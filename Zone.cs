using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zone : MonoBehaviour
{
    public Sprite[] realmBackgrounds;

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
