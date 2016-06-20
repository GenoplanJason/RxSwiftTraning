//
//  tableViewController.swift
//  RxSiwft
//
//  Created by Jason on 2016. 6. 15..
//  Copyright © 2016년 genoplan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class tableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var items = Observable.just(["FirstItem", "SecondItem", "ThridItem"])
        
        items
            .bindTo(tableView.rx_itemsWithCellIdentifier("Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @ row \(row)"
            }
            .addDisposableTo(disposeBag)
        
        
    }
    
    
    
}
