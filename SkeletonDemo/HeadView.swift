//
//  HeadView.swift
//  SkeletonDemo
//
//  Created by 🍎上的豌豆 on 2018/10/21.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit
import SnapKit
import SkeletonView
class HeadView: UIView {

    lazy var userAvatar:UIImageView = {
        let imageV = UIImageView.init()
        imageV.layer.cornerRadius = 31
        imageV.layer.masksToBounds = true
        imageV.backgroundColor =  UIColor.randomColor()
        imageV.isSkeletonable = true
        return imageV
    }()
    lazy var userIDLabel:UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = "苹果上的豌豆"
         label.isSkeletonable = true
        return label
    }()
    lazy var userLabel:UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "2018.10.20"
         label.isSkeletonable = true
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layoutUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        self.addSubview(userAvatar)
        self.addSubview(userIDLabel)
        self.addSubview(userLabel)
  
    }
    private func layoutUI(){
        
        userAvatar.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(38)
           
            make.width.height.equalTo(62)
        }
        userIDLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userAvatar.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
        }
        userLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userIDLabel.snp.bottom).offset(10)
             make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
        }
    }
}
