using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MultiRealmItem : Item
{
    public Sprite[] realmSprites = new Sprite[4];
    public string[] realmItemNames = new string[4];

    public override void InitializeItemName() {
	this.itemName = this.realmItemNames[this.currentRealm];
    }

    public override string GetItemName() {
	return this.realmItemNames[this.currentRealm];
    }

    // updates item when realm is switched
    public override void SetRealm(int realm) {
	if (this.realmSprites[realm] != null) {
	    // activate and set sprite	    
	    SpriteRenderer sr = this.gameObject.GetComponent<SpriteRenderer>();
	    sr.sprite = this.realmSprites[realm];
	    this.gameObject.SetActive(true);
	} else {
	    // deactivate
    	    this.gameObject.SetActive(false);
	}
    }
}
