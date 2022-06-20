import UIKit

final class HomeViewController: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 25, weight: .regular)
        textField.textAlignment = .center
        textField.placeholder = "My salary"
        textField.clearButtonMode = .never
        textField.minimumFontSize = 15
        textField.adjustsFontSizeToFitWidth = true
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGreen.cgColor
        textField.borderStyle = .none
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
    
    private lazy var piker: UIPickerView = {
        let piker = UIPickerView()
        piker.dataSource = self
        piker.delegate = self
        
        return piker
    }()
    
    private let stackViewStepper: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    let percentagesArray = ["5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90", "95", "100"]
    
    var numberMoth = Double()
    var percent = String()
    var result = String()
    var resultVC = ResultViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stackViewStepper)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(piker)
        piker.center = view.center
        
        label.text = "1"
        configureStepperStackView()
        
        let constrait = [
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48),
            
            stackViewStepper.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -140),
            stackViewStepper.heightAnchor.constraint(equalToConstant: 40),
            stackViewStepper.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            stackViewStepper.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -60),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            
            
            
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
        let salary = textField.text ?? "0"
//        let actionOne = Double(salary)! / 100
        resultVC.oneAction = salary
        resultVC.mothe = numberMoth
        
    }
    
    //MARK: - stepperUp
    
    @objc func stepperUp(sender: UIStepper) {
        label.text = "\(Int(sender.value))"
        numberMoth = sender.value
    }
    
}

//MARK: - UIPickerDelegate

extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return percentagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        return percentagesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedPercent = percentagesArray[row]
        resultVC.calculate(for: selectedPercent)
    }
}
