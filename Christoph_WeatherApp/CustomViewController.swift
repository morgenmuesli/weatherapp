//  Created by Yalcin Ozdemir on 11.07.2018.
//  Copyright © 2018. All rights reserved.
import UIKit
import PureLayout


@objc(CustomViewC)
class CustomViewController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .lightGray
        return view
    }()
    let blueView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .blue
        return view
    }()
    let redView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .red
        return view
    }()
    let yellowView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .yellow
        return view
    }()
    let greenView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = .green
        return view
    }()
    
    var didSetupConstraints = false
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        view.addSubview(containerView)
        containerView.addSubview(blueView)
        containerView.addSubview(redView)
        containerView.addSubview(yellowView)
        containerView.addSubview(greenView)
        
        view.setNeedsUpdateConstraints() // bootstrap Auto Layout
    }
    
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            
 
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
