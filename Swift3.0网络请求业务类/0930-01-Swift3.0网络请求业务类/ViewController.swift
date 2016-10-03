//
//  ViewController.swift
//  0930-01-Swift3.0网络请求业务类
//
//  Created by 王中尧 on 16/9/30.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let parameters = [
            "opt_type": 1,
            "size" : 50,
            "offset" : 50
        ]
        
        /*
        WZYNetworkTool.shareInstance.request(requestType: .Get, url: kUrl, parameters: parameters) { (response, error) in
            
            if error == nil {
                guard let dicArray = response?["goods_list"] as? [[String: Any]] else {
                    return
                }
                print(dicArray)
            
            } else {
                print(error)
            }
        }
 */
        
        
        WZYNetworkTool.shareInstance.request(requestType: .Get, url: kUrl, parameters: parameters, succeed: { (response) in
                guard let dicArray = response?["goods_list"] as? [[String: Any]] else {
                    return
                }
                print(dicArray)
            
            }) { (error) in
                
                guard let error = error else {
                    return
                }
                print(error)
        }
        
        
    }
}

