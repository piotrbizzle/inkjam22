using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Portal : MonoBehaviour
{
    // index is current realm, value is destination
    // value -1 means there is no connection from the current realm to another
    public int[] realmConnections;

    private const float MaxPortalCooldown = 0.5f;
    private float portalCooldown = 0.0f;

    public void Update() {
	if (this.portalCooldown > 0) {
	    this.portalCooldown -= Time.deltaTime;
	}	
    }

    public bool isPortalReady() {
	return this.portalCooldown <= 0;
    }

    public void resetPortal() {
	this.portalCooldown = MaxPortalCooldown;
    }
}
