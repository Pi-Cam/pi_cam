//
//  Streamer.swift
//  pi_cam
//
//  Created by Marquavious on 12/13/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import Foundation

class BaseStreamer {
    var streamer: StreamingService?
    enum StreamingService {
        case Youtube
    }
}
