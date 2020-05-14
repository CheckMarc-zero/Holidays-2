//
//  ViewController.swift
//  Holidays
//
//  Created by Андрей Сигида on 06/05/2020.
//  Copyright © 2020 Андрей Сигида. All rights reserved.
//

import UIKit

class HolidayTableViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }


}
extension HolidayTableViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
