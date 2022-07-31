//
//  RemoteConfigVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import Firebase
import SwiftUI

class RemoteConfigVM: ObservableObject {
    @Published var stringValue = ""
    @Published var numberValue = Double(0)
    @Published var boolValue = false
    @Published var jsonConfig: JSONObjectConfig? = nil
    
    @Published var didPullConfig = false
    
    func fetchRemoteConfig() async throws {
        DispatchQueue.main.async {
            self.didPullConfig = false
        }
        
        let rConfig = RemoteConfig.remoteConfig()
        let rSettings = RemoteConfigSettings()
        rSettings.minimumFetchInterval = 0
        rConfig.configSettings = rSettings
        
        do {
            let config = try await rConfig.fetchAndActivate()
            switch config {
            case .successFetchedFromRemote, .successUsingPreFetchedData:
                if let stringVal = rConfig.configValue(forKey: "stringKey").stringValue {
                    DispatchQueue.main.async {
                        self.stringValue = stringVal
                    }
                }
                if let numberVal = rConfig.configValue(forKey: "numberKey").numberValue as? Double {
                    DispatchQueue.main.async {
                        self.numberValue = numberVal
                    }
                }
                DispatchQueue.main.async {
                    self.boolValue = rConfig.configValue(forKey: "boolKey").boolValue
                }
                let dataVal = rConfig.configValue(forKey: "jsonKey").dataValue
                DispatchQueue.main.async {
                    do {
                        self.jsonConfig = try JSONDecoder().decode(JSONObjectConfig.self, from: dataVal)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                DispatchQueue.main.async {
                    self.didPullConfig = true
                }
                return
            default:
                print("Error Activating RemoteConfig")
                return
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
