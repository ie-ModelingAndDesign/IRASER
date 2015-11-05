# はじめに!!
```
 _______________________________
< 我が名はIRASER!! 全てを消しさ(ry >
 -------------------------------
                       \                    ^    /^
                        \                  / \  // \
                         \   |\___/|      /   \//  .\
                          \  /O  O  \__  /    //  | \ \           *----*
                            /     /  \/_/    //   |  \  \          \   |
                            @___@`    \/_   //    |   \   \         \/\ \
                           0/0/|       \/_ //     |    \    \         \  \
                       0/0/0/0/|        \///      |     \     \       |  |
                    0/0/0/0/0/_|_ /   (  //       |      \     _\     |  /
                 0/0/0/0/0/0/`/,_ _ _/  ) ; -.    |    _ _\.-~       /   /
                             ,-}        _      *-.|.-~-.           .~    ~
            \     \__/        `/\      /                 ~-. _ .-~      /
             \____(oo)           *.   }            {                   /
             (    (--)          .----~-.\        \-`                 .~
             //__\\  \_ *uck!   ///.----..<        \             _ -~
            //    \\               ///-._ _ _ _ _ _ _{^ - - - - ~
```
[ここ](http://qiita.com/susieyy/items/f71435cc962e70d81b37 "Qiita")を基にして作っています。  

#前提実行環境
Xcode7.1  
Swift2.1
#用語の日本語訳について!!
|                原文                |                   訳                   |
|:----------------------------------:|:--------------------------------------:|
|              Optional              |              オプショナル              |
|          Optional Chaining         |        オプショナルチェイニング        |
|            Optional Type           |             オプショナル型             |
|          Optional Binding          |       オプショナル バインディング      |
|               Unwrap               |               アンラップ               |
|          Forced Unwrapping         |            強制的アンラップ            |
| Implicitly Unwrapped Optional Type | 暗黙的にアンラップされるオプショナル型 |
|               Closure              |               クロージャ               |
|            Closure Type            |              クロージャ型              |
|          Trailing Closure          |                後置記法                |
|                Enum                |                 列挙型                 |
|                Class               |                 クラス                 |
|               Struct               |              ストラクチャ              |
#Swiftコーディング規約
##インデント
インデントはタブで行い、サイズは 4 とする。
```
func numberColor(value: Int) -> UIColor {
    switch value {
	    case 2, 4:
	    	return UIColor(red: 119.0/255.0, green: 110.0/255.0, blue: 101.0/255.0, alpha: 1.0)
	    default:
	    	return UIColor.whiteColor()
    }
}
```
↑こんな感じ
##変数, 定数定義
関連性のある定義の場合は１行で記述してもよい。  
```
let row: Int, column: Int
```
右辺が値で初期化する場合は左辺に型を記述しない。
```
// ◯
let text = "Hoge Fuga" // String型

// ☓
let text: String = "Hoge Fuga"

// ◯
let flg = false // Bool型

// ☓
let flg: Bool = false

// ◯
let frame = CGRectZero // CGRect型

// ☓
let frame: CGRect = CGRectZero
```
ただし型が曖昧な場合は明記する。
```
// ◯ Int / UInt / NSInteger / NSUInteger など似ている型が複数あり、区別がつかないので明記する
let i: Int = 0

// ◯ Float / CGFloat / Double など似ている型が複数あり、区別がつかないので明記する
let p: Float = 3.14
```
右辺のクラスをNewすることで初期化する場合は型が自明なので左辺に型を記述しない。
```
// ◯
let image = UIImage(named: "Hoge") // <- こういうのがnew（初期化）

// ☓
let image: UIImage = UIImage(named: "Hoge")

// ◯
let size = CGSize(10.0, 10.0)

// ☓
let size: CGSize = CGRectZero
```
型をキャストして代入する場合は変数定義の型明記を省力する
```
// ◯
let text = data["text"] as String // 最後に型が書かれている

// ☓
let text: String = data["text"] as String
```
##nil
変数はアンラップすることでどんな型でもnilを代入できる。
```
var hoge: AnyObject? = nil
```
連想配列の値もnilを代入することができる。
```
var hoge: String?
let hash: [String: String?] = ["hoge": hoge, "fuga": "not nil"]
println(hash)
// -> [hoge: nil, fuga: Optional("not nil")]
```
##セミコロン
式の終端にセミコロンは記述しない。
```
// ◯
println("hoge")

// ☓
println("hoge");
```
##ファイル終末
ファイル終末は改行で終わるようにする。

##マクロコメント
###pragma mark
これについては検索すると出てくるので調べておくと開発が楽。
Swift
```
// MARK: - View life cycle
```

Objective-C
```
#pragma mark -
#pragma mark View life cycle
```
##ログ出力
ログ出力は以下の観点よりNSLogを用いる。
ここだけは参考基と違うので注意。
```
// ◯
print("\(hoge) is \(fuga)")

// ☓
NSLog("%@ is %@", hoge, fuga)
```
##Reference
・[The Swift Programming Language](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ "The Swift Programming Language")  
・[Using Swift with Cocoa and Objective-C](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/index.html#//apple_ref/doc/uid/TP40014216 "Using Swift with Cocoa and Objective-C")  
・[The Official raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-%0Aguide "The Official raywenderlich.com Swift Style Guide")  
・[Transitioning from Objective-C to Swift](http://b2cloud.com.au/tutorial/transitioning-from-objective-c-to-swift/ "Transitioning from Objective-C to Swift")

#最後に
あとは自由！
頑張ろう！！  

###パナキ
![](http://img2.gifmagazine.net/gifmagazine/images/476815/original.gif)
