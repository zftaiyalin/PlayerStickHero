//
//  Aplication.swift
//  PlayerStickHero
//
//  Created by 曾富田 on 2017/6/26.
//  Copyright © 2017年 安风. All rights reserved.
//

import Foundation

class Aplication: NSObject {
    static let shareInstance = Aplication()
    var model: AppModel = AppModel()
    
    override init() {

    }
}
