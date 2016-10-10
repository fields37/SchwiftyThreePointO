using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class GemGun : MonoBehaviour {

    private SteamVR_TrackedObject trackedObject;
    private SteamVR_Controller.Device device;
    public GameObject viveLeftController;

    public float gemDistance = 1f;
	public float flyTime = 3;
    public float newScale = 0.1f;
    public float gemCount = 0;
    public GameObject triggerEffect;
    public Text gemText;
    public GameControllerScript gameController;

    ArrayList gems;

	// Use this for initialization
	void Start () {
        gems = new ArrayList();
        GetComponent<SphereCollider>().radius = gemDistance;
	}
	
	// Update is called once per frame
	void Update () {
        trackedObject = viveLeftController.GetComponent<SteamVR_TrackedObject>();
        device = SteamVR_Controller.Input((int)trackedObject.index);
        if (device.GetHairTrigger())
        {
            triggerEffect.SetActive(true);
            triggerEffect.GetComponent<ParticleSystem>().Play();
        }
        else
        {
            triggerEffect.SetActive(false);
        }
    }

	void OnTriggerEnter (Collider coll)
	{
        suckingMechanism(coll);
	}

    void OnTriggerStay(Collider coll)
    {
        suckingMechanism(coll);
    }



    private void suckingMechanism(Collider coll)
    {
        if (coll.gameObject.tag == "gem")
        {
            GameObject gem = coll.gameObject;
            if (!gems.Contains(gem) && triggerEffect.activeSelf)
            {
                trackedObject = viveLeftController.GetComponent<SteamVR_TrackedObject>();
                SteamVR_Controller.Input((int)trackedObject.index).TriggerHapticPulse(1000);
                gems.Add(gem);
                gemCount++;
                gameController.gemsCollected = gems.Count;
                if (gemText) gemText.text = (gemCount.ToString());
                gem.transform.parent = transform;
                LeanTween.moveLocal(gem, triggerEffect.transform.localPosition + new Vector3(0, 0, 0.15f), flyTime).setEase(LeanTweenType.easeInBounce);
                LeanTween.scale(gem, gem.transform.localScale * newScale, flyTime);
                GetComponent<AudioSource>().Play();
            }
        }
    }

}
