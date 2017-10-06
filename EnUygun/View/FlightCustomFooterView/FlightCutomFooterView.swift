//
//  FlightCutomFooterView.swift
//  EnUygun
//
//  Created by Hüseyin Vural on 4.10.2017.
//  Copyright © 2017 Hüseyin Vural. All rights reserved.
//

import UIKit

protocol FlightCutomFooterViewDelegate {
    func secButClick(selection:Int)
}

class FlightCutomFooterView: UIView ,FlightCutomFooterViewDelegate{
    
    var delegate: FlightCutomFooterViewDelegate?


    @IBOutlet weak var secBut: UIButton!
    @IBOutlet weak var yonBut: UILabel!
    
    
    @IBAction func secButClick(_ sender: UIButton) {
        self.delegate?.secButClick(selection: sender.tag)
    }
    
    
    func secButClick(selection: Int) {}
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
        self.secBut.layer.borderWidth = 1
        self.secBut.layer.borderColor = enUygunGreen.cgColor
        self.secBut.layer.cornerRadius = 2
        
    }
    
    // Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}
