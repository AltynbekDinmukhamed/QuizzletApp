//
//  View.swift
//  QuizzletApp
//
//  Created by Димаш Алтынбек on 05.02.2023.
//

import Foundation
import UIKit

class View: UIView {
    
    //MARK: -View elements-
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        //stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Qestion"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .brown
        progress.trackTintColor = .systemGray
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    let buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("label", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("label", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonThree: UIButton = {
        let button = UIButton()
        button.setTitle("label", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var quizeBrain = QuestionBrain()
    
    //MARK: -LifeCycle-
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Functions-
    
    func setUpViews() {
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
        stack.addArrangedSubview(scoreLabel)
        
        stack.addArrangedSubview(questionView)
        questionView.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: questionView.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionView.leadingAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: questionView.bottomAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: questionView.trailingAnchor)
        ])
        
        //button
        stack.addArrangedSubview(buttonOne)
        stack.addArrangedSubview(buttonTwo)
        stack.addArrangedSubview(buttonThree)
        
        stack.addArrangedSubview(progressView)
        progressView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    
    //MARK: -objc functions-
    @objc func didTap(_ sender: UIButton) {
        let userAnswear = sender.currentTitle!
        
        let userGotRightAnswear = quizeBrain.checkAnswears(userAnswear: userAnswear)
        if userGotRightAnswear {
            sender.backgroundColor = .green
        }else {
            sender.backgroundColor = .red
        }
        
        quizeBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(setText), userInfo: nil, repeats: false)
    }
    
    @objc func setText() {
        questionLabel.text = quizeBrain.getText()
        
        let answears = quizeBrain.getAnswear()
        buttonOne.setTitle(answears[0], for: .normal)
        buttonTwo.setTitle(answears[1], for: .normal)
        buttonThree.setTitle(answears[2], for: .normal)
        
        progressView.progress = quizeBrain.getProgress()
        scoreLabel.text = "Score: \(quizeBrain.getScore())"
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        buttonThree.backgroundColor = UIColor.clear
    }
    
}
