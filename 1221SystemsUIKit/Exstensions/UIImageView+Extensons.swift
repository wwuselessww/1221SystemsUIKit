//
//  UIImageView+Extensons.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 04.06.25.
//

import UIKit

extension UIImageView {
    func imageFrom(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("invalid url????")
            return
        }
        print(urlString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        print("jr")
                    }
                }
            }
        }
    }
}
