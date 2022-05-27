import UIKit

class TaskViewCell: TableCell {

    public var model: Task? {
        didSet {
            guard let model = model else { return }
            guard let settings = TaskCategories.categories.first(where: {
                $0.type == model.category
            }) else { return }
            nameLabel.text = model.name
            dateLabel.text = model.date.formatted(date: .complete, time: .omitted)
            categoryIcon.image = settings.icon
            backgroundColor = settings.backgroundColor
        }
    }

    public var hideHint = true {
        didSet {
            hintView.isHidden = hideHint

            if !hideHint {
                UIView.animate(withDuration: 1.0,
                               delay: 5,
                               options: .curveEaseInOut,
                               animations: {
                    self.hintView.alpha = 1.0
                })
                UIView.animate(withDuration: 1.0,
                               delay: 10,
                               options: .curveEaseInOut,
                               animations: {
                    self.hintView.alpha = 0.0
                })
            }
        }
    }

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultDemiBoldFont(ofSize: 18)
        label.textColor = Colors.labelTextColor
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getDefaultFont(ofSize: 14)
        label.textColor = Colors.dateLabelTextColor
        return label
    }()

    private let categoryIcon: UIImageView = {
        let view = UIImageView()
        view.tintColor = .black
        return view
    }()

    private let hintView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.hintBackgroundColor
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        view.isHidden = true
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()

    private let hintLabel: UILabel = {
        let label = UILabel()
        label.text = "Przesuń w lewo,\naby usunąć zadanie "
        label.font = Fonts.getDefaultFont(ofSize: 12)
        label.textColor = Colors.labelTextColor
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()

    private let hintIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "hand.point.left")
        view.tintColor = Colors.labelTextColor
        return view
    }()

    override func setupLayoutConstraints() {
        contentView.addSubviews([nameLabel, dateLabel, categoryIcon, hintView])

        categoryIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        categoryIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        categoryIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        categoryIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true

        nameLabel.topAnchor.constraint(equalTo: categoryIcon.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: categoryIcon.trailingAnchor, constant: 10).isActive = true
        nameLabel.sizeToFit()

        dateLabel.bottomAnchor.constraint(equalTo: categoryIcon.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: categoryIcon.trailingAnchor, constant: 10).isActive = true

        hintView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        hintView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        hintView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        hintView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        hintView.addSubviews([hintLabel, hintIcon])

        hintLabel.centerYAnchor.constraint(equalTo: hintView.centerYAnchor).isActive = true
        hintLabel.trailingAnchor.constraint(equalTo: hintView.trailingAnchor, constant: -10).isActive = true
        hintLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true

        hintIcon.centerYAnchor.constraint(equalTo: hintView.centerYAnchor).isActive = true
        hintIcon.trailingAnchor.constraint(equalTo: hintLabel.leadingAnchor).isActive = true
        hintIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        hintIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
