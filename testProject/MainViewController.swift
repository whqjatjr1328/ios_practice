
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let titles:UILabel, text:UILabel, name:UILabel, nameInput:UITextField, sendBtn:UIButton
    
    
    init(){
        titles = UILabel()
        text = UILabel()
        name  = UILabel()
        nameInput = UITextField()
        sendBtn = UIButton()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        // Do any additional setup after loading the view.
    }
    
    func setViews(){
        titles.text = "Hello~ "
        titles.textAlignment = .center
//        titles font size setting process
        view.addSubview(titles)
        titles.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titles.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titles.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            titles.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
        ])

        text.text = "this is ios world"
        text.textAlignment = .center
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: titles.bottomAnchor, constant: 15),
            text.leftAnchor.constraint(equalTo: titles.leftAnchor),
            text.rightAnchor.constraint(equalTo: titles.rightAnchor)
        ])

        name.text = "name: "
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            name.leftAnchor.constraint(equalTo: titles.leftAnchor),
            name.widthAnchor.constraint(equalToConstant: 50),
        ])

        nameInput.borderStyle = .roundedRect
        view.addSubview(nameInput)
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            nameInput.leftAnchor.constraint(equalTo: name.rightAnchor, constant: 10),
            nameInput.rightAnchor.constraint(equalTo: titles.rightAnchor, constant: -20)

        ])

        sendBtn.setTitle("send", for: .normal)
        sendBtn.setTitleColor(.blue, for: .normal)
        sendBtn.addTarget(self, action: #selector(self.sendName), for: .touchUpInside)
        view.addSubview(sendBtn)
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendBtn.topAnchor.constraint(equalToSystemSpacingBelow: name.bottomAnchor, multiplier: 10),
            sendBtn.leftAnchor.constraint(equalTo: titles.leftAnchor),
            sendBtn.rightAnchor.constraint(equalTo: titles.rightAnchor)
        ])
    }
    
    
    @objc func sendName(){
        let names = nameInput.text ?? ""
        titles.text = "Hello~ " + names
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
