//
//  ViewController.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 02.06.25.
//

import UIKit

class MainPageViewController: UIViewController {
    internal var vm = MainPageViewModel()
    
    var lblTest: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    var btnTest: UIButton = {
       var btn = UIButton()
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("press me", for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupBindings()
        setupLbl()
        setupBtn()
    }
    
    private func setupLbl() {
        view.addSubview(lblTest)
        lblTest.text = vm.text
        NSLayoutConstraint.activate([
            lblTest.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lblTest.heightAnchor.constraint(equalToConstant: 20),
            lblTest.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            lblTest.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func setupBtn() {
        view.addSubview(btnTest)
        
        btnTest.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            btnTest.topAnchor.constraint(equalTo: lblTest.bottomAnchor, constant: 10),
            btnTest.heightAnchor.constraint(equalToConstant: 40),
            btnTest.leadingAnchor.constraint(equalTo: lblTest.leadingAnchor),
            btnTest.trailingAnchor.constraint(equalTo: lblTest.trailingAnchor)
        ])
    }
    
    @objc func btnPressed() {
        print("kekekkeke")
        vm.text = "gg"
    }


}

