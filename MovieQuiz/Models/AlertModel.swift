//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Daria on 15.04.2026.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
}
