import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {

    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: MovieQuizPresenter!
    private var alertPresenter = AlertPresenter()
    private var didStartGame = false
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieQuizPresenter(viewController: self)
        imageView.layer.cornerRadius = 20
        showLoadingIndicator()
        counterLabel.accessibilityIdentifier = "Index"
    }

    // MARK: - Actions
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
            presenter.yesButtonClicked()
        }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
            presenter.noButtonClicked()
        }
     
    // MARK: - Private Methods
    
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = UIImage(data: step.image) ?? UIImage()
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    
    func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.presenter.restartGame()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 8
            imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        }
    
        
    func showLoadingIndicator() {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }

        func showNetworkError(message: String) {
            hideLoadingIndicator()
            
            let model = AlertModel(title: "Ошибка", message: message, buttonText: "Попробовать ещё раз") { [weak self] in
                guard let self else { return }
                self.presenter.restartGame()
            }
            alertPresenter.show(in: self, model: model)
        }
}

