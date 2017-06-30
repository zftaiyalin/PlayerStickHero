//
//  ViewController.swift
//  PlayerStickHero
//
//  Created by 安风 on 2017/6/20.
//  Copyright © 2017年 安风. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        let image = UIImageView()
        image.image = UIImage.init(named: "stick_background.jpg")
        self.view.addSubview(image)
        
        image.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        
        let icon = UIImageView()
        icon.image = UIImage.init(named: "icon-83.5.png")
        self.view.addSubview(icon)
        
        icon.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 120, height: 120))
            make.top.equalTo(self.view.snp.centerY).offset(-100)
        }
        
        let button = UIButton()
        button.backgroundColor = UIColor.init(hexString: "#FF4040")
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 7
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(pushGame), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 110, height: 40))
            make.top.equalTo(icon.snp.bottom).offset(30)
        }
        
        
        
            if AppUnitl.sharedManager().ssmodel == nil {
                self.perform(#selector(loadRequest), afterDelay: 2.0)
            }else{
                if AppUnitl.sharedManager().ssmodel.appstatus.isShow && UserDefaults.standard.bool(forKey: "pinglun" ) {
                    let lbutton = UIButton()
                    lbutton.backgroundColor = UIColor.init(hexString: "#FF4040")
                    lbutton.setTitleColor(UIColor.white, for: .normal)
                    lbutton.layer.cornerRadius = 7
                    lbutton.setTitle("老司机专区", for: .normal)
                    lbutton.addTarget(self, action: #selector(pushLao), for: .touchUpInside)
                    self.view.addSubview(lbutton)
                    
                    lbutton.snp.makeConstraints { (make) in
                        make.centerX.equalTo(self.view)
                        make.size.equalTo(CGSize.init(width: 110, height: 40))
                        make.top.equalTo(button.snp.bottom).offset(20)
                    }
                }
            }
        

        
        self.addBaner()

    }
    
    func loadRequest() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let currentDateString = dateFormatter.string(from: Date.init())
        let ss = "http://opmams01o.bkt.clouddn.com/stickhero.json?v=" + currentDateString
        let xcfURL = URL.init(string: ss)
        
        var content:String!
        do {
            content = try String(contentsOf:xcfURL!)
        }
        catch let error {
            // Error handling
            print(error)
        }
        
        if content != nil {
            let model = AppModel.yy_model(withJSON: content)
            AppUnitl.sharedManager().ssmodel = model
            if !UserDefaults.standard.bool(forKey: "pinglun" ) && AppUnitl.sharedManager().ssmodel.appstatus.isShow {
                let infoAlert = UIAlertView.init(title: AppUnitl.sharedManager().ssmodel.appstatus.alertTitle, message: AppUnitl.sharedManager().ssmodel.appstatus.alertText, delegate: self, cancelButtonTitle: "取消")
                infoAlert.addButton(withTitle: "去评价")
                infoAlert.show()
            }
        }else{
            self.perform(#selector(loadRequest), afterDelay: 2.0)
        }
    }
    
    func pushLao() {
        self.navigationController?.pushViewController(HongViewController(), animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        if AppUnitl.sharedManager().ssmodel != nil {
        
        if !UserDefaults.standard.bool(forKey: "pinglun" ) && AppUnitl.sharedManager().ssmodel.appstatus.isShow {
            let infoAlert = UIAlertView.init(title: AppUnitl.sharedManager().ssmodel.appstatus.alertTitle, message: AppUnitl.sharedManager().ssmodel.appstatus.alertText, delegate: self, cancelButtonTitle: "取消")
            infoAlert.addButton(withTitle: "去评价")
            infoAlert.show()
        }
        }
    }
    
    public func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int){
        if buttonIndex == 1 {
            
            let str = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1251252305&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"
            
            UIApplication.shared.openURL(URL.init(string: str)!)
            
            UserDefaults.standard.set(true, forKey: "pinglun")
            
        }
    }
    
    func pushGame() {
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        //将取出的storyboard里面的控制器被所需的控制器指着。
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "StickHeroBoard")
        self.present(vc, animated: false) {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

