//
//  Date+Extensions.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 04.06.25.
//

import Foundation

extension String {
    func formattedToString(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
