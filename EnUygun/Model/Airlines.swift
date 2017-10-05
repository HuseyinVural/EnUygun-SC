//
//  Airlines.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//


import UIKit
import Foundation
import ObjectMapper


class Airlines: Mappable {
    
    var code:String?
    var image:String?
    var name:String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.code<-map["code"]
        self.image<-map["image"]
        self.name<-map["name"]
    }
    
}


