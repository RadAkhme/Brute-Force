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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Угадать пароль?"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
        }()
    
    private lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create password", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(passwordButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Press me!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func buttonPressed() {
        
    }
    
    @objc private func passwordButtonPressed() {
        
    }
    
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
