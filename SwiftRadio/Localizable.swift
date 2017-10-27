//
//  Localizable.swift
//  iBasqueRadio
//
//  Created by Gorka Ercilla on 27/10/17.
//  Copyright © 2017 Gorka Ercilla. All rights reserved.
//

import Foundation

protocol Localizable: CustomStringConvertible {
    
    var rawValue: String { get }
    
}

extension Localizable {

    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }

    var uppercased: String {
        return self.localized.uppercased()
    }

    var description: String {
        return self.localized
    }
    
    func localized(with: CVarArg...) -> String {
        let text = String(format: self.localized, arguments: with)
        return text
    }
    
}

extension String {

    enum AboutScreen: String, Localizable {
        case ErrorAlertTitle        = "AboutScreen ErrorAlertTitle"
        case ErrorAlertDescription  = "AboutScreen ErrorAlertDescription"
        case ErrorAlertAcceptAction = "AboutScreen ErrorAlertAcceptAction"
    }

    enum NowPlayingScreen: String, Localizable{
        case ConnectingRadio = "NowPlayingScreen ConnectingRadio"
    }

    enum StationScreen: String, Localizable{
        case Title        = "StationScreen Title"
        case Live         = "StationScreen Live"
        case LiveMetaData = "StationScreen LiveMetaData"
    }

}
