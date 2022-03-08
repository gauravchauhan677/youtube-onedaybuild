//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by GauravChauhan677 on 08/03/22.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String)-> Data? {
        
        return cache[url]
    }
    
}
