//
//  BuyTicketsViewModel.swift
//  event-manager-ios
//
//  Created by Eszenyi Gábor on 2017. 12. 16..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class BuyTicketsViewModel {

    // MARK: - let constants

    // MARK: - var variables

    var items = Variable([Ticket]())
    var event: Event?

    // MARK: - Lifecycle Methods

    init () {

    }

    deinit {
        // Don't forget to remove the observers here
    }

    // MARK: - Business Logic

    // MARK: - Helper Methods

}

// MARK: - Notification handlers can be placed here

extension BuyTicketsViewModel {

}
