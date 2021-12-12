//
//  Alerts.swift
//  TicTacToe
//
//  Created by Arpan Tyagi on 12.12.2021.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}
