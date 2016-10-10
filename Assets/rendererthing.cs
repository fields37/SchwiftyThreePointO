using UnityEngine;
using System.Collections;

public class rendererthing : MonoBehaviour {

    public RenderTexture targetTex;

	// Use this for initialization
	void Start () {
        GetComponent<Camera>().targetTexture = targetTex;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
