
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let height: CGFloat = 30
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        return label
    }()
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "this is chapter 1\nPlease Enter Your Name"
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        return label
    }()
    var nameInput: UITextField = {
        let textField = UITextField()
        textField.placeholder = "John"
        return textField
    }()
    var sendBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
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
        view.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.height.equalTo(self.height)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.height.equalTo(self.height * 2)
            make.centerX.equalToSuperview()
            make.top.equalTo(helloLabel.snp.bottom).offset(30)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(self.height)
            make.width.equalTo(40)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview().offset(-30)
        }
        
        view.addSubview(nameInput)
        nameInput.snp.makeConstraints { make in
            make.height.top.equalTo(nameLabel)
            make.left.equalTo(nameLabel.snp.right).offset(20)
            make.right.equalToSuperview().offset(30)
        }
        
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
        view.addSubview(sendBtn)
        sendBtn.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.height.equalTo(self.height)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    func sendBtnTapped() {
        guard let name = nameInput.text else { return }
        helloLabel.text = "Hello~, " + name
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
