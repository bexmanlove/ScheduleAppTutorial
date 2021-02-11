//
//  ViewController.swift
//  FirstApp
//
//  Created by Sarah on 2/9/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var events : [Schedule]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"

            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    // we're OK to parse!
                }
            }
    }


}

