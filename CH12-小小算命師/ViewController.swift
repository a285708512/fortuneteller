//
//  ViewController.swift
//  CH12-小小算命師
//
//  Created by Kai on 2022/1/18.
//

import UIKit
import GameKit
import AudioToolbox
class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    //要把狀態列隱藏起來,意思是指你希不希望把狀態隱藏起來呢,是！
    
    @IBOutlet weak var yourFortune: UIImageView!
    //此為Main內的1大吉圖片連結
    
    @IBAction func tellMeSomething(_ sender: UIButton) {
        //此為Main內的Button,選Action

        showAnswer()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake{
            showAnswer()
        }
        //此為搖晃手機就會有答案
    }
    //按下按鈕後會執行func showAnswer的程式碼
    func showAnswer(){
        if yourFortune.isHidden == true{
            //顯示我的命運圖片
            //取1~6的亂數
            let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 6) + 1
            //換圖片(1~6)
            yourFortune.image = UIImage(named:"\(answer)")
            //這樣為如果取一個answer 1~6的亂數會得到相對應的圖片,但照片還是隱藏的狀態所以要再寫下面一個程式碼
            yourFortune.isHidden = false
            //不要在隱藏圖片了
            
            AudioServicesPlaySystemSound(1000)
             
        }else{
        //else這邊是指如果不是隱藏代表已經算過命,就要隱藏圖片
            yourFortune.isHidden = true
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

