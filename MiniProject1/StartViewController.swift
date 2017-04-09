//
//  StartViewController.swift
//  MiniProject1
//
//  Created by Shireen Warrier on 2/9/17.
//  Copyright © 2017 Shireen And Daniel. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        let defaults = UserDefaults.standard
        defaults.setValue(false, forKey: ViewController.defaultsKeys.keepScore)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLayout() {
        view.backgroundColor = UIColor(red: 138/255, green: 187/255, blue: 197/255, alpha: 1.0)
        
        startButton = UIButton(frame: CGRect(x: 20, y: view.frame.height * (2/5), width: view.frame.width - 40, height: view.frame.height/5))
        startButton.setTitle("Start Game", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Arial", size: 40)!
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    func startGame() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}

