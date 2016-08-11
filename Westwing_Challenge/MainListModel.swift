//
//  MainListModel.swift
//  Westwing_Challenge
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class MainListModel: Mappable {
    
    var badgeURL: String?
    var bannerURL: String?
    var bannerURLOriginal: String?
    var itemDescription: String?
    var endTime: String?
    var endTimeFormatted: String?
    var campaignID: String?
    var images: Image?
    var messageLine: String?
    var messageLineStyle: String?
    var name: String?
    var navigationURL: String?
    var newsLetterURLKey: String?
    var promotionLine: String?
    var remainingDaysFormatted: String?
    var startTime: String?
    var startTimeFormatted: String?
    var subline: String?
    var themeDay: String?
    var urlKey: String?
    var videos: Array<Video>?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        badgeURL <- map["badge_url"]
        bannerURL <- map["banner_url"]
        bannerURLOriginal <- map["banner_url_original"]
        itemDescription <- map["description"]
        endTime <- map["end_time"]
        endTimeFormatted <- map["end_time_formatted"]
        campaignID <- map["id_campaign"]
        images <- map["images"]
        messageLine <- map["message_line"]
        messageLineStyle <- map["message_line_style"]
        name <- map["name"]
        navigationURL <- map["navigation_url"]
        newsLetterURLKey <- map["newsletter_urlkey"]
        promotionLine <- map["promotion_line"]
        remainingDaysFormatted <- map["remaining_days_formatted"]
        startTime <- map["start_time"]
        startTimeFormatted <- map["start_time_formatted"]
        subline <- map["subline"]
        themeDay <- map["themeday"]
        urlKey <- map["url_key"]
        videos <- map["videos"]
        
    }

    
}

class Image: Mappable {
    
    var imageURL: String?
    var imageWidth: String?
    var imageHeight: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        
        imageURL <- map["url"]
        imageWidth <- map["width"]
        imageHeight <- map["height"]
        
    }
}

class Video: Mappable {
   
    var videoURL: String?
    var thumbnail: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        
        videoURL <- map["url"]
        thumbnail <- map["thumbnail"]
        
    }
}
