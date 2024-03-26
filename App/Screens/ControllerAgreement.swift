//
//  ViewController.swift
//  App
//
//  Created by Stepan Polyakov on 25.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollview = UIScrollView()
    var label = UILabel()
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Согласен/Согласна", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        self.view.addSubview(scrollview)
        scrollview.addSubview(label)
        scrollview.addSubview(button)
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: scrollview.topAnchor),
            label.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            label.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
    
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor, constant: -16)
        ])
        
        label.text = "PLEASE SCROLL DOWN AND READ ALL OF THE FOLLOWING TERMS AND CONDITIONS CAREFULLY BEFORE USING THE APPLE SOFTWARE OR APPLE SERVICES.  THIS IS A LEGAL AGREEMENT BETWEEN YOU AND APPLE.  IF YOU AGREE TO BE BOUND BY ALL OF THE TERMS AND CONDITIONS, CLICK THE “AGREE” BUTTON.  BY CLICKING “AGREE” OR BY DOWNLOADING, USING OR COPYING ANY PART OF THIS APPLE SOFTWARE OR USING ANY PART OF THE APPLE SERVICES, YOU ARE AGREEING ON YOUR OWN BEHALF AND/OR ON BEHALF OF YOUR COMPANY OR ORGANIZATION TO THE TERMS AND CONDITIONS STATED BELOW.  IF YOU DO NOT OR CANNOT AGREE TO THE TERMS OF THIS AGREEMENT, YOU CANNOT USE THIS APPLE SOFTWARE OR THE APPLE SERVICES.  DO NOT DOWNLOAD OR USE THIS APPLE SOFTWARE OR APPLE SERVICES IN THAT CASE. IMPORTANT NOTE: USE OF THIS SOFTWARE IS GOVERNED BY THIS AGREEMENT AND AUTHORIZED TO BE DOWNLOADED ONLY AS PART OF THE XCODE DEVELOPER TOOLS OR/AND BY XCODE DEVELOPER TOOLS AS AN UPDATE TO THE XCODE DEVELOPER TOOLS. THIS SOFTWARE IS AUTHORIZED ONLY FOR EXECUTION ON AN APPLE-BRANDED PRODUCT RUNNING MACOS.  ANY OTHER DOWNLOAD OR USE OF THIS SOFTWARE IS   NOT AUTHORIZED AND IS IN BREACH OF THIS AGREEMENT. PLEASE SCROLL DOWN AND READ ALL OF THE FOLLOWING TERMS AND CONDITIONS CAREFULLY BEFORE USING THE APPLE SOFTWARE OR APPLE SERVICES.  THIS IS A LEGAL AGREEMENT BETWEEN YOU AND APPLE.  IF YOU AGREE TO BE BOUND BY ALL OF THE TERMS AND CONDITIONS, CLICK THE “AGREE” BUTTON.  BY CLICKING “AGREE” OR BY DOWNLOADING, USING OR COPYING ANY PART OF THIS APPLE SOFTWARE OR USING ANY PART OF THE APPLE SERVICES, YOU ARE AGREEING ON YOUR OWN BEHALF AND/OR ON BEHALF OF YOUR COMPANY OR ORGANIZATION TO THE TERMS AND CONDITIONS STATED BELOW.  IF YOU DO NOT OR CANNOT AGREE TO THE TERMS OF THIS AGREEMENT, YOU CANNOT USE THIS APPLE SOFTWARE OR THE APPLE SERVICES.  DO NOT DOWNLOAD OR USE THIS APPLE SOFTWARE OR APPLE SERVICES IN THAT CASE. IMPORTANT NOTE: USE OF THIS SOFTWARE IS GOVERNED BY THIS AGREEMENT AND AUTHORIZED TO BE DOWNLOADED ONLY AS PART OF THE XCODE DEVELOPER TOOLS OR/AND BY XCODE DEVELOPER TOOLS AS AN UPDATE TO THE XCODE DEVELOPER TOOLS. THIS SOFTWARE IS AUTHORIZED ONLY FOR EXECUTION ON AN APPLE-BRANDED PRODUCT RUNNING MACOS.  ANY OTHER DOWNLOAD OR USE OF THIS SOFTWARE IS   NOT AUTHORIZED AND IS IN BREACH OF THIS AGREEMENT. PLEASE SCROLL DOWN AND READ ALL OF THE FOLLOWING TERMS AND CONDITIONS CAREFULLY BEFORE USING THE APPLE SOFTWARE OR APPLE SERVICES.  THIS IS A LEGAL AGREEMENT BETWEEN YOU AND APPLE.  IF YOU AGREE TO BE BOUND BY ALL OF THE TERMS AND CONDITIONS, CLICK THE “AGREE” BUTTON.  BY CLICKING “AGREE” OR BY DOWNLOADING, USING OR COPYING ANY PART OF THIS APPLE SOFTWARE OR USING ANY PART OF THE APPLE SERVICES, YOU ARE AGREEING ON YOUR OWN BEHALF AND/OR ON BEHALF OF YOUR COMPANY OR ORGANIZATION TO THE TERMS AND CONDITIONS STATED BELOW.  IF YOU DO NOT OR CANNOT AGREE TO THE TERMS OF THIS AGREEMENT, YOU CANNOT USE THIS APPLE SOFTWARE OR THE APPLE SERVICES.  DO NOT DOWNLOAD OR USE THIS APPLE SOFTWARE OR APPLE SERVICES IN THAT CASE. IMPORTANT NOTE: USE OF THIS SOFTWARE IS GOVERNED BY THIS AGREEMENT AND AUTHORIZED TO BE DOWNLOADED ONLY AS PART OF THE XCODE DEVELOPER TOOLS OR/AND BY XCODE DEVELOPER TOOLS AS AN UPDATE TO THE XCODE DEVELOPER TOOLS. THIS SOFTWARE IS AUTHORIZED ONLY FOR EXECUTION ON AN APPLE-BRANDED PRODUCT RUNNING MACOS.  ANY OTHER DOWNLOAD OR USE OF THIS SOFTWARE IS   NOT AUTHORIZED AND IS IN BREACH OF THIS AGREEMENT."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
    }
    
    @objc func didTapButton() {
        let vc = ViewControllerMainScreen()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
