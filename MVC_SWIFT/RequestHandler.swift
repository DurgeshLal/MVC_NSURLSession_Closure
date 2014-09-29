//
//  RequestHandler.swift
//  MVC_SWIFT
//
//  Created by Durgesh Lal on 29/09/14.
//  Copyright (c) 2014 Durgesh Lal. All rights reserved.
//

import Foundation

var RequestCompletionBlock = {
    (iResponse: AnyObject!) -> Void in
}

class RequestHandler: NSObject,NSURLSessionDelegate, NSURLSessionDataDelegate{
    
   
    
    var responseData: NSMutableData!
    var response: AnyObject!
    var HTTPResponse: NSHTTPURLResponse!
    
    
    func fetchDataFromUrl(iURL:NSURL!, withClosure:(response:AnyObject!) -> Void){
        
        if (iURL != nil) {
            RequestCompletionBlock = withClosure;
            var request: NSMutableURLRequest = NSMutableURLRequest(URL: iURL);
            request.HTTPMethod = "GET"
            var sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
            var session: NSURLSession = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
            
            var dataTask: NSURLSessionDataTask = session.dataTaskWithRequest(request)
            dataTask.resume()
            
        }
        RequestCompletionBlock = withClosure;
    }
    
         func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void){
            completionHandler(.Allow)
            
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData){
        
        RequestCompletionBlock({data}())
        
        
    }
    
}








