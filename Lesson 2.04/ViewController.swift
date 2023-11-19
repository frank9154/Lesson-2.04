//
//  ViewController.swift
//  Lesson 2.04
//
//  Created by Александр Соколов on 19.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        //setupMainLabel()
        setupSlider()
        setupMainLabel()
    }
    
    // MARK: - IB Actions
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
    
    @IBAction func doneButtonAction (){
        guard let inputText = textField.text, !inputText.isEmpty else {
            //print("Text field is empty")
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
            // выход из метода через ретерн
            return
        }
        
         /*if let _ = Double(inputText) {
            //print("Wrong format")
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
          */
        //задаем регулярное выражение
        let usernamePattern = "^[a-zA-Z ]{3,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern).evaluate(with: inputText)
        
        if !isUsernameValid {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
            return
        }
        
        
        //передача из текстового поля в поле лейбл
        mainLabel.text = inputText
        textField.text = ""
    }
    
    // MARK: - Private Methods
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
    
        // Далее добавляем кнопку в алерт контроллер
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - Setup UI
extension ViewController {
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = .systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
    }
}
