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

    // travel stuff
    public int currentRealm = 0;
    public Zone currentZone;
    
    // Start is called before the first frame update
    void Start()
    {
	this.SetFrame(0);
	this.currentZone.SetRealm(this.currentRealm);
    }

    // Update is called once per frame
    void Update()
    {
        this.Move();
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

    private void Act() {
	// pick up item
	bool ePressed = Input.GetKey("e");
	if (ePressed && !this.eHeld) {
	    this.PickUp();
	}
	this.eHeld = ePressed;
   

	// drop item
	bool qPressed = Input.GetKey("q");
	if (qPressed && !this.qHeld) {
	    this.Drop();
	}
	this.qHeld = qPressed;
    }

    private void PickUp() {
	// TODO: actually pick up
	this.currentZone.SetRealm(0);
    }

    private void Drop() {
	// TODO: actually drop
	this.currentZone.SetRealm(1);
    }
    
    private void SetFrame(int frame) {
        SpriteRenderer sr = this.gameObject.GetComponent<SpriteRenderer>();
	sr.sprite = this.frames[frame];
	this.currentFrame = frame;
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
