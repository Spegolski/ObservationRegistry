//
//  Example.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

class FirstObservable: Observable {
    enum Values: Convertible {
        case didChangeValue
    }
    
    typealias `Event` = Values
    
    func didChangeValue() {
        self.notify(event: .didChangeValue)
    }
}

class SecondObservable: Observable {
    enum Values: Convertible {
        case didTapButton
    }
    
    typealias `Event` = Values
    
    func didChangeValue() {
        self.notify(event: .didTapButton)
    }
}

class FirstObserver: Observer {
    func subscribeToEvents() {
        self.subscribe(to: FirstObservable.Values.didChangeValue, actionHandler: { [weak self] in
            self?.didChangeValue()
        })
        self.subscribe(to: SecondObservable.Values.didTapButton, actionHandler: { [weak self] in
            self?.didTapButton()
        })
    }
    
    @objc
    func didChangeValue() { }
    
    @objc
    func didTapButton() { }
}
