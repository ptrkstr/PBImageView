//
//  ViewController.swift
//  PBImageView
//
//  Created by patrickbdev on 09/29/2016.
//  Copyright (c) 2016 patrickbdev. All rights reserved.
//

import UIKit
import PBImageView

class ViewController: UIViewController {
    
    private let contentModeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = UIColor(white: 0.2, alpha: 1.0)
        view.font = .boldSystemFont(ofSize: 20)
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    private let imageView: PBImageView = {
        let view = PBImageView(image: UIImage(named: "pineapple"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private var nextContentMode = UIView.ContentMode.scaleToFill

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [imageView,
         contentModeLabel].forEach(view.addSubview)
                
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentModeLabel.heightAnchor.constraint(equalToConstant: 60),
            contentModeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentModeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentModeLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])
        
        changeContentMode()
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeContentMode), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    @objc private func changeContentMode() {
        
        UIView.animate(withDuration: 1) {
            let contentMode = self.nextContentMode
            self.imageView.contentMode = contentMode
            self.contentModeLabel.text = contentMode.name
        }
        
        nextContentMode = nextContentMode.next()
    }
}

extension UIView.ContentMode: CaseIterable {
    
    public typealias AllCases = [UIView.ContentMode]
    
    public static var allCases: UIView.ContentMode.AllCases {
        [
            .scaleToFill,
            .scaleAspectFit,
            .scaleAspectFill,
            .redraw,
            .center,
            .top,
            .bottom,
            .left,
            .right,
            .topLeft,
            .topRight,
            .bottomLeft,
            .bottomRight
        ]
    }
    
    /// Returns next enum as per allCases
    func next() -> UIView.ContentMode {
        let allCases = type(of: self).allCases
        let index = allCases.firstIndex(of: self)!
        let indexPlusOne = index + 1
        let nextIndex = indexPlusOne < allCases.count ? indexPlusOne : 0
        return allCases[nextIndex]
    }
    
    var name: String {
        switch self {
        case .scaleToFill: return "UIView.ContentMode.scaleToFill"
        case .scaleAspectFit: return "UIView.ContentMode.scaleAspectFit"
        case .scaleAspectFill: return "UIView.ContentMode.scaleAspectFill"
        case .redraw: return "UIView.ContentMode.redraw"
        case .center: return "UIView.ContentMode.center"
        case .top: return "UIView.ContentMode.top"
        case .bottom: return "UIView.ContentMode.bottom"
        case .left: return "UIView.ContentMode.left"
        case .right: return "UIView.ContentMode.right"
        case .topLeft: return "UIView.ContentMode.topLeft"
        case .topRight: return "UIView.ContentMode.topRight"
        case .bottomLeft: return "UIView.ContentMode.bottomLeft"
        case .bottomRight: return "UIView.ContentMode.bottomRight"
        @unknown default:
            return "UIView.ContentMode.scaleToFill"
        }
    }
    
}
