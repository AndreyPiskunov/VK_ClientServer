//
//  GetGroup.swift
//  VK
//
//  Created by Andrey Piskunov on 30.07.2022.
//

import Foundation

struct GroupsResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [Group]
        
        struct Group: Decodable {
            var id: Int
            var name: String
            var screenName: String
            var photo50: String
            
            enum CodingKeys: String, CodingKey {
                case id, name
                case screenName = "screen_name"
                case photo50 = "photo_50"
            }
        }
    }
}

class GroupsList {
    
    //данные для авторизации в ВК
    func loadData(complition: @escaping ([Group]) -> Void ) {
        
        // Конфигурация по умолчанию
        let configuration = URLSessionConfiguration.default
        // собственная сессия
        let session =  URLSession(configuration: configuration)
        
        // конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.shared.userId!)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.122")
        ]
        
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
                        print("Запрос к API: \(urlConstructor.url!)")
            
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            guard let data = data else { return }
            
            do {
                let arrayGroups = try JSONDecoder().decode(GroupsResponse.self, from: data)
                var fullGroupList: [Group] = []
                for i in 0...arrayGroups.response.items.count-1 {
                    let name = ((arrayGroups.response.items[i].name))
                    let avatar = arrayGroups.response.items[i].photo50
                    fullGroupList.append(Group.init(groupName: name, groupAvatar: avatar))
                }
                complition(fullGroupList)
            } catch let error {
                print(error)
                complition([])
            }
        }
        task.resume()
    }
}
