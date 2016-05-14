//
//  FirstViewController.swift
//  ITESM Biblio
//
//  Created by Luis Alfonso Arriaga Quezada on 5/13/16.
//  Copyright © 2016 Luis Alfonso Arriaga Quezada. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import TwitterKit

class FirstViewController: UIViewController, TWTRTweetViewDelegate {
    
    @IBOutlet weak var BTNTweet: UIButton!
    @IBOutlet weak var LBLLogOut: UILabel!
    @IBOutlet weak var BTNTweetFeed: UIButton!
    @IBOutlet weak var BTNLogInButton: UIButton!
    @IBOutlet weak var UITitterLogo: UIImageView!
    
    @IBOutlet weak var BTNLogOut: UIButton!
    var BackgroundVideo: AVPlayer?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        SetUpBackgroundVideo()
        self.BTNLogOut.hidden = true
        self.LBLLogOut.hidden = true
        self.BTNTweetFeed.hidden = true
        self.BTNTweet.hidden = true
        self.BTNLogInButton.hidden = false

    }
    
    @IBAction func BTNLogInButton(sender: AnyObject)
    {
        Twitter.sharedInstance().logInWithCompletion
            {
                (session, error) -> Void in
                if (session != nil)
                {
                    print("signed in as \(session!.userName)");
                    
                    self.BTNLogInButton.hidden = true
                    self.BTNLogOut.hidden = false
                    self.LBLLogOut.hidden = false
                    self.BTNTweet.hidden = false
                    self.BTNTweetFeed.hidden = false
                }
            }
    }
    
    @IBAction func BTNLogOut(sender: AnyObject)
    {
        let store = Twitter.sharedInstance().sessionStore
        let UserID = store.session()!.userID
        store.logOutUserID(UserID)
        self.BTNLogOut.hidden = true
        self.LBLLogOut.hidden = true
        self.BTNTweetFeed.hidden = true
        self.BTNTweet.hidden = true
        self.BTNLogInButton.hidden = false
        

        
    }
    
    @IBAction func BTNTweet(sender: AnyObject)
    {
        let composer = TWTRComposer()
        
        composer.setText("#Biblio")
        composer.setImage(UIImage(named: "fabric"))
        
        composer.showFromViewController(self) { result in
            if (result == TWTRComposerResult.Cancelled)
            {
                print("Tweet composition cancelled")
            }
            else
            {
                print("Sending tweet!")
            }
        }
 
    }
    
    @IBAction func BTNTweetFeed(sender: AnyObject)
    {
        let vc = SearchTimelineViewController()
        self.presentViewController(vc, animated: true, completion: nil)
        
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // METHOD USED TO LOAD THE INTRO VIDEO FROM THE APP BUNDLE AND USE IT IN A AVPLAYER TO REPRODUCEIT IN A AVPLAYERLAYER
    func SetUpBackgroundVideo()
    {
        let VideoURL: NSURL = NSBundle.mainBundle().URLForResource("TEC", withExtension: "mov")!
        
        BackgroundVideo = AVPlayer(URL: VideoURL)
        BackgroundVideo?.actionAtItemEnd = .None
        BackgroundVideo?.muted = true
       
        
        
        let BackgroundVideoLayer = AVPlayerLayer(player: BackgroundVideo)
        BackgroundVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        BackgroundVideoLayer.zPosition = -1
        
        BackgroundVideoLayer.frame = view.frame
        
        view.layer.insertSublayer(BackgroundVideoLayer, above: self.view.layer)
        
        BackgroundVideo?.play()
        
        //loop video
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loopVideo", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
    }
    
    func loopVideo()
    {
        BackgroundVideo?.seekToTime(kCMTimeZero)
        BackgroundVideo?.play()
    }
    
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

