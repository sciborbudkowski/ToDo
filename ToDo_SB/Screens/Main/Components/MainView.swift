import UIKit

class MainView: View {

    let headerView: MainHeaderView = {
        let view = MainHeaderView()
        return view
    }()

    let tasksTable: UITableView = {
        let view = UITableView()
        view.register(TaskViewCell.self, forCellReuseIdentifier: TaskViewCell.identifier)
        view.allowsSelection = false
        return view
    }()

    private let noTasksLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultDemiBoldFont(ofSize: 20)
        label.textColor = Colors.labelTextColor
        label.text = "Brak zadań do wyświetlenia."
        return label
    }()

    let addTaskTextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.getDefaultFont(ofSize: 18)
        button.setTitle("Dodaj", for: .normal)
        button.setTitleColor(Colors.addNewTaskButtonBackgroundColor, for: .normal)
        return button
    }()

    private let infoAddTaskLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultFont(ofSize: 18)
        label.textColor = Colors.labelTextColor
        label.text = " swoje pierwsze zadanie do listy."
        return label
    }()

    let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()

    private let innerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        return view
    }()

    override func setupConstraints() {
        addSubviews([headerView, tasksTable, mainStackView])

        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        tasksTable.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tasksTable.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tasksTable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tasksTable.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        mainStackView.centerXAnchor.constraint(equalTo: tasksTable.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: tasksTable.centerYAnchor).isActive = true

        mainStackView.addArrangedSubview(noTasksLabel)
        mainStackView.addArrangedSubview(innerStackView)

        innerStackView.addArrangedSubview(addTaskTextButton)
        innerStackView.addArrangedSubview(infoAddTaskLabel)
    }
}
