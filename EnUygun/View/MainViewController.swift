//was obsoleted in Swift 4//  ViewController.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit
import SwiftyJSON
import SLExpandableTableView

class MainViewController: UIViewController,SLExpandableTableViewDelegate,SLExpandableTableViewDatasource,FlightCutomFooterViewDelegate{

    
    @IBOutlet weak var flightTableView: SLExpandableTableView!
    var MainViewM = MainViewModel(mainModel: MainModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.flightTableView.dataSource = self
        self.flightTableView.delegate = self
        
        let nib = UINib(nibName: "Footer", bundle: nil)
        self.flightTableView.register(nib, forHeaderFooterViewReuseIdentifier: "Footer")
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.MainViewM.flightCount)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightInfoCell", for: indexPath) as! FlightInfoViewCell
        return (self.MainViewM.getFlightInfoWithIndex(index: indexPath.section, cell: cell))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row>0{ return 130 }else{ return 90 }
    }
    
    func tableView(_ tableView: SLExpandableTableView!, expandingCellForSection section: Int) -> (UITableViewCell & UIExpandingTableViewCell)! {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell") as! (FlightViewCell & UIExpandingTableViewCell)
        return self.MainViewM.getFlightWithIndex(index: section, cell: cell)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = FlightCutomFooterView(frame:CGRect(x: 0, y: 0, width: tableView.frame.width - 0, height: 35))
        v.tag = 34123124124
        v.secBut.tag = Int(section)
        v.delegate = self
        //Bir soru ? sence delegete protocolu kullanmayıp sadece delegete varible ındaki self referansında secButClick methodunu çağırsaydık bir perfoormans kaybı yaşarmıydık, protocolün burdaki avantajı sadece bizi methodu yazmaya zorlamak mı olmuş oldu
        
        let footerView = UITableViewHeaderFooterView()
        footerView.addSubview(v)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 35
    }
    

    func tableView(_ tableView: SLExpandableTableView!, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: SLExpandableTableView!, needsToDownloadDataForExpandableSection section: Int) -> Bool {
        return false
    }
    
    func tableView(_ tableView: SLExpandableTableView!, downloadDataForExpandableSection section: Int) {
        
    }
    
    func tableView(_ tableView: SLExpandableTableView!, willExpandSection section: UInt, animated: Bool) {
        guard let footer = tableView.footerView(forSection: Int(section)) else{ return }
        self.MainViewM.changeFooterComponent(footer: footer, direction: .Exp)
    }
    

    func tableView(_ tableView: SLExpandableTableView!, willCollapseSection section: UInt, animated: Bool) {
        guard let footer = tableView.footerView(forSection: Int(section)) else{ return }
        self.MainViewM.changeFooterComponent(footer: footer, direction: .Coll)
    }
    

    func secButClick(selection: Int) {
        self.MainViewM.saveFlight(index: selection)
    }
    

}




