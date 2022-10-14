//
//  BruteView.swift
//  Brute Force
//
//  Created by Радик Ахметзянов on 14.10.2022.
//

import UIKit

class BruteView: UIView {
    
    // MARK: - Outlets
    
    private lazy var textField: UITextField = {
            let textField = UITextField()
            textField.backgroundColor = .white
            textField.placeholder = "password"
            textField.textAlignment = .center
            textField.layer.cornerRadius = 20
            textField.text = ""
            return textField
        }()
    
    // MARK: - Initial
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupHierarchy()
            setupStackView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Error")
        }
        
        private func setupHierarchy() {
            
        }
        
        private func setupStackView() {
        
        }

}
