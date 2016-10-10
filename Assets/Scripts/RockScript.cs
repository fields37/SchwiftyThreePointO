using UnityEngine;
using System.Collections;

public class RockScript : MonoBehaviour {

    public float forceMult = 1000;
    public bool gravitate = false;
    private float time = 0;
    private float lifetime = 30;


	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        time += Time.deltaTime;
        if(time > lifetime)
        {
            gravitate = true;
        }
        if (gravitate)
        {
            GetComponent<ConstantForce>().force = -transform.position * forceMult / transform.position.magnitude;
        }

        GetComponent<ConstantForce>().torque = new Vector3(0, 0, Mathf.Abs(transform.position.y + 165) * 4f * transform.position.x);
    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.gameObject.tag == "plasma")
        {
            gravitate = true;
            GameObject.Find("GameController").GetComponent<GameControllerScript>().rocksDestroyed += 1;
            Debug.Log(GameObject.Find("GameController").GetComponent<GameControllerScript>().rocksDestroyed);
        }
    }
}
