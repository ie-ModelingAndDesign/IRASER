//
//  ViewController.swift
//  ui
//
//  Created by 山本　凌 on 2015/12/17.
//  Copyright © 2015年 山本　凌. All rights reserved.
//

import UIKit

class DiscriptionView: UIViewController {

    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closebtn = UIButton(frame: CGRectMake(self.view.frame.size.width - 40, 30, 30, 30))
        closebtn.backgroundColor = UIColor.orangeColor()
        closebtn.setTitle("×", forState: .Normal)
        closebtn.titleLabel!.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        closebtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        closebtn.addTarget(self, action: "backtogame", forControlEvents: .TouchDown)
        closebtn.layer.cornerRadius = closebtn.frame.size.width / 2
        closebtn.titleLabel!.textAlignment = .Justified
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let m1 = NSBundle.mainBundle().pathForResource("m1", ofType: "jpg")
        let m2 = NSBundle.mainBundle().pathForResource("m2", ofType: "jpg")
        let m4 = NSBundle.mainBundle().pathForResource("m4", ofType: "jpg")
        let image_m1 = UIImage(contentsOfFile: m1!)
        let image_m2 = UIImage(contentsOfFile: m2!)
        let image_m4 = UIImage(contentsOfFile: m4!)
        let m1view = UIImageView(frame:  CGRect(x: self.view.frame.size.width - 115, y: 80, width: 80, height: 80))
        m1view.image = image_m1
        let m2view = UIImageView(frame:  CGRect(x: 20, y: 80, width: 80, height: 80))
        m2view.image = image_m2
        let m4view = UIImageView(frame:  CGRect(x: 0, y: self.view.frame.size.height - self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width))
        m4view.image = image_m4
        self.view.addSubview(m1view)
        self.view.addSubview(m2view)
        self.view.addSubview(m4view)
        
        let rule1 = UILabel()
        let rule2 = UILabel()
        let rule3 = UILabel()
        
        rule1.frame = CGRectMake(self.view.frame.size.width / 2 - self.view.frame.size.width / 2, self.view.frame.size.height / 3, self.view.frame.size.width, 50)
        rule1.backgroundColor = UIColor.whiteColor()
        rule1.text = "「ぱなき」とはようするにしりとりです"
        rule1.textColor = UIColor.redColor()
        rule1.textAlignment = NSTextAlignment.Center
        
        rule2.frame = CGRectMake(self.view.frame.size.width / 2 - self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 50, self.view.frame.size.width, 50)
        rule2.backgroundColor = UIColor.whiteColor()
        rule2.text = "相手に「ぱなき」と言われたら終わりです"
        rule2.textColor = UIColor.orangeColor()
        rule2.textAlignment = NSTextAlignment.Center

        rule3.frame = CGRectMake(self.view.frame.size.width / 2 - self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 100, self.view.frame.size.width, 50)
        rule3.backgroundColor = UIColor.whiteColor()
        rule3.text = "しりとりの続いた回数がスコアです"
        rule3.textColor = UIColor.blueColor()
        rule3.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(rule1)
        self.view.addSubview(rule2)
        self.view.addSubview(rule3)
        self.view.addSubview(closebtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backtogame () {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }


}

