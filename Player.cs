using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    // screen boundaries
    private const float ScreenTopY = 5.0f;
    private const float ScreenBottomY = -5.0f;
    private const float ScreenRightX = 8.0f;
    private const float ScreenLeftX = -8.0f;
    private const float ScreenEdgeBuffer = 0.25f;

    // animation stuff
    private const int PlayerAnimationDelay = 10;   
    public Sprite[] frames;
    private int currentFrame = 0;
    private int playerAnimationCounter = PlayerAnimationDelay;
    private int playerFacing = 0; // 0 = left, 1 = right

    // controls
    private bool qHeld;
    private bool eHeld;
    private bool spaceHeld;
    
    // colliders
    public List<Item> collidedItems;
    
    // travel stuff
    public int currentRealm = 0;
    public Zone currentZone;
    
    // Start is called before the first frame update
    public void Start()
    {
	this.SetFrame(0);
	this.currentZone.SetRealm(this.currentRealm);

	// collision
        this.gameObject.AddComponent<BoxCollider2D>();
	this.gameObject.GetComponent<BoxCollider2D>().size = this.GetComponent<SpriteRenderer>().size;

	Rigidbody2D rb = this.gameObject.AddComponent<Rigidbody2D>();
	rb.gravityScale = 0.0f;
	rb.constraints = RigidbodyConstraints2D.FreezeAll;
	rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;
	rb.sleepMode = RigidbodySleepMode2D.NeverSleep;
    }

    // Update is called once per frame
    public void Update()
    {
        this.Move();
	this.MoveZones();
	this.Act();
    }
    
    private void Move()
    {
	bool up = Input.GetKey("w");
	bool down = Input.GetKey("s");
	bool left = Input.GetKey("a");
	bool right = Input.GetKey("d");

	bool vertical = up ^ down;
	bool horizontal = left ^ right;
	bool diagonal = vertical && horizontal;
	
	float speedScale = diagonal ? 4.2f : 6.0f;

	if (up && this.gameObject.transform.position.y < ScreenTopY + ScreenEdgeBuffer) {
	    this.gameObject.transform.Translate(Vector3.up * Time.deltaTime * speedScale);
	}
	if (down && this.gameObject.transform.position.y > ScreenBottomY - ScreenEdgeBuffer) {
	    this.gameObject.transform.Translate(Vector3.down * Time.deltaTime * speedScale);
	}
	if (left && this.gameObject.transform.position.x > ScreenLeftX - ScreenEdgeBuffer) {
	    this.gameObject.transform.Translate(Vector3.left * Time.deltaTime * speedScale);
	    this.playerFacing = 0;
	}
	if (right && this.gameObject.transform.position.x < ScreenRightX + ScreenEdgeBuffer) {
	    this.gameObject.transform.Translate(Vector3.right * Time.deltaTime * speedScale);
	    this.playerFacing = 1;
	}

       if (left || right || up || down) {
	    this.playerAnimationCounter -= 1;
	    if (playerAnimationCounter == 0) {
		this.playerAnimationCounter = PlayerAnimationDelay;
		this.currentFrame += 1;
	    }
	} else {
	    this.currentFrame = 0;
	}
	
	if (this.playerFacing == 0) {
	    this.SetFrame((this.currentFrame) % 2);   
	} else {
	    this.SetFrame((this.currentFrame) % 2 + 2);
	}
    }

    private void MoveZones() {
	// go north
	Transform playerTransform = this.gameObject.transform;
	if (playerTransform.position.y > ScreenTopY && currentZone.north != null) {
	    playerTransform.Translate(new Vector3(0.0f, -9.5f, 0.0f));
    	    this.SwapZones(this.currentZone.north);
	}
	// go south
	if (playerTransform.position.y < ScreenBottomY && currentZone.south != null) {
	    playerTransform.Translate(new Vector3(0.0f, 9.5f, 0.0f));
    	    this.SwapZones(this.currentZone.south);
	}
	// go east
	if (playerTransform.position.x > ScreenRightX && currentZone.east != null) {
    	    playerTransform.Translate(new Vector3(-15.5f, 0.0f, 0.0f));
	    this.SwapZones(this.currentZone.east);
	}
	// go west
	if (playerTransform.position.x < ScreenLeftX && currentZone.west != null) {
	    playerTransform.Translate(new Vector3(15.5f, 0.0f, 0.0f));
	    this.SwapZones(this.currentZone.west);
	}
    }

    private void SwapZones(Zone newZone) {
	    this.currentZone.SetActive(false);
	    this.currentZone = newZone;
	    this.currentZone.SetActive(true);
    	    this.currentZone.SetRealm(this.currentRealm);    
    }

    private void Act() {
	// pick up item
	bool ePressed = Input.GetKey("e");
	this.eHeld = ePressed;

	// drop item
	bool qPressed = Input.GetKey("q");
	if (qPressed && !this.qHeld) {
	    this.Drop();
	}
	this.qHeld = qPressed;

	// interact
	bool spacePressed = Input.GetKey("space");
	if (spacePressed && !this.spaceHeld) {
	    this.Interact();
	}
	this.spaceHeld = spacePressed;

	// clear colliders
	this.collidedItems.Clear();
    }

    void OnTriggerStay2D(Collider2D collider) {
	// pick up item
	Item item = collider.gameObject.GetComponent<Item>();
	if (!this.eHeld || item == null) {
	    return;
	}
	
	int heldItemsCount = this.gameObject.transform.childCount;
	if (heldItemsCount >= 3) {
	    return;
	}

	GameObject pickedUpGo = collider.gameObject;
	pickedUpGo.transform.parent = this.gameObject.transform;
	
	Vector3 playerPosition = this.gameObject.transform.position;
	pickedUpGo.transform.position = new Vector3(playerPosition.x, playerPosition.y + (heldItemsCount + 1) * 1.5f, 0.0f);

    }

    private void Drop() {
	int heldItemsCount = this.gameObject.transform.childCount;
	if (heldItemsCount == 0) {
	    return;
	}
	Transform droppedTransform = this.gameObject.transform.GetChild(heldItemsCount - 1);
	droppedTransform.position = this.gameObject.transform.position;
	droppedTransform.parent = this.currentZone.gameObject.transform;
    }
    
    private void SetFrame(int frame) {
        SpriteRenderer sr = this.gameObject.GetComponent<SpriteRenderer>();
	sr.sprite = this.frames[frame];
	this.currentFrame = frame;
    }

    private void Interact() {
	this.SetRealm(this.currentRealm == 1 ? 0 : 1);
    }

    private void SetRealm(int realm) {
	// player
	this.currentRealm = realm;       
	foreach (Transform child in this.transform) {
	    child.gameObject.GetComponent<Item>().MoveToRealm(realm);
	}
	
	// zone
	this.currentZone.SetRealm(realm);

    }
    
    /*
        MINGUS

         \_\
        /oo|
          ||____
          \     >
           || ||
     */
}
