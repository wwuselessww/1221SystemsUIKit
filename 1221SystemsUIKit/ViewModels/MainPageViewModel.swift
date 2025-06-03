//
//  MainPageViewModel.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//
import Combine
import Foundation

class MainPageViewModel: ObservableObject {
    @Published var text: String = "HEHHEHEHEEHEHE"
    var cancellables: Set<AnyCancellable> = []
}
