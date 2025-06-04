//
//  ForecastCell.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//

import UIKit

class ForecastCell: UITableViewCell {
    static var identifier: String = "ForecastCell"
    
    
    var imageViewWeatherCondition: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(systemName: "wind")
        v.tintColor = .label
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private var lblViewWeatherCondition: UILabel = {
        let lbl = UILabel()
        lbl.text = "Windy"
        lbl.translatesAutoresizingMaskIntoConstraints =  false
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .natural
        lbl.textColor = .label
        return lbl
    }()
    
    private var lblDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .label
        return lbl
    }()
    
    private var hStack: UIStackView = {
        let h = UIStackView()
        h.translatesAutoresizingMaskIntoConstraints = false
        h.axis = .horizontal
        h.spacing = 8
        h.alignment = .trailing
        h.distribution = .equalSpacing
        return h
    }()
    
    private var humidityView = WeatherDetailView()
    private var windSpeedView = WeatherDetailView()
    
    private var lblTemperature: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .label
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.secondarySystemBackground
        setupWeatherLbl()
        setupWeatherImage()
        setupLblDay()
        setupHstack()
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(weekday: String, temperature: Int, humidity: Int, windSpeed: Double, conditionText: String, conditionImgURLString: String) {
        lblDate.text = weekday
        lblTemperature.text = "\(temperature)°C"
        windSpeedView.lbl.text = String(format: "%.0f", windSpeed)
        humidityView.lbl.text = String(humidity)
        lblViewWeatherCondition.text = conditionText
        let fullUrl = "https:" + conditionImgURLString
        DispatchQueue.main.async {
            self.imageViewWeatherCondition.imageFrom(fullUrl)
        }
    }
    
    private func setupLblDay() {
        contentView.addSubview(lblDate)
        setupLblDayConstraints()
    }
    
    private func setupHstack() {
        humidityView.configure(systemImage: "humidity", title: "10")
        windSpeedView.configure(systemImage: "wind", title: "20")
        contentView.addSubview(hStack)
        setupHstackConstraints()
        hStack.addArrangedSubview(humidityView)
        hStack.addArrangedSubview(windSpeedView)
        hStack.addArrangedSubview(lblTemperature)
    }
    
    private func setupWeatherImage() {
        contentView.addSubview(imageViewWeatherCondition)
        setupWeatherImageConstraints()
    }
    
    private func setupWeatherLbl() {
        contentView.addSubview(lblViewWeatherCondition)
        setupWeatherLblConstraints()
    }
    
    //MARK: setup constraints
    
    private func setupLblDayConstraints() {
        NSLayoutConstraint.activate([
            lblDate.topAnchor.constraint(equalTo: lblViewWeatherCondition.bottomAnchor),
            lblDate.leadingAnchor.constraint(equalTo: imageViewWeatherCondition.trailingAnchor, constant: 10),
            lblDate.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            lblDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setupHstackConstraints() {
        NSLayoutConstraint.activate([
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            hStack.leadingAnchor.constraint(greaterThanOrEqualTo: lblDate.trailingAnchor, constant: 10)
        ])
    }
    
    private func setupWeatherImageConstraints() {
        NSLayoutConstraint.activate([
            imageViewWeatherCondition.topAnchor.constraint(equalTo: lblViewWeatherCondition.bottomAnchor),
            imageViewWeatherCondition.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewWeatherCondition.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageViewWeatherCondition.widthAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupWeatherLblConstraints() {
        NSLayoutConstraint.activate([
            lblViewWeatherCondition.topAnchor.constraint(equalTo: contentView.topAnchor),
            lblViewWeatherCondition.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            lblViewWeatherCondition.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//            lblViewWeatherCondition.bottomAnchor.constraint(equalTo: imageViewWeatherCondition.topAnchor)
            lblViewWeatherCondition.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
   
}
