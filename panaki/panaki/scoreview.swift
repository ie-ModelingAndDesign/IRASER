//
//  scoreview.swift
//  panaki
//
//  Created by 徳山盛隼 on 2016/02/11.
//  Copyright © 2016年 Kazuma. All rights reserved.
//

import UIKit
import GameKit

class scoreview: UIViewController, GKGameCenterControllerDelegate {
    
    private var score: Int  = 0
    
    func setScore(val: Int) {
        self.score = val
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let m4 = NSBundle.mainBundle().pathForResource("m4", ofType: "jpg")
        let image_m4 = UIImage(contentsOfFile: m4!)
        let m4view = UIImageView(frame:  CGRect(x: 0, y: self.view.frame.size.height - self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width))
        m4view.image = image_m4
        self.view.addSubview(m4view)
        
        let lavel1 = UILabel()
        lavel1.frame = CGRectMake(0, 20, self.view.frame.size.width, 80)
        lavel1.backgroundColor = UIColor.whiteColor()
        lavel1.text = "スコア"
        lavel1.font = UIFont.systemFontOfSize(80)
        lavel1.textColor = UIColor.redColor()
        lavel1.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lavel1)

        
        let lavel2 = UILabel()
        lavel2.frame = CGRectMake(0, self.view.frame.size.height / 2 - 50, self.view.frame.size.width, 50)
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
        let backButton: UIButton = UIButton(frame: CGRectMake(self.view.frame.size.width / 2 - 60, self.view.frame.size.height / 2 + 30, 120, 50))
        backButton.backgroundColor = UIColor.redColor();
        backButton.layer.masksToBounds = true
        backButton.setTitle("もう一回", forState: .Normal)
        backButton.layer.cornerRadius = 20.0
        backButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchDown)
        self.view.addSubview(backButton)
        
        
        let gk_score: GKScore = GKScore()
        gk_score.value = Int64(score)
        gk_score.leaderboardIdentifier = "Hello" // Achievement
        
        let scoreArr: [GKScore] = [gk_score]
        GKScore.reportScores(scoreArr, withCompletionHandler:{(error:NSError?) -> Void in
            if((error != nil)) {
                print("Report: Error")
            } else {
                print("Report: OK")
            }
        })
        
        self.Leaderboard(gk_score.leaderboardIdentifier)
    }
    
    func Leaderboard(id: String) {
        let localPlayer = GKLocalPlayer()
        localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifier : String?, error : NSError?) -> Void in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let gcViewController: GKGameCenterViewController = GKGameCenterViewController()
                gcViewController.gameCenterDelegate = self
                gcViewController.viewState = GKGameCenterViewControllerState.Leaderboards
                gcViewController.leaderboardIdentifier = id
                
                self.presentViewController(gcViewController, animated: true, completion: nil)
            }
        })
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController){
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }

    func onClickMyButton(sender: UIButton){
        
        let myViewController = ViewController()
        
        myViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        self.presentViewController(myViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}