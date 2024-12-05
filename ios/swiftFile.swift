//
//  swiftFile.swift
//  ConsentSDKObj
//
//  Created by Surendra Ponnapalli on 11/28/24.
//

import Foundation
import ConsentUI

@objc(ConsentSDKSwift)
public class ConsentSDKSwift:NSObject {
    
    @objc
        static let shared = ConsentSDKSwift()
    
    @objc
  func getSDKConfigure(appUrl:String, cdnUrl:String, tenantId:String, appId:String) {
    ConsentSDK.shared.setupSDK(options:
                                ConsentSDKOptions(
                                  appUrl: appUrl,
                                  cdnUrl: cdnUrl,
                                  tenantId: tenantId,
                                  appId: appId,
                                  testingMode: true,
                                  logLevel: .debug,
                                  consentsCheckInterval: 60,
                                  languageCode: "en",
                                  locationCode: "AQ"
                                )
    )
    
    ConsentSDK.shared.isReady() { state in
      print(state.status())
      if state == .available {
        ConsentSDK.shared.presentConsentBanner()
      }
    }
  }
    
}
