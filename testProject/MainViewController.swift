
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let imageView:UIImageView, resize:UIButton, onOffSwitch:UISwitch
    var onImage:UIImage?, offImage:UIImage?
    var zoomIn = false
    
    init(){
        imageView = UIImageView()
        resize = UIButton()
        onOffSwitch = UISwitch()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        onImage = UIImage(named: "lamp_on.png")
        offImage = UIImage(named: "lamp_off.png")
        setViews()
        // Do any additional setup after loading the view.
    }
    
    func setViews(){
        imageView.contentMode = .scaleAspectFit
        imageView.image = offImage
        view.addSubview(imageView)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: view.bounds.width/2, height: view.bounds.height/2))
        
        resize.setTitle("resize", for: .normal)
        resize.setTitleColor(.blue, for: .normal)
        resize.addTarget(self, action: #selector(self.resizeAction(_:)), for: .touchUpInside)
        view.addSubview(resize)
        resize.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resize.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            resize.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resize.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        onOffSwitch.setOn(false, animated: true)
        onOffSwitch.addTarget(self, action: #selector(self.switchAction(_:)), for: .touchUpInside)
        view.addSubview(onOffSwitch)
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onOffSwitch.bottomAnchor.constraint(equalTo: resize.bottomAnchor),
            onOffSwitch.leftAnchor.constraint(equalTo: resize.rightAnchor, constant: 30)
        ])

    }
    
    @objc func resizeAction(_ sender:UIButton){
        zoomIn.toggle()
        if(zoomIn){
            imageView.frame.size = CGSize(width: view.bounds.width, height: view.bounds.height-30)
            resize.setTitle("zoom Out", for: .normal)
        } else{
            imageView.frame.size = CGSize(width: view.bounds.width/2, height: view.bounds.height/2)
            resize.setTitle("zoom In", for: .normal)
        }
    }
    
    @objc func switchAction(_ sender:UISwitch){
        if sender.isOn {
            imageView.image = onImage
        } else {
            imageView.image = offImage
        }
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
