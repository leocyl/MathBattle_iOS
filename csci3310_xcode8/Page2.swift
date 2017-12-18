//
//  Page2.swift
//  csci3310_xcode8
//
//  Created by Yu Yu on 20/11/2017.
//  Copyright © 2017 group9. All rights reserved.
//

import UIKit
import CoreData


class Page2: UIViewController {
    @IBOutlet weak var player1_0: UIButton!
    @IBOutlet weak var player1_1: UIButton!
    @IBOutlet weak var player1_2: UIButton!
    @IBOutlet weak var player1_3: UIButton!
    @IBOutlet weak var player1_4: UIButton!
    @IBOutlet weak var player1_5: UIButton!
    @IBOutlet weak var player1_6: UIButton!
    @IBOutlet weak var player1_7: UIButton!
    @IBOutlet weak var player1_8: UIButton!
    @IBOutlet weak var player1_9: UIButton!
    @IBOutlet weak var player1_ptr1: UIImageView!
    @IBOutlet weak var player1_ptr2: UIImageView!
    @IBOutlet weak var player1_ptr3: UIImageView!
    @IBOutlet weak var player1_ptr4: UIImageView!
    @IBOutlet weak var player1_ptr5: UIImageView!
    @IBOutlet weak var player1_ptr6: UIImageView!
    @IBOutlet weak var player1_ptr7: UIImageView!
    @IBOutlet weak var player1_ptr8: UIImageView!
    @IBOutlet weak var player1_ptr9: UIImageView!
    @IBOutlet weak var player1_ptr10: UIImageView!
    @IBOutlet weak var player1_question: UILabel!
    @IBOutlet weak var player1_answer: UILabel!
    @IBOutlet weak var player1_enter: UIButton!
    @IBOutlet weak var player1_showname: UILabel!
    
    
    @IBOutlet weak var player2_0: UIButton!
    @IBOutlet weak var player2_1: UIButton!
    @IBOutlet weak var player2_2: UIButton!
    @IBOutlet weak var player2_3: UIButton!
    @IBOutlet weak var player2_4: UIButton!
    @IBOutlet weak var player2_5: UIButton!
    @IBOutlet weak var player2_6: UIButton!
    @IBOutlet weak var player2_7: UIButton!
    @IBOutlet weak var player2_8: UIButton!
    @IBOutlet weak var player2_9: UIButton!
    @IBOutlet weak var player2_ptr1: UIImageView!
    @IBOutlet weak var player2_ptr2: UIImageView!
    @IBOutlet weak var player2_ptr3: UIImageView!
    @IBOutlet weak var player2_ptr4: UIImageView!
    @IBOutlet weak var player2_ptr5: UIImageView!
    @IBOutlet weak var player2_ptr6: UIImageView!
    @IBOutlet weak var player2_ptr7: UIImageView!
    @IBOutlet weak var player2_ptr8: UIImageView!
    @IBOutlet weak var player2_ptr9: UIImageView!
    @IBOutlet weak var player2_ptr10: UIImageView!
    @IBOutlet weak var player2_answer: UILabel!
    @IBOutlet weak var player2_question: UILabel!
    @IBOutlet weak var player2_enter: UIButton!
    @IBOutlet weak var player2_showname: UILabel!
    
    @IBOutlet weak var exit: UIButton!
    
    var p1answer = ""
    var p2answer = ""
    var p1name = ""
    var p2name = ""
    var p1_default_answer = 0
    var p2_default_answer = 0
    var p1score = 0
    var p2score = 0
    var winnername = ""
    var player1_calation_num = 2
    var player2_calation_num = 2
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDifficulty()
        let difficulty = difficultyList[0]
        // Pre-load player1_calation_num
        if difficulty["difficulty1"] == "Easy" {
            player1_calation_num = 1
        }else if difficulty["difficulty1"] == "Normal"{
            player1_calation_num = 2
        }else if difficulty["difficulty1"] == "Master"{
            player1_calation_num = 3
        }
        // Pre-load player2_calation_num
        if difficulty["difficulty2"] == "Easy" {
            player2_calation_num = 1
        }else if difficulty["difficulty2"] == "Normal"{
            player2_calation_num = 2
        }else if difficulty["difficulty2"] == "Master"{
            player2_calation_num = 3
        }
        
        player1_display()
        player2_display()
        game_init()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        enterName()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func player1_display(){
        player1_answer.layer.cornerRadius = 8
        player1_answer.layer.borderWidth = 2.0
    }
    
