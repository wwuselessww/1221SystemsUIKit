//
//  MainPageVC+bindings.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//

import Foundation
extension MainPageViewController {
    func setupBindings() {
        vm.$text.sink { [weak self] str in
            self?.lblTest.text = str
        }
        .store(in: &vm.cancellables)
    }
}
