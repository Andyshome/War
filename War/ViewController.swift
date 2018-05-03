//
//  ViewController.swift
//  War
//
//  Created by Qiu Ziang on 2018/3/21.
//  Copyright © 2018年 skylove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flag = 0
    //determine the flag
    var game_list : [Int] = []
    //determine the list
    func clear_war_image () {
        War_top_image1.image = UIImage(named:"0")
        // change image to nothing, hide it
        War_top_image2.image = UIImage(named:"0")
        // change image to nothing, hide it
        War_top_image3.image = UIImage(named:"0")
        // change image to nothing, hide it
        War_end_image1.image = UIImage(named:"0")
        // change image to nothing, hide it
        War_end_image2.image = UIImage(named:"0")
        // change image to nothing, hide it
        War_end_image3.image = UIImage(named:"0")
        // change image to nothing, hide it
        
    }
    
    func change_number(card:Int) -> Int {
        // determine the change number function
        var change_data = 0
        // determine the data first
        if card % 13 != 0 {
            // make sure the king card not equal 0
             change_data = card % 13
            //get the real value of the card
        } else {
            change_data = 13
            // let the king card value equal to 13
        }
        return change_data
        //return the value back
    }
    
    
    
    func boot_list() -> [Int]{
        // clean the list and give a new gaming list
        var data:[Int] = []
        // make a new list first
        for a in 1...52 {
            // do 52 times
            data.append(a)
            //put elements in this list
        }
        return data
        // return the list
    }
    func shuffleArray(arr:[Int]) -> [Int] {
        var data:[Int] = arr
        // give the value to a new arr
        for i in 1..<arr.count {
            // change every position in the list
            let index:Int = Int(arc4random()) % i
            // change every position in the list
            if index != i {
                // change every position in the list
                data.swapAt(i, index)
                // change every position in the list
            }
        }
        return data
    }
    @IBOutlet weak var Top_image: UIImageView!
    @IBOutlet weak var End_image: UIImageView!
    @IBOutlet weak var change_image_button: UIButton!
    @IBOutlet weak var New_game_button: UIButton!
    @IBOutlet weak var Cpu_text: UITextField!
    @IBOutlet weak var Player_text: UITextField!
    @IBOutlet weak var War_top_image1: UIImageView!
    @IBOutlet weak var War_top_image2: UIImageView!
    @IBOutlet weak var War_top_image3: UIImageView!
    @IBOutlet weak var War_end_image1: UIImageView!
    @IBOutlet weak var War_end_image2: UIImageView!
    @IBOutlet weak var War_end_image3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func change_image(_ sender: Any) {
        New_game_button.alpha = 0.4
        // make it looks like could not use
        let top_image_x = Top_image.frame.origin.x
        let top_image_y = Top_image.frame.origin.y
        let end_image_x = End_image.frame.origin.x
        let end_image_y = End_image.frame.origin.y
        
        
        clear_war_image()
        // each pick start clean the war space even it is clear
        if flag == 0 {
            // when we start game we should figure out the list.
            game_list = boot_list()
            // boot the game list
            game_list = shuffleArray(arr: game_list)
            //shuffle the gae list
            New_game_button.isUserInteractionEnabled = false
            //make sure the new game button could not be used during the game.
        }
        flag += 1
        // each game flag plus1
        var top_value = game_list.popLast()
        // from list get the last value
        var end_value = game_list.popLast()
        // from list get the last value
        //print(top_value!) test part
        //print(end_value!) test part
        End_image.image = UIImage(named:String(end_value!))
        // set the end image which name is the string of the value
        Top_image.image = UIImage(named:String(top_value!))
        // set the top image which name is the string of the value
        Top_image.frame = CGRect(x: 700, y: top_image_y, width: 0, height:
        0)
        //hide image
        End_image.frame = CGRect(x: 700, y: top_image_y, width: 0, height:
            0)
        UIView.animate(withDuration: 1.0) {
            self.Top_image.frame = CGRect(x:top_image_x,y:top_image_y,width:160,height:249)
            //animate
            self.End_image.frame = CGRect(x:end_image_x,y:end_image_y,width:160,height:249)
        }
        let time: TimeInterval = 1.2
        //set delay
        change_image_button.alpha = 0.4
        //gray it
        change_image_button.isUserInteractionEnabled = false
        // could not be used
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            self.change_image_button.isUserInteractionEnabled = true
            // 1.2s after it could be used
            self.change_image_button.alpha = 1.0
            // same
        }
        
        top_value = change_number(card: top_value!)
        // change the value to it actual value
        end_value = change_number(card: end_value!)
        //change the value to it actual value
        //print(top_value!) test part
        //print(end_value!) test part
        if (top_value!) > (end_value!) {
            // if statement to find who wins
            Player_text.text = String(Int(Player_text.text!)!+2)
            // give 2 points to winner
        } else if top_value! < end_value!{
            // same
            Cpu_text.text = String(Int(Cpu_text.text!)!+2)
            // give two points to winner
        } else {
            // enter war game
            var top_total_score = 0
            // give top score equal 0
            var end_total_score = 0
            // give end score equal 0
            let length = game_list.count
            // find out how many elements still in the list
            if length >= 6 {
                var war_top_value1 = game_list.popLast()
                // give value from the list
                var war_top_value2 = game_list.popLast()
                // give value from the list
                var war_top_value3 = game_list.popLast()
                // give value from the list
                var war_end_value1 = game_list.popLast()
                // give value from the list
                var war_end_value2 = game_list.popLast()
                // give value from the list
                var war_end_value3 = game_list.popLast()
                // give value from the lisy
                War_top_image1.image = UIImage(named:String(war_top_value1!))
                //set image
                War_top_image2.image = UIImage(named:String(war_top_value2!))
                //set image
                War_top_image3.image = UIImage(named:String(war_top_value3!))
                //set image
                War_end_image1.image = UIImage(named:String(war_end_value1!))
                //set image
                War_end_image2.image = UIImage(named:String(war_end_value2!))
                //set image
                War_end_image3.image = UIImage(named:String(war_end_value3!))
                //set image
                War_top_image1.alpha = 0
                // disapear it
                War_top_image2.alpha = 0
                // disapear it
                War_top_image3.alpha = 0
                // disapear it
                War_end_image1.alpha = 0
                // disapear it
                War_end_image2.alpha = 0
                // disapear it
                War_end_image3.alpha = 0
                // disapear it
                UIView.animate(withDuration: 1.0) {
                    self.War_top_image1.alpha = 1
                    //animate to appear
                    self.War_top_image2.alpha = 1
                    //animate to appear
                    self.War_top_image3.alpha = 1
                    //animate to appear
                    self.War_end_image1.alpha = 1
                    //animate to appear
                    self.War_end_image2.alpha = 1
                    //animate to appear
                    self.War_end_image3.alpha = 1
                    //animate to appear
                }
                
                war_end_value1 = change_number(card: war_end_value1!)
                //find out the actuall value of each card
                war_end_value2 = change_number(card: war_end_value2!)
                //find out the actuall value of each card
                war_end_value3 = change_number(card: war_end_value3!)
                //find out the actuall value of each card
                war_top_value1 = change_number(card: war_top_value1!)
                //find out the actuall value of each card
                war_top_value2 = change_number(card: war_top_value2!)
                //find out the actuall value of each card
                war_top_value3 = change_number(card: war_top_value3!)
                //find out the actuall value of each card
                top_total_score = war_top_value1! + war_top_value2! + war_top_value3!
                //get the total value of these cards
                end_total_score = war_end_value1! + war_end_value2! + war_end_value3!
                //get the total value of these cards
                if top_total_score > end_total_score {
                    // find out the winner
                    Player_text.text = String(Int(Player_text.text!)!+2)
                    // give 2 score to the winner
                } else if end_total_score > top_total_score {
                    // same
                    Cpu_text.text = String(Int(Cpu_text.text!)!+2)
                } else {
                    Player_text.text = String(Int(Player_text.text!)!+1)
                    Cpu_text.text = String(Int(Cpu_text.text!)!+1)
                }
                flag += 3
            } else if length == 4 {
                var war_top_value1 = game_list.popLast()
                // get value
                var war_top_value2 = game_list.popLast()
                 // give value from the list
                var war_end_value1 = game_list.popLast()
                 // give value from the list
                var war_end_value2 = game_list.popLast()
                 // give value from the list
                War_top_image1.image = UIImage(named:String(war_top_value1!))
                //set image
                War_top_image2.image = UIImage(named:String(war_top_value2!))
                //set image
                War_end_image1.image = UIImage(named:String(war_end_value1!))
                //set image
                War_end_image2.image = UIImage(named:String(war_end_value2!))
                //set image

                
                War_top_image1.alpha = 0
                //disappear
                War_top_image2.alpha = 0
                //disappear
                War_end_image1.alpha = 0
                //disappear
                War_end_image2.alpha = 0
                //disappear
            
                
                UIView.animate(withDuration: 1.0) {
                    self.War_top_image1.alpha = 1
                    //animate to appear
                    self.War_top_image2.alpha = 1
                    //animate to appear
                    self.War_end_image1.alpha = 1
                    //animate to appear
                    self.War_end_image2.alpha = 1
                    //animate to appear
                }
                
                
                
                
                war_top_value1 = change_number(card: war_top_value1!)
                //change to acutual value
                war_top_value2 = change_number(card: war_top_value2!)
                //change to acutual value
                war_end_value1 = change_number(card: war_end_value1!)
                //change to acutual value
                war_end_value2 = change_number(card: war_end_value2!)
                //change to acutual value
                top_total_score = war_top_value1! + war_top_value2!
                //get the total score
                end_total_score = war_end_value1! + war_end_value2!
                //get the total score
                if top_total_score > end_total_score {
                    Player_text.text = String(Int(Player_text.text!)!+2)
                    //player get 2 points
                } else if end_total_score > top_total_score {
                    Cpu_text.text = String(Int(Cpu_text.text!)!+2)
                    //cpu get 2 points
                } else {
                    Player_text.text = String(Int(Player_text.text!)!+1)
                    //tie
                    Cpu_text.text = String(Int(Cpu_text.text!)!+1)
                    //tie
                }
                flag += 2
            } else if length == 2 {
                var war_top_value1 = game_list.popLast()
                //get value
                var war_end_value1 = game_list.popLast()
                //get value
                War_top_image1.image = UIImage(named:String(war_top_value1!))
                //set image
                War_end_image1.image = UIImage(named:String(war_end_value1!))
                //set image
                
                War_top_image1.alpha = 0
                // disappear it
                War_end_image1.alpha = 0
                //disappear it
                
               
                UIView.animate(withDuration: 1.0) {
                    self.War_top_image1.alpha = 1
                    // animate to appear
                    self.War_end_image1.alpha = 1
                    // animate to appear
                }
                    

              
                
                
                war_top_value1 = change_number(card: war_top_value1!)
                // get the actual value
                war_end_value1 = change_number(card: war_end_value1!)
                // get the actual value
                top_total_score = war_top_value1!
                //total score
                end_total_score = war_end_value1!
                //total score
                if top_total_score > end_total_score {
                    Player_text.text = String(Int(Player_text.text!)!+2)
                    // player get 2 points
                } else if end_total_score > top_total_score {
                    Cpu_text.text = String(Int(Cpu_text.text!)!+2)
                    // cpu get 2 points
                } else {
                    Player_text.text = String(Int(Player_text.text!)!+1)
                    //tie
                    Cpu_text.text = String(Int(Cpu_text.text!)!+1)
                    //tie
                }
                flag += 1
                //flag plus 1
            } else {
                Player_text.text = String(Int(Player_text.text!)!+1)
                //tie
                Cpu_text.text = String(Int(Cpu_text.text!)!+1)
                //tie
            }
            }
        if flag >= 26 {
            change_image_button.isUserInteractionEnabled = false
            //set the button could not to be used
            New_game_button.isUserInteractionEnabled = true
            // set the new game button could be used
            var win_name:String!
            //set var to the alarm text
            if Int(Cpu_text.text!)! > Int(Player_text.text!)! {
                win_name = "Cpu wins!"
                // set cpu win
            } else if Int(Player_text.text!)! > Int(Cpu_text.text!)! {
                win_name = "Player wins!"
                // set the player win
            } else {
                win_name = "Tie!"
                // set tie
            }
            let alert = UIAlertController(title:"Finish",message:win_name,preferredStyle: .alert)
            // give a text alarm
            let action = UIAlertAction(title:"Try again!",style: .default,handler: nil)
            // give a text alarm
            alert.addAction(action)
            // give a text alarm
            let time: TimeInterval = 1.2
            //set the time delay or the button will be used after
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.present(alert, animated: true, completion: nil)
                self.change_image_button.isUserInteractionEnabled = false
                //set the change button could not to be used
                self.change_image_button.alpha = 0.4
                // change the colour
            }
            New_game_button.alpha = 1
            //change the colour of the new game botton 
        }
    }
    
    @IBAction func New_game(_ sender: Any) {
        flag = 0
        Player_text.text = "0"
        //reset the player text box
        Cpu_text.text = "0"
        //reset the cpu text box 
        change_image_button.isUserInteractionEnabled = true
        //set the change image button could be used
        clear_war_image()
        // clean the image of war
        Top_image.image = UIImage(named:"53")
        // reset the top image
        End_image.image = UIImage(named:"54")
        // reset the end image
        change_image_button.alpha = 1
        // change the colour of the button
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

