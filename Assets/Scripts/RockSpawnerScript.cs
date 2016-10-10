using UnityEngine;
using System.Collections;

public class RockSpawnerScript: MonoBehaviour {

    public GameObject wheel;
    private float period = 14;
    public GameObject rockPrefab;
    public GameObject cameraHead;
    float time = 0;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        time += Time.deltaTime;
        if (time > period)
        {
            period =Random.Range(3, 6);
            time = 0;
            GameObject rock = Instantiate(rockPrefab);
            rockPrefab.transform.position = transform.position;
            rockPrefab.transform.localScale = Vector3.one * 0.05f * Random.Range(1, 3);
            rock.transform.parent = wheel.transform;
            float direction = 1;
            if (cameraHead.transform.forward.x < 0)
            {
                direction = -1;
            }
            rock.GetComponent<Rigidbody>().velocity = new Vector3(1f, 0, 0) * Random.Range(25, 100) * direction;
        }
	}
}
