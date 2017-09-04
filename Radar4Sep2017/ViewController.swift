//
//  ViewController.swift
//  Radar4Sep2017
//
//  Created by Daniel Loewenherz on 9/4/17.
//  Copyright © 2017 Lionheart Software LLC. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    let button = UIButton(type: .system)

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        button.setTitle("Start Session", for: .normal)
        button.addTarget(self, action: #selector(startAuthenticationSession), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func startAuthenticationSession() {
        guard let url = URL(string: "https://api.twitter.com/oauth/authorize?force_login=true") else {
            return
        }

        let session = SFAuthenticationSession(url: url, callbackURLScheme: "radar4sep2017://") { (_, _) in }

        session.start()
    }
}
