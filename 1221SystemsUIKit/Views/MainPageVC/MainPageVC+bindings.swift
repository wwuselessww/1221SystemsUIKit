//
//  MainPageVC+bindings.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//

import Foundation
extension MainPageViewController {
    func setupBindings() {
        vm.$weatherObject.sink { object in
            Task { @MainActor in
                await self.vm.populateWeatherText()
                self.vm.populateCollectionView()
                self.lblWeatherText.text = "Its Bloody \(self.vm.conditionString) In \(self.vm.cityName)"
                self.lblTemperature.text = "\(self.vm.temreratureString)°C"
                self.windView.lbl.text = "\(self.vm.windSpeedString)km/h"
                self.humidityView.lbl.text = "\(self.vm.humidityString)%"
                self.imgViewWeather.imageFrom(self.vm.conditionImageString)
                self.updateSnapshot()
                
            }
        }
        .store(in: &vm.cancellables)
//        vm.$forecastArray.sink { [weak self] array in
//            
//            print("array binded")
//            
//        }
//        .store(in: &vm.cancellables)

    }
}
