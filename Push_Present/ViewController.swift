//
//  ViewController.swift
//  Push_Present
//
//  Created by Admin on 3/17/21.
//

import UIKit

// TODO 6: create protocol to update title
protocol Titledelegate: class {
    func changeTitle(newTitle: String)
}

class ViewController: UIViewController {
    
    private var pushButton = UIButton()
    private var presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // TODO 2: set title
        title = "Home"
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.backgroundColor = .gray
        pushButton.layer.cornerRadius = 5
        pushButton.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
        view.addSubview(pushButton)
        
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.white, for: .normal)
        presentButton.backgroundColor = .gray
        presentButton.layer.cornerRadius = 5
        presentButton.addTarget(self, action: #selector(presentViewController), for: .touchUpInside)
        view.addSubview(presentButton)
        
        setUpView()
    }

    // TODO 3: create VC to push
    @objc func pushViewController() {
        let pushVC = PushViewController()
        navigationController?.pushViewController(pushVC, animated: true)
    }
    
    // TODO 4: create VC to present
    @objc func presentViewController() {
        let presentVC = PresentViewController()
        self.present(presentVC, animated: true, completion: nil)
        
        // TODO 9: update delegate
        presentVC.delegate = self
    }
    
    func setUpView() {
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -6),
            pushButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            pushButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 6),
            presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            presentButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

// TODO 7: override protocol methods
extension ViewController: Titledelegate {
    func changeTitle(newTitle: String) {
        title = newTitle
    }
}
