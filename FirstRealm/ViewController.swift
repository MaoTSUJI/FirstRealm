//
//  ViewController.swift
//  FirstRealm
//
//  Created by 辻真緒 on 2019/07/30.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // テーブルに表示するデータを保持した配列
    var items:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addItem(_ sender: UIButton) {
        
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
