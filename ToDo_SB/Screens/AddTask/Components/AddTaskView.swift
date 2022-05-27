import UIKit

class AddTaskView: View {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.addNewTaskViewBackgroundColor
        view.layer.cornerRadius = 10
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultFont(ofSize: 14)
        label.textColor = Colors.labelTextColor
        label.text = "Nazwa zadania:"
        return label
    }()

    lazy var nameTextField: UITextField = {
        let field = UITextField()
        field.font = Fonts.getDefaultFont(ofSize: 14)
        field.backgroundColor = Colors.textFieldBackgroundColor
        field.borderStyle = .roundedRect
        return field
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultFont(ofSize: 14)
        label.textColor = Colors.labelTextColor
        label.text = "Data wykonania:"
        return label
    }()

    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.timeZone = NSTimeZone.local
        picker.locale = Locale.current
        picker.backgroundColor = .white
        picker.datePickerMode = .date
        return picker
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultFont(ofSize: 14)
        label.textColor = Colors.labelTextColor
        label.text = "Kategoria zadania:"
        return label
    }()

    let categoryControl: UISegmentedControl = {
        let items = TaskCategory.allCases.map { item in
            return item.rawValue
        }
        let control = UISegmentedControl(items: items)
        return control
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

    let cancelButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.borderless()
        configuration.title = "Anuluj"
        configuration.titlePadding = 10
        configuration.background.backgroundColor = Colors.cancelButtonBackgroundColor
        configuration.baseForegroundColor = Colors.addNewTaskButtonLabelColor
        configuration.cornerStyle = .medium
        button.configuration = configuration
        return button
    }()

    override func setupProperties() {
        backgroundColor = Colors.addNewTaskViewOuterColor
    }

    override func setupConstraints() {
        addSubviews([containerView])

        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 500).isActive = true

        containerView.addSubviews([nameTextField,
                                   nameLabel,
                                   dateLabel,
                                   datePicker,
                                   categoryLabel,
                                   categoryControl,
                                   addTaskButton,
                                   cancelButton])

        nameTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.75).isActive = true

        nameLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true

        dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true

        datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true

        categoryLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true

        categoryControl.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor).isActive = true
        categoryControl.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        categoryControl.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true

        addTaskButton.topAnchor.constraint(equalTo: categoryControl.bottomAnchor, constant: 20).isActive = true
        addTaskButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true

        cancelButton.topAnchor.constraint(equalTo: categoryControl.bottomAnchor, constant: 20).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
    }
}
