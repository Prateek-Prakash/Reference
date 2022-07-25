//
//  FakeryDataView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import SwiftUI

struct FakeryDataView: View {
    @StateObject var fakeryDataVM = FakeryDataVM()
    
    var body: some View {
        VStack {
            List {
                if let mock = fakeryDataVM.mock {
                    Section("Name") {
                        Text("First Name")
                            .badge(mock.name.firstName())
                        Text("Last Name")
                            .badge(mock.name.lastName())
                        Text("Title")
                            .badge(mock.name.title())
                    }
                    
                    Section("Gender") {
                        Text("Binary Type")
                            .badge(mock.gender.binaryType())
                    }
                    
                    Section("Phone Number") {
                        Text("Area Code")
                            .badge(mock.phoneNumber.areaCode())
                        Text("Exchange Code")
                            .badge(mock.phoneNumber.exchangeCode())
                        Text("Subscriber Number")
                            .badge(mock.phoneNumber.subscriberNumber())
                    }
                    
                    Section("Address") {
                        Text("Building Number")
                            .badge(mock.address.buildingNumber())
                        Text("Street Name")
                            .badge(mock.address.streetName())
                        Text("City")
                            .badge(mock.address.city())
                        Text("County")
                            .badge(mock.address.county())
                        Text("State")
                            .badge(mock.address.state())
                        Text("ZIP Code")
                            .badge(mock.address.postcode())
                        Text("Country Code")
                            .badge(mock.address.countryCode())
                        Text("Latitude")
                            .badge(mock.address.latitude().description)
                        Text("Longitude")
                            .badge(mock.address.longitude().description)
                    }
                    
                    Section("Application") {
                        Text("Name")
                            .badge(mock.app.name())
                        Text("Version")
                            .badge(mock.app.version())
                        Text("Author")
                            .badge(mock.app.author())
                    }
                    
                    Section("Number") {
                        Text("Bool")
                            .badge(mock.number.randomBool().description.capitalized)
                        Text("Integer [0 ••• 1000]")
                            .badge(mock.number.randomInt())
                        Text("Integer [-100 ••• 50]")
                            .badge(mock.number.randomInt(min: -150, max: 50))
                        Text("Float [0 ••• 1000]")
                            .badge(mock.number.randomFloat().description)
                        Text("Float [-5.5 ••• 35]")
                            .badge(mock.number.randomFloat(min: -5.5, max: 35).description)
                        Text("CGFloat [0 ••• 1000]")
                            .badge(mock.number.randomCGFloat().description)
                        Text("CGFloat [-10.5 ••• 50]")
                            .badge(mock.number.randomCGFloat(min: -10.5, max: 50).description)
                        Text("Double [0 ••• 1000]")
                            .badge(mock.number.randomCGFloat().description)
                        Text("Double [0 ••• 1]")
                            .badge(mock.number.randomCGFloat(min: 0, max: 1).description)
                    }
                }
            }
            .navigationTitle("Fakery Data")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        fakeryDataVM.refreshMock()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
        }
    }
}
