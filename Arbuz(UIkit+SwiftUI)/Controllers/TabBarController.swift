//
//  TabBarController.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import UIKit

class TabBarController: UITabBarController ,UITabBarControllerDelegate{

    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
         self.delegate = self
         
     }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         tabBar.barTintColor = .white
         tabBar.isTranslucent = false
         tabBar.unselectedItemTintColor = .black
         navigationController?.navigationItem.largeTitleDisplayMode = .never
         navigationController?.navigationBar.prefersLargeTitles = false
         
            let unselectedColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)

         UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
         
         // Create Tab one
         let tabOne = ViewController()
         let tabOneBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
         
         tabOne.tabBarItem = tabOneBarItem
         
         
         // Create Tab two
         let tabTwo = SearchViewController()
         let tabTwoBarItem2 = UITabBarItem(title: "", image: UIImage(systemName: "text.magnifyingglass"), selectedImage: UIImage(systemName: "text.magnifyingglass"))
         
         
         tabTwo.tabBarItem = tabTwoBarItem2
         
         // Create Tab three
         let tabThree = SearchViewController()
         let tabTwoBarItem3 = UITabBarItem(title: "", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart"))
         
         
         tabThree.tabBarItem = tabTwoBarItem3
         
         
         // Create Tab four
         let tabFour = HeartViewController()
         let tabTwoBarItem4 = UITabBarItem(title: "", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart"))
         
         
         tabFour.tabBarItem = tabTwoBarItem4
         
         
         // Create Tab five
         let tabFive = PineappleViewController()
         let tabTwoBarItem5 = UITabBarItem(title: "", image: UIImage(systemName: "brain.head.profile"), selectedImage: UIImage(systemName: "brain.head.profile"))
         
         
         tabFive.tabBarItem = tabTwoBarItem5
         
         self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
     }
     
     // UITabBarControllerDelegate method
     func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
         
     }
 }
