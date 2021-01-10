//
//  ViewController.swift
//  GestureTest
//
//  Created by Гончаров Денис on 10.01.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var subview: UIView = {
        let view = View(frame: .zero)
        return view
    }()
    
    lazy var label: UILabel = {
        let label = Label()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.text = "Touch me"
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        view.addSubview(subview)
        let gesture = UITapGestureRecognizer()
        gesture.numberOfTapsRequired = 2
        gesture.delaysTouchesEnded = false
        gesture.addTarget(self, action: #selector(onTap(_:)))
        label.addGestureRecognizer(gesture)
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        label.sizeToFit()
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: label.bounds.height)
        label.frame = frame.insetBy(dx: 16, dy: 0)
        label.center = view.center
        subview.frame = label.bounds
        subview.center = CGPoint(x: view.center.x, y: view.center.y + 50)
    }
    
    @objc
    func onTap(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .began:
            print("began")
        case .ended:
            print("ended")
        default:
            print(sender.state.rawValue)
        }
    }
    
    @objc
    func onButtonTouch(_ sender: Any?) {
        print("ViewController onButtonTouch")
        print(sender)
    }
}

