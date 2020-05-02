//
//  View.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import UIKit

protocol SecondView: AnyObject {
    var enteredValue: String? { get }
    func fill(with text: String?)
}

class SecondViewController: UIViewController {
    var presenter: SecondPresenter!
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 20.0)
        textField.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.textField)
        self.textField.delegate = self
        
        NSLayoutConstraint.activate([
            self.textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            self.textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
            self.textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            self.textField.heightAnchor.constraint(equalToConstant: 200.0)
        ])
        
        self.presenter.didLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter.willDisappear()
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.presenter.didEndEditing()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SecondViewController: SecondView {
    var enteredValue: String? {
        return self.textField.text
    }
    
    func fill(with text: String?) {
        self.textField.text = text
    }
}
