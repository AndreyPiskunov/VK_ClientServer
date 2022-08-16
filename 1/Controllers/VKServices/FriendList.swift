//
//  GetVKRequests.swift
//  VK
//
//  Created by Andrey Piskunov on 18.07.2022.
//

import Foundation
import UIKit


struct FriendsResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [User]
        
        struct User: Decodable {
            var id: Int
            var firstName: String
            var lastName: String
            var photo50: String
            
            enum CodingKeys: String, CodingKey {
                case id
                case firstName = "first_name"
                case lastName = "last_name"
                case photo50 = "photo_50"
            }
        }
    }
}
    
class FriendList {
    
    //данные для авторизации в ВК
    func loadData(complition: @escaping ([Friend]) -> Void ) {
        
        // Конфигурация по умолчанию
        let configuration = URLSessionConfiguration.default
        // собственная сессия
        let session =  URLSession(configuration: configuration)
        
        // конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.shared.userId!)),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.122")
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            //            print("Запрос к API: \(urlConstructor.url!)")
            
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            guard let data = data else { return }
            
            do {
                let arrayFriends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                var friendList: [Friend] = []
                for i in 0...arrayFriends.response.items.count-1 {
                    let name = ((arrayFriends.response.items[i].firstName) + " " + (arrayFriends.response.items[i].lastName))
                    let avatar = arrayFriends.response.items[i].photo50
                    let id = String(arrayFriends.response.items[i].id)
                    friendList.append(Friend.init(userName: name, userAvatar: avatar))
                }
                complition(friendList)
            } catch let error {
                print(error)
                complition([])
            }
        }
        task.resume()
    }
}


