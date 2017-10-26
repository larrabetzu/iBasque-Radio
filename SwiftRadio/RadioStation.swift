//
//  RadioStation.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/4/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit


//*****************************************************************
// Radio Station
//*****************************************************************
class RadioStation: Decodable {
    
    var name     : String
    var streamURL: String
    var imageURL : String
    var websiteURL : String
    var desc     : String
    var longDesc : String
    
    init(name: String, streamURL: String, imageURL: String, websiteURL: String, desc: String, longDesc: String){
        self.name       = name
        self.streamURL  = streamURL
        self.imageURL   = imageURL
        self.websiteURL = websiteURL
        self.desc       = desc
        self.longDesc   = longDesc
    }
    
    // Convenience init without longDesc
    convenience init(name: String, streamURL: String, imageURL: String, websiteURL: String, desc: String){
        self.init(name: name, streamURL: streamURL, imageURL: imageURL, websiteURL: websiteURL,desc: desc, longDesc: "")
    }
    
    //*****************************************************************
    // MARK: - JSON Parsing into object
    //*****************************************************************
    
    class func parseStations(jsonString: String) -> [RadioStation] {
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let radioStation = try! decoder.decode([RadioStation].self, from: jsonData)
        
        return radioStation
    }

}
