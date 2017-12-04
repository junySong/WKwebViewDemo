//
//  WKwebViewController.swift
//  Juny_WKwebViewDemo
//
//  Created by 宋俊红 on 2017/12/1.
//  Copyright © 2017年 Juny_song. All rights reserved.
//
import WebKit
import UIKit

class WKwebViewController: UIViewController,WKScriptMessageHandler,WKNavigationDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "fuction1" {
            print("fuction1")
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let  userContentController = WKUserContentController.init()
        userContentController.add(self, name: "fuction1")
        
        // 根据生成的WKUserScript对象，初始化WKWebViewConfiguration
        let webConfiguration = WKWebViewConfiguration.init()
        webConfiguration.userContentController = userContentController
        
        let webView :WKWebView = WKWebView.init(frame: CGRect.init(x: 0, y: 0, width: 500, height: 480), configuration: webConfiguration)
        webView.navigationDelegate = self
        
    
        
        self.view.addSubview(webView)
//        webView.load(URLRequest.init(url: NSURL.init(string: "https://www.baidu.com") as! URL))
        let fileURL = URL(fileURLWithPath: Bundle.main.path(forResource:"test", ofType: "html")!)
        webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
  
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        let string = "alert('tanchukuang')"
//        webView.evaluateJavaScript(string) { (string,Error) in
//            print("------")
//            print(Error)
//        }
//在这里我调用的是点击sendAPP按钮的方法（注意打印结果输出，我们并没有点击按钮，但是输出了fuction1方法）
        webView.evaluateJavaScript("sendApp()")  { (result, error) in
            guard error == nil else {
                print("there was an error")
                print(error)
                return
            }
            
        }
        
        
    }
    

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
