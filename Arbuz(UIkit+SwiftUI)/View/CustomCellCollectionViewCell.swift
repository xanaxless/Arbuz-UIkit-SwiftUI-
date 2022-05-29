//
//  CustomCellCollectionViewCell.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import UIKit
import SwiftUI
class CustomCellCollectionViewCell: UICollectionViewCell {
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.layer.cornerRadius = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func  setupView(product: Product) {
        let pr2 = ProductFirstView(product: product)
        let childView2 = UIHostingController(rootView: pr2)
        childView2.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(childView2.view)
        childView2.view.frame = contentView.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init ")
    }
}
