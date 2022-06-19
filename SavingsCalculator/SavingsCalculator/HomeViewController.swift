import UIKit

final class HomeViewController: UIViewController {
        
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 25, weight: .regular)
        textField.textAlignment = .center
        textField.placeholder = "Salary"
        textField.clearButtonMode = .never
        textField.minimumFontSize = 15
        textField.adjustsFontSizeToFitWidth = true
        textField.textContentType = .telephoneNumber
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperUp), for: .valueChanged)
        
        return stepper
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calculateButton), for: .touchUpInside)
        
        return button
    }()
    
    private let stackViewStepper: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stackViewStepper)
        view.addSubview(textField)
        view.addSubview(button)
        label.text = "1"
        configureStepperStackView()
        
        let constrait = [
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48),
            
            stackViewStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewStepper.topAnchor.constraint(equalTo: textField.topAnchor, constant: 80),
            stackViewStepper.heightAnchor.constraint(equalToConstant: 40),
            stackViewStepper.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            stackViewStepper.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -60),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80)
            
            
            
        ]
        
        NSLayoutConstraint.activate(constrait)
        
    }
    
    //MARK: - configureStepperStackView
    
    func configureStepperStackView() {
        stackViewStepper.addArrangedSubview(label)
        stackViewStepper.addArrangedSubview(stepper)
        stackViewStepper.axis = .horizontal
        stackViewStepper.spacing = 20
        stackViewStepper.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 40).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stepper.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stepper.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    //MARK: - calculateButton
    
    @objc func calculateButton(sender: UIButton) {
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true, completion: nil)
    }
    
    //MARK: - stepperUp
    
    @objc func stepperUp(sender: UIStepper) {
        label.text = "\(Int(sender.value))"
    }
    
}
