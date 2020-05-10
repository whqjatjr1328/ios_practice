
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let imageView:UIImageView, prevBtn:UIButton, nextBtn:UIButton, statusLabel:UILabel, numOfImages=6
    var currentImageIdx=0 {
        didSet{
            statusLabel.text = "\(currentImageIdx+1) / \(images.count)"
            imageView.image = images[currentImageIdx]
        }
    }
    var images:[UIImage]
    
    init(){
        imageView = UIImageView()
        prevBtn = UIButton()
        nextBtn = UIButton()
        statusLabel = UILabel()
        images=[]
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        for i in 1...numOfImages{
            if let image = UIImage(named: String(i)+".png"){
                images.append(image)
            }
        }
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        imageView.contentMode = .scaleAspectFit
        imageView.image = images.first
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width - 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.5)
            
        ])
        
        statusLabel.text = "\(currentImageIdx + 1) / \(images.count)"
        statusLabel.textAlignment = .center
        view.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 60),
            statusLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        prevBtn.setTitle("previous", for: .normal)
        prevBtn.setTitleColor(.blue, for: .normal)
        prevBtn.addTarget(self, action: #selector(self.btnClicked(_:)), for: .touchUpInside)
        view.addSubview(prevBtn)
        prevBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            prevBtn.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            prevBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
        ])
        
        nextBtn.setTitle("next", for: .normal)
        nextBtn.setTitleColor(.blue, for: .normal)
        nextBtn.addTarget(self, action: #selector(self.btnClicked(_:)), for: .touchUpInside)
        view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextBtn.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            nextBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
    
    
    @objc func btnClicked(_ sender:UIButton){
        var idx = currentImageIdx
        if sender == prevBtn {
            idx -= 1
            if idx < 0 {
                idx += images.count
            }
        } else if sender == nextBtn {
            idx += 1
            idx %= images.count
        }
        currentImageIdx = idx
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
