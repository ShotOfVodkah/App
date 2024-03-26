//
//  ControllerSettings.swift
//  App
//
//  Created by Александра Грицаенко on 26.03.2024.
//

import UIKit

class ControllerSettings: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Назад", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //сделать, чтобы кнопка возвращала на преддыдущий экран
    @objc func backButtonTapped() {
        let vc = ControllerMainScreen()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
