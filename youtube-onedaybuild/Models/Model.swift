//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by GauravChauhan677 on 07/03/22.
//

import Foundation

protocol ModelDelegate {
    
    func videoFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos(){
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Create a URLSession object
        let session = URLSession.shared
        
        // Creaate a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil{
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    
                    DispatchQueue.main.async {
                        // call the "Videofetched" method of the delegate
                        self.delegate?.videoFetched(response.items!)
                    }
                    
                }
              //  dump(response)
                
                
            }
            catch {
                print(error,"error")
                
            }
            
        }
        
        // off the task
        dataTask.resume()
        
        
    }
    
}
