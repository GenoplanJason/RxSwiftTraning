//
//  SearchViewController.swift
//  RxSiwft
//
//  Created by Jason on 2016. 6. 15..
//  Copyright © 2016년 genoplan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var shownCities = [String]()
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"]
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        
    }
    
    func setup() {
        tableView.delegate = self
        searchBar.rx_text.throttle(0.5, scheduler: MainScheduler.instance).distinctUntilChanged().filter{$0.characters.count > 0}.subscribeNext{[unowned self](query) in
            self.shownCities = self.allCities.filter { $0.hasPrefix(query)}
            self.tableView.reloadData()
            }.addDisposableTo(disposeBag)
    }
    func tableview(tableView : UITableView, numberOfRowInSection section : Int)-> Int {
        return shownCities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cityPrototypeCell", forIndexPath: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }
}
