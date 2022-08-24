//
//  RemainderPresenter.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/24/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RemainderPresentationLogic {
    func presentRemainders(response: Remainder.RemainderData.Response)
}

class RemainderPresenter: RemainderPresentationLogic
{
    weak var viewController: RemainderDisplayLogic?
    
    func presentRemainders(response: Remainder.RemainderData.Response) {
        var remainderArray: [RemainderForm] = []
        response.objects!.forEach({ data in
            do {
                let remainder = try JSONDecoder().decode(RemainderForm.self, from: data)
                remainderArray.append(remainder)
            } catch {
                print(error)
            }
        })
        let viewModel = Remainder.RemainderData.ViewModel(remainders: remainderArray)
        viewController?.displayRemainders(viewModel: viewModel)
    }
}
