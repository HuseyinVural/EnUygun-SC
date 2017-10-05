//
//  Flight.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper
import RealmSwift


class Flight: Mappable {
    
    var enuid:String?
    var provider:String?
    var price:Int?
    var price_currency:String?
    var flight_number:String?
    var origin:String?
    var destination:String?
    
    var marketing_airline:String?
    var Flyclass:String?
    
    var total_minutes:Int?
    var day:Int?
    var minute:Int?
    var hour:Int?
    var time:String?
    var date:String?
    var a_time:String?
    var a_date:String?
    var available_seats:Int?
    var bagaj:Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.enuid<-map["enuid"]
        self.provider<-map["provider"]
        self.price<-map["detail_price"]
        self.price_currency<-map["price_currency"]
        
        self.flight_number<-map["segments.0.flight_number"]
        self.available_seats<-map["segments.0.available_seats"]
    
        self.origin<-map["segments.0.origin"]
        self.destination<-map["segments.0.destination"]
        self.marketing_airline<-map["segments.0.marketing_airline"]
        self.Flyclass<-map["segments.0.class"]

        
        self.time<-map["segments.0.departure_datetime.time"]
        self.date<-map["segments.0.departure_datetime.date"]
        
        self.a_time<-map["segments.0.arrival_datetime.time"]
        self.a_date<-map["segments.0.arrival_datetime.date"]

        
        self.total_minutes<-map["infos.duration.total_minutes"]
        self.day<-map["infos.duration.day"]
        self.minute<-map["infos.duration.minute"]
        self.hour<-map["infos.duration.hour"]
        self.bagaj<-map["infos.baggage_info.firstBaggageCollection.0.allowance"]

  

    }
    
}


class FlightDBEntity:Object{
    @objc dynamic var enuid=""
    @objc dynamic var price=0
    @objc dynamic var orgin=""
    @objc dynamic var destination=""
    @objc dynamic var time=""
    @objc dynamic var date=""
    
    override static func primaryKey() -> String? {
        return "enuid"
    }
    
    override static func indexedProperties() -> [String] {
        return ["orgin","destination","price"]
    }
    
}


