//
//  ViewController.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 07.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    
    
    
    
    
    lazy var titleLable = UILabel.newAutoLayout()
    lazy var temperaturLable = UILabel.newAutoLayout()
    lazy var wheaterLable = UILabel.newAutoLayout()
    

    
    lazy var weatherIconContainer : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cloudy"))
        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.clipsToBounds = true
        return imageView
        
    }()
    lazy var weatherInfo : UIStackView = {
        let weather = UIStackView(arrangedSubviews: [self.temperaturLable, self.wheaterLable])
        weather.distribution = .fillEqually
        return weather
    }()
    
    
    
    
    

    
}
extension ViewController {
    
    func addSubviews() {

        self.view.addSubview(titleLable)
        self.view.addSubview(weatherIconContainer)
        self.view.addSubview(weatherInfo)
        
    }
    
    func updateInfos(infos: CurrentForecastViewModel) {
        titleLable.text = infos.city
        temperaturLable.text = String(format: "%.2f °C", infos.temp!)
        wheaterLable.text = infos.weather
        weatherIconContainer.image = infos.image
    }
    
    func setupConstraints() {

        titleLable.textColor = .black
        titleLable.text = "Test"
        temperaturLable.text = "Test"
        temperaturLable.textAlignment = .center
        wheaterLable.textAlignment = .center
        wheaterLable.text = "Test"
        titleLable.sizeToFit()
        titleLable.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLable.autoPinEdge(toSuperviewEdge: .top, withInset: 64.0)
        weatherIconContainer.autoAlignAxis(toSuperviewAxis: .vertical)
        weatherIconContainer.autoPinEdge(.top,to: .bottom ,of: titleLable, withOffset: 10.0)
        weatherInfo.alignment = .center
        weatherInfo.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        weatherInfo.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        weatherInfo.autoPinEdge(.top, to: .bottom, of: weatherIconContainer, withOffset: 10.0)
        
        
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.addSubviews()
        self.setupConstraints()
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
}

