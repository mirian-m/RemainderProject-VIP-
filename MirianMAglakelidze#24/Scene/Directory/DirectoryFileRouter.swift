//
//  DirectoryFileRouter.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/23/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol DirectoryFileRoutingLogic {
    func routeToRemainder(segue: UIStoryboardSegue?)
}

protocol DirectoryFileDataPassing {
    var dataStore: DirectoryFileDataStore? { get }
}

class DirectoryFileRouter: NSObject, DirectoryFileRoutingLogic, DirectoryFileDataPassing {
    weak var viewController: DirectoryFileViewController?
    var dataStore: DirectoryFileDataStore?
    
    
    func routeToRemainder(segue: UIStoryboardSegue?) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "RemainderViewController") as? RemainderViewController else { return }
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToRemainder(source: viewController!, destination: destinationVC)
    }
    
    
    func navigateToRemainder(source: DirectoryFileViewController, destination: UIViewController) {
        source.show(destination, sender: nil)
    }
    
    //   MARK: Passing data
    
    func passDataToSomewhere(source: DirectoryFileDataStore, destination: inout RemainderDataStore) {
        destination.name = source.tappedFileName
    }
}
