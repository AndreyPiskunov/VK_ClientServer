//
//  GetPhoto.swift
//  VK
//
//  Created by Andrey Piskunov on 30.07.2022.
//

import Foundation

struct PhotosResponse: Decodable {
    var response: Response
    
    struct Response: Decodable {
        var count: Int
        var items: [Photo]
        
        struct Photo: Decodable {
//            var albumId: Int
//            var date: Int
//            var id: Int
//            var ownerId: Int
//            var hasTags: Bool
            var sizes: [Sizes]
//            var text: String
            
//            enum CodingKeys: String, CodingKey {
//                case albumId = "album_id"
//                case date, id
//                case ownerId = "owner_id"
//                case hasTags = "has_tags"
//                case sizes, text
//
//            }
//
            struct Sizes: Decodable {
//                var height: Int
                var url: String
//                var type: String
//                var width: Int
            }
        }
    }
}

class FriendPhoto {
    
    //данные для авторизации в ВК
    func loadData(owner_id: String, complition: @escaping ([Photo]) -> Void ) {
        
        // Конфигурация по умолчанию
        let configuration = URLSessionConfiguration.default
        // собственная сессия
        let session =  URLSession(configuration: configuration)
        
        // конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/photos.getAll"
        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: owner_id),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.122")
        ]
                
        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            //print("Запрос к API: \(urlConstructor.url!)")
            
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            guard let data = data else { return }
            
            do {
                let arrayPhotosFriend = try JSONDecoder().decode(PhotosResponse.self, from: data)
                var photosFriend: [Photo] = []
                
                for i in 0...arrayPhotosFriend.response.items.count-1 {
                    if let urlPhoto = arrayPhotosFriend.response.items[i].sizes.last?.url {
                        photosFriend.append(Photo.init(photo: urlPhoto))
                    }
                }
                complition(photosFriend)
            } catch let error {
                print(error)
                complition([])
            }
        }
        task.resume()
    }
}
