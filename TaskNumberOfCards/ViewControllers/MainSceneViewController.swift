//
//  MainSceneViewController.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 11/10/2020.
//

import UIKit

class MainSceneViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properites
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        return imageView
    }()
    
    let inputTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.systemRed.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .systemGray5
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let inputDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter a three-digit or larger number"
        label.font = label.font.withSize(13)
        return label
    }()
    
    let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "43")
        return imageView
    }()
    
    let gambleButton: UIView = {
        let stackView = GambleButtonView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        stackView.isUserInteractionEnabled = true
        return stackView
    }()


    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }

    //MARK: Methods
    fileprivate func setupView(){
        view.backgroundColor = .white
        inputTextField.delegate = self
        gambleButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showResultScreen(_:))))
        
        view.addSubview(imageView)
        view.addSubview(inputTextField)
        view.addSubview(inputDescriptionLabel)
        view.addSubview(gambleButton)
    }
    
    fileprivate func setupLayout(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            
            inputTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant:  20),
            inputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextField.widthAnchor.constraint(equalToConstant: 80),
            inputTextField.heightAnchor.constraint(equalToConstant: 40),

            inputDescriptionLabel.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 10),
            inputDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gambleButton.topAnchor.constraint(equalTo: inputDescriptionLabel.bottomAnchor, constant: 25),
            gambleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "INCORRECT ENTRY", message: "The number you are entering must be at least three-digit", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Try again", style: .destructive, handler: {(action:UIAlertAction!) in
            self.inputTextField.text = nil
        }))
        
        self.present(alert, animated: true)
    }
    
    //MARK: Actions
    @objc func showResultScreen(_ sender: UITapGestureRecognizer? = nil) {
        inputTextField.resignFirstResponder()
        
        guard let input = inputTextField.text, !inputTextField.text!.isEmpty else {
            return
        }
        
        let inputNumber = Int(input)!
        
        if(inputNumber.isAtleastThreeDigit) {
            
            navigationController?.pushViewController(GameResultViewController(repetitions: inputNumber), animated: false)
            
            self.inputTextField.text = nil
            return
        } else {
            showAlert()
        }
    }
}
