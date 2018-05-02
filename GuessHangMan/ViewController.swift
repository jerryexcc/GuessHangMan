//
//  ViewController.swift
//  GuessHangMan
//
//  Created by 世明 on 2018/4/30.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var sound: AVAudioPlayer!
    @IBOutlet weak var tfWord: UITextField!
    let guessStr = "peter"
    var chance = 0, score = 0
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label_first: UILabel!
    @IBOutlet weak var label_second: UILabel!
    @IBOutlet weak var label_third: UILabel!
    @IBOutlet weak var label_fourth: UILabel!
    @IBOutlet weak var label_fifth: UILabel!
    @IBOutlet weak var label_YN: UILabel!
    @IBOutlet weak var btnPassGuess: UIButton!
    @IBOutlet weak var btnRe: UIButton!
    @IBOutlet weak var label_Guessed: UILabel!
    @IBAction func btnRestart(_ sender: Any) {
        btnRe.isHidden = true
        btnPassGuess.isHidden = false
        tfWord.text = ""
        label_YN.text = ""
        label_first.text = "_"
        label_second.text = "_"
        label_third.text = "_"
        label_fourth.text = "_"
        label_fifth.text = "_"
        imageView.image = #imageLiteral(resourceName: "none")
        label_Guessed.text = "已經猜過的字母: "
    }
    @IBAction func btnGuessAct(_ sender: Any) {
        if tfWord.text?.count == 1{
            //猜單一字母
            displayWord(word: tfWord.text!, wordLength: 1)
        }else if tfWord.text?.count == 5{
            //直接猜單字
            displayWord(word: tfWord.text!, wordLength: 5)
        }else if (tfWord.text?.count)! > 1 && (tfWord.text?.count)! <= 4{
            
        }else{
            //猜不到
        }
    }
    func displayWord(word: String, wordLength: Int){
        label_Guessed.text = "\(label_Guessed.text ?? "")\(word), "
        tfWord.text = ""
        if guessStr.contains(word){
            label_YN.text = "O"
            label_YN.textColor = UIColor.green
            switch word{
            case "p":
                score += 1
                label_first.text = "p"
            case "e":
                score += 2
                label_second.text = "e"
                label_fourth.text = "e"
            case "t":
                score += 1
                label_third.text = "t"
            case "r":
                score += 1
                label_fifth.text = "r"
            default:
                print("")
            }
            if score == 5{
                btnRe.isHidden = false
                btnPassGuess.isHidden = true
                chance = 0
                score = 0
                imageView.image = #imageLiteral(resourceName: "right")
                print("恭喜你贏了")
            }
        }else{
            print("No")
            label_YN.text = "X"
            label_YN.textColor = UIColor.red
            chance += 1
        }
        switch chance {
        case 1:
            imageView.image = #imageLiteral(resourceName: "head")
        case 2:
            imageView.image = #imageLiteral(resourceName: "body")
        case 3:
            imageView.image = #imageLiteral(resourceName: "oneArm")
        case 4:
            imageView.image = #imageLiteral(resourceName: "twoArms")
        case 5:
            imageView.image = #imageLiteral(resourceName: "oneLeg")
        case 6:
            sound.play()
            btnRe.isHidden = false
            btnPassGuess.isHidden = true
            chance = 0
            imageView.image = #imageLiteral(resourceName: "dead")
        default:
            print("Nothing")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         let url = Bundle.main.url(forResource: "然後他就死掉了", withExtension: "mp3")
        do{
            sound = try AVAudioPlayer(contentsOf: url!)
            sound.prepareToPlay()
        }catch let error{
            print("Error:\(error)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

