//
//  FlightViewCell.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit
import SLExpandableTableView

class FlightViewCell: UITableViewCell,UIExpandingTableViewCell {

    @IBOutlet weak var airlinesTitle: UILabel!
    @IBOutlet weak var airLinesLogo: UIImageView!
    @IBOutlet weak var lastArm: UILabel!

    @IBOutlet weak var flightCod: UILabel!
    @IBOutlet weak var flightTime: UILabel!
    @IBOutlet weak var flightPrice: UILabel!
    @IBOutlet weak var flightBagaj: UILabel!
    @IBOutlet weak var flightDuration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    var isLoading: Bool
    
    var expansionStyle: UIExpansionStyle = UIExpansionStyleCollapsed
    
    func setExpansionStyle(_ style: UIExpansionStyle, animated: Bool) {
        self.isLoading = true
        self.expansionStyle = style
        if style.rawValue == 1 {
            self.hideSeparator()
        }else{
            self.showSeparator()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isLoading = true
        self.expansionStyle = UIExpansionStyleCollapsed
        super.init(coder: aDecoder)
    }
    
}
