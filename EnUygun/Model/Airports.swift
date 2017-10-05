//
//  Airports.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class Airports: Mappable {
    
    var airport_code:String?
    var airport_name:String?
    var slug:String?
    var city_code:String?
    var city_name:String?
    var country_code:String?
    var country_name:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.airport_code<-map["airport_code"]
        self.airport_name<-map["airport_name"]
        self.slug<-map["slug"]
        self.city_code<-map["city_code"]
        self.city_name<-map["city_name"]
        self.country_code<-map["country_code"]
        self.country_name<-map["country_name"]
    }
    
}