    func player2_display(){
        player2_answer.layer.cornerRadius = 8
        player2_answer.layer.borderWidth = 2.0
        player2_question.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_answer.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_enter.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_0.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_1.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_2.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_3.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_4.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_5.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_6.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_7.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_8.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_9.transform = CGAffineTransform(rotationAngle: 3.14)
        player2_showname.transform = CGAffineTransform(rotationAngle: 3.14)
    }
    
    func game_init(){
        
        player1_ptr1.image = UIImage(named: "empty")
        player1_ptr2.image = UIImage(named: "empty")
        player1_ptr3.image = UIImage(named: "empty")
        player1_ptr4.image = UIImage(named: "empty")
        player1_ptr5.image = UIImage(named: "empty")
        player1_ptr6.image = UIImage(named: "empty")
        player1_ptr7.image = UIImage(named: "empty")
        player1_ptr8.image = UIImage(named: "empty")
        player1_ptr9.image = UIImage(named: "empty")
        player1_ptr10.image = UIImage(named: "empty")
        player1_ptr10.image = UIImage(named: "empty")
        player2_ptr1.image = UIImage(named: "empty")
        player2_ptr2.image = UIImage(named: "empty")
        player2_ptr3.image = UIImage(named: "empty")
        player2_ptr4.image = UIImage(named: "empty")
        player2_ptr5.image = UIImage(named: "empty")
        player2_ptr6.image = UIImage(named: "empty")
        player2_ptr7.image = UIImage(named: "empty")
        player2_ptr8.image = UIImage(named: "empty")
        player2_ptr9.image = UIImage(named: "empty")
        player2_ptr10.image = UIImage(named: "empty")
        player2_ptr10.image = UIImage(named: "empty")
        gen_question(player: 1)
        gen_question(player: 2)
    }
    
