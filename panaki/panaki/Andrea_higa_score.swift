//
//  Andrea_higa_score.swift
//  panaki
//
//  Created by CodeHex from IRASER on 2015/11/05.
//  Copyright © 2015年 CodeHex. All rights reserved.
//

import UIKit
import GameKit
    

//game center にログインするための処理
struct GKLocalPlayerUtil {
    static var localPlayer:GKLocalPlayer = GKLocalPlayer();
    
    static func login(target:UIViewController){
        self.localPlayer = GKLocalPlayer();
        self.localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if ((viewController) != nil) {
                print("ログイン確認処理：失敗-ログイン画面を表示");
                target.presentViewController(viewController!, animated: true, completion: nil);
            }else{
                print("ログイン確認処理：成功");
                if (error == nil){
                    print("ログイン認証：成功");
                }else{
                    print("ログイン認証：失敗");
                }
            }
        }
    }
}

//game center　にスコアを送信するための処理
struct GKScoreUtil {
    
    static func reportScores(value:Int, leaderboardid:String){
        let score:GKScore = GKScore();
        score.value = Int64(value);
        score.leaderboardIdentifier = leaderboardid;
        let scoreArr:[GKScore] = [score];
        GKScore.reportScores(scoreArr, withCompletionHandler:{(error:NSError?) -> Void in
            if( (error != nil)){
                print("reportScore NG");
            }else{
                print("reportScore OK");
            }
        });
        
    }
}
