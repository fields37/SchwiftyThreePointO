using UnityEngine;
using System.Collections;

public class ControllerScript : MonoBehaviour {

    public GameObject ballPrefab;

    private SteamVR_TrackedObject trackedObject;
    private SteamVR_Controller.Device device;

    public Transform directionObject;
    public float shootPower = 500;

    void Start () {
        trackedObject = GetComponent<SteamVR_TrackedObject>();
    }
	
	void Update () {
        device = SteamVR_Controller.Input((int)trackedObject.index);
        if (device.GetHairTriggerDown())
        {
            device.TriggerHapticPulse(1000);
            GameObject ball = Instantiate(ballPrefab);
            ball.transform.position = transform.position + directionObject.forward;
            ball.GetComponent<Rigidbody>().velocity = directionObject.forward * shootPower;
            GetComponent<AudioSource>().Play();
       }
    }
}
