using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Item : MonoBehaviour
{
    public string itemName;
    public int currentRealm;

    void Start() {
	// collision
        this.gameObject.AddComponent<BoxCollider2D>();
	this.gameObject.GetComponent<BoxCollider2D>().isTrigger = true;
	this.gameObject.GetComponent<BoxCollider2D>().size = this.GetComponent<SpriteRenderer>().size;
	
	this.InitializeItemName();
    }

    public virtual void InitializeItemName() {}
    
    public virtual string GetItemName(int realm) {
	return this.itemName;
    }

    // moves item to a different realm
    public void MoveToRealm(int realm) {
	this.currentRealm = realm;
	this.SetRealm(realm);
    }

    // updates item when realm is switched
    public virtual void SetRealm(int realm) {
	this.gameObject.SetActive(this.currentRealm == realm);
    }
}
