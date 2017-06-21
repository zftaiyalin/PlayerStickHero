//
//  ViewController.swift
//  PlayerStickHero
//
//  Created by 安风 on 2017/6/20.
//  Copyright © 2017年 安风. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.green
        
        let button = UIButton()
        button.setTitle("开始游戏", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 8
        button.frame = CGRect.init(x: 0, y: 0, width: 100, height: 60)
        button.addTarget(self, action: #selector(pushGame), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func pushGame() {
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        //将取出的storyboard里面的控制器被所需的控制器指着。
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "StickHeroBoard")
        self.present(vc, animated: true) { 
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

