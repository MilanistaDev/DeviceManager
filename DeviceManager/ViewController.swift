//
//  ViewController.swift
//  DeviceManager
//
//  Created by Takuya Aso on 2017/01/09.
//  Copyright © 2017年 Takuya Aso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var modelNumberLabel: UILabel!
    @IBOutlet weak var useriOSDeviceLabel: UILabel!

    // plist からデバイスデータを取得する
    // get device data from plist
    var deviceDic: NSDictionary = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // DeviceList.plist からデータ取得
        // get device data from DeviceList.plist
        let bundle = Bundle.main

        // DeviceList.plist のファイルパスを指定
        // Specify the file path of DeviceList.plist.
        let path = bundle.path(forResource: "DeviceList", ofType: "plist")

        // DeviceList.plistのデータを取得して格納
        // Acquires data of DeviceList.plist and stores it
        self.deviceDic = NSDictionary(contentsOfFile: path!)!
    }

    /**
      使用端末の情報を表示
      Display the user iOS device Info.
    */
    @IBAction func checkDeviceAction(_ sender: Any) {

        // iPhone5,1 みたいな文字列取得
        let modelName = DeviceManager.currentDeviceIdentifierName()
        self.modelNumberLabel.text = modelName;

        let deviceType: DeviceType = DeviceManager.currentDeviceType()
        let deviceTypeStr: String = String(deviceType.rawValue)
        let deviceName: String = self.deviceDic.object(forKey: deviceTypeStr) as! String

        self.useriOSDeviceLabel.text = deviceName
    }

    /**
      特定の端末に対してのみ特別な処理を行う場合の例
      An example of a case where special processing is performed only for a specific terminal.
    */
    @IBAction func CorrespondingDeviceCheck(_ sender: Any) {
        let deviceType:DeviceType = DeviceManager.currentDeviceType()

        switch deviceType {
        case .iPhone7Plus:
            self.view.backgroundColor = UIColor.red
        case .iPodtouch5:
            self.view.backgroundColor = UIColor.green
        default:
            self.view.backgroundColor = UIColor.white
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

