//
//  ViewController.swift
//  MiniProject1
//
//  Created by Daniel Andrews on 2/9/17.
//  Copyright © 2017 Shireen And Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let members: [String] = ["Jessica Cherny", "Kevin Jiang", "Jared Gutierrez", "Kristin Ho", "Christine Munar", "Mudit Mittal", "Richard Hu", "Shaan Appel", "Edward Liu", "Wilbur Shi", "Young Lin", "Abhinav Koppu", "Abhishek Mangla", "Akkshay Khoslaa", "Andy Wang", "Aneesh Jindal", "Anisha Salunkhe", "Ashwin Vaidyanathan", "Cody Hsieh", "Justin Kim", "Krishnan Rajiyah", "Lisa Lee", "Peter Schafhalter", "Sahil Lamba", "Sirjan Kafle", "Tarun Khasnavis", "Billy Lu", "Aayush Tyagi", "Ben Goldberg", "Candice Ye", "Eliot Han", "Emaan Hariri", "Jessica Chen", "Katharine Jiang", "Kedar Thakkar", "Leon Kwak", "Mohit Katyal", "Rochelle Shen", "Sayan Paul", "Sharie Wang", "Shreya Reddy", "Shubham Goenka", "Victor Sun", "Vidya Ravikumar"];

    var scoreLabel: UILabel!
    var personImage: UIImageView!
    var statsPicture: UIButton!
    var timerLabel: UILabel!
    var option1Label: UIButton!
    var option2Label: UIButton!
    var option3Label: UIButton!
    var option4Label: UIButton!
    var stopButton: UIButton!
    var pointsLabel: UILabel!
    var secondsLabel: UILabel!
    
    var name: String = ""
    var streak: Int = 0
    var score: Int = 0
    var timeLeft: Int = 5
    var gameTimer: Timer = Timer()
    var timer: Timer = Timer()
    
    struct defaultsKeys {
        static let longestStreak = "LongestStreak"
        static let points = "Points"
        static let name1 = "Name1"
        static let name2 = "Name2"
        static let name3 = "Name3"
        static let bool1 = "Bool1"
        static let bool2 = "Bool2"
        static let bool3 = "Bool3"
        static let currentStreak = "CurrentStreak"
        static let keepScore = "KeepScore"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLayout() {
        view.backgroundColor = Constants.mainBackgroundColor
        
        scoreLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 15, y: (navigationController?.navigationBar.frame.maxY)! + 5, width: 35, height: 45))
        scoreLabel.text = "\(score)"
        scoreLabel.textAlignment = .center
        scoreLabel.adjustsFontSizeToFitWidth = true
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont(name: "Arial", size: 40)
        
        personImage = UIImageView(frame: CGRect(x: 50, y: scoreLabel.frame.maxY + 30, width: view.frame.height/2 - (navigationController?.navigationBar.frame.height)!, height: view.frame.height/2 - (navigationController?.navigationBar.frame.height)!))
        personImage.layer.cornerRadius = personImage.frame.size.width/2;
        personImage.clipsToBounds = true;
        
        statsPicture = UIButton(frame: CGRect(x: view.frame.maxX - 50, y: (navigationController?.navigationBar.frame.maxY)!, width: 50, height: 50))
        statsPicture.setImage(#imageLiteral(resourceName: "bargraph"), for: .normal)
        statsPicture.addTarget(self, action: #selector(goToStats), for: .touchUpInside)
        
        stopButton = UIButton(frame: CGRect(x: 10, y: (navigationController?.navigationBar.frame.maxY)! + 10, width: 35, height: 35))
        stopButton.setImage(#imageLiteral(resourceName: "stop"), for: .normal)
        stopButton.addTarget(self, action: #selector(stopGame), for: .touchUpInside)
        
        timerLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 15, y: personImage.frame.maxY + 30, width: 30, height: 45))
        timerLabel.textColor = UIColor.white
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont(name: "Arial", size: 35)
        
        option1Label = UIButton(frame: CGRect(x: 10, y: timerLabel.frame.maxY + 40, width: view.frame.width/2 - 20, height: 30))
        option1Label.setTitleColor(UIColor.white, for: .normal)
        option1Label.backgroundColor = Constants.mainBackgroundColor
        option1Label.titleLabel?.adjustsFontSizeToFitWidth = true
        option1Label.titleLabel?.textAlignment = .center
        option1Label.addTarget(self, action: #selector(nameClicked(withSender:)), for: .touchUpInside)
        option1Label.titleLabel?.font = UIFont(name: "Arial", size: 24)
        
        option2Label = UIButton(frame: CGRect(x: option1Label.frame.maxX + 10, y: timerLabel.frame.maxY + 40, width: view.frame.width/2 - 20, height: 30))
        option2Label.setTitleColor(UIColor.white, for: .normal)
        option2Label.backgroundColor = Constants.mainBackgroundColor
        option2Label.titleLabel?.adjustsFontSizeToFitWidth = true
        option2Label.titleLabel?.textAlignment = .center
        option2Label.titleLabel?.font = UIFont(name: "Arial", size: 24)
        option2Label.addTarget(self, action: #selector(nameClicked(withSender:)), for: .touchUpInside)
        
        option3Label = UIButton(frame: CGRect(x: 10, y: option1Label.frame.maxY + 20, width: view.frame.width/2 - 20, height: 30))
        option3Label.setTitleColor(UIColor.white, for: .normal)
        option3Label.backgroundColor = Constants.mainBackgroundColor
        option3Label.titleLabel?.adjustsFontSizeToFitWidth = true
        option3Label.titleLabel?.textAlignment = .center
        option3Label.titleLabel?.font = UIFont(name: "Arial", size: 24)
        option3Label.addTarget(self, action: #selector(nameClicked(withSender:)), for: .touchUpInside)
        
        option4Label = UIButton(frame: CGRect(x: option3Label.frame.maxX + 10, y: option1Label.frame.maxY + 20, width: view.frame.width/2 - 20, height: 30))
        option4Label.setTitleColor(UIColor.white, for: .normal)
        option4Label.backgroundColor = Constants.mainBackgroundColor
        option4Label.titleLabel?.adjustsFontSizeToFitWidth = true
        option4Label.titleLabel?.textAlignment = .center
        option4Label.titleLabel?.font = UIFont(name: "Arial", size: 24)
        option4Label.addTarget(self, action: #selector(nameClicked(withSender:)), for: .touchUpInside)
        
        pointsLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 40, y: scoreLabel.frame.maxY, width: 90, height: 20))
        pointsLabel.text = "Total Points"
        pointsLabel.textAlignment = .center
        pointsLabel.adjustsFontSizeToFitWidth = true
        pointsLabel.textColor = UIColor.white
        
        secondsLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 15, y: timerLabel.frame.maxY, width: timerLabel.frame.width, height: 20))
        secondsLabel.text = "sec"
        secondsLabel.textAlignment = .center
        secondsLabel.adjustsFontSizeToFitWidth = true
        secondsLabel.textColor = UIColor.white
        
        view.addSubview(scoreLabel)
        view.addSubview(personImage)
        view.addSubview(statsPicture)
        view.addSubview(stopButton)
        view.addSubview(timerLabel)
        view.addSubview(option1Label)
        view.addSubview(option2Label)
        view.addSubview(option3Label)
        view.addSubview(option4Label)
        view.addSubview(pointsLabel)
        view.addSubview(secondsLabel)
    }
    
    func goToStats() {
        let defaults = UserDefaults.standard
        
        timer.invalidate()
        gameTimer.invalidate()
        
        defaults.setValue(true, forKey: defaultsKeys.keepScore)
        
        navigationController?.pushViewController(StatsViewController(), animated: true)
    }
    
    func stopGame() {
        let defaults = UserDefaults.standard
        
        timer.invalidate()
        gameTimer.invalidate()
        
        defaults.setValue(0, forKey: defaultsKeys.points)
        defaults.setValue(0, forKey: defaultsKeys.currentStreak)
    }
    
    func getName() -> String {
        let size = members.count;
        let randIndex = Int(arc4random_uniform(UInt32(size)))
        return members[randIndex]
    }
    
    func storeValues(streak: Int, score: Int, correct: Bool, name: String) {
        let defaults = UserDefaults.standard
        
        let longest = defaults.integer(forKey: defaultsKeys.longestStreak)
        let name1 = defaults.string(forKey: defaultsKeys.name1)
        let name2 = defaults.string(forKey: defaultsKeys.name2)
        let bool1 = defaults.bool(forKey: defaultsKeys.bool1)
        let bool2 = defaults.bool(forKey: defaultsKeys.bool2)
        
        defaults.setValue(streak, forKey: defaultsKeys.currentStreak)
        if longest < streak {
            defaults.setValue(streak, forKey: defaultsKeys.longestStreak)
        }
        
        defaults.setValue(score, forKey: defaultsKeys.points)
        
        defaults.setValue(name2, forKey: defaultsKeys.name3)
        defaults.setValue(name1, forKey: defaultsKeys.name2)
        defaults.setValue(name, forKey: defaultsKeys.name1)
        
        defaults.setValue(bool2, forKey: defaultsKeys.bool3)
        defaults.setValue(bool1, forKey: defaultsKeys.bool2)
        defaults.setValue(correct, forKey: defaultsKeys.bool1)
        
        defaults.synchronize()
    }
    
    func nameClicked(withSender sender: UIButton?) {
        let guessedName = sender?.currentTitle!
        let btn = sender
        
        gameTimer.invalidate()
        var callWaitASecond = true
        
        if guessedName != nil {
            if guessedName == name {
                //you got it right
                streak += 1
                score += 1
                scoreLabel.text = "\(score)"
                //change button to green
                btn?.backgroundColor = UIColor.green
            } else {
                //You got it wrong
                streak = 0
                
                //change button to red
                btn?.backgroundColor = UIColor.red
            }
        } else {
            streak = 0
            callWaitASecond = false
        }
        
        //Store and replace values
        storeValues(streak: streak, score: score, correct: guessedName == name, name: name)
        
        //move on to next question
        if callWaitASecond {
            waitASecond()
        } else {
            setupGame()
        }
    }
    
    func waitASecond() {
        timer = Timer()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(setupGame), userInfo: nil, repeats: false)
    }
    
    func getNames(used name: String, number n: Int) -> [String] {
        var names: [String] = []
        
        while names.count < n {
            let newName = getName()
            
            if newName != name && !names.contains(newName) {
                names.append(newName)
            }
        }
        
        return names
    }
    
    func setUpOptionLabels(name: String) {
        var options: [String] = [name] + getNames(used: name, number: 3)
    
        option1Label.setTitle(options.remove(at: Int(arc4random_uniform(UInt32(options.count)))), for: UIControlState.normal)
        option2Label.setTitle(options.remove(at: Int(arc4random_uniform(UInt32(options.count)))), for: UIControlState.normal)
        option3Label.setTitle(options.remove(at: Int(arc4random_uniform(UInt32(options.count)))), for: UIControlState.normal)
        option4Label.setTitle(options.remove(at: Int(arc4random_uniform(UInt32(options.count)))), for: UIControlState.normal)
    }
    
    func outOfTime() {
        nameClicked(withSender: nil)
    }
    
    func handleTimer() {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft)"
        if timeLeft == 0 {
            outOfTime()
        }
    }
    
    func setupGame() {
        option1Label.backgroundColor = Constants.mainBackgroundColor
        option2Label.backgroundColor = Constants.mainBackgroundColor
        option3Label.backgroundColor = Constants.mainBackgroundColor
        option4Label.backgroundColor = Constants.mainBackgroundColor
        
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: defaultsKeys.keepScore) {
            score = defaults.integer(forKey: defaultsKeys.points)
            scoreLabel.text = "\(score)"
        }
        
        timeLeft = 5
        timerLabel.text = "\(timeLeft)"
        
        name = getName()
        
        var lower = name.lowercased()
        
        lower.remove(at: name.characters.index(of: " ")!)
        personImage.image = UIImage(named: lower)
        
        setUpOptionLabels(name: name)
        
        //Handle time stuff
        gameTimer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
}

