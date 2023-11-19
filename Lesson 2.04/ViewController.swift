//
//  ViewController.swift
//  Lesson 2.04
//
//  Created by Александр Соколов on 19.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        //setupMainLabel()
        setupSlider()
        setupMainLabel()
    }
    
    @IBAction func segmentedControlAction() {
    }
    
    @IBAction func sliderAction() {
        
    }
    
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = .systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
    }
}

