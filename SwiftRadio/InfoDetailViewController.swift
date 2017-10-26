//
//  InfoDetailViewController.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/9/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit

class InfoDetailViewController: UIViewController {
    
    @IBOutlet weak var stationImageView: UIImageView!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationDescLabel: UILabel!
    @IBOutlet weak var stationLongDescTextView: UITextView!
    @IBOutlet weak var okayButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    
    var currentStation: RadioStation!
    var downloadTask: URLSessionDownloadTask?
    var website: String?

    //*****************************************************************
    // MARK: - ViewDidLoad
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStationText()
        setupStationLogo()
    }

    deinit {
        // Be a good citizen.
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    //*****************************************************************
    // MARK: - UI Helpers
    //*****************************************************************
    
    func setupStationText() {
        
        // Display Station Name & Short Desc
        stationNameLabel.text = currentStation.name
        stationDescLabel.text = currentStation.desc
        website = currentStation.websiteURL
        //websiteButton.setTitle(website!.substring(from: website!.startIndex.index(offsetBy:7)), for:.normal)
        
        // Display Station Long Desc
        if currentStation.longDesc == "" {
            loadDefaultText()
        } else {
            stationLongDescTextView.text = currentStation.longDesc
        }
    }
    
    func loadDefaultText() {
        // Add your own default ext
        stationLongDescTextView.text = "You are listening to Swift Radio. This is a sweet open source project. Tell your friends, swiftly!"
    }
    
    func setupStationLogo() {
        
        // Display Station Image/Logo
        let imageURL = currentStation.imageURL
        
        if imageURL.range(of: "http") != nil {
            // Get station image from the web, iOS should cache the image
            if let url = NSURL(string: currentStation.imageURL) {
                downloadTask = stationImageView.loadImageWithURL(url: url) { _ in }
            }
            
        } else if imageURL != "" {
            // Get local station image
            stationImageView.image = UIImage(named: imageURL)
            
        } else {
            // Use default image if station image not found
            stationImageView.image = UIImage(named: "stationImage")
        }
        
        // Apply shadow to Station Image
        stationImageView.applyShadow()
    }
    
    //*****************************************************************
    // MARK: - IBActions
    //*****************************************************************
    
    @IBAction func okayButtonPressed(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func websiteButtonDidTouch(sender: UIButton) {
        if let web = website{
            if let url = NSURL(string: web) {
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
    
}
