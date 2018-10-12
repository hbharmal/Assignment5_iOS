//
//  AnimalCollectionViewController.swift
//  nht278_assignment5
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

private let reuseIdentifier = "Cell"

class AnimalCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = Bundle.main.path(forResource: "GalleryItemPlist", ofType: "plist")
        let dict = NSArray(contentsOfFile: path!)
        
        var items: [GalleryItem] = []
        
        
        for i in 0..<dict!.count {
            let line = dict![i] as! NSDictionary
            let image = line.allKeys[0] as! String
            let caption = line.allValues[0] as! String
            items.append(GalleryItem(image: image, caption: caption))
        }
        
        dump(items)
        
        // UIImage(named: "green-square-Retina") <----to get an image from the assets.xcassets file with named as the image
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        
        
        return cell
    }
    
    // for section header and footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // header
        //        if let SectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
        //            SectionHeader.sectionHeaderLabel.text = "MY HEADER"
        //            return SectionHeader
        //        }
        //
        //
        //        return UICollectionReusableView()
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath)
            let headerLabel = UILabel(frame: CGRect(x: 110, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height) )
            headerLabel.font = UIFont(name: "Verdana", size: 20)
            headerLabel.text = "Pictures of Giraffes"
            headerLabel.sizeToFit()
            headerLabel.textAlignment = .center
            //            headerLabel.backgroundColor = UIColor(named: "Grey")
            headerView.addSubview(headerLabel)
            return headerView
            
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionFooter", for: indexPath)
            let footerLabel = UILabel(frame: CGRect(x: 132, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height) )
            footerLabel.font = UIFont(name: "Verdana", size: 20)
            footerLabel.text = "Super Cute :) "
            footerLabel.sizeToFit()
            footerLabel.textAlignment = .center
            //            footerLabel.backgroundColor = UIColor(named: "Grey")
            footerView.addSubview(footerLabel)
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    
    
    //        // footer
    //        if let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionFooter", for: indexPath) as? SectionFooter {
    //            sectionFooter.sectionFooterLabel.text = "MY FOOTER"
    //            return sectionFooter
    //        }
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

