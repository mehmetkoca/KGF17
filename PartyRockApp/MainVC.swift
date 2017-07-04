//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Mehmet Koca on 04/07/2017.
//  Copyright © 2017 on3. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mfo = PartyRock(imageURL: "https://i1.imgiz.com/data/artist3/1482154197-mfo.jpg", videoURL: "<iframe width=\"360\" height=\"180\" src=\"https://www.youtube.com/embed/yDlwD2TJsUw?list=PL3sdnmp-jT1s12l6wo2EVW3gZDj4IFoDL\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "MFÖ - 5 Temmuz")
        let morVeOtesi = PartyRock(imageURL: "http://staticws.biletix.com/static/images/live/event/eventphotos/mor_ve_otesi_01.jpg", videoURL: "<iframe width=\"361\" height=\"180\" src=\"https://www.youtube.com/embed/VjT7CmN0O7w\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Mor ve Ötesi - 6 Temmuz")
        let teoman = PartyRock(imageURL: "https://pbs.twimg.com/profile_images/2845671228/8dfca30fb692133e7dc2eb028385a7ee_400x400.png", videoURL: "<iframe width=\"361\" height=\"180\" src=\"https://www.youtube.com/embed/Sdw7eaCSzhg?list=PLEjMpD2ZVkm7WgOpRJ6aL2JWWUyCQuMg4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Teoman - 7 Temmuz")
        let pilliBebek = PartyRock(imageURL: "https://i1.imgiz.com/data/artist3/pilli-bebek-14884557021.jpg", videoURL: "<iframe width=\"361\" height=\"180\" src=\"https://www.youtube.com/embed/Xm98K2Y6ZSA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Pilli Bebek - 8 Temmuz")
        let ceylanErtem = PartyRock(imageURL: "http://www.sanajans.com/sanatci/ceylanertem.jpg", videoURL: "<iframe width=\"361\" height=\"190\" src=\"https://www.youtube.com/embed/OYTbKrxObbM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Ceylan Ertem - 9 Temmuz")
        partyRocks.append(mfo)
        partyRocks.append(morVeOtesi)
        partyRocks.append(teoman)
        partyRocks.append(pilliBebek)
        partyRocks.append(ceylanErtem)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let  cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination  = segue.destination as? VideoVC{
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

    


}

