//
//  ViewController.swift
//  Demo_017
//
//  Created by 鄭淳澧 on 2021/7/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var passImageViews: [UIImageView]!
    @IBOutlet var passBtns: [UIButton]!
    
    var password = "5566"
    var enterNum = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let fullScreenSize = UIScreen.main.bounds.size
//        var myBtn = UIButton(type: .system)
//        myBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
//        myBtn.setTitle("確認", for: .normal)
//        myBtn.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
//        myBtn.target(forAction: Selector(enterNum), withSender: passBtnsTapped(_:))
//        myBtn.center = CGPoint(x: fullScreenSize.width / 2, y: fullScreenSize.height / 2)
//        self.view.addSubview(myBtn)
    }
    
//    func simpleHint() {
//        let alertController = UIAlertController(title: "Caution!", message: "密碼錯誤，請按確認繼續", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "確認", style: .default) {_ in
//            print(1 + 1)
//        }
//        alertController.addAction(okAction)
//    }
    
    func checkPass() {
        if enterNum == password {
            
            let alertController = UIAlertController(title: "Welcome", message: "Jack !", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Confirm", style: .default) { _ in
                self.reset()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
//            performSegue(withIdentifier: "myFrontPage", sender: self)
            
        } else {
            let alertController = UIAlertController(title: "Caution", message: "Forget Password ?", preferredStyle: .alert)
            let notOkAction = UIAlertAction(title: "Back", style: .cancel, handler: nil)
            alertController.addAction(notOkAction)
            present(alertController, animated: true, completion: reset)
        }
    }
    
    func reset() {
        for i in passImageViews {
            i.isHighlighted = false
        }
        enterNum = ""
    }
    
    
    func changeImage() {
        switch enterNum.count {
        case 1:
            for i in 0...3 {passImageViews[i].isHighlighted = false}
            for i in 0...0 {passImageViews[i].isHighlighted = true}
        case 2:
            for i in 0...3 {passImageViews[i].isHighlighted = false}
            for i in 0...1 {passImageViews[i].isHighlighted = true}
        case 3:
            for i in 0...3 {passImageViews[i].isHighlighted = false}
            for i in 0...2 {passImageViews[i].isHighlighted = true}
        case 4:
            for i in 0...3 {passImageViews[i].isHighlighted = false}
            for i in 0...3 {passImageViews[i].isHighlighted = true}
            checkPass()
        default:
            for i in 0...3 {passImageViews[i].isHighlighted = false}
        }
    }
    
    
    @IBAction func passBtnsTapped(_ sender: UIButton) {
        if enterNum.count != 4 {
            enterNum += sender.currentTitle!
        }
//        else {
//            if enterNum == password {
//                print("correct!")
//            } else {
//                print("wrong answer")
//            }
//            checkPass()
//        }
        changeImage()
        print(enterNum)
    }
    
    

    @IBAction func deleteBtnTapped(_ sender: Any) {
        if enterNum.count != 0 {
            enterNum.removeLast()
        }
        changeImage()
        print(enterNum)
    }
    
}

