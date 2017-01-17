//
//  ViewController.swift
//  TelTechDialerView
//
//  Created by jclardy on 01/12/2017.
//  Copyright (c) 2017 jclardy. All rights reserved.
//

import UIKit

import TelTechDialerView

class ViewController: UIViewController {

    @IBOutlet weak var startCallButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedStartCall(_ sender: Any) {
        let controller = TelTechOnCallController.create()
        controller.start()
        self.present(controller, animated: true, completion: nil)
    }
    
    
}

