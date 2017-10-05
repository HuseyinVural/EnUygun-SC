//
//  FlightInfoViewCell.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit
import SLExpandableTableView

class FlightInfoViewCell: UITableViewCell,UIExpandingTableViewCell {
    
    
    @IBOutlet weak var FlightInfoAirlineTitle: UILabel!
    @IBOutlet weak var FlightInfoPNR: UILabel!
    @IBOutlet weak var FlightInfoDuration: UILabel!
    @IBOutlet weak var FlightInfoClass: UILabel!
    @IBOutlet weak var FlightInfoOName: UILabel!
    @IBOutlet weak var FlightInfoDName: UILabel!
    
    
    
    var isLoading: Bool
    
    var expansionStyle: UIExpansionStyle = UIExpansionStyleCollapsed
    
    func setExpansionStyle(_ style: UIExpansionStyle, animated: Bool) {
        self.isLoading = true
        self.expansionStyle = style
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isLoading = false
        self.expansionStyle = UIExpansionStyleExpanded
        super.init(coder: aDecoder)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
