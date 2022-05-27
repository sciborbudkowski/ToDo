import UIKit

class ToastMessage: UIViewController {

    var message: String?
    var toastColor: UIColor?

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.toastLabelColor
        label.font = Fonts.getDefaultFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        guard let message = self.message else { return }
        guard let toastColor = self.toastColor else { return }
        messageLabel.text = message
        containerView.backgroundColor = toastColor

        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubviews([containerView])

        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        containerView.addSubviews([messageLabel])
        messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
}
