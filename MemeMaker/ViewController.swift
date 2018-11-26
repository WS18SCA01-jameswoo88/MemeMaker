//
//  ViewController.swift
//  MemeMaker
//
//  Created by James Chun on 11/24/18.
//  Copyright © 2018 James Chun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let topChoices: [CaptionChoice] = [
        CaptionChoice(emoji:"🕶",  caption:"You know what's cool?"),
        CaptionChoice(emoji:"💥",  caption:"You know what makes me mad?"),
        CaptionChoice(emoji:"💕",  caption:"You know what I love?")
    ]
    
    let bottomChoices: [CaptionChoice] = [
        CaptionChoice(emoji:"🐱",  caption:"Cats wearing hats"),
        CaptionChoice(emoji:"🐕",  caption:"Dogs carrying logs"),
        CaptionChoice(emoji:"🐒",  caption:"Monkeys being funky")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let font: UIFont = UIFont.systemFont(ofSize: 40);
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]; //a dictionary
        topCaptionSegmentedControl!.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        bottomCaptionSegmentedControl!.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        //FIXME: why doesn't this work?
        topCaptionSegmentedControl!.layer.borderColor = UIColor.clear.cgColor
        bottomCaptionSegmentedControl!.layer.borderColor = UIColor.clear.cgColor
        
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
    }

    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        let topIndex: Int = topCaptionSegmentedControl.selectedSegmentIndex
        let topCaption = topChoices[topIndex]
        topCaptionLabel!.text = topCaption.caption

        let bottomIndex: Int = bottomCaptionSegmentedControl.selectedSegmentIndex
        let bottomCaption = bottomChoices[bottomIndex]
        bottomCaptionLabel!.text = bottomCaption.caption
    }
    
}

