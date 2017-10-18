//
//  MyCollView + Search.swift
//  final
//
//  Created by Mark Hoath on 19/10/17.
//  Copyright © 2017 Mark Hoath. All rights reserved.
//

import UIKit

extension MyCollectionViewController : UISearchBarDelegate {


    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true;
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false;
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false;
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false;
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered.removeAll(keepingCapacity: false)
        let searchPredicate = searchBar.text!
        filtered = array.filter( {$0.name.range(of: searchPredicate) != nil})
        filtered.sort {$0.name < $1.name}
        isSearching = (filtered.count == 0) ? false: true
        collectionView?.reloadData()
    }

}
