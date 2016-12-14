//
//  Streamer.swift
//  pi_cam
//
//  Created by Marquavious on 12/13/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import Foundation

class Stream: BaseStreamer {
    
    var streamerService: StreamingService?
    var apiKey: String!
    var link: String!
    
    init (streamerService: StreamingService, apiKey:String, link:String){
        super.init()
        self.streamerService = streamerService
        self.apiKey = apiKey
        self.link = link
    }
}
    
