//
//  TabBarController.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import UIKit

class TabBarController: UITabBarController ,UITabBarControllerDelegate{
    // singleton due to the fact the we have only one cart in whole app
    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
         self.delegate = self
         
         object_setClass(self.tabBar, CustomTabbar.self)
         (self.tabBar as! CustomTabbar).setup()
     }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         tabBar.barTintColor = .white
         tabBar.isTranslucent = false
         tabBar.barStyle = .default
         tabBar.unselectedItemTintColor = .black
             tabBar.selectedItem?.badgeColor = .green
         
         
         
         
         // Create Tab one
         let tabOne = ViewController()
         let tabOneBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
         
         tabOne.tabBarItem = tabOneBarItem
         
         
         // Create Tab two
         let tabTwo = SearchViewController()
         let tabTwoBarItem = UITabBarItem(title: "", image: UIImage(systemName: "text.magnifyingglass"), selectedImage: UIImage(systemName: "text.magnifyingglass"))
         
         
         tabTwo.tabBarItem = tabTwoBarItem
         
         // Create Tab three
         let tabThree = CartViewController()
         let tabThreeBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart"))
         
         
         tabThree.tabBarItem = tabThreeBarItem
         
         
         // Create Tab four
         let tabFour = HeartViewController()
         let tabFourBarItem = UITabBarItem(title: "", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart"))
         
         
         tabFour.tabBarItem = tabFourBarItem
         
         
         // Create Tab five
         let tabFive = PineappleViewController()
         let tabFiveBarItem = UITabBarItem(title: "", image: UIImage(systemName: "brain.head.profile"), selectedImage: UIImage(systemName: "brain.head.profile"))
         
         
         tabFive.tabBarItem = tabFiveBarItem
         
         self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
        
     }
     
     // UITabBarControllerDelegate method
     func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
         navigationController?.navigationItem.largeTitleDisplayMode = .never
         navigationController?.navigationBar.prefersLargeTitles = false
     }
    
    //Delegate methods
       func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
           print("Should select viewController: \(viewController.title ?? "") ?")
           return true;
       }
    
}

class CustomTabbar: UITabBar{
    func setup() {
        backgroundColor = .white
        selectedItem?.badgeColor = .green
        unselectedItemTintColor = .black
        barTintColor = .white
    }
    
    
}
