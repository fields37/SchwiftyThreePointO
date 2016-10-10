using UnityEngine;
using System.Collections;

public class GameControllerScript : MonoBehaviour {
    public GameObject cameraRig;
    private bool loseRoutingStarted = false;
    private bool loseMessagedPlayed = false;
    private float timeSinceLoseRoutine = 0f;
    private AudioSource[] sources;
    public GameObject boomParticles;
    public int rocksDestroyed = 0;
    public int gemsCollected = 0;
    public GameObject scores;
    public TextMesh scoresRock;
    public TextMesh scoresGem;

    //0: intro speech
    //1: backgroundmusic
    //2: lose speech

    private float transcendTime = 2;
	// Use this for initialization
	void Start () {
        sources = GetComponents<AudioSource>();
    }   
	
	// Update is called once per frame
	void Update () {
        scoresRock.text = rocksDestroyed.ToString();
        scoresGem.text = gemsCollected.ToString();

        if (loseRoutingStarted)
        {
            timeSinceLoseRoutine += Time.deltaTime;
        }
        if (loseRoutingStarted && !loseMessagedPlayed && timeSinceLoseRoutine> 2)
        {
            sources[2].Play();
            LeanTween.move(cameraRig, Vector3.zero, transcendTime).setEase(LeanTweenType.easeInOutCubic);
            loseMessagedPlayed = true;
        }
        if (loseRoutingStarted && timeSinceLoseRoutine > 15)
        {
            Application.LoadLevel(Application.loadedLevel);
        }
	}

    public void StartLosingRoutine()
    {
        boomParticles.SetActive(true);
        loseRoutingStarted = true;
        
    }
}
