//
//  WZYNetworkTool.swift
//  0930-01-Swift3.0网络请求业务类
//
//  Created by 王中尧 on 16/9/30.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

import AFNetworking

enum WZYRequestType {
    case Get
    case Post
}

class WZYNetworkTool: AFHTTPSessionManager {
    
    static let shareInstance = WZYNetworkTool()

    // 将成功和失败的回调写在一个逃逸闭包中
    func request(requestType : WZYRequestType, url : String, parameters : [String : Any], resultBlock : @escaping([String : Any]?, Error?) -> ()) {
        
        // 成功闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            resultBlock(responseObj as? [String : Any], nil)
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            resultBlock(nil, error)
        }
        
        // Get 请求
        if requestType == .Get {
            get(url, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
        
        // Post 请求
        if requestType == .Post {
            post(url, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
    }
    
    // 将成功和失败的回调分别写在两个逃逸闭包中
    func request(requestType : WZYRequestType, url : String, parameters : [String : Any], succeed : @escaping([String : Any]?) -> (), failure : @escaping(Error?) -> ()) {
        
        // 成功闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            succeed(responseObj as? [String : Any])
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            failure(error)
        }
        
        // Get 请求
        if requestType == .Get {
            get(url, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
        
        // Post 请求
        if requestType == .Post {
            post(url, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
    }
}
