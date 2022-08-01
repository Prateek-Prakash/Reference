//
//  NFCManager.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import CoreNFC
import Foundation

enum NFCMode: String {
    case read = "Read"
    case write = "Write"
}

class NFCManager: NSObject, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?
    var mode: NFCMode = .read
    var text: String = ""
    
    func scan(mode: NFCMode, text: String = "") {
        guard NFCNDEFReaderSession.readingAvailable else {
            print("NFCWriter: Unsupported Device")
            return
        }
        self.mode = mode
        self.text = text
        self.session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        self.session?.alertMessage = "Hold Near ID Tag"
        self.session?.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        print("NFCWriter: [NFCNDEFTag] Found")
        if tags.count > 1 {
            let retryInterval = DispatchTimeInterval.milliseconds(500)
            session.alertMessage = "Multiple Tags Found"
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval, execute: {
                session.restartPolling()
            })
            return
        }
        
        let tag = tags.first!
        session.connect(to: tag, completionHandler: { error in
            if nil != error {
                session.alertMessage = "Connection Error"
                session.invalidate()
                return
            }
            
            tag.queryNDEFStatus(completionHandler: { status, capacity, error in
                guard error == nil else {
                    session.alertMessage = "NDEF Status Error"
                    session.invalidate()
                    return
                }
                
                switch status {
                case .notSupported:
                    session.alertMessage = "NDEF Non-Compliant Tag"
                    session.invalidate()
                case .readWrite:
                    if self.mode == .read {
                        self.readTag(session, tag: tag)
                    } else if self.mode == .write {
                        self.writeTag(session, tag: tag)
                    }
                case .readOnly:
                    if self.mode == .read {
                        self.readTag(session, tag: tag)
                    }
                @unknown default:
                    session.alertMessage = "Unknown NDEF Tag Status"
                    session.invalidate()
                }
            })
        })
    }
    
    func readTag(_ session: NFCNDEFReaderSession, tag: NFCNDEFTag) {
        tag.readNDEF(completionHandler: { message, error in
            var alert: String
            if nil != error || nil == message {
                alert = "Read Failure"
            } else {
                alert = "Found NDEF Message"
                let payload = message!.records.first!
                if let uri = payload.wellKnownTypeURIPayload() {
                    let text = uri.absoluteString
                    alert = text
                }
            }
            session.alertMessage = alert
            session.invalidate()
        })
    }
    
    func writeTag(_ session: NFCNDEFReaderSession, tag: NFCNDEFTag) {
        let message = NFCNDEFMessage(records: [NFCNDEFPayload.wellKnownTypeURIPayload(string: self.text)!])
        tag.writeNDEF(message, completionHandler: { error in
            if nil != error {
                session.alertMessage = "Write Failure"
            } else {
                session.alertMessage = "Write Successful"
            }
            session.invalidate()
        })
    }
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        print("NFCHelper: Activate Session")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFCHelper: Invalidate Session")
        self.session = nil
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("NFCHelper: [NFCNDEFMessage] Found]")
    }
}
