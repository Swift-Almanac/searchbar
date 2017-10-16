//
//  MyCollectionViewController.swift
//  final
//
//  Created by Mark Hoath on 16/10/17.
//  Copyright © 2017 Mark Hoath. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyCell"

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var array: [MyData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        
        let firstRecord = MyData(name: "Audrey", age: 34, gender: true)
        let secondRecord = MyData(name: "Brian", age: 27, gender: false)
        
        array.append( firstRecord)
        array.append( secondRecord)
        
        array.sort { $0.name < $1.name }
        
        navigationItem.title = "My Database"
        navigationController?.navigationBar.isTranslucent = false

        self.collectionView?.backgroundColor = .white
        
        // Register cell classes
        self.collectionView!.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDetails))
        navigationItem.rightBarButtonItem = addButton

        // Do any additional setup after loading the view.
    }
    
    @objc func addDetails() {
        
        let detailVC = MyViewController()
        detailVC.delegate = self
        detailVC.mode = .add
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func add(record: MyData) {
        
        array.append(record)
        array.sort { $0.name < $1.name }
        collectionView?.reloadData()
    }
    
    func modify(record: MyData) {
        
        let indexPath = collectionView?.indexPathsForSelectedItems
        
        array.remove(at: indexPath![0].row)
        array.append(record)
        array.sort { $0.name < $1.name }
        collectionView?.reloadData()
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = MyViewController()
        detailVC.delegate = self
        detailVC.mode = .edit
        detailVC.record = array[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        

        cell.backgroundColor = .yellow
        cell.nameLabel.text = array[indexPath.row].name
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return(CGSize(width: view.bounds.width, height: 44))
    }

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
