//
//  FlowCoordinator.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 05/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

enum FlowAction: Event {
    case finish
}

class FlowCoordinator: Coordinator {
    
    let mainView: MainView
    let toolbarHidden: Bool
    
    weak var parentCoordinator: Coordinator?
    
    var orderedViews: [UIViewController.Type] = []
    
    lazy var nextButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fastForward, target: self, action: #selector(didTapNextButton(_:)))
    }()
    
    lazy var closeButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(didTapCloseButton(_:)))
    }()
    
    lazy var navigationController: CustomNavigationController = {
        let controller = CustomNavigationController()
        controller.hideToolbar = self.toolbarHidden
        return controller
    }()
    
    init(mainView: MainView, views: [UIViewController.Type], toolbarHidden: Bool = false) {
        self.mainView = mainView
        self.orderedViews = views
        self.toolbarHidden = toolbarHidden
    }
    
    func getView(_ type: UIViewController.Type) -> UIViewController {
        let view = type.init()
        view.parentCoordinator = self
        return view
    }
    
    func start() {
        if let _ = self.orderedViews.first {
            showNextView()
            self.mainView.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func handle(_ action: Event) {
        self.parentCoordinator?.handle(action)
    }
    
    @objc func didTapNextButton(_ sender: Any) {
        showNextView()
    }
    
    @objc func didTapCloseButton(_ sender: Any) {
        self.parentCoordinator?.handle(FlowAction.finish)
    }
    
    func showNextView() {
        
        //get position from count from stack of navigation controller
        //this handles next even if user pressed back before
        
        let nextPosition = self.navigationController.viewControllers.count
        
        if nextPosition > self.orderedViews.count - 1 {
            return
        }
        
        let viewType = orderedViews[nextPosition]
        let view = self.getView(viewType)
        
        self.push(view)
        
        //if it's first view
        if nextPosition == 0 {
            view.navigationItem.leftBarButtonItem = closeButton
        }
        
        if nextPosition == self.orderedViews.count - 1 {
            view.navigationItem.rightBarButtonItem = closeButton
        } else {
            view.navigationItem.rightBarButtonItem = nextButton
        }
    }
    
    func push(_ controller: UIViewController) {

        if self.navigationController.viewControllers.isEmpty {
            self.navigationController.viewControllers = [controller]

        } else {
            self.navigationController.pushViewController(controller, animated: true)
        }
    }
}
