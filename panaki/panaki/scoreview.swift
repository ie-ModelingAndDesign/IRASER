//
//  scoreview.swift
//  panaki
//
//  Created by 徳山盛隼 on 2016/02/11.
//  Copyright © 2016年 Kazuma. All rights reserved.
//

import UIKit

class scoreview: UIViewController {
    
    private var score: Int  = 0
    
    func setScore(val: Int) {
        self.score = val
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lavel1 = UILabel()
        lavel1.frame = CGRectMake(self.view.frame.size.width / 2 - self.view.frame.size.width / 2, self.view.frame.size.height / 3 - 150, self.view.frame.size.width, 80)
        lavel1.backgroundColor = UIColor.whiteColor()
        lavel1.text = "スコア"
        lavel1.font = UIFont.systemFontOfSize(80)
        lavel1.textColor = UIColor.redColor()
        lavel1.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lavel1)

        
        let lavel2 = UILabel()
        lavel2.frame = CGRectMake(self.view.frame.size.width / 2 - self.view.frame.size.width / 2 , self.view.frame.size.height / 2 - 200, self.view.frame.size.width , 50)
        lavel2.backgroundColor = UIColor.whiteColor()
        // ラベルに枠線を付ける
        // 枠線の色
        lavel2.layer.borderColor = UIColor.blackColor().CGColor
        // 枠線の太さ
        lavel2.layer.borderWidth = 2.0
        lavel2.text = "\(score)"
        lavel2.font = UIFont.systemFontOfSize(50)
        lavel2.textColor = UIColor.redColor()
        lavel2.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lavel2)
        

        
        // 背景色を設定.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // ボタンを作成.
        let backButton: UIButton = UIButton(frame: CGRectMake(0,0,120,50))
        backButton.backgroundColor = UIColor.redColor();
        backButton.layer.masksToBounds = true
        backButton.setTitle("もう一回", forState: .Normal)
        backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:self.view.bounds.height / 2 - 100)
        backButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton);
    }
        
    /*
    ボタンイベント.
    */
    internal func onClickMyButton(sender: UIButton){
        
        // 遷移するViewを定義.
        let myViewController: UIViewController = ViewController()
        
        // アニメーションを設定.
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        // Viewの移動.
        self.presentViewController(myViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}