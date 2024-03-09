//
//  VCBookFirst.swift
//  lesson11(HWStoryboard)
//
//  Created by Евгений Сабина on 09.03.24.
//

import UIKit

class VCBookFirst: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func goToVC(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "vcBookSecond") {
            self.navigationController?.pushViewController(vc, animated: true)
            vc.title = "SecondVC"
        }
    }
    
    

}
