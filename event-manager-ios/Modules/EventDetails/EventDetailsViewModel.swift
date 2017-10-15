//
//  EventDetailsViewModel.swift
//  event-manager-ios
//
//  Created by Eszenyi Gábor on 2017. 10. 15..
//  Copyright © 2017. Gabor Eszenyi. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxDataSources

class EventDetailsViewModel {

    // MARK: - let constants

    // MARK: - var variables
    var model: Event? {
        didSet {
            guard let model = model else { return }
            sections.value = [TableViewSection(items: [EventDetailDescription(model.performer.description!)])]

            imageUrl.value = model.performer.imageUrl
            name.value = model.performer.name
            isFavorite.value = model.isFavorite
            startTimeInfo.value = model.startDate.toString(format: "MMM dd, EEEE")!
            placeInfo.value = model.place.name
            facebookEventInfo.value = model.facebookEventUrl ?? facebookEventInfo.value
        }
    }
    var bottomConstraintOffset = Variable(CGFloat(0.0))
    var imageUrl = Variable("")
    var name = Variable("")
    var isFavorite = Variable(false)
    var startTimeInfo = Variable("")
    var placeInfo = Variable("")
    var ticketInfo = Variable("No ticket information.")
    var facebookEventInfo = Variable("No facebook event available.")

    // Change the sections variable to update the TableView
    var sections = Variable([TableViewSection]())
    var dataSource = RxTableViewSectionedReloadDataSource<TableViewSection>()

    // MARK: - Lifecycle Methods

    init () {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavoriteState(_:)), name: Constants.Notifications.EventFavoriteStateUpdated, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Business Logic

    // MARK: - Helper Methods

}

// MARK: - Notification handlers can be placed here

extension EventDetailsViewModel {
    @objc func updateFavoriteState(_ notification: Notification) {
        guard let event = notification.object as? Event else { return }
        if event.eventId == model?.eventId {
            model?.isFavorite = event.isFavorite
            isFavorite.value = event.isFavorite
        }
    }
}