    func check_answer(player : Int){
        if player == 1 {
            let answer = Int(p1answer)
            if answer == p1_default_answer{
                p1score = p1score+1
                player1_answer.text = ""
                switch p1score {
                case 1:
                    player1_ptr1.image = UIImage(named: "fill")
                case 2:
                    player1_ptr2.image = UIImage(named: "fill")
                case 3:
                    player1_ptr3.image = UIImage(named: "fill")
                case 4:
                    player1_ptr4.image = UIImage(named: "fill")
                case 5:
                    player1_ptr5.image = UIImage(named: "fill")
                case 6:
                    player1_ptr6.image = UIImage(named: "fill")
                case 7:
                    player1_ptr7.image = UIImage(named: "fill")
                case 8:
                    player1_ptr8.image = UIImage(named: "fill")
                case 9:
                    player1_ptr9.image = UIImage(named: "fill")
                case 10:
                    player1_ptr10.image = UIImage(named: "fill")
                    //win message
                    let alert = UIAlertController(title: "Win!", message: self.p1name+" has won the game!", preferredStyle: .alert)
                    
                    //2. Add the text field. You can configure it however you need.
                    //alert.addTextField { (textField) in
                    //    textField.text = "Some default text"
                   // }
                    
                    // 3. Grab the value from the text field, and print it when the user clicks OK.
                   // alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                     //   let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                     //   self.winnername = (textField?.text)!
                        //print(self.winnername)
                      //  self.saveRanking(winner: self.p1name, loser:self.p2name)
          //              self.performSegue(withIdentifier: "Page1", sender: nil)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                        self.saveRanking(winner: self.p1name, loser:self.p2name)
                        self.performSegue(withIdentifier: "unwindToPage1", sender: self)
                }))
                    // 4. Present the alert.
                    self.present(alert, animated: true, completion: nil)
                    
                default:
                    break
                }
                
            }
            else{
                player1_answer.text = ""
            }
            gen_question(player: 1)
        }
        else{
            let answer = Int(p2answer)
            if(answer == p2_default_answer){
                p2score = p2score+1
                player2_answer.text = ""
                switch p2score {
                case 1:
                    player2_ptr1.image = UIImage(named: "fill")
                case 2:
                    player2_ptr2.image = UIImage(named: "fill")
                case 3:
                    player2_ptr3.image = UIImage(named: "fill")
                case 4:
                    player2_ptr4.image = UIImage(named: "fill")
                case 5:
                    player2_ptr5.image = UIImage(named: "fill")
                case 6:
                    player2_ptr6.image = UIImage(named: "fill")
                case 7:
                    player2_ptr7.image = UIImage(named: "fill")
                case 8:
                    player2_ptr8.image = UIImage(named: "fill")
                case 9:
                    player2_ptr9.image = UIImage(named: "fill")
                case 10:
                    player2_ptr10.image = UIImage(named: "fill")
                //win message
                    let refreshAlert = UIAlertController(title: "Won", message: self.p2name+" has Won the game!", preferredStyle: UIAlertControllerStyle.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                        self.saveRanking(winner: self.p2name, loser:self.p1name)
                        self.performSegue(withIdentifier: "unwindToPage1", sender: self)
                    }))
                    
                    present(refreshAlert, animated: true, completion: nil)
                    
                default:
                    break
                }
            }
            else{
                player2_answer.text = ""
            }
            gen_question(player: 2)
        }
        
    }
    
    func gen_question(player: Int){
        let base_range = UInt32(100)
        var calation_num = 2
        let calation = [" + ", " - ", " x ", " ÷ "]
        var num1 = arc4random_uniform(base_range)
        var question_label: String = String(num1)
        var action = ""
        
        
        if player == 1 {
            p1_default_answer = 0
            p1_default_answer += Int(num1)
            if player1_calation_num==3 {
                calation_num = Int(arc4random_uniform(base_range)%3)+1
            }else{
                calation_num = player1_calation_num
            }
        }
        else{
            p2_default_answer = 0
            p2_default_answer += Int(num1)
            if player2_calation_num==3 {
                calation_num = Int(arc4random_uniform(base_range)%3)+1
            }else{
                calation_num = player2_calation_num
            }
        }
        
        for _ in 1...calation_num {
            num1 = arc4random_uniform(base_range)
            //    question_label += calation[Int(arc4random_uniform(base_range)%2)] + String(arc4random_uniform(base_range))
            action = calation[Int(arc4random_uniform(base_range)%2)]
            question_label += action + String(num1)
            //  print(num1)
            switch action {
            case " + ":
                if player == 1 {
                    p1_default_answer += Int(num1)
                    //  print("p1 answer is " + String(p1_default_answer))
                }
                else{
                    p2_default_answer += Int(num1)
                    //print("p2 answer is " + String(p2_default_answer))
                }
                
            case " - ":
                if player == 1 {
                    p1_default_answer -= Int(num1)
                    // print("p1 answer is " + String(p1_default_answer))
                }
                else{
                    p2_default_answer -= Int(num1)
                    // print("p2 answer is " + String(p2_default_answer))
                }
                
            default:
                print(",,,")
            }
            
            
        }
        question_label += " = ?"
        
        //print(question_label)
        if player == 1 {
            player1_question.text = question_label
            print("p1answer is " + String(p1_default_answer))
        }else{
            player2_question.text = question_label
            print("p2answer is " + String(p2_default_answer))
        }
        
        if(p1_default_answer < 0){
            gen_question(player: 1)
        }
        
        if(p2_default_answer < 0){
            
            gen_question(player: 2)
        }
        
    }
    
    @IBAction func button_action(_ sender: UIButton){
        let response = sender.titleLabel!.text!
        if response.hasPrefix("player1") {
            if(response.hasPrefix("player1_enter")){
                // do something
                check_answer(player: 1)
                p1answer = ""
            }
            else{
                p1answer = p1answer + String(response[response.index(before: response.endIndex)])
                player1_answer.text = p1answer
            }
            
        }
        else {
            if(response.hasPrefix("player2_enter")){
                // do something function check answer
                check_answer(player: 2)
                p2answer = ""
            }
            else{
                p2answer = p2answer + String(response[response.index(before: response.endIndex)])
                player2_answer.text = p2answer
            }
            
        }
      //  print(p1answer)
      //  print(response)
        
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
    
    func saveRanking(winner:String, loser:String) {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)!
        
        // 設定要新增的看板資料
        // 使用自動產生的 BoardHistory 類別
        let insRank = Entity(entity: entity, insertInto: managedContext)
        let date = Date()
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .full
        dateformatter.timeStyle = .long
        dateformatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        let dateString = dateformatter.string(from: date)
        
        
        insRank.name = "[" + dateString + "]    " + winner + " defeated " + loser
        
        
        
        // 將資料寫入資料庫
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
    

func enterName() {
    let alert = UIAlertController(title: "Welcome", message: "Players, please enter your name", preferredStyle: .alert)
    
    //2. Add the text field. You can configure it however you need.
    alert.addTextField { (textField) in
        textField.text = "P1"
    }
    alert.addTextField { (textField2) in
        textField2.text = "P2"
    }
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
        self.p1name = (textField?.text)!
        let textField2 = alert?.textFields![1] // Force unwrapping because we know it exists.
        self.p2name = (textField2?.text)!
        print(self.p1name)
        print(self.p2name)
        self.player1_showname.text = self.p1name
        self.player2_showname.text = self.p2name
    }))
    self.present(alert, animated: true, completion: nil)
}
}
