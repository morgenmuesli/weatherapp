//
//  WeatherCell.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 12.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import UIKit
import PureLayout

class WheatherInformation: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    private let rootView = UIStackView(forAutoLayout: ())
    private var temperaturLable = UILabel(forAutoLayout: ())
    private var descriptionLable = UILabel(forAutoLayout: ())
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        addSubviews()
        
        
        
    }
    
    private func addSubviews(){
        rootView.addSubview(temperaturLable)
        rootView.addSubview(descriptionLable)
        addSubview(rootView)
        
    }
    
    private func setupStackView(){
        rootView.axis = NSLayoutConstraint.Axis.horizontal
        rootView.autoPinEdgesToSuperviewEdges()
    }
    
    private func setupLables(){
        temperaturLable.textColor = .red
        descriptionLable.textColor = .red
        temperaturLable.text = "--°C"
        descriptionLable.text = "light rain"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }

}
