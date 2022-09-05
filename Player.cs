using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    // ink stuff
    public InkStory inkStory;

    // ui stuff
    public SpriteRenderer screenDimmer;
    
    // screen boundaries
    private const float ScreenTopY = 5.0f;
    private const float ScreenBottomY = -5.0f;
    private const float ScreenRightX = 8.0f;
    private const float ScreenLeftX = -8.0f;
    private const float ScreenEdgeBuffer = 0.25f;

    // animation stuff
    private const float PlayerAnimationDelay = 0.1f;   
    public Sprite[] frames;
    private int currentFrame = 0;
    private float playerAnimationCounter = PlayerAnimationDelay;
    private int playerFacing = 0; // 0 = left, 1 = right

    // controls
    private bool qHeld;
    private bool eHeld;
    private bool spaceHeld;
    private bool mHeld;
    private bool lHeld;
        
    // travel stuff
    public int currentRealm = 0;
    public Zone currentZone;
    private Dictionary<string, Zone> zoneDirectory = new Dictionary<string, Zone>();
    private Zone destinationZone;
    private int destinationRealm;
    private bool destinationHasRealm;
    private float destinationX;
    private float destinationY;
    private bool destinationHasCoordinates;
    private const float MaxTeleportCounter = 0.8f;
    private const float HalfTeleportCounter = MaxTeleportCounter / 2;
    private float teleportCounter = 0.0f;

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
	rb.constraints = RigidbodyConstraints2D.FreezeRotation;
	rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;
	rb.sleepMode = RigidbodySleepMode2D.NeverSleep;

	// create mapping from each the name of each zone that can be
        // teleported to to the zone
	GameObject[] teleportZoneGos = GameObject.FindGameObjectsWithTag("TeleportZone");
	foreach (GameObject teleportZoneGo in teleportZoneGos) {
	    Zone teleportZone = teleportZoneGo.GetComponent<Zone>();
	    this.zoneDirectory[teleportZoneGo.name] = teleportZone;
	}	
    }

    // Update is called once per frame
    public void Update()
    {
	if (this.destinationZone != null) {
	    this.TeleportZoneUpdate();
	}

	if (this.inkStory.isVisible) {
	    return;
	}
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
	    this.playerAnimationCounter -= Time.deltaTime;
	    if (playerAnimationCounter <= 0.0f) {
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
	// debug
	bool mPressed = Input.GetKey("m");
	if (mPressed && !this.mHeld) {
	    this.inkStory.DebugInventory();
	}
	this.mHeld = mPressed;

	bool lPressed = Input.GetKey("l");
	if (lPressed && !this.lHeld) {
	    int nextRealm = this.currentRealm == 3 ? 0 : this.currentRealm + 1;
	    this.SetRealm(nextRealm);
	}
	this.lHeld = lPressed;
	
	// pick up item
	this.eHeld = Input.GetKey("e");

	// drop item
	bool qPressed = Input.GetKey("q");
	if (qPressed && !this.qHeld) {
	    this.Drop();
	}
	this.qHeld = qPressed;

	// interact
	this.spaceHeld = Input.GetKey("space");
    }

    void OnTriggerStay2D(Collider2D collider) {
	if (this.inkStory.isVisible) {
	    return;
	}
	
	// pick up item
	Item item = collider.gameObject.GetComponent<Item>();
	if (item != null && this.eHeld) {
	    this.PickUp(item);
	    return;
	}

	// start dialogue
	Dialogue dialogue = collider.gameObject.GetComponent<Dialogue>();
	if (dialogue != null && this.spaceHeld) {
	    this.inkStory.OpenStory(dialogue.startingKnot);
	    return;
	}

	// enter portal
	Portal portal = collider.gameObject.GetComponent<Portal>();
	if (portal != null && portal.isPortalReady() && this.spaceHeld) {
	    int destinationRealm = portal.realmConnections[this.currentRealm];
	    if (destinationRealm != -1) {
		this.SetRealm(destinationRealm);
		portal.resetPortal();
	    }
	}
    }

    private void PickUp(Item item) {
	if (!item.pickUpable || item.gameObject.transform.parent == this.gameObject.transform) {
	    return;
	}
	int heldItemsCount = this.gameObject.transform.childCount;
	if (heldItemsCount >= 3) {
	    return;
	}

	GameObject itemGo = item.gameObject;
	itemGo.transform.parent = this.gameObject.transform;

	this.FixInventory();
	
	this.UpdateInkStoryInventory();
    }

    private void FixInventory() {
	Vector3 playerPosition = this.gameObject.transform.position;
	for (int i = 0; i < this.gameObject.transform.childCount; i++) {
	    Transform child = this.gameObject.transform.GetChild(i);
	    child.position = new Vector3(playerPosition.x, playerPosition.y + (i + 1) * 1.5f, 0.0f);
	}
    }
    
    private void Drop() {
	int heldItemsCount = this.gameObject.transform.childCount;
	if (heldItemsCount == 0) {
	    return;
	}
	Transform droppedTransform = this.gameObject.transform.GetChild(heldItemsCount - 1);
	droppedTransform.position = this.gameObject.transform.position;
	droppedTransform.parent = this.currentZone.gameObject.transform;

	this.UpdateInkStoryInventory();
    }

    public void UpdateInkStoryInventory() {
	List<string> itemNames = new List<string>();
	foreach (Transform child in this.transform) {
	    itemNames.Add(child.gameObject.GetComponent<Item>().GetItemName());
	}
	this.inkStory.UpdateInventory(itemNames);
    }

    public void ReceiveItem(string itemName) {
	MultiRealmItem item = new GameObject().AddComponent<MultiRealmItem>();
	item.InitCreatedItem(itemName, this.currentRealm);

	if (this.gameObject.transform.childCount < 3) {
	    // pick up item if there's room
	    this.PickUp(item);
	} else {
	    // otherwise, drop item on the ground
	    item.gameObject.transform.parent = this.currentZone.transform;
	    item.gameObject.transform.position = this.gameObject.transform.position;
	}
    }

    public void LoseItem(string itemName) {
	Vector3 playerPosition = this.gameObject.transform.position;

	bool destroyedAnItem = false;
	for (int i = 0; i < this.gameObject.transform.childCount; i++) {
	    Transform child = this.gameObject.transform.GetChild(i);
	    if (child.gameObject.GetComponent<Item>().GetItemName() == itemName && !destroyedAnItem) {
		child.parent = child.parent.parent; // fixes held item count
		GameObject.Destroy(child.gameObject);
		destroyedAnItem = true;
		continue;
	    }
	}

	this.FixInventory();
	this.UpdateInkStoryInventory();
    }

    // this is the worst part of the code
    public void TeleportToZone(string zoneName, int realm, bool hasRealm, float x, float y, bool hasCoordinates) {
	this.destinationZone = this.zoneDirectory[zoneName];
	this.destinationRealm = realm;
	this.destinationHasRealm = hasRealm;
	this.destinationX = x;
	this.destinationY = y;
	this.destinationHasCoordinates = hasCoordinates;
	this.teleportCounter = MaxTeleportCounter;	
    }

    public void TeleportZoneUpdate() {
	bool isPreTeleportBeforeDecrement = this.teleportCounter > HalfTeleportCounter;
	this.teleportCounter -= Time.deltaTime;

	if (this.teleportCounter > HalfTeleportCounter) {
	    // turning solid for the first half of the counter
	    float alpha = Math.Min(1 + 0.7f * (HalfTeleportCounter - this.teleportCounter) / HalfTeleportCounter, 1.0f);
	    this.screenDimmer.color = new Color(1.0f, 1.0f, 1.0f, alpha);
	} else if (this.teleportCounter > 0.0f) {
	    // then turning clear
	    float alpha = Math.Max(1 + (1 - (MaxTeleportCounter - this.teleportCounter) / HalfTeleportCounter), 0.0f);
	    this.screenDimmer.color = new Color(1.0f, 1.0f, 1.0f, alpha);
	} else {
	    this.screenDimmer.color = Color.clear;
	    this.destinationZone = null;
	}

	// do the actual teleport
	if (isPreTeleportBeforeDecrement && this.teleportCounter <= HalfTeleportCounter) {
	    this.SwapZones(this.destinationZone);
	    if (this.destinationHasCoordinates) {
		this.gameObject.transform.position = new Vector3(this.destinationX, this.destinationY, 0.0f);
	    }
	    if (this.destinationHasRealm) {
		this.SetRealm(this.destinationRealm);
	    }
	}
    }
    
    private void SetFrame(int frame) {
        SpriteRenderer sr = this.gameObject.GetComponent<SpriteRenderer>();
	sr.sprite = this.frames[frame];
	this.currentFrame = frame;
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
