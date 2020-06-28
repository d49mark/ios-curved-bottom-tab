//
//  TabBar.swift
//  iOS_curve_tab
//
//  Created by Dilip on 27/06/20.
//  Copyright © 2020 Dilip. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class TabBar: UITabBar {
    private var middleButton = UIButton()
    
    private var shapeLayer: CALayer?
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        //The below 4 lines are for shadow above the bar. you can skip them if you do not want a shadow
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMiddleButton()
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        let from = point
        let to = middleButton.center

        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 10)
    }
    @objc func setupMiddleButton() {
        let image = UIImage(named: "ios_center_button.png")
        middleButton.setImage(image, for: UIControl.State.normal)
        middleButton.contentVerticalAlignment = .fill
        middleButton.contentHorizontalAlignment = .fill
        middleButton.imageEdgeInsets = UIEdgeInsets.init(top:45,left:45,bottom:45,right:45)
        middleButton.frame.size = CGSize(width: 170, height: 170)
        middleButton.layer.cornerRadius = 35
        middleButton.layer.masksToBounds = true
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        middleButton.addTarget(self, action: #selector(test), for: .touchUpInside)
        addSubview(middleButton)
    }
    @objc func test() {
        print("my name is jeff")
    }
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height-20), y: 0)) // the beginning of the trough

        path.addCurve(to: CGPoint(x: centerWidth, y: -height-5),
        controlPoint1: CGPoint(x: (centerWidth - 40), y:  0), controlPoint2: CGPoint(x: centerWidth-50, y: -height))
        

        path.addCurve(to: CGPoint(x: (centerWidth + height+20), y: 0),
        controlPoint1: CGPoint(x: centerWidth+50, y:-height), controlPoint2: CGPoint(x: (centerWidth + 40), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
}
