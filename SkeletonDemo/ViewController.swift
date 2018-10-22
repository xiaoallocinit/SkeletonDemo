//
//  ViewController.swift
//  SkeletonDemo
//
//  Created by 🍎上的豌豆 on 2018/10/21.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit
import SnapKit
import SkeletonView

class ViewController: UIViewController ,SkeletonTableViewDelegate, SkeletonTableViewDataSource{
    lazy  var table:UITableView = {
        
        let tableView = UITableView.init(frame:.zero, style: UITableView.Style.grouped)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight          = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.estimatedSectionFooterHeight   = 0
        tableView.estimatedSectionHeaderHeight   = 0
        if #available(iOS 11.0, *) {
            
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        tableView.isSkeletonable = true
        return tableView
        
    }();
    //头部视图
    fileprivate  var header = HeadView.init(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:160))
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.view.showAnimatedSkeleton()
        //self.table.showAnimatedGradientSkeleton()
        self.header.showAnimatedGradientSkeleton()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         //self.navigationItem.title = "Skeleton Screen加载占位图"
        view.backgroundColor = .white
        view.addSubview(table)
         self.table.tableHeaderView = self.header
        self.table.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
           //self.table.hideSkeleton()
            self.header.hideSkeleton()
        }
    }
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "MyTableViewCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as! MyTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
//MARK:UITableViewDelegate
extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
