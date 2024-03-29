//
//  СontrollerChapter1.swift
//  App
//
//  Created by Stepan Polyakov on 29.03.2024.
//

import Foundation
import UIKit

class ControllerChapter1: UIViewController {
    var currentSceneId: Int16 = 1
    var amount: Int16 = 0
    let sceneManager: SceneManager
    var sentenceLabel: UILabel!
    var isSceneDisplayed: Bool = true
    var recentScenesDeque = Deque<Int16>()

    
    init(sceneManager: SceneManager) {
        self.sceneManager = sceneManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        SceneManager.shared.deleteAllScenes()
        SceneManager.shared.deleteAllChoices()
        let scenes: [scene] = scene.allScenes
        for scene in scenes {
                SceneManager.shared.createScene(scene.id, background: scene.background, character: scene.character, emotion: scene.emotion, next: scene.next, sentence: scene.sentence)
            amount += 1
        }
        let choices: [choice] = choice.allChoices
        for choice in choices {
            SceneManager.shared.createChoice(id: choice.id , c1: choice.c1, c2: choice.c2, c3: choice.c3, c4: choice.c4, n1: choice.n1, n2: choice.n2, n3: choice.n3, n4: choice.n4)
        }
        
        sentenceLabel = UILabel()
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        sentenceLabel.textAlignment = .center
        sentenceLabel.numberOfLines = 0
        view.addSubview(sentenceLabel)
        NSLayoutConstraint.activate([
                sentenceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                sentenceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        sentenceLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        sentenceLabel.center = view.center
        showScene(withId: currentSceneId)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    func showScene(withId id: Int16) {
        recentScenesDeque.append(id)
        guard let scene = sceneManager.fetchScene(id) else {
            return
        }
        isSceneDisplayed = true
        print("Scene ID: \(scene.id), Sentence: \(scene.sentence ?? ""), Character: \(scene.character ?? ""), Emotion: \(scene.emotion ?? ""), Background: \(scene.background ?? "")")
        sentenceLabel.text = scene.sentence
        if let stackView = view.subviews.first(where: { $0 is UIStackView }) as? UIStackView {
            stackView.removeFromSuperview()
        }
        //print("Sentence Label Text:", sentenceLabel.text ?? "No text set")
        
    }
    
    func showChoice(withId id: Int16) {
        guard let choice = sceneManager.fetchChoice(byID: id) else {
            return
        }
        isSceneDisplayed = false
        
        sentenceLabel.text = nil
        let choiceButtons = [choice.c1, choice.c2, choice.c3, choice.c4].filter { $0 != "" }
        let numberOfButtons = choiceButtons.count
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        switch numberOfButtons {
        case 4:
            // Добавляем кнопки в два ряда по две в каждом
            let topStackView = UIStackView()
            topStackView.axis = .horizontal
            topStackView.spacing = 20
            topStackView.alignment = .center
            topStackView.distribution = .fillEqually
            stackView.addArrangedSubview(topStackView)
            
            let bottomStackView = UIStackView()
            bottomStackView.axis = .horizontal
            bottomStackView.spacing = 20
            bottomStackView.alignment = .center
            bottomStackView.distribution = .fillEqually
            stackView.addArrangedSubview(bottomStackView)
            
            for (index, choiceText) in choiceButtons.enumerated() {
                let button = createButton(title: choiceText, tag: index + 1)
                if index < 2 {
                    topStackView.addArrangedSubview(button)
                } else {
                    bottomStackView.addArrangedSubview(button)
                }
            }
            
        case 3:
            let topStackView = UIStackView()
            topStackView.axis = .horizontal
            topStackView.spacing = 20
            topStackView.alignment = .center
            topStackView.distribution = .fillEqually
            stackView.addArrangedSubview(topStackView)
            
            let bottomStackView = UIStackView()
            bottomStackView.axis = .horizontal
            bottomStackView.spacing = 20
            bottomStackView.alignment = .center
            bottomStackView.distribution = .fillEqually
            stackView.addArrangedSubview(bottomStackView)
            
            for (index, choiceText) in choiceButtons.enumerated() {
                let button = createButton(title: choiceText, tag: index + 1)
                if index < 2 {
                    topStackView.addArrangedSubview(button)
                } else {
                    bottomStackView.addArrangedSubview(button)
                }
            }
            
        case 2:
            for (index, choiceText) in choiceButtons.enumerated() {
                let button = createButton(title: choiceText, tag: index + 1)
                stackView.addArrangedSubview(button)
            }
            
        default:
            break
        }
    }

    func createButton(title: String?, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(choiceButtonTapped(_:)), for: .touchUpInside)
        button.tag = tag
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }



    func goToNextScene() {
        guard let nextSceneId = sceneManager.fetchScene(currentSceneId)?.next else {
            return
        }
        currentSceneId = nextSceneId
        if currentSceneId <= amount {
            showScene(withId: nextSceneId)
        } else {
            showChoice(withId: nextSceneId)
        }
    }
    
    @objc func choiceButtonTapped(_ sender: UIButton) {
        guard let currentChoice = sceneManager.fetchChoice(byID: currentSceneId) else {
                return
            }
            
        let nextSceneId: Int16?
        switch sender.tag {
        case 1:
            nextSceneId = currentChoice.n1
        case 2:
            nextSceneId = currentChoice.n2
        case 3:
            nextSceneId = currentChoice.n3
        case 4:
            nextSceneId = currentChoice.n4
        default:
            nextSceneId = nil
        }
            
        if let nextSceneId = nextSceneId {
            currentSceneId = nextSceneId
            showScene(withId: nextSceneId)
        }
    }

    @objc func screenTapped() {
        if isSceneDisplayed {
            goToNextScene()
        }
    }
}

struct Deque<T> {
    private var array = [T]()

    mutating func append(_ element: T) {
        array.append(element)
        if array.count > 5 {
            array.removeFirst()
        }
    }

    func peek(at index: Int) -> T? {
        guard index >= 0 && index < array.count else {
            return nil
        }
        return array[index]
    }

    var count: Int {
        return array.count
    }
}

