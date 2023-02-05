//
//  ViewController.swift
//  QuizzletApp
//
//  Created by Димаш Алтынбек on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let NewView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(NewView)
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .systemPurple
        NewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NewView.topAnchor.constraint(equalTo: view.topAnchor),
            NewView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            NewView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            NewView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

