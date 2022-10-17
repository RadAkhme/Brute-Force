//
//  ViewController.swift
//  Brute Force
//
//  Created by Радик Ахметзянов on 14.10.2022.
//

import UIKit

class BruteController: UIViewController {
    
    var brute = Brute()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = BruteView()
        self.view = view
        view.delegate = self
        view.backgroundColor = .systemYellow
    }
}

extension BruteController: BruteViewDelegate {
    func buttonPressed(_ bruteView: BruteView) {
        bruteView.bgColor.toggle()
    }
    
    func passwordButtonPressed(_ bruteView: BruteView) {
        bruteView.textField.isSecureTextEntry = true
        bruteView.label.text = "Сейчас угадаю..."
        brute.randomPassword(bruteView)
        bruteView.activityIndicator.startAnimating()
        
        if let password = bruteView.textField.text {
            let queue = DispatchQueue(label: "", qos: .userInteractive)
            
            queue.async {
                self.brute.bruteForce(bruteView, passwordToUnlock: password)
            }
        }
    }
}
