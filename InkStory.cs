using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;

public class InkStory : MonoBehaviour
{
    public TextAsset inkJSONAsset;
    public Canvas canvas;
    public SpriteRenderer screenDimmer;
    private Story story;
    public bool isVisible;
    
    // UI Prefabs
    public Text textPrefab;
    public Button buttonPrefab;
    
    public void Start() {
	this.story = new Story(inkJSONAsset.text);
    }
    
    public void OpenStory(string startingKnot) {
	this.screenDimmer.color = new Color(1.0f, 1.0f, 1.0f, 0.3f);
	this.story.ChoosePathString(startingKnot);
	this.isVisible = true;
	this.RefreshView();
    }

    private void RefreshView () {
	this.ClearView();
	
	// show next story text
	while (this.story.canContinue) {
	    Text storyText = Instantiate(textPrefab) as Text;
	    storyText.text = this.story.Continue().Trim();
	    storyText.transform.parent = this.canvas.transform;

    	    Text dividerText = Instantiate(textPrefab) as Text;	     
	    dividerText.transform.parent = this.canvas.transform;
	}
	
	if (story.currentChoices.Count > 0) {
            // show choice buttons
	    for (int i = 0; i < this.story.currentChoices.Count; i++) {
		Choice choice = this.story.currentChoices[i];
		Button button = CreateChoiceButton(choice.text.Trim());
		button.onClick.AddListener(delegate {
			this.OnClickChoiceButton(choice);
		    }
		);
	    }
	} else {
	    // exit out of story
	    this.ClearView();
	    this.screenDimmer.color = Color.clear;
	    this.isVisible = false;
	}
    }

    private void ClearView() {
	foreach (Transform child in this.transform) {
	    GameObject.Destroy(child.gameObject);
	}
    }

    // Creates a button showing the choice text
    Button CreateChoiceButton (string text) {
	// Creates the button from a prefab
	Button choice = Instantiate(buttonPrefab) as Button;
	choice.transform.parent=canvas.transform;
		
	// Gets the text from the button prefab
	Text choiceText = choice.GetComponentInChildren<Text>();
	choiceText.text = text;

	// Make the button expand to fit the text
	HorizontalLayoutGroup layoutGroup = choice.GetComponent <HorizontalLayoutGroup> ();
	layoutGroup.childForceExpandHeight = false;
	
	return choice;
    }

    // When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton (Choice choice) {
	this.story.ChooseChoiceIndex(choice.index);
	this.story.Continue();
	RefreshView();
    }
}
