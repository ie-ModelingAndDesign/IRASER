//
//  Andrea_higa_siritori.swift
//  panaki
//
//  Created by CodeHex from IRASER on 2015/11/05.
//  Copyright © 2015年 CodeHex. All rights reserved.
//

import UIKit
import SwiftyJSON

class Andrea_higa {
    // Singleton
    static let instance = Andrea_higa()
    private static var dict: Dictionary<String, Int> = Dictionary()
        
    func siritori(word: String) -> String {
        let andrea = Andrea_higa_word()
        
        let file = andrea.find(word)
        if file == "0" {
            return "パナキ"
        } else if file == "71" {
            return "エラー" // エラーの対処を考える
        }

        let path = NSBundle.mainBundle().pathForResource(file, ofType: "json")!
        let fileHandle = NSFileHandle(forReadingAtPath: path)
        let data = fileHandle?.readDataToEndOfFile()
        let json = JSON(data: data!).dictionaryObject!
        let cnt = json.count
        
        var return_word = ""
        
        repeat {
            let index = Int(arc4random_uniform(UInt32(cnt)))
            return_word = Array(json.keys)[index]
            if return_word.characters.last! == "ん" {
                Andrea_higa.dict[return_word] = 1
            }
        } while Andrea_higa.dict[return_word] == 1
        
        Andrea_higa.dict[return_word] = 1

        return return_word
    }
}