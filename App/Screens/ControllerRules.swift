//
//  ControllerRules.swift
//  App
//
//  Created by Александра Грицаенко on 28.03.2024.
//

import UIKit

class ControllerRules: UIViewController {
    
    var scrollView = UIScrollView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let ruleslabel = UILabel()
        ruleslabel.text = "Правила игры"
        ruleslabel.font = UIFont(name: "AvenirNext-Bold", size: 38)
        ruleslabel.textAlignment = .center
        ruleslabel.textColor = .white
        ruleslabel.backgroundColor = UIColor(named: "ButtonColor")
        ruleslabel.layer.borderWidth = 5
        ruleslabel.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        ruleslabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ruleslabel)
        
        NSLayoutConstraint.activate([
            ruleslabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            ruleslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ruleslabel.widthAnchor.constraint(equalToConstant: 350),
            ruleslabel.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        setupUI()
    }
    
    private func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        label.text = """
        Визуальная новелла - это интерактивный жанр игр, схожий с книгами-квестами, где игроки принимают участие в повествовании и принимают ключевые решения, влияющие на сюжет и его развитие. Правила игры в визуальную новеллу могут варьироваться в зависимости от конкретного проекта, однако обычно они включают в себя следующие аспекты:

        1. Повествование и сюжет: В визуальной новелле игроки взаимодействуют с историей через прочтение текста и просмотр изображений. Сюжет может быть линейным или включать множество возможных концовок в зависимости от принятых решений.

        2. Выборы и решения: Игроки часто сталкиваются с выборами и решениями, которые влияют на ход сюжета и развитие персонажей. Эти решения могут иметь долгосрочные последствия и влиять на конечный исход игры.

        3. Интерактивные элементы: Визуальные новеллы могут содержать интерактивные элементы, такие как мини-игры, загадки или диалоги с персонажами.

        4. Иллюстрации и анимации: Изображения и анимации часто используются для дополнения текста и создания атмосферы игры.

        5. Звук и музыка: Аудиоэффекты и музыка могут усилить атмосферу игры и добавить эмоциональную глубину к событиям и персонажам.

        6. Сохранение прогресса: Визуальные новеллы обычно предоставляют возможность сохранения прогресса игрока, позволяя им вернуться к игре и продолжить с того же места.

        7. Достижения и концовки: Игроки могут получать достижения за выполнение определенных задач или достижение определенных концовок. Концовки могут быть различными в зависимости от принятых решений и действий игрока.

        Игра в визуальную новеллу - это погружение в увлекательный мир истории, в котором игроки взаимодействуют с персонажами, принимают ключевые решения и наслаждаются захватывающим сюжетом.
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
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

