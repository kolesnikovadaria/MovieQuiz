

//import UIKit
//
//final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
//    
//    var isShowStepCalled = false
//     var lastStepModel: QuizStepViewModel?
//     
//     var isShowResultCalled = false
//     var lastPresentedResult: QuizResultsViewModel?
//     
//     var isHighlightBorderCalled = false
//     var lastBorderAnswerResult: Bool?
//     
//     var isShowLoadingIndicatorCalled = false
//     var isHideLoadingIndicatorCalled = false
//     
//     var isShowNetworkErrorCalled = false
//     var lastNetworkErrorMessage: String?
//     
//    
//    func show(quiz step: QuizStepViewModel) {
//        isShowStepCalled = true
//        lastStepModel = step
//    }
//    
//    func show(quiz result: QuizResultsViewModel) {
//        isShowResultCalled = true
//        lastPresentedResult = result
//    }
//    
//    func highlightImageBorder(isCorrectAnswer: Bool) {
//        isHighlightBorderCalled = true
//        lastBorderAnswerResult = isCorrectAnswer
//    }
//    
//    func showLoadingIndicator() {
//        isShowLoadingIndicatorCalled = true
//    }
//    
//    func hideLoadingIndicator() {
//        isHideLoadingIndicatorCalled = true
//    }
//    
//    func showNetworkError(message: String) {
//        isShowNetworkErrorCalled = true
//        lastNetworkErrorMessage = message
//    }
//    
//    
//}

import UIKit

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    var lastStepModel: QuizStepViewModel?
    var lastResultModel: QuizResultsViewModel?
    var isHighlightImageBorderCalled = false
    var shownNetworkErrorMessage: String?
    var isShowLoadingIndicatorCalled = false
    var isHideLoadingIndicatorCalled = false
    var isButtonsEnabled: Bool?
    
    func show(quiz step: QuizStepViewModel) {
        lastStepModel = step
    }
    
    func show(quiz result: QuizResultsViewModel) {
        lastResultModel = result
    }
    
    func setButtonsEnabled(_ isEnabled: Bool) {
        isButtonsEnabled = isEnabled
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        isHighlightImageBorderCalled = true
    }
    
    func showLoadingIndicator() {
        isShowLoadingIndicatorCalled = true
    }
    
    func hideLoadingIndicator() {
        isHideLoadingIndicatorCalled = true
    }
    
    func showNetworkError(message: String) {
        shownNetworkErrorMessage = message
    }
}
