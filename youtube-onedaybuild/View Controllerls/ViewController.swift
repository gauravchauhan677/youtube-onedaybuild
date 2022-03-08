//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by GauravChauhan677 on 07/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    

    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        
        model.getVideos()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //confirm that a vidio was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get a refrence to a vidio that is tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //Get a reference to a detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedVideo
        
        
        
    }
    
    //MARK: - Model delegate methods
    func videoFetched(_ videos: [Video]) {
        
        self.videos = videos            // set the returned vidio to our vidio property
        
        tableView.reloadData()
    }
    

    
    // MARK: - TableView Methods.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
//        let title = self.videos[indexPath.row].title
//        
//        cell.textLabel?.text = title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

