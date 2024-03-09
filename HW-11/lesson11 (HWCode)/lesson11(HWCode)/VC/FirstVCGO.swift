//
//  FirstVcGO.swift
//  lesson11(HWCode)
//
//  Created by Евгений Сабина on 09.03.24.
//

import UIKit

class FirstVCGO: UIViewController {

    lazy var nextButton: UIButton = makeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondVC"
        self.view.backgroundColor = .systemOrange
        self.view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
        nextButton.addAction(UIAction(handler: { [weak self] _ in
          
            let vc = FirstVCGOThird()
            self?.navigationController?.pushViewController(vc, animated: true)
            
        }), for: .touchUpInside)
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton(configuration: .bordered())
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 9
        button.setTitle("goToVC", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
