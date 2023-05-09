//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by 千代丸怜央 on 2023/05/09.
//

import UIKit

class MemoCollectionViewController: UIViewController , UICollectionViewDataSource{

    //MARK: コレクションビュー
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: ユーザーデフォルト
    var saveData: UserDefaults = UserDefaults.standard
    
    //MARK: タイトルのデータを格納する配列
    var titles: [String] = []

    //MARK: コンテンツのデータを格納する配列
    var contents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: データの取得
        saveData.register(defaults: [ "titles": [String](), "contents": [String]() ])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        //MARK: コレクションビューの設定
        //データソースの設定
        collectionView.dataSource = self
        //レイアウトの設定
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        
    }
    
    //MARK: - UICollectionViewDataSourceの実装
    //MARK: セルの個数を決めるメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    //MARK: セルに表示する内容を設定するメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Storyboard上で用意されたセルを読み込む
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        //セルの中身（コンテンツ）を設定できる変数を用意する
        var contentConfiguration = UIListContentConfiguration.cell()
        //タイトルを設定する
        contentConfiguration.text = titles[indexPath.item]
        //サブタイトルを設定する
        contentConfiguration.secondaryText = contents[indexPath.item]
        //セルの設定を更新する
        cell.contentConfiguration = contentConfiguration
        //セルの設定を完了する
        return cell
    }
    

   

}
