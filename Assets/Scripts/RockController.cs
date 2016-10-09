using UnityEngine;
using System.Collections;

public class RockController : MonoBehaviour {

    public GameObject wheel;
    public float period = 2.5f;
    public GameObject rockPrefab;
    float time = 0;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        time += Time.deltaTime;
        if (time> period)
        {
            time = 0;
            GameObject rock = Instantiate(rockPrefab);
            rockPrefab.transform.position = transform.position;
            rock.transform.parent = wheel.transform;
            rock.GetComponent<Rigidbody>().velocity = new Vector3(1, 0, 0) * Random.Range(-100, 100);
        }
	}
}
