//
//  ViewController.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 02.06.25.
//

import UIKit

class MainPageViewController: UIViewController {
    internal var vm = MainPageViewModel()
    
    internal var imgViewWeather: UIImageView = {
        var imgView = UIImageView(frame: .zero)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = .white
        return imgView
    }()
    internal var lblTemperature: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 64, weight: .semibold)
        return lbl
    }()
    
    internal var lblWeatherText: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
//        lbl.text = "Its\nFucking\nRaining\nIn\nSaint\nPetersburg"
        lbl.text = "Its Fucking Sunny In Saint Petersburg"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 64, weight: .semibold)
        return lbl
    }()
    
    internal var hstack = UIStackView()
    internal var windView = WeatherDetailView()
    internal var humidityView = WeatherDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupImgViewWeather()
        setupTemperatureLbl()
        setupWeatherText()
        setupWeatherInfo()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblWeatherText.sizeToFit()
    }
    private func setupWeatherText() {
        view.addSubview(lblWeatherText)
        setupWeatherTextConstraints()
        
    }
    
    private func setupTemperatureLbl() {
        view.addSubview(lblTemperature)
        lblTemperature.text = "15°C"
        setupTemperatureLblConstarains()
    }
    
    private func setupImgViewWeather() {
        view.addSubview(imgViewWeather)
        imgViewWeather.image = UIImage(systemName: "cloud.drizzle")
        setupWeatherImgViewConstrains()
        
    }
    
    private func setupWeatherInfo() {
        windView.configure(systemImage: "wind", title: "10km.h")
        humidityView.configure(systemImage: "humidity", title: "20%")
        
        
        
        view.addSubview(hstack)
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.addArrangedSubview(windView)
        hstack.addArrangedSubview(humidityView)
        hstack.axis = .horizontal
        hstack.alignment = .center
        hstack.distribution = .fill
        hstack.spacing = 8
        setupWeatherInfoConstraints()
    }
    
    

    
    //MARK: setup constraints
    private func setupWeatherImgViewConstrains() {
        NSLayoutConstraint.activate([
            imgViewWeather.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imgViewWeather.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imgViewWeather.heightAnchor.constraint(equalToConstant: 76),
            imgViewWeather.widthAnchor.constraint(equalToConstant: 76)
        ])
    }
    private func setupTemperatureLblConstarains() {
        NSLayoutConstraint.activate([
            lblTemperature.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            lblTemperature.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            lblTemperature.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            lblTemperature.trailingAnchor.constraint(equalTo: imgViewWeather.leadingAnchor, constant: -10)
        ])
    }
    private func setupWeatherTextConstraints() {
        NSLayoutConstraint.activate([
            lblWeatherText.topAnchor.constraint(equalTo: lblTemperature.bottomAnchor, constant: 10),
            lblWeatherText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            lblWeatherText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            lblWeatherText.heightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor, constant: 20)
        ])
    }
    private func setupWeatherInfoConstraints() {
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: lblWeatherText.bottomAnchor, constant: 10),
            hstack.leadingAnchor.constraint(equalTo: lblTemperature.leadingAnchor),
            hstack.trailingAnchor.constraint(lessThanOrEqualTo: imgViewWeather.trailingAnchor),
            hstack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

