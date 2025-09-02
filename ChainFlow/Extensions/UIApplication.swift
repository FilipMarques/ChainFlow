//
//  UIApplication.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 01/09/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
