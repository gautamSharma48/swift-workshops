//
//  ViewController.swift
//  photo_app_w407
//
//  Created by Gautam Sharma on 20/06/23.
//

import UIKit


struct Photo : Decodable{
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

class ViewController: UIViewController , UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var photos: [Photo] = []
    var api = Api();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self;
        api.vc = self;
        api.fetchDataAF()
    }
    
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataRow = photos[indexPath.item]
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell();
        }
        
        if let url = URL(string: dataRow.url){
            cell.myImageView.loadImageSd(url: url);
        }
        return cell
    }
    
}

