//
//  Rank.swift
//  csci3310_xcode8
//
//  Created by Rocco on 15/12/2017.
//  Copyright © 2017 group9. All rights reserved.
//

import UIKit
import CoreData


var RankingList = [[String: String]]()
var CountList = [[String: Int]]()


class Rank: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var rankTableView: UITableView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankTableView.delegate = self
        rankTableView.dataSource = self
        
        // deletHistory()     //this function is to remove all the data inside the coredata
        loadRankingList()
        print(RankingList.count)
        //print(RankingList[0])
        //print(CountList.count)
        //print(CountList[0])
        // let winner = RankingList[0]
        // let times = CountList[0]
        //  print(winner["name"]!)
        //  print(times["count"]!)
        //  print(RankingList.count)
        
       
        print("rank page")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RankingList.count
        //return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = (RankingList[indexPath.row]["name"])
        return cell
    }

    @IBAction func Clear(_ sender: UIButton) {
        deletHistory()
        loadRankingList()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func loadRankingList() {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let fetchRequest = NSFetchRequest<Entity>(entityName: "Entity")
        var fetchResult = [Entity]()
        do {
            fetchResult = try managedContext.fetch(fetchRequest).reversed()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        RankingList.removeAll()
        for winner in fetchResult {
            if let winnerName = winner.name{
                print(winner.name!)
                RankingList.append(["name": winnerName])
                let count = winner.count
                print(winner.count)
                CountList.append(["count": Int(count)])
            }
        }
        self.rankTableView.reloadData()
        //RankingList.append(["name" : "123"])
        //CountList.append(["count" : 123])
    }
    
}
func deletHistory(){
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
    do{
        var request = try managedContext.fetch(fetch)as![Entity]
        for var result in request {
            managedContext.delete(result)
        }
    }catch{
        print("Error")
    }
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }

}


/*
 this will tell you how to access the names inside the core data
  the name is something like p1 defeat p2 now
  to cler the history, simply call th delethistroy function above
better implement a button for delet
 to get the names (sentence)
 just call a for loop for ranking list, for everything in the ranking list, display them one by one
 for something in rankingList
 then .... (display) thanks!!!
 */

