//
//  circleProgressView.swift
//  testProject
//
//  Created by BeomSeok on 2020/11/30.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class circleProgressVIew: UIView {
    var circleLayer = CAShapeLayer()
    var prgressLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupDownloadingCircleLayer()
//        setupCirclePath()
        setupCirclePath2()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCirclePath() {
        let circlePath = UIBezierPath(arcCenter:center, radius: frame.height / 2.0, startAngle: -.pi / 2.0, endAngle: .pi * 1.5, clockwise: true)
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = 20.0
        circleLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(circleLayer)
        
        prgressLayer.path = circlePath.cgPath
        prgressLayer.fillColor = UIColor.clear.cgColor
        prgressLayer.lineWidth = 10.0
        prgressLayer.strokeEnd = 0.0
        prgressLayer.strokeColor = UIColor.blue.cgColor
        layer.addSublayer(prgressLayer)
    }
    
    func updateProgress(duration: TimeInterval, value: Double = 1.0) {
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        if prgressLayer.strokeEnd == 0.0, value == 1.0 {
            anim.duration = TimeInterval(5)
        } else {
            prgressLayer.strokeEnd = CGFloat(value)
            anim.duration = TimeInterval(1)
        }
        anim.toValue = value
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        prgressLayer.add(anim, forKey: "progress")
    }
    
    func updateDownloadProgress(_ progress: Double) {
//        guard let circleLayer = circleLayer else { return }
        let startAngle: CGFloat = .pi * 1.5
        let endAngle: CGFloat = startAngle + CGFloat(progress) * 2.0 * .pi
        
        let mask = CAShapeLayer()
        
        let path: CGMutablePath = CGMutablePath()
        path.move(to: center)
        path.addArc(center: center, radius: bounds.height / 2.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        mask.lineWidth = bounds.height / 2.0
        
        mask.path = path
        mask.strokeEnd = 0
        circleLayer.mask = mask
        circleLayer.mask?.frame = bounds
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.duration = 1
        
        anim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        anim.fillMode = CAMediaTimingFillMode.forwards
        anim.isRemovedOnCompletion = false
        anim.autoreverses = false
        anim.toValue = 1.0
        
        mask.add(anim, forKey: "strokeEnd")
    }
    
    func setupDownloadingCircleLayer() {
//        guard circleLayer == nil else { return }
//        animationView.isHidden = false
        layoutIfNeeded()
        let startAngle: CGFloat = .pi * 1.5
        let endAngle: CGFloat = startAngle + 2 * .pi
        let pathStart = UIBezierPath(arcCenter: center, radius: bounds.height/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        pathStart.addLine(to: center)
        let progressLayer = CAShapeLayer()
        progressLayer.path = pathStart.cgPath
        progressLayer.fillColor = UIColor.lightGray.cgColor
        
        layer.addSublayer(progressLayer)
        progressLayer.frame = bounds
        circleLayer = progressLayer
    }
    
    func forceToShowDownloadAnimation() {
        let baseProgress: Double = 0.01
        setupDownloadingCircleLayer()
        updateDownloadProgress(0)
        for i in 1 ... 101 {
            updateDownloadProgress(baseProgress * Double(i))
        }
    }
    
    func setupCirclePath2() {
        layoutIfNeeded()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: bounds.width/2.0, y: bounds.height/2.0), radius: self.bounds.height / 2.0, startAngle: -.pi / 2.0, endAngle: .pi * 1.5, clockwise: true)
        
        prgressLayer.path = circlePath.cgPath
        prgressLayer.fillColor = UIColor.clear.cgColor
        prgressLayer.lineWidth = bounds.height
        prgressLayer.strokeEnd = 0.0
        prgressLayer.strokeColor = UIColor.blue.cgColor
        layer.addSublayer(prgressLayer)
        
        self.layer.cornerRadius = self.bounds.height / 2.0
        self.clipsToBounds = true
    }
}
