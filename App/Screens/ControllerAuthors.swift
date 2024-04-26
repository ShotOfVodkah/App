//
//  ControllerAboutAuthors.swift
//  App
//
//  Created by Александра Грицаенко on 27.03.2024.
//

import UIKit

class ControllerAuthors: UIViewController {
    
    var scrollView = UIScrollView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let authorslabel = UILabel()
        authorslabel.text = "Об авторах"
        authorslabel.font = UIFont(name: "AvenirNext-Bold", size: 38)
        authorslabel.textAlignment = .center
        authorslabel.textColor = .white
        authorslabel.backgroundColor = UIColor(named: "ButtonColor")
        authorslabel.layer.borderWidth = 5
        authorslabel.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        authorslabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorslabel)
        
        NSLayoutConstraint.activate([
            authorslabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            authorslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorslabel.widthAnchor.constraint(equalToConstant: 350),
            authorslabel.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        setupUI()
    }
    
    private func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        label.text = """
        Данная образовательная компьютерная игра была создана креативной командой из НИУ ВШЭ в 2024 году! Вам передают «Привет!»:
        
        
        Руководитель:
        Ковалева Наталия Николаевна (Madam Cyfra)
        
        
        Команда программистов:
        Грицаенко Александра Вячеславовна
        Поляков Степан Андреевич
        Слипченко Вера Николаевна
        Рублева Виталия Владимировна
        
        
        Команда юристов-сценаристов:
        Волчихина Полина Андреевна
        Третьякова Элина
        Грибова Екатерина
        Идрисов Равшан Равшанович
        Палий Сергей Александрович (mausno)
        
        
        Команда дизайнеров-иллюстраторов:
        Самотеева Анна Александровна (GodotBruh)
        Лаптева Дарья Романовна (Smakonca)
        Никина Екатерина Михайловна
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.textColor = UIColor(named: "TextColor")
        scrollView.addSubview(label)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: scrollView.topAnchor),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
