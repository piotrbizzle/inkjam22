using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Item : MonoBehaviour
{
    public string itemName;
    public int currentRealm;
    public bool pickUpable = true;
    public bool collides = false;
    
    // transition effect on MoveToRealm
    private const float MaxTransitionCounter = 0.25f;
    private const float HalfTransitionCounter = MaxTransitionCounter / 2;
    private float transitionCounter = 0.0f;
    
    public void Start() {
	// collision
        this.gameObject.AddComponent<BoxCollider2D>();

	if (this.collides) {
	    this.gameObject.AddComponent<Rigidbody2D>();
	    this.gameObject.GetComponent<Rigidbody2D>().gravityScale = 0.0f;
	    this.gameObject.GetComponent<Rigidbody2D>().constraints = RigidbodyConstraints2D.FreezeAll;
	} else {
	    this.gameObject.GetComponent<BoxCollider2D>().isTrigger = true;
	}
	
	this.InitializeItemName();
    }

    public void Update() {
	// visual effect on MoveToRealm
	if (this.transitionCounter <= 0.0f) {
	    return;
	}
	
	bool isPreSwapBeforeDecrement = this.transitionCounter > HalfTransitionCounter;
	this.transitionCounter -= Time.deltaTime;

	if (this.transitionCounter > HalfTransitionCounter) {
    	    // turning clear for the first half of counter
	    float alpha = Math.Max(1 - (MaxTransitionCounter - this.transitionCounter) / HalfTransitionCounter, 0.0f);
	    this.SetAlpha(alpha);
	} else if (this.transitionCounter > 0.0f) {	    
	    // turning solid for the second half
	    float alpha = Math.Min((HalfTransitionCounter - this.transitionCounter) / HalfTransitionCounter, 1.0f);
	    this.SetAlpha(alpha);
	} else {
    	    this.SetAlpha(1.0f);
	}
       
	if (isPreSwapBeforeDecrement && this.transitionCounter <= HalfTransitionCounter) {
	    this.SetRealm(this.currentRealm);
	}
    }

    public void InitCreatedItem(string itemName, int realm) {
	// scale and set sprite
	this.gameObject.transform.localScale = new Vector3(4.0f, 4.0f, 4.0f);
	this.gameObject.AddComponent<SpriteRenderer>();
	this.gameObject.GetComponent<SpriteRenderer>().sprite = Resources.Load<Sprite>("foods/" + itemName);

	// set name
	this.gameObject.name = itemName;
	this.itemName = itemName;
	this.InitializeItemName();
	
	// set realm
	this.currentRealm = realm;
	this.SetRealm(realm);
    }

    private void SetAlpha(float alpha) {
	this.gameObject.GetComponent<SpriteRenderer>().color = new Color(1.0f, 1.0f, 1.0f, alpha);
    }
    
    public virtual void InitializeItemName() {}
    
    public virtual string GetItemName() {
	return this.itemName;
    }

    // moves item to a different realm
    public void MoveToRealm(int realm) {
	this.currentRealm = realm;
	this.transitionCounter = MaxTransitionCounter;
    }

    // updates item when realm is switched
    public virtual void SetRealm(int realm) {
	this.gameObject.SetActive(this.currentRealm == realm);
    }
}
