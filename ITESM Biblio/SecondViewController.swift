//
//  SecondViewController.swift
//  ITESM Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/13/16.
//  Copyright © 2016 Luis Alfonso Arriaga Quezada. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var UIWebViewShowcaseVideo: UIWebView!
    
    @IBOutlet weak var UIWebViewADayInBiblio: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let URLShowcaseVideo = "<iframe width=\"282\" height=\"182\" src=\"https://www.youtube.com/embed/RErcCHe4iAI?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let URLADayInBiblio = "<iframe width=\"282\" height=\"182\" src=\"https://www.youtube.com/embed/usi0VJ6MhSs?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        
        UIWebViewShowcaseVideo.loadHTMLString(URLShowcaseVideo, baseURL: nil)
        
        UIWebViewADayInBiblio.loadHTMLString(URLADayInBiblio, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

