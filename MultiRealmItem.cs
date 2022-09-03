using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MultiRealmItem : Item
{
    public Sprite[] realmSprites;
    public string[] realmItemNames;

    void Start() {
	this.itemName = this.realmItemNames[this.currentRealm];
    }
    
    public override string GetItemName(int realm) {
	return this.realmItemNames[realm];
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
    	    this.gameObject.SetActive(true);
	}
    }
}
