//
//  EventDetailsViewController.swift
//  FirstApp
//
//  Created by Sarah on 2/12/21.
//

import UIKit

// This view controller deals with the view users see after tapping on a row in the table.
// Users should see the details that go along with the event that they tapped on.
class EventDetailsViewController: UIViewController {
    // Outlets from the storyboard file
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // An instance of Schedule so that we can use the data from the JSON
    var event: Schedule?
    
    // Function called every time the view is loaded onto the stack
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // We want to see the nav bar (including back button) - hidden in original view
        navigationController?.isNavigationBarHidden = false
        imageView.image = UIImage(named: "hackher413_2021_logo.png") //Set the image
        
        // Set the text with the data from the JSON and Schedule struct
        titleLabel.text = event?.eventName
        timeLabel.text = "\(event?.startTime ?? "Unknown Start Time") - \(event?.endTime ?? "Unknown End Time")"
        if event?.host == "" {
            hostLabel.isHidden = true
        }
        else {
            hostLabel.text = "Hosted by: \(event?.host ?? "N/A")"
        }
        descriptionLabel.text = event?.eventDescription
    }
    
}
