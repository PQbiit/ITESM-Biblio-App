//
//  SearchTimelineViewController.swift
//  ITESM Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/13/16.
//  Copyright © 2016 Luis Alfonso Arriaga Quezada. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class SearchTimelineViewController: TWTRTimelineViewController
{
   
    @IBOutlet weak var FeedTable: UITableView!
    @IBOutlet weak var TweetFeedBar: UINavigationBar!
    
    @IBOutlet weak var BTNBack: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#Biblio", APIClient: client)
        self.showTweetActions = true
        
    }
}