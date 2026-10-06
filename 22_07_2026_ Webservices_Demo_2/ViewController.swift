//
//  ViewController.swift
//  22_07_2026_ Webservices_Demo_2
//
//  Created by Vishal Jagtap on 05/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    var apiResponse : APIResponse?
    var comments : [Comment] = []
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        jsonParsing()
    }
    
    func jsonParsing(){
        urlRequest = URLRequest(url: Constants.url!)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!) { data, res, err in
            print("data : \(data)")
            print("response : \(res)")
            print("error : \(err)")
            
            do{
                var jsonResponse = try JSONSerialization.jsonObject(with: data!) as? [String : Any]
                print("-----------------------------")
                print(jsonResponse!)
                let commentsResponse = jsonResponse!["comments"] as? [[String : Any]]
                
                let total = jsonResponse!["total"] as? Int
                let skip = jsonResponse!["skip"] as? Int
                let limit = jsonResponse!["limit"] as? Int
                
                for eachComment in commentsResponse!{
                    let eachCommentId = eachComment["id"] as? Int
                    let eachCommentBody = eachComment["body"] as? String
                    let eachCommentPostId = eachComment["postId"] as? Int
                    let eachCommentLikes = eachComment["likes"] as? Int
                    
                    let eachCommentUser = eachComment["user"] as? [String:Any]
                    
                    let eachUserId = eachCommentUser!["id"] as? Int
                    let eachUserUsername = eachCommentUser!["username"] as? String
                    let eachUserFullName = eachCommentUser!["fullName"] as? String
                    
                    let userObject = User(id: eachUserId!,
                                          username: eachUserUsername!,
                                          fullName: eachUserFullName!)
                    
                    let commentObject = Comment(id: eachCommentId!,
                                                body: eachCommentBody!,
                                                postId: eachCommentPostId!,
                                                likes: eachCommentLikes!,
                                                user: userObject)
                    
                    self.comments.append(commentObject)
                    print("------comments array-------")
                    print(self.comments)
                }
            }catch{
                print("Error")
            }
        }
        dataTask?.resume()
    }
}
