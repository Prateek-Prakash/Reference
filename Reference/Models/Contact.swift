//
//  Contact.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import Fakery
import Foundation

struct Contact: Identifiable {
    var id: String
    var name: String
    var phone: String
    var favorite: Bool
    
    static func mock() -> Contact {
        let fakeData = Faker(locale: "en-US")
        let fName = "\(fakeData.name.firstName()) \(fakeData.name.lastName())"
        let fArea = fakeData.phoneNumber.areaCode()
        let fExchange = fakeData.phoneNumber.exchangeCode()
        let fSubscriber = fakeData.phoneNumber.subscriberNumber()
        let fPhone = "+1-\(fArea)-\(fExchange)-\(fSubscriber)"
        
        return Contact(
            id: "-\(UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased())",
            name: fName,
            phone: fPhone,
            favorite: false
        )
    }
}
