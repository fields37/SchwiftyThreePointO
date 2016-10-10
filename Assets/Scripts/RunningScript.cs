using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

public class RunningScript : MonoBehaviour
{

    public struct TimeHeight
    {
        public float time;
        public float height;

        public TimeHeight(float t, float h)
        {
            time = t;
            height = h;
        }
    }

    public Transform wheel;
    public Transform cameraHead;
    public Transform cameraRig;
    public float radialVel = 5;
    public float runVelocity = 0.5f;

    public bool useWheel = true;

    
    public bool isRunning = false;

    private float currentTime = 0;
    private float windowSize = 75;
    private int peaksNumberTH = 2;
    private float peaksHeightTH = 0.001f;
    private LinkedList<TimeHeight> window;
    private LinkedList<TimeHeight> peaks;
    System.IO.StreamWriter file;

    // Use this for initialization
    void Start()
    {
        window = new LinkedList<TimeHeight>();
        peaks = new LinkedList<TimeHeight>();
    }

    // Update is called once per frame
    void Update()
    {
        isRunning = false;
        currentTime += Time.deltaTime;

        TimeHeight currentTimeHeight = new TimeHeight(currentTime, cameraHead.position.y);
        window.AddLast(currentTimeHeight);
        
        
        if (window.Count < windowSize) return;
        window.RemoveFirst();
        peaks = new LinkedList<TimeHeight>();
        LinkedListNode<TimeHeight> a = window.First;
        LinkedListNode<TimeHeight> b = a.Next;
        LinkedListNode<TimeHeight> c = b.Next;
        LinkedListNode<TimeHeight> d = c.Next;
        LinkedListNode<TimeHeight> e = d.Next;

        while (e != null)
        {
            float aa = a.Value.height;
            float bb = b.Value.height;
            float cc = c.Value.height;
            float dd = d.Value.height;
            float ee = e.Value.height;
            float avgsum = (aa + bb + dd + ee) / 4;
            if (cc > aa && cc > bb && cc > dd && cc > ee && cc - avgsum > peaksHeightTH)
            {
                peaks.AddLast(c.Value);
            }
            if (cc < aa && cc < bb && cc < dd && cc < ee && avgsum - cc > peaksHeightTH)
            {
                peaks.AddLast(c.Value);
            }
            a = b;
            b = c;
            c = d;
            d = e;
            e = d.Next;
        }


        if (peaks.Count >= peaksNumberTH)
        {
            isRunning = true;
        }

        if (isRunning)
        {
            handleRun();
            if (!GetComponent<AudioSource>().isPlaying)
            {
                GetComponent<AudioSource>().Play();
            }
        } else
        {
            GetComponent<AudioSource>().Pause();
        }

    }

    public void handleRun()
    {
            cameraRig.position += Time.deltaTime * new Vector3(0, 0, cameraHead.forward.z) * runVelocity;
            wheel.Rotate(new Vector3(0, 0, -cameraHead.forward.x * radialVel));
    }

    

}
