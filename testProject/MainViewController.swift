
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let offImage: UIImage? = UIImage(named: "lamp_off.png")
    let onImage: UIImage? = UIImage(named: "lamp_on.png")
    
    let numOfPictures: Int = 6
    var currentPictureIdx: Int = 0
    
    var isEnlarged: Bool = false
    let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    let enlargeButton: UIButton = UIButton()
    let onOffSwitch: UISwitch = UISwitch()
    
    let nextBtn: UIButton = UIButton()
    let prevBtn: UIButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func setupViews() {
        imageView.image = offImage
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(50)
        }
        
        enlargeButton.setTitle("enlarge", for: .normal)
        enlargeButton.setTitleColor(.black, for: .normal)
        enlargeButton.addTarget(self, action: #selector(enlargeButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(enlargeButton)
        enlargeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview().offset(-50)
        }
        
        onOffSwitch.isOn = false
        onOffSwitch.addTarget(self, action: #selector(ofOffSwitchTapped(_:)), for: .touchUpInside)
        view.addSubview(onOffSwitch)
        onOffSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(enlargeButton.snp.centerY)
            make.centerX.equalToSuperview().offset(50)
        }
        
        nextBtn.setTitle("next", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        nextBtn.addTarget(self, action: #selector(prevNextBtnTapped(_:)), for: .touchUpInside)
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.centerY.equalTo(enlargeButton)
            make.right.equalToSuperview().offset(-30)
        }
        
        prevBtn.setTitle("prev", for: .normal)
        prevBtn.setTitleColor(.black, for: .normal)
        prevBtn.addTarget(self, action: #selector(prevNextBtnTapped(_:)), for: .touchUpInside)
        view.addSubview(prevBtn)
        prevBtn.snp.makeConstraints { make in
            make.centerY.equalTo(enlargeButton)
            make.left.equalToSuperview().offset(30)
        }
        
        imageView.image = UIImage(named: "1.png")
        
    }
    
    @objc
    func ofOffSwitchTapped(_ sender: UISwitch) {
        imageView.image = sender.isOn ? onImage : offImage
    }
    
    @objc
    func enlargeButtonTapped(_ sender: UIButton) {
        isEnlarged.toggle()
        let witdh = isEnlarged ? 200 : 100
        imageView.snp.updateConstraints { make in
            make.width.height.equalTo(witdh)
        }
    }
    
    @objc
    func prevNextBtnTapped(_ sender: UIButton) {
        if sender == nextBtn {
            currentPictureIdx = (currentPictureIdx + 1) % numOfPictures
        } else {
            currentPictureIdx = (currentPictureIdx - 1 + numOfPictures) % numOfPictures
        }
        
        imageView.image = UIImage(named: String(currentPictureIdx + 1) + ".png")
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
