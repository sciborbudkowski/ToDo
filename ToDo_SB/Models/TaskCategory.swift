import Foundation
import UIKit

struct TaskCategoryType {
    var type: TaskCategory
    var icon: UIImage
    var backgroundColor: UIColor
}

enum TaskCategory: String, Decodable, CaseIterable {
    case work = "Praca"
    case shopping = "Zakupy"
    case other = "Inne"
}

class TaskCategories {

    static let categories: [TaskCategoryType] = [
        TaskCategoryType(type: .work,
                         icon: UIImage(systemName: "rectangle.inset.filled.and.person.filled")!,
                         backgroundColor: Colors.category1Color),
        TaskCategoryType(type: .shopping,
                         icon: UIImage(systemName: "cart.fill")!,
                         backgroundColor: Colors.category2Color),
        TaskCategoryType(type: .other,
                         icon: UIImage(systemName: "wand.and.rays")!,
                         backgroundColor: Colors.category3Color)
    ]
}
