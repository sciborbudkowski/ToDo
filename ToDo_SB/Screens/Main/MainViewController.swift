import UIKit

protocol MessagingProtocol: AnyObject {
    func newTaskAdded(task: Task)
    func taskWillRemove(rowNumber: Int)
    func errorLoadingUserDefaultsData()
    func errorSavingUserDefaultsData()
}

class MainViewController: UIViewController {

    private let customView = MainView()
    private let dataSource = TasksDataSource()

    override func viewDidLoad() {
        view = customView

        customView.backgroundColor = .white
        customView.headerView.addTaskButton.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
        customView.addTaskTextButton.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)

        customView.tasksTable.dataSource = dataSource
        customView.tasksTable.delegate = dataSource

        dataSource.delegate = self
        dataSource.loadData()

        updateView()
    }

    private func showToastMessage(_ message: String, color: UIColor) {
        let toast = ToastMessage()
        toast.message = message
        toast.toastColor = color
        toast.modalPresentationStyle = .custom
        toast.modalTransitionStyle = .crossDissolve
        present(toast, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            toast.dismiss(animated: true)
        }
    }

    private func updateView() {
        if dataSource.data.isEmpty {
            customView.tasksTable.isHidden = true
            customView.mainStackView.isHidden = false
        } else {
            customView.tasksTable.isHidden = false
            customView.mainStackView.isHidden = true
        }
    }

    @objc private func addTaskTapped() {
        let addTaskViewController = AddTaskViewController()
        addTaskViewController.modalTransitionStyle = .crossDissolve
        addTaskViewController.modalPresentationStyle = .custom
        addTaskViewController.delegate = self
        present(addTaskViewController, animated: true)
    }
}

extension MainViewController: MessagingProtocol {

    internal func newTaskAdded(task: Task) {
        dataSource.data.append(task)
        customView.tasksTable.reloadData()
        updateView()

        showToastMessage("Nowe zadanie zostało dodane.", color: Colors.addedItemToastColor)
    }

    internal func taskWillRemove(rowNumber: Int) {
        let taskName = dataSource.data[rowNumber].name

        let alert = UIAlertController(title: "Uwaga!",
                                      message: "Czy chcesz usunąć zadanie o nazwie\n\(taskName)?",
                                      preferredStyle: .alert)
        let actionYes = UIAlertAction(title: "Usuń", style: .destructive) { [weak self] _ in
            self?.dataSource.data.remove(at: rowNumber)
            self?.customView.tasksTable.reloadData()
            self?.updateView()
            self?.showToastMessage("Zadanie zostało usunięte.", color: Colors.removedItemToastColor)
        }
        let actionNo = UIAlertAction(title: "Anuluj", style: .cancel)
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        present(alert, animated: true)
    }

    internal func errorLoadingUserDefaultsData() {
        let alert = UIAlertController(title: "Błąd!",
                                      message: "Nie można załadować listy zadań.",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }

    internal func errorSavingUserDefaultsData() {
        let alert = UIAlertController(title: "Błąd!",
                                      message: "Nie można zapisać listy zadań.",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
