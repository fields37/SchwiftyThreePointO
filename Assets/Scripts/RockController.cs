using UnityEngine;
using System.Collections;

public class RockController : MonoBehaviour {

    public GameObject wheel;
    public float period = 2f;
    public GameObject rockPrefab;
    float time = 0;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        time += Time.deltaTime;
        if (time> period)
        {
            period = Random.Range(3, 7);
            time = 0;
            GameObject rock = Instantiate(rockPrefab);
            rockPrefab.transform.position = transform.position;
            rockPrefab.transform.localScale = Vector3.one * 0.05f * Random.Range(1, 3);
            rock.transform.parent = wheel.transform;
            rock.GetComponent<Rigidbody>().velocity = new Vector3(1.5f, 0, 0) * Random.Range(-75, 75);
        }
	}
}
