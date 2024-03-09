//
//  ViewController.swift
//  HW.DELEGATION
//
//  Created by Евгений Сабина on 09.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    var text: String = ""
    
    
    @IBOutlet weak var label: UILabel!
    
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    label.text = text
    
}

    @IBAction func goToEditProfile(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        nextVC.delegate = self
        self.navigationController?.pushViewController(nextVC, animated: true)

    }
    
}

extension ViewController: SecondViewControllerDelegate {
    func send(_ name: String, _ secondName: String, _ date: String) {
        label.text = "\(name) | \(secondName) | \(date)"

    }
}
