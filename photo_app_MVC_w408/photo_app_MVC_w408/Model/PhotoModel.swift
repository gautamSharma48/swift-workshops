//
//  PhotoModel.swift
//  photo_app_MVC_w408
//
//  Created by Gautam Sharma on 21/06/23.
//

import Foundation


struct Photo : Decodable{
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
