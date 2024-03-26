//
//  ViewController_MainScreen.swift
//  App
//
//  Created by Александра Грицаенко on 26.03.2024.
//

import UIKit

class ControllerMainScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let label = UILabel()
        label.text = "Game Name"
        label.font = UIFont(name: "AvenirNext-Bold", size: 38)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(named: "ButtonColor")
        label.layer.borderWidth = 5
        label.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 350),
            label.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        let buttonTitles = ["Новая игра", "Загрузить", "Настройки", "Об авторах", "Выход"]
        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 38)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(named: "ButtonColor")
            button.layer.borderWidth = 5
            button.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            view.addSubview(button)
                    
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CGFloat(index) * 88 + 65),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.widthAnchor.constraint(equalToConstant: 253),
                button.heightAnchor.constraint(equalToConstant: 80)
            ])
        }
    }
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "Новая игра":
            print("Start")
        case "Загрузить":
            print("Load")
        case "Настройки":
            print("Settings")
        case "Об авторах":
            print("About Authors")
        case "Выход":
            print("Exit")
        default:
            break
        }
    }
}
