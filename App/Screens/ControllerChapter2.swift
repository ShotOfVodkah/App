//
//  СontrollerChapter1.swift
//  App
//
//  Created by Stepan Polyakov on 29.03.2024.
//

import Foundation
import UIKit

class ControllerChapter2: UIViewController {
    var currentSceneId: Int16 = saveData.numScene
    var amount: Int16 = 6
    let sceneManager: SceneManager
    var sentenceLabel: UILabel!
    var characterLabel: UILabel!
    var isSceneDisplayed: Bool = true
    var recentScenesDeque = Deque<Int16>()
    
    let menuView = UIView()
    
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
        
        saveData.numChapter = 2
        
        SceneManager.shared.deleteAllScenes()
        SceneManager.shared.deleteAllChoices()
        let scenes: [scene] = scene.allScenes2
        for scene in scenes {
            SceneManager.shared.createScene(scene.id, background: scene.background, character: scene.character, emotion: scene.emotion, next: scene.next, sentence: scene.sentence,on_screen: scene.on_screen)
            amount += 1
        }
        let choices: [choice] = choice.allChoices2
        for choice in choices {
            SceneManager.shared.createChoice(id: choice.id , c1: choice.c1, c2: choice.c2, c3: choice.c3, c4: choice.c4, n1: choice.n1, n2: choice.n2, n3: choice.n3, n4: choice.n4)
        }
        
