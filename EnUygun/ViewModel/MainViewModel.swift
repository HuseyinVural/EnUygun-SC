//
//  MainViewModel.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import ObjectMapper

class MainViewModel: NSObject {
    
    var mainModel:MainModel=MainModel()
    var jsonDataObj:JSON?
    var flightCount:Int = 0

    
    func getAllFlight(){
        mainModel.readJsonData()
        self.jsonDataObj = mainModel.jsonDataObj
        let departureCount = self.jsonDataObj!["flights"]["departure"].count
        self.flightCount = departureCount
    }
    
    
    func getFlightWithIndex(index: Int,cell:FlightViewCell)->FlightViewCell{
        
        let departure = self.jsonDataObj!["flights"]["departure"][index]
        guard let flights = departure.rawString() else { return cell }
        guard let flightObj = Mapper<Flight>().map(JSONString: flights) else { return cell }

        let airLinesCode = flightObj.marketing_airline ?? "TK"
        let airLines = getAirLines(code:airLinesCode)
        cell.airlinesTitle.text = airLines.name
        
        let image = airLines.image ?? "https://cdn.enuygun.com/ucak-bileti/assets/img/airline-icon/PC.png"
        cell.airLinesLogo.sd_setImage(with: URL(string: image), completed: nil)
        
        let orgin = flightObj.origin ?? ""
        let destination = flightObj.destination ?? ""
        cell.flightCod.text = " \(orgin) > \(destination) "
        
        let desTime = flightObj.time ?? "--:--"
        cell.flightTime.text = desTime
        
        if let koltuk = flightObj.available_seats{
            cell.lastArm.text = "Son \(koltuk) Koltuk"
        }else{
            cell.lastArm.text = ""
        }
        
        let priceCC = flightObj.price_currency ?? "TL"
        let price = flightObj.price ?? 9999
        cell.flightPrice.text = "\(price) \(priceCC)"
        
        let bagaj = flightObj.bagaj ?? 15
        cell.flightBagaj.text = "#\(bagaj) kg/kişi"
        
        let hour = flightObj.hour ?? 0
        let min  = flightObj.minute ?? 0
        cell.flightDuration.text = "#\(hour)sa \(min)dk"
        if min<1{
            cell.flightDuration.text = "#\(hour)sa"
        }
        
        return cell
    }
    
    
    func getFlightInfoWithIndex(index: Int,cell:FlightInfoViewCell)->FlightInfoViewCell{
        
        let departure = self.jsonDataObj!["flights"]["departure"][index]
        guard let flights = departure.rawString() else { return cell }
        guard let flightObj = Mapper<Flight>().map(JSONString: flights) else { return cell }
        
        let airLinesCode = flightObj.marketing_airline ?? "TK"
        let airLines = getAirLines(code:airLinesCode)
        
        cell.FlightInfoAirlineTitle.text = airLines.name
        cell.FlightInfoPNR.text = flightObj.flight_number
        cell.FlightInfoClass.text = "Bilet Sınıfı:\(flightObj.Flyclass ?? "E")"

        let hour = flightObj.hour ?? 0
        let min  = flightObj.minute ?? 0
        cell.FlightInfoDuration.text = "#\(hour)sa \(min)dk"
        if min<1{
            cell.FlightInfoDuration.text = "#\(hour)sa"
        }
        
        let orgin = flightObj.origin ?? "QQ"
        let orginPort = getAirPorts(code: orgin)
        cell.FlightInfoOName.text = "\(flightObj.time ?? "") \(orginPort.city_name ?? ""), \(orginPort.airport_name ?? "")"

        let dest  = flightObj.destination ?? "QQ"
        let destPort = getAirPorts(code: dest)
        cell.FlightInfoDName.text = "\(flightObj.a_time ?? "") \(destPort.city_name ?? ""), \(destPort.airport_name ?? "")"
        
        return cell
    }
    
    
    func getAirLines(code:String)->Airlines{
        let airline = self.jsonDataObj!["airlines"][code]
        guard let airLines = airline.rawString() else { return Airlines(JSONString: "{}")! }
        guard let airLinesObj = Mapper<Airlines>().map(JSONString: airLines) else { return Airlines(JSONString: "{}")! }
        return airLinesObj
    }
    
    
    func getAirPorts(code:String)->Airports{
        let airport = self.jsonDataObj!["airports"][code]
        guard let airports = airport.rawString() else { return Airports(JSONString: "{}")! }
        guard let airportObj = Mapper<Airports>().map(JSONString: airports) else { return Airports(JSONString: "{}")! }
        return airportObj
    }
    
    enum cellAnimateDirection {
        case Exp
        case Coll
    }
    func changeFooterComponent(footer:UITableViewHeaderFooterView,direction:cellAnimateDirection){
        if let footerInView = footer.viewWithTag(34123124124) as? FlightCutomFooterView{
            if direction == .Coll{
                footerInView.secBut.backgroundColor = UIColor.white
                footerInView.secBut.setTitleColor(enUygunGreen, for: .normal)
                footerInView.yonBut.text = "▼";
            }else{
                footerInView.secBut.backgroundColor = enUygunGreen
                footerInView.secBut.setTitleColor(UIColor.white, for: .normal)
                footerInView.yonBut.text = "▲";
            }
        }
    }
    
    func saveFlight(index:Int){
        let departure = self.jsonDataObj!["flights"]["departure"][index]
        guard let flights = departure.rawString() else { return }
        guard let flightObj = Mapper<Flight>().map(JSONString: flights) else { return }
        RealmService.DBInstance.insertFlight(flight: flightObj)
    }
    

    
    
    
}
