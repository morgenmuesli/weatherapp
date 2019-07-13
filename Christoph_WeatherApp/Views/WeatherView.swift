//
//  WeatherView.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 12.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import UIKit
import PureLayout

class WeatherView : UIView{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let rootView = UIStackView()
    
    
    
    private lazy var weatherIconContainer : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cloudy"))
        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    
    
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRootView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupRootView() {
        addSubview(rootView)
        rootView.configureForAutoLayout()
        rootView.autoPinEdgesToSuperviewEdges()
        rootView.axis = NSLayoutConstraint.Axis.vertical
        rootView.backgroundColor = .blue
        

    }
    
    
    private func addSubviews() {
        
        rootView.addSubview(weatherIconContainer)
    }
    
    
    override func updateConstraints() {
        
        rootView.updateConstraints()
        weatherIconContainer.updateConstraints()
        super.updateConstraints()
    }
    


}
