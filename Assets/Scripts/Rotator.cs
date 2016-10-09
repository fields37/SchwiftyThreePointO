using UnityEngine;
using System.Collections;

public class Rotator : MonoBehaviour {

	void Update () {
	transform.Rotate(0, (Time.deltaTime * 360), 0);
	}
}
