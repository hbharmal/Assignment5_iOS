//
//  AnimalCollectionViewController.swift
//  hab889_assignment5
//
//  Created by Hussain Bharmal on 10/10/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class GalleryItem {
    
    var image: String
    var caption: String
    
    init(image: String, caption: String) {
        self.image = image
        self.caption = caption
    }
    
}

var items: [GalleryItem] = []

private let reuseIdentifier = "Cell"

class AnimalCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = Bundle.main.path(forResource: "GalleryItemPlist", ofType: "plist")
        let dict = NSArray(contentsOfFile: path!)
        
        for i in 0..<dict!.count {
            let line = dict![i] as! NSDictionary
            let image = line.allKeys[0] as! String
            let caption = line.allValues[0] as! String
            items.append(GalleryItem(image: image, caption: caption))
        }
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        navigationItem.backBarButtonItem?.title = "Animals"
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as! AnimalCollectionViewCell
        
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    // for section header and footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            case UICollectionElementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath)
                let headerLabel = UILabel(frame: CGRect(x: 110, y: 15, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height) )
                headerLabel.font = UIFont(name: "Verdana", size: 20)
                headerLabel.text = "Pictures of Giraffes"
                headerLabel.sizeToFit()
                headerLabel.textAlignment = .center
                headerView.addSubview(headerLabel)
                return headerView
            
            case UICollectionElementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionFooter", for: indexPath)
                let footerLabel = UILabel(frame: CGRect(x: 132, y: 15, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height) )
                footerLabel.font = UIFont(name: "Verdana", size: 20)
                footerLabel.text = "Super Cute :)"
                footerLabel.sizeToFit()
                footerLabel.textAlignment = .center
                footerView.addSubview(footerLabel)
                return footerView
            
            default:
                assert(false, "Unexpected element kind")
        }
        
    }
    
}

