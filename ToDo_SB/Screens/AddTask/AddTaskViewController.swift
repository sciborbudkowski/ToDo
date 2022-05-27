import UIKit

class AddTaskViewController: UIViewController {

    weak var delegate: MessagingProtocol?

    let customView = AddTaskView()

    private var newTask = Task()

    override func viewDidLoad() {
        view = customView

        customView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        customView.addTaskButton.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func addTaskButtonTapped() {
        if let taskName = customView.nameTextField.text, taskName != "" {
            newTask.name = taskName
        } else {
            let alertVC = UIAlertController(title: "Błąd",
                                            message: "Nazwa zadania nie może być pusta.",
                                            preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.customView.nameTextField.becomeFirstResponder()
            }

            alertVC.addAction(okAction)
            present(alertVC, animated: true)
            return
        }

        if customView.categoryControl.selectedSegmentIndex == -1 {
            let alertVC = UIAlertController(title: "Błąd",
                                            message: "Nie wybrano kategorii zadania.",
                                            preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.customView.categoryControl.becomeFirstResponder()
            }

            alertVC.addAction(okAction)
            present(alertVC, animated: true)
            return
        } else {
            let index = customView.categoryControl.selectedSegmentIndex
            guard let titleForIndex = customView.categoryControl.titleForSegment(at: index) else {
                fatalError("titleForIndex should not be nil here")
            }
            guard let category = TaskCategory(rawValue: titleForIndex) else {
                fatalError("category should not be nil here")
            }
            newTask.category = category
        }

        newTask.date = customView.datePicker.date

        dismiss(animated: true)
        delegate?.newTaskAdded(task: newTask)
    }
}
