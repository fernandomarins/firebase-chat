//
//  ConversationViewController.swift
//  firebase-chat
//
//  Created by Fernando Marins on 15/12/21.
//

import UIKit
import Firebase

class ConversationViewController: UIViewController {
    
//    private let logoutButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Log Out", for: .normal)
//        button.backgroundColor = .link
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 12
//        // masks to bounds: cuts everything that overlays the corners
//        button.layer.masksToBounds = true
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
//
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(logoutButton)
//        logoutButton.addTarget(self, action: #selector(didLogout), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        logoutButton.frame = CGRect(x: view.center.x/2, y: view.center.y/2, width: 100, height: 52)
    }
    
    @objc func didLogout() {
        try! Firebase.Auth.auth().signOut()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    fileprivate func validateAuth(){
        if Firebase.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false, completion: nil)
        }
    }

}

