//
//  ViewController_MainScreen.swift
//  App
//
//  Created by Александра Грицаенко on 26.03.2024.
//

import UIKit

class ControllerLoad: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let label = UILabel()
        label.text = "Фидес: Сетевые приключения"
        label.font = UIFont(name: "AvenirNext-Bold", size: 38)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.backgroundColor = UIColor(named: "ButtonColor")
        label.layer.borderWidth = 5
        label.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let backButton = createButton(title: "Назад", action: #selector(backButtonTapped), height: 60, width: 110)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 350),
            label.heightAnchor.constraint(equalToConstant: 110),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
        
        let buttonTitles = ["Продолжить", "Глава 1", "Глава 2", "Глава 3", "Глава 4"]
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
                button.widthAnchor.constraint(equalToConstant: 270),
                button.heightAnchor.constraint(equalToConstant: 80)
            ])
        }
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
    
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "Продолжить":
            if saveData.numChapter == 1 {
                let vc = ControllerChapter1(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else if saveData.numChapter == 2 {
                let vc = ControllerChapter2(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else if saveData.numChapter == 3 {
                let vc = ControllerChapter3(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else if saveData.numChapter == 4 {
                let vc = ControllerChapter4(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        case "Глава 1":
            saveData.numScene = 0
            fight = true
            not_peace = false
            director = false
            let vc = ControllerChapter1(sceneManager: SceneManager.shared)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case "Глава 2":
            if saveData.numChapter < 2 {
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                let attributedTitle = NSAttributedString(string: "Начните проходить историю, чтобы открылся доступ ко 2 главе", attributes: [
                    .font: UIFont(name: "AvenirNext-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.white
                ])
                alertController.setValue(attributedTitle, forKey: "attributedTitle")
                alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "ButtonColor")
                let okAction = UIAlertAction(title: "Понятно!", style: .cancel, handler: nil)
                okAction.setValue(UIColor.white, forKey: "titleTextColor")
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            } else {
                saveData.numScene = 0
                director = false
                let vc = ControllerChapter2(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        case "Глава 3":
            if saveData.numChapter < 3 {
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                let attributedTitle = NSAttributedString(string: "Начните проходить историю, чтобы открылся доступ к 3 главе", attributes: [
                    .font: UIFont(name: "AvenirNext-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.white
                ])
                alertController.setValue(attributedTitle, forKey: "attributedTitle")
                alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "ButtonColor")
                let okAction = UIAlertAction(title: "Понятно!", style: .cancel, handler: nil)
                okAction.setValue(UIColor.white, forKey: "titleTextColor")
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            } else {
                saveData.numScene = 0
                let vc = ControllerChapter3(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        case "Глава 4":
            if saveData.numChapter < 4{
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                let attributedTitle = NSAttributedString(string: "Начните проходить историю, чтобы открылся доступ к 4 главе", attributes: [
                    .font: UIFont(name: "AvenirNext-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.white
                ])
                alertController.setValue(attributedTitle, forKey: "attributedTitle")
                alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "ButtonColor")
                let okAction = UIAlertAction(title: "Понятно!", style: .cancel, handler: nil)
                okAction.setValue(UIColor.white, forKey: "titleTextColor")
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            } else {
                saveData.numScene = 0
                let vc = ControllerChapter4(sceneManager: SceneManager.shared)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
