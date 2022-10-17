//
//  Brute.swift
//  Brute Force
//
//  Created by Радик Ахметзянов on 14.10.2022.
//

import Foundation
import UIKit

class Brute {
    
    func bruteForce(_ passwordView: BruteView, passwordToUnlock: String) {
        
        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }
        
        var password: String = ""
        
        let queue = DispatchQueue(label: "", qos: .userInitiated)
        
        queue.async {
            while password != passwordToUnlock {
                password = self.generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
            }
            DispatchQueue.main.async {
                passwordView.label.text = password
                passwordView.textField.isSecureTextEntry = false
                passwordView.activityIndicator.stopAnimating()
            }
        }
    }
    
    func indexOf(character: Character, _ array: [String]) -> Int {
        return array.firstIndex(of: String(character)) ?? 0
    }
    
    func characterAt(index: Int, _ array: [String]) -> Character {
        return index < array.count ? Character(array[index]) : Character("")
    }
    
    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var str: String = string
        
        if str.count <= 0 {
            str.append(characterAt(index: 0, array))
        }
        else {
            str.replace(at: str.count - 1,
                        with: characterAt(index: (indexOf(character: str.last ?? Character(""), array) + 1) % array.count, array))
            
            if indexOf(character: str.last ?? Character(""), array) == 0 {
                str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last ?? Character(""))
            }
        }
        return str
    }
    
    func randomPassword(_ bruteView: BruteView) {
        let passwordCharacters = Array("".digits + "".lowercase + "".uppercase + "".punctuation)
        let lenght = 3
        let randomPassword = String((0..<lenght).map{ _ in passwordCharacters[Int(arc4random_uniform(UInt32(passwordCharacters.count)))]})
        bruteView.textField.text = randomPassword
    }
}
