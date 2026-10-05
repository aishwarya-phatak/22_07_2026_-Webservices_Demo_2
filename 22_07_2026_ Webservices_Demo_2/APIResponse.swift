//
//  APIResponse.swift
//  22_07_2026_ Webservices_Demo_2
//
//  Created by Vishal Jagtap on 05/10/26.
//

import Foundation

struct APIResponse{
    var comments : [Comment]
    var total : Int
    var skip : Int
    var limit : Int
}
