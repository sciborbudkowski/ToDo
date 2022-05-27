import UIKit

class MainHeaderView: View {

    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultBoldFont(ofSize: 26)
        label.textColor = Colors.applicationNameLabelColor
        label.text = "ToDo_SB"
        return label
    }()

    let addTaskButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.borderless()
        configuration.title = "Dodaj zadanie"
        configuration.titlePadding = 10
        configuration.background.backgroundColor = Colors.addNewTaskButtonBackgroundColor
        configuration.baseForegroundColor = Colors.addNewTaskButtonLabelColor
        configuration.cornerStyle = .medium
        button.configuration = configuration
        return button
    }()

    override func layoutSubviews() {
        setGradientBackground(
            topColor: Colors.headerBackgroundTopColor,
            bottomColor: Colors.headerBackgroundBottomColor)
    }

    override func setupConstraints() {
        addSubviews([containerView])

        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        containerView.addSubviews([titleLabel, addTaskButton])

        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true

        addTaskButton.sizeToFit()
        addTaskButton.centerYAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30).isActive = true
        addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
