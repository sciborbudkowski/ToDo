import UIKit

class TasksDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    weak var delegate: MessagingProtocol?

    var data: [Task] = [] {
        didSet {
            saveData()
        }
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskViewCell.identifier, for: indexPath)
                as? TaskViewCell
        else { return UITableViewCell() }
        cell.model = data[indexPath.row]
        if data.count == 1 {
            cell.hideHint = false
        }

        return cell
    }

    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    // swiftlint:disable line_length
    internal func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Usuń") { [weak self] _, _, _ in
            self?.delegate?.taskWillRemove(rowNumber: indexPath.row)
        }

        return UISwipeActionsConfiguration(actions: [action])
    }

    func loadData() {
        if let storedData = UserDefaults.standard.data(forKey: "ToDo_SB_data") {
            do {
                let decoder = JSONDecoder()
                data = try decoder.decode([Task].self, from: storedData)
            } catch {
                delegate?.errorLoadingUserDefaultsData()
            }
        }
    }

    func saveData() {
        do {
            let encoder = JSONEncoder()
            let json = try encoder.encode(data)
            UserDefaults.standard.set(json, forKey: "ToDo_SB_data")
        } catch {
            delegate?.errorSavingUserDefaultsData()
        }
    }
}
