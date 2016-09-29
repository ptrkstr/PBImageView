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
    
    private let contentModeLabel = UILabel(frame: .zero)
    private let imageView = PBImageView(image: UIImage(named: "pineapple"))

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        contentModeLabel.text = imageView.contentMode.name
        contentModeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentModeLabel.textAlignment = .center
        contentModeLabel.textColor = UIColor.init(white: 0.2, alpha: 1.0)
        contentModeLabel.backgroundColor = UIColor.init(white: 0.9, alpha: 0.4)
        view.addSubview(contentModeLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentModeLabel.heightAnchor.constraint(equalToConstant: 60),
            contentModeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentModeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentModeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.changeContentMode), userInfo: nil, repeats: true)
    }

    @objc private func changeContentMode() {
        UIView.animate(withDuration: 1) {
            let contentMode = UIViewContentMode(rawValue: Int(arc4random_uniform(13)))!
            self.imageView.contentMode = contentMode
            self.contentModeLabel.text = contentMode.name
        }
    }
}

private extension UIViewContentMode {
    
    var name: String {
        switch self {
        case .scaleToFill: return "UIViewContentModeScaleToFill"
        case .scaleAspectFit: return "UIViewContentModeScaleAspectFit"
        case .scaleAspectFill: return "UIViewContentModeScaleAspectFill"
        case .redraw: return "UIViewContentModeRedraw"
        case .center: return "UIViewContentModeCenter"
        case .top: return "UIViewContentModeTop"
        case .bottom: return "UIViewContentModeBottom"
        case .left: return "UIViewContentModeLeft"
        case .right: return "UIViewContentModeRight"
        case .topLeft: return "UIViewContentModeTopLeft"
        case .topRight: return "UIViewContentModeTopRight"
        case .bottomLeft: return "UIViewContentModeBottomLeft"
        case .bottomRight: return "UIViewContentModeBottomRight"
        }
    }
    
}
