
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var animView: circleProgressVIew?
    var progress: Double = 0 {
        didSet{
            label?.text = "\(progress)"
        }
    }
    
    var label: UILabel? = nil
    var button1: UIButton? = nil
    var button2: UIButton? = nil
    var button3: UIButton? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _view = circleProgressVIew(frame: CGRect(x: 100, y: 400, width: 200, height: 200 ))
        _view.layer.borderColor = UIColor.red.cgColor
        _view.layer.borderWidth = 1.0
        animView = _view
        
        
        let tagGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addSubview(_view)
//        animView?.updateDownloadProgress(0)
        view.addGestureRecognizer(tagGesture)
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let _label = UILabel(frame: CGRect(x: 0, y: 100, width: 400, height: 200))
        _label.text = "\(progress)"
        _label.textColor = .black
        view.addSubview(_label)
        label = _label
        
        let b1 = setupButton(frame: CGRect(x: 0, y: 700, width: 30, height: 100), title: "+10%")
        view.addSubview(b1)
        button1 = b1
        
        let b2 = setupButton(frame: CGRect(x: 100, y: 700, width: 30, height: 100), title: "+100%")
        view.addSubview(b2)
        button2 = b2
        
        let b3 = setupButton(frame: CGRect(x: 200, y: 700, width: 30, height: 100), title: "reset")
        view.addSubview(b3)
        button3 = b3
    }
    
    func setupButton(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .black
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonTap(sender:)), for: .touchUpInside)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }
    
    @objc
    func buttonTap(sender: UIButton) {
        if sender == button1 {
            progress += 0.1
            animView?.updateProgress(duration: TimeInterval(1), value: progress)
        } else if sender == button2 {
            progress = 1.0
            animView?.updateProgress(duration: TimeInterval(100), value: progress)
        } else if sender == button3 {
            progress = 0
            animView?.updateProgress(duration: TimeInterval(5), value: progress)
        }
    }
    

    @objc
    func tap() {
//        progress += 0.1
//        if progress > 1 {
//            progress = 0
//        }
//        animView?.updateProgress(duration: TimeInterval(1))
//        animView?.updateProgress(duration: TimeInterval(1), value: progress)
//        animView?.updateDownloadProgress(progress)
//        animView?.forceToShowDownloadAnimation()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
