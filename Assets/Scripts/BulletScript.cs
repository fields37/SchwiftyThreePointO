using UnityEngine;
using System.Collections;

public class BulletScript : MonoBehaviour {

    // Use this for initialization
    float forceMult = 15;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        GetComponent<ConstantForce>().force = -transform.position * forceMult / transform.position.magnitude;
	}

    
}
