//
//  CartViewController.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import UIKit
import SwiftUI

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarController?.tabBar.barTintColor = .white
        setupView()
    }
    
    func  setupView() {
        let pr = CartView()
        let childView = UIHostingController(rootView: pr)
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childView.view)
        childView.view.frame = view.frame
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
