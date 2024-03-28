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
        Грицаенко Александра и Поляков Степан - талантливые студенты 2 курса НИУ ВШЭ ФКН ПМИ, обладающие огромным потенциалом и страстью к разработке мобильных приложений. Их совместное творчество поражает своей креативностью и инновационным подходом.

        Они не просто создают приложения, а создают настоящие шедевры, в которых каждая деталь продумана до мелочей. Их творческий подход к разработке позволяет создавать приложения, которые не только функциональны, но и привлекательны для пользователей.

        Их последний проект - визуальная новелла для iPhone - является великолепным примером их профессионализма и творческого вдохновения. Благодаря их усилиям и таланту, пользователи могут погрузиться в увлекательный мир истории, оживленный яркими персонажами и захватывающим сюжетом.

        Их приложение не только увлекательно, но и функционально. Они уделяют внимание каждой детали, чтобы обеспечить пользователям лучший опыт использования приложения. В результате их труда получается не просто приложение, а настоящее произведение искусства, которое приносит удовольствие и вдохновляет.

        Грицаенко Александра и Поляков Степан - это будущее разработки мобильных приложений, и их талант и преданность делу обещают многое для индустрии в будущем. Их работы вызывают восхищение и вдохновляют на новые творческие свершения.
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
