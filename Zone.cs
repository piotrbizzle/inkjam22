using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zone : MonoBehaviour
{
    public bool isStartingZone;
    public Zone north;
    public Zone south;
    public Zone east;
    public Zone west;

    public Sprite[] realmBackgrounds;
    public bool firstFrame = true;  // hack to deactivate children after Start()

    public void Start() {
	this.gameObject.GetComponent<SpriteRenderer>().sortingLayerName = "Background";
    }
    
    public void Update() {
	if (this.firstFrame) {
	    this.SetActive(this.isStartingZone);
    	    this.gameObject.transform.position = new Vector3(0.0f, 0.0f, 0.0f);
	    this.firstFrame = false;
	}
    }

    public void SetActive(bool isActive) {
	foreach (Transform child in this.transform) {
	    child.gameObject.SetActive(isActive);
	}
	this.gameObject.GetComponent<SpriteRenderer>().enabled = isActive;
    }

    public void SetRealm(int realm) {
	// background
        SpriteRenderer sr = this.gameObject.GetComponent<SpriteRenderer>();
	sr.sprite = this.realmBackgrounds[realm];

	// items
	foreach (Transform child in this.transform) {
	    child.gameObject.GetComponent<Item>().SetRealm(realm);
	}
    }
}
