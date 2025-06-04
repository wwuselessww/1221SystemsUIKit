//
//  ViewController.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 02.06.25.
//

import UIKit

class MainPageViewController: UIViewController {
    internal var vm = MainPageViewModel()
    internal var tableHeightConstraint: NSLayoutConstraint?
    
    lazy var dataSource: UITableViewDiffableDataSource<Section, WeatherModel> = {
        return .init(tableView: table) { [self] tableView, indexPath, itemIdentifier in
            guard let cell = table.dequeueReusableCell(withIdentifier: ForecastCell.identifier) as? ForecastCell else {
                print("***cant deque cell for table in mainPageVC")
                return ForecastCell()
            }
            cell.backgroundColor = .white
            cell.configure(weekday: itemIdentifier.name, temperature: indexPath.row)
            return cell
        }
    }()
    
    internal var table: UITableView = {
        var t = UITableView(frame: .zero, style: .insetGrouped)
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .clear
        return t
    }()
    
    private var scrollView: UIScrollView = {
        var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    internal var contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    
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
        lbl.text = "Its Fucking Sunny In Saint Petersburg"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 64, weight: .semibold)
        return lbl
    }()
    
   internal var separator: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    internal var lblScroll: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.text = "scroll down to see future"
        lbl.textColor = .systemGray2
        return lbl
    }()
    

    
    
    internal var hstack = UIStackView()
    internal var windView = WeatherDetailView()
    internal var humidityView = WeatherDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getWeather()
        setupBindings()
        setupScroll()
        setupImgViewWeather()
        setupTemperatureLbl()
        setupWeatherText()
        setupWeatherInfo()
        setupSeparator()
        setupScrollLbl()
        setupTable()
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblWeatherText.sizeToFit()
    }
    private func setupWeatherText() {
        contentView.addSubview(lblWeatherText)
        setupWeatherTextConstraints()
        
    }
    
    private func setupTemperatureLbl() {
        contentView.addSubview(lblTemperature)
        lblTemperature.text = "15°C"
        setupTemperatureLblConstarains()
    }
    
    private func setupImgViewWeather() {
        contentView.addSubview(imgViewWeather)
        imgViewWeather.image = UIImage(systemName: "cloud.drizzle")
        setupWeatherImgViewConstrains()
        
    }
    
    private func setupWeatherInfo() {
        windView.configure(systemImage: "wind", title: "10km.h", color: .white)
        humidityView.configure(systemImage: "humidity", title: "20%", color: .white)
        contentView.addSubview(hstack)
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.addArrangedSubview(windView)
        hstack.addArrangedSubview(humidityView)
        hstack.axis = .horizontal
        hstack.alignment = .center
        hstack.distribution = .fill
        hstack.spacing = 8
        setupWeatherInfoConstraints()
    }
    
    private func setupSeparator() {
        contentView.addSubview(separator)
        setupSeparatorConstraints()
    }
    
    private func setupScroll() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupScrollConstraints()
    }
    
    private func setupScrollLbl() {
        contentView.addSubview(lblScroll)
        setupScrollLblConstraints()
    }
    
    

    
    //MARK: setup constraints
    private func setupWeatherImgViewConstrains() {
        NSLayoutConstraint.activate([
            imgViewWeather.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imgViewWeather.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imgViewWeather.heightAnchor.constraint(equalToConstant: 76),
            imgViewWeather.widthAnchor.constraint(equalToConstant: 76)
        ])
    }
    private func setupTemperatureLblConstarains() {
        NSLayoutConstraint.activate([
            lblTemperature.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblTemperature.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblTemperature.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            lblTemperature.trailingAnchor.constraint(equalTo: imgViewWeather.leadingAnchor, constant: -10)
        ])
    }
    private func setupWeatherTextConstraints() {
        NSLayoutConstraint.activate([
            lblWeatherText.topAnchor.constraint(equalTo: lblTemperature.bottomAnchor, constant: 10),
            lblWeatherText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lblWeatherText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblWeatherText.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, constant: 20)
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
    private func setupSeparatorConstraints() {
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: hstack.bottomAnchor, constant: 5),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            separator.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    private func setupScrollLblConstraints() {
        NSLayoutConstraint.activate([
            lblScroll.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 5),
            lblScroll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblScroll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            lblScroll.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupScrollConstraints() {
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(50)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize", object as? UITableView === table {
            tableHeightConstraint?.constant = table.contentSize.height
            view.layoutIfNeeded()
        }
    }
}
