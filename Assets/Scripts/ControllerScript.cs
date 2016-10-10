using UnityEngine;
using System.Collections;

public class ControllerScript : MonoBehaviour {

    public GameObject ballPrefab;

    private SteamVR_TrackedObject trackedObject;
    private SteamVR_Controller.Device device;
    public GameObject plasma1;
    public GameObject plasma2;
    public GameObject plasma3;

    private GameObject[] plasmas;
    private float[] plasmaTimes;
    private float time = 0;
    private float threshold = 5f;

    public Transform directionObject;
    public float shootPower = 500;
    private bool vibrate;
    private float vibrateFor = 0.2f;
    private float vibrateTimer = 0f;
    private int turn = 0;
    void Start () {
        trackedObject = GetComponent<SteamVR_TrackedObject>();
        plasmas = new GameObject[] { plasma1, plasma2, plasma3 };
        plasmaTimes = new float[] { -10, -10, -10 };
    }
	
	void Update () {
        device = SteamVR_Controller.Input((int)trackedObject.index);

        time += Time.deltaTime;

        if(vibrate && vibrateTimer < vibrateFor)
        {
            SteamVR_Controller.Input((int)trackedObject.index).TriggerHapticPulse(1000);
            vibrateTimer += Time.deltaTime;
        } else
        {
            vibrate = false;
        }

        for(int i=0; i <3; i++)
        {
            if (time - plasmaTimes[i] > threshold)
            {
                plasmas[i].SetActive(true);
            }
        }


        if (device.GetHairTriggerDown() )
        {
            if (plasmas[turn].activeSelf)
            {
                plasmas[turn].SetActive(false);
                plasmaTimes[turn] = time;
                turn = (turn + 1) % 3;
                device.TriggerHapticPulse(1000);
                GameObject ball = Instantiate(ballPrefab);
                ball.transform.position = transform.position + directionObject.forward;
                ball.GetComponent<Rigidbody>().velocity = directionObject.forward * shootPower;
                GetComponent<AudioSource>().Play();
            }
            else {
                vibrate = true;
                vibrateTimer = 0;
            }
       } 
    }
}
