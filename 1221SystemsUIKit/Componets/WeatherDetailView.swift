//
//  WeatherDetailView.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//

import UIKit

class WeatherDetailView: UIView {
    private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.drizzle")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var lbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .white
        lbl.text = "10%"
        return lbl
    }()
    private  var hstack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        hstack.addArrangedSubview(imageView)
        hstack.addArrangedSubview(lbl)

        self.addSubview(hstack)
        setupStackViewConstraints()
        
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: self.topAnchor),
            hstack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hstack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hstack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configure(systemImage: String, title: String) {
        imageView.image = UIImage(systemName: systemImage)
        lbl.text = title
    }
    
}
