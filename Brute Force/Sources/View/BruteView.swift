//
//  BruteView.swift
//  Brute Force
//
//  Created by Радик Ахметзянов on 14.10.2022.
//

import UIKit
import SnapKit

protocol BruteViewDelegate {
    func buttonPressed(_ bruteView: BruteView)
    func passwordButtonPressed(_ bruteView: BruteView)
}

class BruteView: UIView {
        
    var delegate: BruteViewDelegate?

    // MARK: - Outlets
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "password"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.text = ""
        textField.setRightIcon(self)
        textField.setLeftIcon(UIImage(named: "") ?? UIImage())
        return textField
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Угадать пароль?"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create password", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(passwordButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Press me!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var bgColor: Bool = false {
        didSet {
            if bgColor {
                backgroundColor = .systemCyan
            } else {
                backgroundColor = .systemYellow
            }
        }
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
        addSubview(textField)
        addSubview(label)
        addSubview(passwordButton)
        addSubview(button)
    }
    
    private func setupStackView() {
        textField.snp.makeConstraints { make in
            make.bottom.equalTo(label.snp.top).offset(-30)
            make.height.equalTo(50)
            make.left.equalTo(self).offset(50)
            make.right.equalTo(self).inset(50)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-50)
            
        }
        
        passwordButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(label.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.left.equalTo(self).offset(50)
            make.right.equalTo(self).inset(50)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(passwordButton.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.left.equalTo(self).offset(50)
            make.right.equalTo(self).inset(50)
        }
    }
}

extension BruteView: BruteViewDelegate {
    @objc func buttonPressed(_ bruteView: BruteView) {
        delegate?.buttonPressed(self)
    }
    
    @objc func passwordButtonPressed(_ bruteView: BruteView) {
        delegate?.passwordButtonPressed(self)
    }
}
