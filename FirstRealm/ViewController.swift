//
//  ViewController.swift
//  FirstRealm
//
//  Created by 辻真緒 on 2019/07/30.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // テーブルに表示するデータを保持した配列
    var items:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // RealmからItemを全件取得する
        let realm = try! Realm()
        items = realm.objects(Item.self).reversed()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func addItem(_ sender: UIButton) {
        // 新しいItemクラスを作成(インスタンス化)
        let item = Item()
        // Itemクラスに入力されたタイトル（テキスト）を設定
        item.title = textField.text
        
        // Realmに保存する
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
        
        // 最新のItem一覧を取得
        items = realm.objects(Item.self).reversed()
        
        // テーブルを更新
        tableView.reloadData()
        
        // テキストフィールドを空にする
        textField.text = ""

    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 列番号を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        // 表示するItemクラスを取得
        let item = items[indexPath.row]
        // セルのラベルに、Itemクラスのタイトルを設定
        cell.textLabel?.text = item.title
        
        return cell
    
    }
    
    
    
    
}
