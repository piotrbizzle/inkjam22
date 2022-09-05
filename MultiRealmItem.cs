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
	this.currentRealm = realm;
	
	if (this.realmSprites[realm] != null) {
	    // activate and set sprite	    
	    SpriteRenderer sr = this.gameObject.GetComponent<SpriteRenderer>();
	    sr.sprite = this.realmSprites[realm];
	    this.gameObject.SetActive(true);
	} else {
	    // deactivate
    	    this.gameObject.SetActive(false);
	}

	GameObject parentGo = this.gameObject.transform.parent.gameObject;
	Player player = parentGo.GetComponent<Player>();
	if (player != null) {
	    player.UpdateInkStoryInventory();
	}
    }

    public void InitCreatedItem(string itemName, int realm) {
	// scale and set sprite
	this.gameObject.transform.localScale = new Vector3(4.0f, 4.0f, 4.0f);
	this.gameObject.AddComponent<SpriteRenderer>();
	Sprite sprite = Resources.Load<Sprite>("foods/" + itemName);
	this.gameObject.GetComponent<SpriteRenderer>().sprite = sprite;
	this.realmSprites = new Sprite[]{sprite, sprite, sprite, sprite};
	this.realmItemNames = new string[]{itemName, itemName, itemName, itemName};
	
	// set name
	this.gameObject.name = itemName;
	this.itemName = itemName;
	this.currentRealm = realm;
	this.InitializeItemName();
	
	// set realm
	this.currentRealm = realm;
	
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
