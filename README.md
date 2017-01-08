# About this Sample code

## Summary
English Version of readme is not completed. After writing, add explanation. So sorry.



## 概要
このアプリは，バグで端末依存とかで，ある端末のみ別の対応をしなければならないといったときに直感的に対処できるように作ったデバイスチェッカです。
Swift 3 で書かれています。

[Objective-C Version](https://github.com/MilanistaDev/OCDeviceManager/)


## 使い方

1. 下記の2ファイルをプロジェクトに追加します。

> DeviceList.plist

> DeviceManager.swift

2. 使用するクラスファイルで下記のように使用します。

```ViewController.swift

…

// 端末の種類を取得
let deviceType:DeviceType = DeviceManager.currentDeviceType()

// enum で直感的に判定できるようにしました
switch deviceType {
    case .iPhone7Plus:
        ...
    case .iPadmini4:
        ...
    default:
        ...
}
```

端末識別に使う enum は下記で定義されています。
対応させるアプリの端末によって適宜追加修正が必要なのが，
よくない点です。

```DeviceManager.h

// アプリ対応端末 enum
enum DeviceType: Int {
case Unknown = 0
case iPhone4S
case iPhone5
case iPhone5c
case iPhone5s
case iPhone6Plus
case iPhone6
case iPhone6s
case iPhone6sPlus
case iPhoneSE
case iPhone7
case iPhone7Plus
case iPad3
case iPad4
case iPadAir
case iPadAir2
case iPadmini1
case iPadmini2
case iPadmini3
case iPadmini4
case iPadPro9_7
case iPadPro12_9
case iPodtouch5
case iPodtouch6
}
```

以上です。
もっとスマートな判定の仕方等あればご指摘お願いいたします。
