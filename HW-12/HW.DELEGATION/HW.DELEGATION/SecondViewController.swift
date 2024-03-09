//
//  SecondViewController.swift
//  HW.DELEGATION
//
//  Created by Евгений Сабина on 09.03.24.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {

    func send(_ text1: String, _ text2: String, _ text3: String)
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate? = nil
    
    @IBOutlet weak var field1: UITextField!
    
    @IBOutlet weak var field2: UITextField!
    
    @IBOutlet weak var field3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func saveReturn(_ sender: UIButton) {
        guard let text1 = field1.text else {return}
        guard let text2 = field2.text else {return}
        guard let text3 = field3.text else {return}
        self.delegate?.send(text1, text2, text3)
        self.navigationController?.popViewController(animated: true)
    }
}
    
    


