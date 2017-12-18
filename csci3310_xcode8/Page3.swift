//
//  Page3.swift
//  csci3310_xcode8
//
//  Created by CHENG Wai Yi on 14/12/2017.
//  Copyright © 2017 group9. All rights reserved.
//

import UIKit
import CoreData


var difficultyList = [[String: String]]()


class Page3: UIViewController {

    @IBOutlet weak var exit: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var player1_level: UISegmentedControl!
    @IBOutlet weak var player2_level: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDifficulty()
        print(difficultyList.count)
        print(difficultyList[0])
        let difficulty = difficultyList[0]
        
        // Pre-load player 1 Level
        if difficulty["difficulty1"] == "Easy" {
            player1_level.selectedSegmentIndex = 0
        }else if difficulty["difficulty1"] == "Normal"{
            player1_level.selectedSegmentIndex = 1
        }else if difficulty["difficulty1"] == "Master"{
            player1_level.selectedSegmentIndex = 2
        }
        
        // Pre-load player 2 Level
        if difficulty["difficulty2"] == "Easy" {
            player2_level.selectedSegmentIndex = 0
        }else if difficulty["difficulty2"] == "Normal"{
            player2_level.selectedSegmentIndex = 1
        }else if difficulty["difficulty2"] == "Master"{
            player2_level.selectedSegmentIndex = 2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func button_action(_ sender: UIButton){
        let response = sender.titleLabel!.text!
        if(response == "Reset"){
            player1_level.selectedSegmentIndex = 1
            player2_level.selectedSegmentIndex = 1
        }else if(response == "Save"){
            deletHistory()
            change_difficulty()
        }
    }
    
    func change_difficulty() {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Difficulty", in: managedContext)!
        
        let insDiff = Difficulty(entity: entity, insertInto: managedContext)
        insDiff.difficulty1 = player1_level.titleForSegment(at: player1_level.selectedSegmentIndex) ;
        insDiff.difficulty2 = player2_level.titleForSegment(at: player2_level.selectedSegmentIndex) ;
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func loadDifficulty() {
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let fetchRequest = NSFetchRequest<Difficulty>(entityName: "Difficulty")
        var fetchResult = [Difficulty]()
        do {
            fetchResult = try managedContext.fetch(fetchRequest).reversed()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        difficultyList.removeAll()
        
        for difficulty in fetchResult {
            if let difficulty1 = difficulty.difficulty1, let difficulty2 = difficulty.difficulty2 {
                difficultyList.append(["difficulty1": difficulty1, "difficulty2": difficulty2])
            }
        }
        
        difficultyList.append(["difficulty1" : "Normal", "difficulty2" : "Normal"])
        
    }
    func deletHistory(){
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Difficulty")
        do{
            var request = try managedContext.fetch(fetch)as![Difficulty]
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
