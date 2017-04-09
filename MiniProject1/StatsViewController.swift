//
//  StatsViewController.swift
//  MiniProject1
//
//  Created by Shireen Warrier on 2/9/17.
//  Copyright © 2017 Shireen And Daniel. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var longestStreakLabel: UILabel!
    var recentLabel: UILabel!
    var nameLabel1: UILabel!
    var nameLabel2: UILabel!
    var nameLabel3: UILabel!
    var boolImage1: UIImageView!
    var boolImage2: UIImageView!
    var boolImage3: UIImageView!
    var longestStreakNum: UILabel!
    var statsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        let defaults = UserDefaults.standard
        
        view.backgroundColor = Constants.statsBackgroundColor
        
        statsLabel = UILabel(frame: CGRect(x: 0, y: (navigationController?.navigationBar.frame.maxY)! + 20, width: view.frame.width, height: 40))
        statsLabel.font = UIFont(name: "Arial", size: 35)
        statsLabel.textAlignment = .center
        statsLabel.text = "Statistics"
        statsLabel.textColor = UIColor.white
        statsLabel.backgroundColor = Constants.statsBackgroundColor
        
        longestStreakNum = UILabel(frame: CGRect(x: 0, y: statsLabel.frame.maxY + 30, width: view.frame.width, height: 70))
        longestStreakNum.textAlignment = .center
        longestStreakNum.font = UIFont(name: "Arial", size: 60)
        longestStreakNum.text = String(defaults.integer(forKey: ViewController.defaultsKeys.longestStreak))
        longestStreakNum.textColor = UIColor(red: 217/255, green: 153/255, blue: 153/255, alpha: 1.0)
        longestStreakNum.backgroundColor = Constants.statsBackgroundColor
        longestStreakNum.adjustsFontSizeToFitWidth = true
        
        longestStreakLabel = UILabel(frame: CGRect(x: 0, y: longestStreakNum.frame.maxY, width: view.frame.width, height: 18))
        longestStreakLabel.font = UIFont(name: "Arial", size: 16)
        longestStreakLabel.textAlignment = .center
        longestStreakLabel.text = "Longest Streak"
        longestStreakLabel.textColor = UIColor.white
        longestStreakLabel.backgroundColor = Constants.statsBackgroundColor
        
        recentLabel = UILabel(frame: CGRect(x: view.frame.width/6, y: view.frame.height/2, width: view.frame.width * (2/3), height: 40))
        recentLabel.font = UIFont(name: "Arial", size: 25)
        recentLabel.textAlignment = .center
        recentLabel.text = "Recent Results"
        recentLabel.layer.borderWidth = 3.0
        recentLabel.layer.borderColor = UIColor(red: 217/255, green: 153/255, blue: 153/255, alpha: 1.0).cgColor
        recentLabel.textColor = UIColor.white
        recentLabel.backgroundColor = Constants.statsBackgroundColor
        
        nameLabel1 = UILabel(frame: CGRect(x: 0, y: recentLabel.frame.maxY + 30, width: view.frame.width * (2/3), height: 30))
        nameLabel1.font = UIFont(name: "Arial", size: 25)
        nameLabel1.textAlignment = .center
        nameLabel1.adjustsFontSizeToFitWidth = true
        nameLabel1.text = defaults.string(forKey: ViewController.defaultsKeys.name1)
        nameLabel1.textColor = UIColor.white
        nameLabel1.backgroundColor = Constants.statsBackgroundColor
        
        boolImage1 = UIImageView(frame: CGRect(x: nameLabel1.frame.maxX, y: recentLabel.frame.maxY + 30, width: 45, height: 45))
        if defaults.bool(forKey: ViewController.defaultsKeys.bool1) {
            boolImage1.image = UIImage(named: "correct")
        } else {
            boolImage1.image = UIImage(named: "incorrect")
        }
        
        nameLabel2 = UILabel(frame: CGRect(x: 0, y: nameLabel1.frame.maxY + 20, width: view.frame.width * (2/3), height: 30))
        nameLabel2.font = UIFont(name: "Arial", size: 25)
        nameLabel2.textAlignment = .center
        nameLabel2.adjustsFontSizeToFitWidth = true
        nameLabel2.text = defaults.string(forKey: ViewController.defaultsKeys.name2)
        nameLabel2.textColor = UIColor.white
        nameLabel2.backgroundColor = Constants.statsBackgroundColor
        
        boolImage2 = UIImageView(frame: CGRect(x: nameLabel2.frame.maxX, y: nameLabel1.frame.maxY + 20, width: 45, height: 45))
        if defaults.bool(forKey: ViewController.defaultsKeys.bool2) {
            boolImage2.image = UIImage(named: "correct")
        } else {
            boolImage2.image = UIImage(named: "incorrect")
        }
        
        nameLabel3 = UILabel(frame: CGRect(x: 0, y: nameLabel2.frame.maxY + 20, width: view.frame.width * (2/3), height: 30))
        nameLabel3.font = UIFont(name: "Arial", size: 25)
        nameLabel3.textAlignment = .center
        nameLabel3.adjustsFontSizeToFitWidth = true
        nameLabel3.text = defaults.string(forKey: ViewController.defaultsKeys.name3)
        nameLabel3.textColor = UIColor.white
        nameLabel3.backgroundColor = Constants.statsBackgroundColor
        
        boolImage3 = UIImageView(frame: CGRect(x: nameLabel3.frame.maxX, y: nameLabel2.frame.maxY + 20, width: 45, height: 45))
        if defaults.bool(forKey: ViewController.defaultsKeys.bool3) {
            boolImage3.image = UIImage(named: "correct")
        } else {
            boolImage3.image = UIImage(named: "incorrect")
        }
        
        view.addSubview(longestStreakLabel)
        view.addSubview(recentLabel)
        view.addSubview(nameLabel1)
        view.addSubview(nameLabel2)
        view.addSubview(nameLabel3)
        view.addSubview(boolImage1)
        view.addSubview(boolImage2)
        view.addSubview(boolImage3)
        view.addSubview(longestStreakNum)
        view.addSubview(statsLabel)
    }

}
