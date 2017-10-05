//
//  MainModel.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class MainModel: NSObject {
    var jsonDataObj:JSON?
    
    func readJsonData() {
        if let path = Bundle.main.path(forResource: "JData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                self.jsonDataObj = jsonObj
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Data bulunamadı.")
        }
    }
    
}


