//
//  Presenter.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol SecondPresenter: AnyObject {
    func didLoad()
    func didEndEditing()
    func willDisappear()
}

class SecondDefaultPresenter {
    
    // MARK: - Private properties
    
    private weak var view: SecondView?
    private let model: SecondModel
    
    // MARK: - Public API
    
    init(view: SecondView, model: SecondModel) {
        self.view = view
        self.model = model
    }
}

// MARK: - Presenter protocol implementation
extension SecondDefaultPresenter: SecondPresenter {
    func didLoad() {
        self.view?.fill(with: self.model.value)
    }
    
    func didEndEditing() {
        self.model.update(value: self.view?.enteredValue)
    }
    
    func willDisappear() {
        self.model.update(value: self.view?.enteredValue)
    }
}
