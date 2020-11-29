
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var animView: circleProgressVIew?
    var progress: Double = 0
    
    
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
    }
    

    @objc
    func tap() {
        progress += 0.1
        if progress > 1 {
            progress = 0
        }
        animView?.updateProgress(duration: TimeInterval(1))
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
