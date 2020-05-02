//
//  Presenter.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import Foundation

protocol FirstPresenter: AnyObject {
    func didLoad()
    func didTapShowNext()
}

class FirstDefaultPresenter {
    private weak var view: FirstView?
    private let model: FirstModel
    private let router: FirstRouter
    
    
    init(view: FirstView, router: FirstRouter, model: FirstModel) {
        self.view = view
        self.model = model
        self.router = router
        
        self.subscribe(to: RecordingServiceImpl.Events.didChangeValue, actionHandler: { [weak self] in
            self?.view?.display(value: self?.model.value)
        })
    }
}

// MARK: - Presenter protocol implementation
extension FirstDefaultPresenter: FirstPresenter {
    func didLoad() {
        self.view?.display(value: self.model.value)
    }
    
    func didTapShowNext() {
        self.router.showSecondScreen()
    }
}

// MARK: - Observer protocol implementation
extension FirstDefaultPresenter: Observer { }
