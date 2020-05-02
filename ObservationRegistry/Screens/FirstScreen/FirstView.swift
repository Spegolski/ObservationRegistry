//
//  View.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import UIKit

protocol FirstView: AnyObject {
    func display(value: String?)
}

class FirstViewController: UIViewController {
    var presenter: FirstPresenter!
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Show next screen", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(label)
        self.view.addSubview(button)
        self.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.label.heightAnchor.constraint(equalToConstant: 100.0),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.button.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        self.presenter.didLoad()
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        self.presenter.didTapShowNext()
    }
}

extension FirstViewController: FirstView {
    func display(value: String?) {
        self.label.text = value
    }
}
