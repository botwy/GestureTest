//
//  View.swift
//  GestureTest
//
//  Created by Гончаров Денис on 10.01.2021.
//

import UIKit

class View: UIView {

    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.addTarget(nil, action: #selector(onButtonTouch(_:)), for: .touchUpInside)
        self.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = bounds
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(onButtonTouch(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    @objc
    func onButtonTouch(_ sender: Any?) {
        print("View onButtonTouch")
    }
}
