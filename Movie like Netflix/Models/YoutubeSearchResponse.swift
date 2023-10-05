//
//  YoutubeSearchResponse.swift
//  Movie like Netflix
//
//  Created by Luyện Hà Luyện on 02/10/2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}
struct VideoElement: Codable {
    let id: IdVideo
}
struct IdVideo: Codable {
    let kind: String
    let videoId: String
    
}
