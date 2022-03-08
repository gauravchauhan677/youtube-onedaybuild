//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by GauravChauhan677 on 08/03/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else {
            return
        }
        
        //create the embed URL
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
       // Load it into the webView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //set up title
        titleLabel.text = video!.title
        
        //set up date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d,yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //set up the description
        textView.text = video!.description
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
