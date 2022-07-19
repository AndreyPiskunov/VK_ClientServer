//
//  GetVKRequests.swift
//  VK
//
//  Created by Andrey Piskunov on 18.07.2022.
//

import Foundation
import UIKit

class GetRequest: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendGetRequestFriends()
        sendGetRequestPhotos()
        sendGetRequestGroups()
        sendGetRequestGroupsSearch()
    }
    
    func sendGetRequestFriends() {
        
        var components = URLComponents(string: "https://api.vk.com/method/users.get")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = components?.url else { return  }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let stringData = String(data: data, encoding: .utf8) else { return }
            print(stringData)
        }.resume()
    }
    
    func sendGetRequestPhotos() {
        
        var components = URLComponents(string: "https://api.vk.com/method/photos.get")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = components?.url else { return  }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let stringData = String(data: data, encoding: .utf8) else { return }
            print(stringData)
        }.resume()
    }
    
    func sendGetRequestGroups() {
        
        var components = URLComponents(string: "https://api.vk.com/method/groups.get")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = components?.url else { return  }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let stringData = String(data: data, encoding: .utf8) else { return }
            print(stringData)
        }.resume()
    }
    
    func sendGetRequestGroupsSearch() {
        
        var components = URLComponents(string: "https://api.vk.com/method/groups.search")
        components?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "q", value: "Place"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = components?.url else { return  }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let stringData = String(data: data, encoding: .utf8) else { return }
            print(stringData)
        }.resume()
    }
}
