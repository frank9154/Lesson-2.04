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
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .yellow
        // default = case 3
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .green
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        // Задаем прозрачность фона. Метод with alpha component позволяет задать новое значение для прозрачности
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        //view.alpha = CGFloat(slider.value)
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

