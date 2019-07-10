//  Created by Yalcin Ozdemir on 11.07.2018.
//  Copyright © 2018. All rights reserved.
import UIKit
import PureLayout


class CustomViewController: UIViewController {
    
    var didSetupConstraints = false
    var bannerView = UIView.newAutoLayout()
    var label = UILabel.newAutoLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
    }
    

    
    
}

// MARK: PureLayout Implementation
extension CustomViewController {
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(bannerView)
        bannerView.backgroundColor = UIColor.green
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet tortor ultricies, iaculis diam quis, molestie odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eget interdum libero. Nulla at ipsum lectus. Praesent tristique nisl in tincidunt tempus. Nam purus metus, mattis eu fermentum et, ultricies in enim. Donec placerat laoreet dolor, quis tincidunt diam. Vivamus nisi ligula."
        label.numberOfLines = 0
        view.addSubview(label)
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            
            bannerView.autoSetDimensions(to: CGSize(width: self.view.frame.width, height: 300))
            bannerView.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
            bannerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 15)
            bannerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
            
            label.autoPinEdge(.top, to: .bottom, of: bannerView, withOffset: 50)
            label.autoPinEdge(toSuperviewEdge: .trailing, withInset: 15)
            label.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
}
