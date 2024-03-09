//
//  TabBarAllViewController.swift
//  lesson11(HWCode)
//
//  Created by Евгений Сабина on 09.03.24.
//

import UIKit

class TabBarAllViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = FirstVC()
        let firstVCNavigation = NavigationVC(rootViewController: firstVC)
        
        let secondVC = SecondVC()
        let secondVCNavigation = NavigationVC(rootViewController: secondVC)
       
        
        
        firstVCNavigation.tabBarItem = UITabBarItem(title: "VController1", image: UIImage(systemName: "book.closed.fill"), tag: 0)
        secondVCNavigation.tabBarItem = UITabBarItem(title: "VController2", image: UIImage(systemName: "figure.run.circle.fill"), tag: 1)
        
        viewControllers = [firstVCNavigation, secondVCNavigation]
    }
    



}
