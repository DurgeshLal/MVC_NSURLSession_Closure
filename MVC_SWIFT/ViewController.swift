//
//  ViewController.swift
//  MVC_SWIFT
//
//  Created by Durgesh Lal on 16/09/14.
//  Copyright (c) 2014 Durgesh Lal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var btnLoadImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func imageTapped(sender: AnyObject) {
        
        let url:NSURL = NSURL.URLWithString("http://127.0.0.1:9090//manager/images/tomcat.gif")// replace with your server url.
        let requestHandeler:RequestHandler = RequestHandler()
        requestHandeler.fetchDataFromUrl(url, withClosure: { (response) -> Void in
            self.imgBackground.image = UIImage(data: response as NSData)
        })
        
        
        /*
        
        var request:NSMutableURLRequest = NSMutableURLRequest(URL: url);
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response : NSURLResponse!,data: NSData!, error: NSError!) -> Void in
            
            self.imgBackground.image = UIImage(data: data)
            
        }
*/
            
        }
   
    }


