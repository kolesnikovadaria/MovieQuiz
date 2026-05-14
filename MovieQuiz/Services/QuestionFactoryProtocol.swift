//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Daria on 11.04.2026.
//

import Foundation

protocol QuestionFactoryProtocol {
    var movies: [MostPopularMovie] { get set }
    func requestNextQuestion()
    func loadData()
}

