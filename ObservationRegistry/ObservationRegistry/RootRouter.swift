//
//  RootRouter.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import UIKit

class RootRouter {
    private weak var initialView: FirstViewController?
    
    private let recordingService: RecordingService
    
    init() {
        self.recordingService = RecordingServiceImpl()
    }
    
    func initialViewController() -> UIViewController {
        let view = FirstViewController()
        let model = FirstDefaultModel(service: self.recordingService)
        let presenter = FirstDefaultPresenter(view: view, router: self, model: model)
        view.presenter = presenter
        self.initialView = view
        
        return UINavigationController(rootViewController: view)
    }
}

extension RootRouter: FirstRouter {
    func showSecondScreen() {
        let view = SecondViewController()
        let model = SecondDefaultModel(service: self.recordingService)
        let presenter = SecondDefaultPresenter(view: view, model: model)
        view.presenter = presenter
        
        self.initialView?.show(view, sender: self)
    }
}
