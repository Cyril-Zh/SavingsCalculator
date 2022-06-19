import UIKit

final class HomeViewController: UIViewController {

    private let textField: UITextField = {
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
    
    private let stepper: UITextField = {
        let stepper = UITextField()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        return stepper
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
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        view.addSubview(textField)
        view.addSubview(stepper)
        view.addSubview(button)
        
        let constrait = [
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48),
            
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepper.topAnchor.constraint(equalTo: textField.topAnchor, constant: 80),
            stepper.heightAnchor.constraint(equalToConstant: 40),
            stepper.widthAnchor.constraint(equalToConstant: 80),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80)
            
            
        ]
        
        NSLayoutConstraint.activate(constrait)
        
    }

    @objc func calculateButton(sender: UIButton) {
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true, completion: nil)
    }

}
