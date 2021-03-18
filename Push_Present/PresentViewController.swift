//
//  PresentViewController.swift
//  Push_Present
//
//  Created by Admin on 3/17/21.
//

import UIKit

class PresentViewController: UIViewController {
    
    // TODO 8: set up delegate
    weak var delegate: Titledelegate?
    
    private var label = UILabel()
    private var textField = UITextField()
    private var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Present"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Presenting me"
        label.font = UIFont(name: "", size: 18)
        label.tintColor = .black
        view.addSubview(label)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.text = "Do it"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(button)
        
        constraints()
    }
    
    @objc func dismissViewController() {
        // TODO 5: dismiss view controller
        self.dismiss(animated: true, completion: nil)
        // TODO 9: call delegate function
        delegate?.changeTitle(newTitle: textField.text ?? "No more")
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100),
            textField.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
