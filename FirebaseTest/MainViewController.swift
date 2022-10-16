//
//  MainViewController.swift
//  FirebaseTest
//
//  Created by Valya on 16.10.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        labelConstraints()
        
    }
    
// MARK: - initLabel
    func initLabel(targetLabel: UILabel, text: String, font:UIFont?, center: CGPoint) {
            
            targetLabel.font = font
            targetLabel.textColor = .black
            targetLabel.center = center
            targetLabel.textAlignment = .center
            targetLabel.numberOfLines = 2
            targetLabel.text = text
            targetLabel.lineBreakMode = .byTruncatingTail
            
            self.view.addSubview(targetLabel)
        }
    // MARK: - labelConstraints
    
    private func labelConstraints() {
        initLabel(targetLabel: label, text: "Firebase", font: UIFont(name: "Helvetica", size: 33), center: self.view.center)
            label.snp.makeConstraints { maker in
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(200)
            }
        }
    
}

