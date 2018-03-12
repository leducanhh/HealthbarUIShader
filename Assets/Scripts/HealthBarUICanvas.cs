using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HealthBarUICanvas : MonoBehaviour
{
    [SerializeField][Range(0, 1)] private float m_health;

    private Image imageGUI;
    private Material materialInstance;

    private void Start()
    {
        imageGUI = GetComponent<Image>();

        materialInstance = Instantiate(imageGUI.material); //with UI Canvas, material does not create new instance. so we have to create manually.

        m_health = 1; //default value
    }

    private void Update()
    {
        materialInstance.SetFloat("_Percent", m_health); //set value for temporary material
        imageGUI.material = materialInstance; //assign to material property
    }
}
