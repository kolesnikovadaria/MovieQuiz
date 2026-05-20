//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Daria on 15.04.2026.
//

import UIKit

final class AlertPresenter {
    func show(in vc: UIViewController, model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)

        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in
            DispatchQueue.main.async {
                model.completion()
            }
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
