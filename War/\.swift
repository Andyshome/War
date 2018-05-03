//
//  andrewfunctionbase.swift
//  War
//
//  Created by Qiu Ziang on 2018/3/22.
//  Copyright © 2018年 skylove. All rights reserved.
//

import Foundation
class andrewfunction: ViewController {
    func boot_list() -> [Int]{
        var data:[Int] = []
        for a in 1...52 {
            data.append(a)
        }
        return data
    }
    func shuffleArray(arr:[Int]) -> [Int] {
        var data:[Int] = arr
        for i in 1..<arr.count {
            let index:Int = Int(arc4random()) % i
            if index != i {
                data.swapAt(i, index)
            }
        }
        return data
    }
    
}

