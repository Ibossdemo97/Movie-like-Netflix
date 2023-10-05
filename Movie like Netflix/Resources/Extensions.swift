//
//  Extensions.swift
//  Movie like Netflix
//
//  Created by Luyện Hà Luyện on 22/09/2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
