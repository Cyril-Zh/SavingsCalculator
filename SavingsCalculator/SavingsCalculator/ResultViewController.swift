import UIKit

final class ResultViewController: UIViewController {
    
    var result = String()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(recalculateButton), for: .touchUpInside)
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Total many"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        //label.text = "many"
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 40, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Dollar")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(resultLabel)
        view.addSubview(image)
        
        let constrait = [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 30),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            image.topAnchor.constraint(equalTo: resultLabel.topAnchor, constant: 0),
            image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            image.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 0)
            
        ]
        
        NSLayoutConstraint.activate(constrait)
    }
    
    @objc func recalculateButton(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
