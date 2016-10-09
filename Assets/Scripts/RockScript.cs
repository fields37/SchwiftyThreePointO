using UnityEngine;
using System.Collections;

public class RockScript : MonoBehaviour {

    public float forceMult = 1000;
    public bool dead = false;
    public Transform player;

    private  float dieTime = 1f;
    private bool startExit = false;
    private bool exitmessagePlayed = false;

    private float exitTime = 0;
    public bool gravitate = false;

    public AudioClip crash;
    public AudioClip gameover;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        if (gravitate)
        {
            GetComponent<ConstantForce>().force = -transform.position * forceMult / transform.position.magnitude;
        }
        
        if(startExit)
        {
            exitTime += Time.deltaTime;
        }

        if (exitTime > 1.5f && !exitmessagePlayed)
        {
            AudioSource.PlayClipAtPoint(gameover, Vector3.zero,1f);
            exitmessagePlayed = true;
        }

        if(exitTime > 13 && exitmessagePlayed)
        {
            Debug.Log("should exit");
            Application.LoadLevel(Application.loadedLevel);
        }

    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.gameObject.tag == "plasma")
        {
            gravitate = true;
        }

        if (collision.collider.gameObject.tag == "MainCamera")
        {
            AudioSource.PlayClipAtPoint(crash, transform.position,1f);
            LeanTween.move(collision.collider.transform.parent.gameObject, Vector3.zero, dieTime).setEase(LeanTweenType.easeInOutCubic);
            player = collision.collider.transform.parent;
            dead = true;
            startExit = true;
        }
    }
}
