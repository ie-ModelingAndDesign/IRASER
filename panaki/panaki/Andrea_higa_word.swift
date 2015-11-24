//
//  Andrea_higa_word_search.swift
//  panaki
//
//  Created by CodeHex from IRASER on 2015/11/05.
//  Copyright © 2015年 CodeHex. All rights reserved.
//

import UIKit
import SwiftyJSON

extension Character {
    func isMatch(pattern: String) -> Bool {
        let char = String(self)
        let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
        let matches = regex?.matchesInString(char, options: NSMatchingOptions.Anchored, range: NSRange(location: 0, length: char.characters.count))
        return matches?.count > 0
    }
}

class Andrea_higa_word {
    // Singleton
    static let instance: Andrea_higa_word = Andrea_higa_word()
    
    func find(word: String) -> String{
        var filename = 0
        let andrea = Andrea_higa_word()
        let Char: Character = andrea.adjustChar(word)
        switch Char {
            case "あ":
                filename = 1
                break
            case "い":
                filename = 2
                break
            case "う":
                filename = 3
                break
            case "え":
                filename = 4
                break
            case "お":
                filename = 5
                break
            case "か":
                filename = 6
                break
            case "が":
                filename = 7
                break
            case "き":
                filename = 8
                break
            case "ぎ":
                filename = 9
                break
            case "く":
                filename = 10
                break
            case "ぐ":
                filename = 11
                break
            case "け":
                filename = 12
                break
            case "げ":
                filename = 13
                break
            case "こ":
                filename = 14
                break
            case "ご":
                filename = 15
                break
            case "さ":
                filename = 16
                break
            case "ざ":
                filename = 17
                break
            case "し":
                filename = 18
                break
            case "じ":
                filename = 19
                break
            case "す":
                filename = 20
                break
            case "ず":
                filename = 21
                break
            case "せ":
                filename = 22
                break
            case "ぜ":
                filename = 23
                break
            case "そ":
                filename = 24
                break
            case "ぞ":
                filename = 25
                break
            case "た":
                filename = 26
                break
            case "だ":
                filename = 27
                break
            case "ち":
                filename = 28
                break
            case "ぢ":
                filename = 29
                break
            case "つ":
                filename = 30
                break
            case "づ":
                filename = 31
                break
            case "て":
                filename = 32
                break
            case "で":
                filename = 33
                break
            case "と":
                filename = 34
                break
            case "ど":
                filename = 35
                break
            case "な":
                filename = 36
                break
            case "に":
                filename = 37
                break
            case "ぬ":
                filename = 38
                break
            case "ね":
                filename = 39
                break
            case "の":
                filename = 40
                break
            case "は":
                filename = 41
                break
            case "ば":
                filename = 42
                break
            case "ひ":
                filename = 44
                break
            case "び":
                filename = 45
                break
            case "ぴ":
                filename = 46
                break
            case "ふ":
                filename = 47
                break
            case "ぶ":
                filename = 48
                break
            case "ぷ":
                filename = 49
                break
            case "へ":
                filename = 50
                break
            case "べ":
                filename = 51
                break
            case "ぺ":
                filename = 52
                break
            case "ほ":
                filename = 53
                break
            case "ぼ":
                filename = 54
                break
            case "ぽ":
                filename = 55
                break
            case "ま":
                filename = 56
                break
            case "み":
                filename = 57
                break
            case "む":
                filename = 58
                break
            case "め":
                filename = 59
                break
            case "も":
                filename = 60
                break
            case "や":
                filename = 61
                break
            case "ゆ":
                filename = 62
                break
            case "よ":
                filename = 63
                break
            case "ら":
                filename = 64
                break
            case "り":
                filename = 65
                break
            case "る":
                filename = 66
                break
            case "れ":
                filename = 67
                break
            case "ろ":
                filename = 68
                break
            case "わ":
                filename = 69
                break
            case "を":
                filename = 70
                break
            case "ぱ", "ん":
                break
            case "e":
                filename = 71
                break
            default:
                filename = 72
                break
        } // "ぱ", "ん" は 0 を返し, 何かしらのエラーは 72 を返す。空文字は 71 を返す.(絵文字や英字など "ゔ" も, その他の記号の処理)
        
        return String(filename)
    }
    
    func adjustChar(word: String) -> Character {
         //空文字判断wordが空文字なら"e"を返す
        if word.isEmpty{
            return "e"
        }
        let filtering = "[ぁぃぅぇぉっゃゅょゎ]"
        var lastChar = word.characters.last!
        // let filtering2 = 「ゐ ゑ」の対処を行う
        
        if lastChar == "ー" {
            let previousWord = String(word.characters.dropLast())
            let previouslastChar = previousWord.characters.last!
            lastChar = previouslastChar.isMatch(filtering) ? uppercaseHiragana(previouslastChar) : previouslastChar
        } else {
            lastChar = lastChar.isMatch(filtering) ? uppercaseHiragana(lastChar) : lastChar
        }
        
        return lastChar
    }
    
    private func uppercaseHiragana(char: Character) -> Character{
        switch char {
            case "ぁ":
                return "あ"
            case "ぃ":
                return "い"
            case "ぅ":
                return "う"
            case "ぇ":
                return "え"
            case "ぉ":
                return "お"
            case "っ":
                return "つ"
            case "ゃ":
                return "や"
            case "ゅ":
                return "ゆ"
            case "ょ":
                return "よ"
            case "ゎ":
                return "わ"
            default:
                break
        }
        
        return "!"
    }
}