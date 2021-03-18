//
//  PushViewController.swift
//  Push_Present
//
//  Created by Admin on 3/17/21.
//

import UIKit

class PushViewController: UIViewController {

    private var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Push"
        
       // navigationController?.popViewController(animated: true)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press the button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        view.addSubview(button)
        
        constraints()
    }
    
    @objc func pressedButton() {
        let vc = ThirdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
