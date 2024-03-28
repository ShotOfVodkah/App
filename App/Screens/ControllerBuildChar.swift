//
//  ControllerBuildCharacter.swift
//  App
//
//  Created by Александра Грицаенко on 26.03.2024.
//

import UIKit

class ControllerBuildChar: UIViewController {
    
    let birthDateKey = "selectedBirthDate"
    let nameKey = "enteredName"
    let genderKey = "selectedGender"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let label = makeLabel(text: "Собери своего персонажа", size: 38, width: 350, height: 150)
        
        let username = UITextField()
        username.placeholder = "Введите имя"
        username.font = UIFont(name: "AvenirNext-Bold", size: 25)
        username.textColor = .white
        username.backgroundColor = UIColor(named: "ButtonColor")
        username.layer.borderWidth = 5
        username.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        username.textAlignment = .center
        username.translatesAutoresizingMaskIntoConstraints = false
        username.addTarget(self, action: #selector(saveName), for: .editingDidEndOnExit)
        view.addSubview(username)
        
        let genderlabel = makeLabel(text: "Выберите пол:", size: 25, width: 320, height: 60)
        let genderselection = UISegmentedControl(items: ["Мужской", "Женский"])
        genderselection.selectedSegmentIndex = 0
        genderselection.addTarget(self, action: #selector(saveGender(_:)), for: .valueChanged)
        genderselection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderselection)
        
        let agelabel = makeLabel(text: "Выберите дату рождения", size: 25, width: 320, height: 80)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0, y: 0, width: 340, height: 70)
        datePicker.backgroundColor = UIColor(named: "ButtonColor")
        datePicker.layer.borderWidth = 5
        datePicker.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        datePicker.layer.cornerRadius = 10
        datePicker.clipsToBounds = true
        datePicker.contentMode = .center
        view.addSubview(datePicker)
        
        let menuButton = UIButton()
        menuButton.setTitle("Назад", for: .normal)
        configureButton(menuButton)
        menuButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let nextButton = UIButton()
        nextButton.setTitle("Далее", for: .normal)
        configureButton(nextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        let buttonStack = UIStackView(arrangedSubviews: [menuButton, nextButton])
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.spacing = 50
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        let mainStack = UIStackView(arrangedSubviews: [label, username, genderlabel, genderselection, agelabel, datePicker, buttonStack])
        mainStack.axis = .vertical
        mainStack.alignment = .center
        mainStack.spacing = 13
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            username.widthAnchor.constraint(equalToConstant: 320),
            username.heightAnchor.constraint(equalToConstant: 60),
            buttonStack.widthAnchor.constraint(equalToConstant: 350),
            menuButton.heightAnchor.constraint(equalToConstant: 70),
            nextButton.heightAnchor.constraint(equalToConstant: 70),
            menuButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor)
        ])
    }
    
    func configureButton(_ button: UIButton) {
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 30)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeLabel(text: String, size: CGFloat, width: CGFloat, height: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "AvenirNext-Bold", size: size)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(named: "ButtonColor")
        label.layer.borderWidth = 5
        label.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: width).isActive = true
        label.heightAnchor.constraint(equalToConstant: height).isActive = true
        return label
    }
    
    @objc func saveName(_ sender: UITextField) { //нет обработки не введенного имени
        UserDefaults.standard.set(sender.text, forKey: nameKey)
        if let enteredName = sender.text, !enteredName.isEmpty {
            UserDefaults.standard.set(enteredName, forKey: nameKey)
            print("Name saved:", enteredName)
        } else {
            print()
        }
    }
    
    @objc func saveGender(_ sender: UISegmentedControl) {
        let selectedGender = sender.selectedSegmentIndex
        UserDefaults.standard.set(selectedGender, forKey: genderKey)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) { //нет обработки не введенного возраста
        UserDefaults.standard.set(sender.date, forKey: birthDateKey)
        print("Selected date:", sender.date)
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func nextButtonTapped() { //сделать переход на начало первой главы
        print("Next Button Tapped")
    }
}
