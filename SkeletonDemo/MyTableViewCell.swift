//
//  MyTableViewCell.swift
//  SkeletonDemo
//
//  Created by 🍎上的豌豆 on 2018/10/21.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.createUI()
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var userAvatar:UIImageView = {
        let imageV = UIImageView.init()
        imageV.layer.cornerRadius = 31
        imageV.layer.masksToBounds = true
        imageV.backgroundColor = UIColor.randomColor()
        imageV.isSkeletonable = true
        return imageV
    }()
    lazy var userIDLabel:UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = "🍎苹果上的豌豆w"
        label.isSkeletonable = true
        return label
    }()
    lazy var userLabel:UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = "2018.08.20"
        label.isSkeletonable = true
        return label
    }()
  private func createUI(){
    self.addSubview(userAvatar)
    self.addSubview(userIDLabel)
    self.addSubview(userLabel)
    userAvatar.snp.makeConstraints { (make) in
        make.top.equalTo(38)
        make.left.equalTo(15)
        make.width.height.equalTo(62)
    }
    userIDLabel.snp.makeConstraints { (make) in
        make.top.equalTo(40)
        make.left.equalTo(userAvatar.snp.right).offset(21)
        
        make.height.equalTo(20)
    }
    userLabel.snp.makeConstraints { (make) in
        make.top.equalTo(70)
        make.left.equalTo(userAvatar.snp.right).offset(21)
        
        make.height.equalTo(20)
    }
    }

}


extension UIColor {
    static func colorWithRGBA(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor{
        
        return self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    static func colorWithRGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor{
        
        return colorWithRGBA(r: r, g: g, b: b, alpha: 1)
    }
    
    static func colorWithHex(hex : Int) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1)
    }
    
    static func colorWithHex(hex : Int , alpha : CGFloat) -> UIColor{
        return UIColor.init(red: CGFloat((hex >> 16) & 0xFF)/255.0 , green: CGFloat((hex >> 8) & 0xFF)/255.0 , blue: CGFloat(hex & 0xFF)/255.0 , alpha: alpha)
    }
    
    static func randomColor() -> UIColor {
        return colorWithRGB(r: CGFloat(arc4random_uniform(256)),
                            g: CGFloat(arc4random_uniform(256)),
                            b: CGFloat(arc4random_uniform(256)))
    }
    
    func image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

