//
//  ViewController.swift
//  FirstApp
//
//  Created by Sarah on 2/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var events = [Schedule]() //Array of Schedule instances, which is what the JSON contains
    // Outlets from the storyboard file
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    // Function called every time the view is loaded onto the stack
    override func viewDidLoad() {
        super.viewDidLoad()
        logoView.image = UIImage(named: "hackher413_2021_logo.png") //Set logo
        self.view.backgroundColor = UIColor(red: 254/255, green: 186/255, blue: 134/255, alpha: 1) //Set background color to HackHer413 color
        
        //Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        // rowHeight and estimatedRowHeight are set so cell heights are flexible based on content
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        // Call function to get JSON data from personal GitHub Pages site
        self.loadData(urlAsString: "https://sarahmanlove.github.io/ScheduleAppTutorial/data.json")
    }
    
    // Function called every time the view comes onscreen, no matter if it's already on the stack or not
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true // Hide nav bar
        // Deselect table row if one was previously selected
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    // If the string can be a URL, then check to see if can get data from the URL.
    // If that works, then decode the JSON using an array of Schedule structs.
    // If that data can be decoded, then save it as the variable events (named at top)
    func loadData(urlAsString: String){
        if let url = URL(string: urlAsString) {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let jsonEvents = try? decoder.decode([Schedule].self, from: data) {
                    self.events = jsonEvents
                }
            }
        }
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    
    // This function is called for every row in the table, so since there is 1 section and
    // events.count number of rows in each section, this is called events.count number of times.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Initialize/register the cell so that it's structure can be used in the table.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else{
            fatalError("The dequeued cell is not an instance of EventTableViewCell")
        }
        
        // Set the text in each cell
        cell.startTimeLabel.text = events[indexPath.row].startTime
        cell.eventNameLabel.text = events[indexPath.row].eventName
        cell.eventTypeLabel.text = events[indexPath.row].eventType

        return cell
    }
    
    // Function where EventDetailsViewController is added to the navigation stack/goes to
    // the page when a user clicks on the row. 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEvent = events[indexPath.row]
        
        if let viewController = storyboard?.instantiateViewController(identifier: "eventDetails") as? EventDetailsViewController {
            viewController.event = selectedEvent
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
