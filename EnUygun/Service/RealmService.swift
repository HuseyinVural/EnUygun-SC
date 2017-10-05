//
//  RealmService.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 5.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import Foundation
import RealmSwift


class RealmService{
    
    var realm:Realm!
    static var DBInstance = RealmService()
    
    init() {
        do {
            self.realm = try Realm()
        }catch let err{
            print("Opss \(err)")
        }
    }
    
    
    func insertFlight(flight:Flight){
        let flightDbEntity = FlightDBEntity()
        flightDbEntity.date = flight.date!
        flightDbEntity.destination = flight.destination!
        flightDbEntity.enuid = flight.enuid!
        flightDbEntity.orgin = flight.origin!
        flightDbEntity.price = flight.price!
        flightDbEntity.time = flight.time!
        
        do {
            try self.realm.write {
                self.realm.delete(realm.objects(FlightDBEntity.self))
                self.realm.add(flightDbEntity, update: true)
            }
        } catch let err {
            print(err)
        }
    }
    
    /*
    func selectFlight(flight:Flight)->FlightDBEntity{
        var flightDbEntity = FlightDBEntity()
        do {
            try self.realm.write {
                flightDbEntity = self.realm.object(ofType: FlightDBEntity.self, forPrimaryKey: flight.enuid!)!
            }
        } catch let err {
            print(err)
        }
        return flightDbEntity
    }
    
    func deleteFlight(flight:Flight){
        do {
            try self.realm.write {
                guard let obj = self.realm.object(ofType: FlightDBEntity.self, forPrimaryKey: flight.enuid!) else{ return }
                self.realm.delete(obj)
            }
        } catch let err {
            print(err)
        }
    }
     */
}
