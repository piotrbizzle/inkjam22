using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Item : MonoBehaviour
{
    public string itemName;
    public int currentRealm;
    public bool pickUpable = true;

    // transition effect on MoveToRealm
    private const float MaxTransitionCounter = 0.22f;
    private const float HalfTransitionCounter = MaxTransitionCounter / 2;
    private float transitionCounter = 0.0f;
    
    public void Start() {
	// collision
        this.gameObject.AddComponent<BoxCollider2D>();
	this.gameObject.GetComponent<BoxCollider2D>().isTrigger = true;
	this.gameObject.GetComponent<BoxCollider2D>().size = this.GetComponent<SpriteRenderer>().size;
	
	this.InitializeItemName();
	this.SetRealm(0);
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
	    this.setAlpha(alpha);
	}
	else if (this.transitionCounter > 0.0f) {	    
	    // turning solid for the second half
	    float alpha = Math.Min((HalfTransitionCounter - this.transitionCounter) / HalfTransitionCounter, 1.0f);
	    this.setAlpha(alpha);
	} else {
    	    this.setAlpha(1.0f);
	}
       
	if (isPreSwapBeforeDecrement && this.transitionCounter <= HalfTransitionCounter) {
	    this.SetRealm(this.currentRealm);
	}
    }

    private void setAlpha(float alpha) {
	this.gameObject.GetComponent<SpriteRenderer>().color = new Color(1.0f, 1.0f, 1.0f, alpha);
    }
    
    public virtual void InitializeItemName() {}
    
    public virtual string GetItemName(int realm) {
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