        sentenceLabel = UILabel()
        sentenceLabel.textAlignment = .center
        sentenceLabel.numberOfLines = 0
        sentenceLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
        sentenceLabel.textColor = .white
        sentenceLabel.backgroundColor = UIColor(named: "ButtonColor")
        sentenceLabel.layer.borderWidth = 1
        sentenceLabel.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sentenceLabel)
        
        characterLabel = UILabel()
        characterLabel.textAlignment = .center
        characterLabel.textColor = .white
        characterLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
        characterLabel.backgroundColor = UIColor(named: "ButtonColor")
        characterLabel.numberOfLines = 0
        characterLabel.layer.borderWidth = 1
        characterLabel.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(characterLabel)
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuView)
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.heightAnchor.constraint(equalToConstant: 85)
        ])
        
        let buttons = ["Выход", "Информация", "История", "Настройки"]
        var previousButton: UIButton?
        for title in buttons {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 14)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(named: "ButtonColor")
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
            menuView.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
                button.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 0.25)
            ])
            
            if let previousButton = previousButton {
                NSLayoutConstraint.activate([
                    button.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    button.leadingAnchor.constraint(equalTo: menuView.leadingAnchor)
                ])
            }
            previousButton = button
        }
        
        NSLayoutConstraint.activate([
            sentenceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sentenceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            sentenceLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            characterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterLabel.bottomAnchor.constraint(equalTo: sentenceLabel.topAnchor, constant: -10),
            characterLabel.widthAnchor.constraint(equalToConstant: 230)
        ])
        
        showScene(withId: currentSceneId)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func screenTapped(_ sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: self.view)
        if touchPoint.y < 200 {
            menuView.isHidden = !menuView.isHidden
        } else {
            if isSceneDisplayed {
                goToNextScene()
            }
        }
    }
    
    @objc func menuButtonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        switch title {
        case "Выход":
            let vc = ControllerMainScreen()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case "Информация":
            let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
            let attributedTitle = NSAttributedString(string: "Информация", attributes: [
                .font: UIFont(name: "AvenirNext-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 18),
                .foregroundColor: UIColor.white
            ])
            alertController.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessage = NSMutableAttributedString(string:
"""

Комментарий 1:

Унижение чести и достоинства человека - ситуация, когда кто-то сознательно или намеренно делает или говорит что-то, что причиняет другому человеку боль и стыд. Например, оскорблять, унижать, издеваться или уничижать кого-то может нанести ущерб его самооценке и самочувствию.
Ответственность за оскорбление чести и достоинства личности отражены в статье 5.61 Кодекса об Административных Правонарушениях РФ. В 2020 году за оскорбление личности предусмотрено наказание в виде штрафа, в размере: 1000 - 3000 рублей для физических лиц


Комментарий 2:

Правовая грамотность - знание основных правил и законов, которые есть в стране, а также своих прав, обязанностей и способов их защиты. Правовая грамотность необходима каждому гражданину вне зависимости от возраста. Улучшить уровень можно при помощи изучения положений на «Официальном интернет-портале правовой информации» (pravo.gov.ru), а также на Едином портале государственных услуг Российской Федерации, более того законы РФ являются базовым инструментом для повышения своей правовой грамотности.
Правовая справка - это документ, который включает в себя содержание и подтверждение каких-либо фактов.


Комментарий 3:

За оскорбление личности может наступить административная ответственность по статье 5.61 Кодекса Российской Федерации об административных правонарушениях.
Оскорбление представляет собой действия, направленные на унижение чести и достоинства другого лица, выраженные в неприличной форме.
Неприличной следует считать циничную, противоречащую нравственным нормам поведения в обществе форму унизительного обращения с человеком.
Как оскорбление можно расценивать непристойные шутки, нецензурную брань и оскорбительные жесты в адрес конкретного лица. 
Субъектом данного правонарушения могут быть и несовершеннолетний гражданин, достигший 16-летнего возраста, оскорбивший, к примеру, в социальной сети своего сверстника.
Кроме того, необходимо помнить, что привлечение лица к административной ответственности за оскорбление не является основанием для освобождения его от обязанности денежной компенсации причиненного потерпевшему морального вреда в соответствии со статьей 151 Гражданского кодекса Российской Федерации.


Комментарий 4:

Telegram — популярный мессенджер, который позволяет общаться с друзьями и коллегами, отправлять сообщения, звонить, видео чатиться, делиться фотографиями и документами. Однако, так как Telegram имеет свои правила использования, существуют определенные ограничения и запреты, которыми пользователи должны следовать.

Вот некоторые действия, которые стоит избегать в Telegram:
1. Распространение контента, нарушающего законодательство. Запрещено отправлять или публиковать материалы, которые нарушают авторские права, содержат дискриминацию, ненависть, насилие, порнографию или другой контент, запрещенный законодательством.
2. Создание спама и массовой рассылки. Нежелательно использовать Telegram для массовой отправки нежелательной рекламной информации или спама.
3. Оскорбления, угрозы и ненависть. Запрещено использовать Telegram для оскорблений, угроз и проявления ненависти по отношению к другим пользователям или группам.
4. Распространение ложной информации. Необходимо избегать распространения ложной информации или фейковых новостей, которые могут вводить в заблуждение других пользователей.
5. Взлом аккаунтов и использование чужой личной информации. Запрещено пытаться взламывать аккаунты или использовать чужие личные данные без согласия владельца.
""")
            
            attributedMessage.addAttributes([NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 13) ?? UIFont.systemFont(ofSize: 16),
                                             .foregroundColor: UIColor.white], range: NSRange(location: 0, length: attributedMessage.length))
            alertController.setValue(attributedMessage, forKey: "attributedMessage")
            alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "ButtonColor")
            let okAction = UIAlertAction(title: "Понятно!", style: .cancel, handler: nil)
            okAction.setValue(UIColor.white, forKey: "titleTextColor")
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        case "История":
            if recentScenesDeque.count > 0 {
                var recentScenesArray = [Int16]()
                for index in 0..<recentScenesDeque.count {
                    if let sceneId = recentScenesDeque.peek(at: index) {
                        recentScenesArray.append(sceneId)
                    }
                }
                
                let alertController = UIAlertController(title: "", message: nil, preferredStyle: .alert)
                let attributedTitle = NSAttributedString(string: "Последние реплики", attributes: [
                    .font: UIFont(name: "AvenirNext-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.white
                ])
                alertController.setValue(attributedTitle, forKey: "attributedTitle")
                
                var message = "\n"
                for sceneId in recentScenesArray {
                    if let scene = sceneManager.fetchScene(sceneId) {
                        message += "\(scene.character ?? ""): \(scene.sentence ?? "")\n\n"
                    }
                }
                
                let attributedMessage = NSMutableAttributedString(string: message)
                attributedMessage.addAttributes([NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 13) ?? UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white], range: NSRange(location: 0, length: attributedMessage.length))
                alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "ButtonColor")
                alertController.setValue(attributedMessage, forKey: "attributedMessage")
                let okAction = UIAlertAction(title: "Понятно!", style: .cancel, handler: nil)
                okAction.setValue(UIColor.white, forKey: "titleTextColor")
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                let attributedTitle = NSAttributedString(string: "Последние реплики", attributes: [
                    .font: UIFont(name: "AvenirNext-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.white
                ])
                alertController.setValue(attributedTitle, forKey: "attributedTitle")
                let attributedMessage = NSMutableAttributedString(string: "Начните проходить историю, чтобы появились последние несколько реплик")
                attributedMessage.addAttributes([NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 13) ?? UIFont.systemFont(ofSize: 16),
                                                 .foregroundColor: UIColor.white], range: NSRange(location: 0, length: attributedMessage.length))
                alertController.setValue(attributedMessage, forKey: "attributedMessage")
                alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(named: "ButtonColor")
                let okAction = UIAlertAction(title: "Понятно!", style: .cancel, handler: nil)
                okAction.setValue(UIColor.white, forKey: "titleTextColor")
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
        case "Настройки":
            let vc = ControllerSettings()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
    
    func showScene(withId id: Int16) {
        recentScenesDeque.append(id)
        guard let scene = sceneManager.fetchScene(id) else {
            return
        }
        isSceneDisplayed = true
        print("Scene ID: \(scene.id), Sentence: \(scene.sentence ?? ""), Character: \(scene.character ?? ""), Emotion: \(scene.emotion ?? ""), Background: \(scene.background ?? "")")
        view.subviews.forEach { subview in
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
        if let backgroundName = scene.background,
           let backgroundImage = UIImage(named: backgroundName) {
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(backgroundImageView, at: 0)
            NSLayoutConstraint.activate([
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        } else {
            print("Image not found for background:", scene.background ?? "Unknown")
        }
        sentenceLabel.text = scene.sentence
        characterLabel.text = scene.character
        if let characterName = scene.on_screen,
           let emotion = scene.emotion,
           let characterImage = UIImage(named: "\(characterName)_\(emotion)") {
            let characterImageView = UIImageView(image: characterImage)
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(characterImageView)
            let screenHeight = view.frame.size.height
            let characterHeight = (screenHeight * 3) / 2
            let characterWidth = (characterHeight * characterImage.size.width) / characterImage.size.height
            view.addSubview(sentenceLabel)
            view.addSubview(characterLabel)
            
            NSLayoutConstraint.activate([
                characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                characterImageView.topAnchor.constraint(equalTo: view.topAnchor),
                characterImageView.widthAnchor.constraint(equalToConstant: characterWidth),
                characterImageView.heightAnchor.constraint(equalToConstant: characterHeight),
                sentenceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                sentenceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
                sentenceLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
                characterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                characterLabel.bottomAnchor.constraint(equalTo: sentenceLabel.topAnchor, constant: -10),
            ])
        } else {
            print("Image not found for character:", scene.on_screen ?? "Unknown", scene.emotion ?? "Unknown")
        }
        
        if let stackView = view.subviews.first(where: { $0 is UIStackView }) as? UIStackView {
            stackView.removeFromSuperview()
        }
    }
    
    func showChoice(withId id: Int16) {
        guard let choice = sceneManager.fetchChoice(byID: id) else {
            return
        }
        isSceneDisplayed = false
        
        sentenceLabel.text = nil
        characterLabel.text = nil
        let choiceButtons = [choice.c1, choice.c2, choice.c3, choice.c4].filter { $0 != "" }
        
        let stackView = UIStackView()
        for (index, choiceText) in choiceButtons.enumerated() {
            let button = createButton(title: choiceText, tag: index + 1)
            stackView.addArrangedSubview(button)
        }
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }

    func createButton(title: String?, tag: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(choiceButtonTapped(_:)), for: .touchUpInside)
        button.tag = tag
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.layer.borderColor = UIColor(named: "ButtonBorder")?.cgColor
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 20)
        button.layer.cornerRadius = 10
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 350).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }

    func goToNextScene() {
        guard var nextSceneId = sceneManager.fetchScene(currentSceneId)?.next else {
            return
        }
        if currentSceneId == 94 {
            director = true
        } else if currentSceneId == 45 {
            fight = false
        }
        if currentSceneId == 26 && !fight {
            nextSceneId = 27
        } else if currentSceneId == 131 && not_peace{
            nextSceneId = 137
        }
        if nextSceneId == -1 {
            saveData.numScene = 0
            let vc = ControllerChapter3(sceneManager: SceneManager.shared)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            return
        }
        saveData.numScene = currentSceneId
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
}

