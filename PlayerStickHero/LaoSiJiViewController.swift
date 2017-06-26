//
//  LaoSiJiViewController.swift
//  PlayerStickHero
//
//  Created by 曾富田 on 2017/6/26.
//  Copyright © 2017年 安风. All rights reserved.
//

import UIKit

class LaoSiJiViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //创建tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        //签订代理
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topView = UIView()
        topView.backgroundColor = UIColor.init(hexString: "#FF4040")
        self.view.addSubview(topView)
        
        topView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(64)
        }
        
        let leftBtu = UIButton()
        leftBtu.backgroundColor = UIColor.init(hexString: "#FF4040")
        leftBtu.setTitleColor(UIColor.white, for: .normal)
        leftBtu.setTitle("返回", for: .normal)
        leftBtu.addTarget(self, action: #selector(backHome), for: .touchUpInside)
        topView.addSubview(leftBtu)
        
        leftBtu.snp.makeConstraints { (make) in
            make.bottom.equalTo(topView)
            make.left.equalTo(topView).offset(13)
            make.size.equalTo(CGSize.init(width: 44, height: 44))
        }
        
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(64)
            make.bottom.equalTo(self.view)
        }
        

        // Do any additional setup after loading the view.
    }

    func backHome() {
        self.dismiss(animated: false) { 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // 分()个区
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1

    }
    
    
    // 分()行/区
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10;
      
    }
    
    
    //设置每row的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
   
        return 64

    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//            let cell = tableView.dequeueReusableCell(withIdentifier: ConstructionTechniquCellID, for: indexPath) as! SearchIntegratedTextCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            return cell
        
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
