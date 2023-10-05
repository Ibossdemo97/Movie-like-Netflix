//
//  Movie.swift
//  Movie like Netflix
//
//  Created by Luyện Hà Luyện on 21/09/2023.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}
struct Title: Codable {
    let adult: Bool
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int
    let media_type: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double?
    let vote_count: Int?
}
