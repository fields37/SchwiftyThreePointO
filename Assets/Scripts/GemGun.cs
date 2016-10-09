using UnityEngine;
using System.Collections;

public class GemGun : MonoBehaviour {

	public float gemDistance = 1f;
	public float flyTime = 3;
    public float newScale = 0.1f;
    public float gemCount = 0;

    ArrayList gems = new ArrayList();

	// Use this for initialization
	void Start () {
		GetComponent<SphereCollider>().radius = gemDistance;
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnTriggerEnter (Collider coll)
	{
		if (coll.gameObject.tag == "gem") {
			GameObject gem = coll.gameObject;
            if (!gems.Contains(gem))
            {
                gems.Add(gem);
                gemCount++;
                gem.transform.parent = transform;
                LeanTween.moveLocal(gem, transform.localPosition, flyTime).setEase(LeanTweenType.easeInBounce);
                LeanTween.scale(gem, gem.transform.localScale * newScale, flyTime);
                GetComponent<AudioSource>().Play();
            }
			
		}
	}

}
