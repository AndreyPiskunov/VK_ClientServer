//
//  AllGroupController.swift
//  VK
//
//  Created by User on 06.06.2022.
//

import UIKit

class AllGroupController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    func fillData() -> [Group] {
        
//        let group1 = Group(name: "Autoclub", description: "Ekaterinburg", avatar: "Ford-Mustang")
//        let group2 = Group(name: "Motoclub", description: "Moscow", avatar: "moto")
//        let group3 = Group(name: "MedClub", description: "Rostov", avatar: "medimage")
//    
        var groupsArray = [Group]()
        
//        groupsArray.append(group1)
//        groupsArray.append(group2)
//        groupsArray.append(group3)
        
        return groupsArray
    }
    
    var groups = [Group]()
    
    let customTableViewCellReuse = "customTableViewCellReuse"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = fillData()
        tableView.register (UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
}

    extension AllGroupController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as! CustomTableViewCell
        
        cell.configure(self.groups[indexPath.row])
        
        return cell
    }

    
}

    extension AllGroupController: UITableViewDelegate {
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let group = groups[indexPath.item]
        NotificationCenter.default.post(name: Notification.Name("pressToGroup"), object: group)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    return 100
    }

}
