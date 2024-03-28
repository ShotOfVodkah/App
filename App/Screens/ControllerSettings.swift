//
//  ControllerSettings.swift
//  App
//
//  Created by Александра Грицаенко on 26.03.2024.
//

import UIKit

class ControllerSettings: UIViewController {
    
    let soundSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let settingslabel = setupLabel(text: "Настройки", fontSize: 38, height: 110, width: 350)
        
        let rulesButton = createButton(title: "Правила игры", action: #selector(rulesButtonTapped), height: 70, width: 300)
        
        let agreementButton = createButton(title: "Пользовательское соглашение", action: #selector(agreementButtonTapped), height: 90, width: 300)
        agreementButton.titleLabel?.numberOfLines = 2
        agreementButton.titleLabel?.textAlignment = .center
        
        let soundlabel = setupLabel(text: "Отключить \nзвук в игре", fontSize: 30, height: 90, width: 230)
        
        soundSwitch.frame = CGRect(x: 290, y: 430, width: 0, height: 0)
        soundSwitch.onTintColor = UIColor(named: "ButtonBorder")
        let scale: CGFloat = 1.2
        soundSwitch.transform = CGAffineTransform(scaleX: scale, y: scale)
        soundSwitch.addTarget(self, action: #selector(soundSwitchValueChanged), for: .valueChanged)
        view.addSubview(soundSwitch)
        soundSwitch.isOn = UserDefaults.standard.bool(forKey: "soundEnabled")
        
        let backButton = createButton(title: "Назад", action: #selector(backButtonTapped), height: 60, width: 110)
        
        NSLayoutConstraint.activate([
            settingslabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.topAnchor.constraint(equalTo: settingslabel.bottomAnchor, constant: 30),
            agreementButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 10),
            soundlabel.topAnchor.constraint(equalTo: agreementButton.bottomAnchor, constant: 10),
            soundlabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 162),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
    func setupLabel(text: String, fontSize: CGFloat, height: CGFloat, width: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "AvenirNext-Bold", size: fontSize)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(named: "ButtonColor")
        label.layer.borderWidth = 5
        label.numberOfLines = text.contains("\n") ? 0 : 1
        label.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: width),
            label.heightAnchor.constraint(equalToConstant: height)
        ])
        return label
    }
    
    func createButton(title: String, action: Selector, height: CGFloat, width: CGFloat) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 30)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: width),
            button.heightAnchor.constraint(equalToConstant: height)
        ])
        return button
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func rulesButtonTapped() {
        let vc = ControllerRules()
        self.present(vc, animated: true, completion: nil)
    }
                                         
    @objc func agreementButtonTapped() { //возможно сделать перекидывание на файл с пользовательским соглашением, либо как-то сделать чтобы не было кнопки согласен/согласна
        let vc = ControllerAgreement()
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func soundSwitchValueChanged() {
        UserDefaults.standard.set(soundSwitch.isOn, forKey: "soundEnabled")
        if soundSwitch.isOn {
            print("Звук включен")
        } else {
            print("Звук выключен")
        }
    }
}
