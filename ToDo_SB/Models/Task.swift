import Foundation

struct Task: Codable {
    var name: String
    var date: Date
    var category: TaskCategory

    enum CodeKeys: CodingKey {
        case name
        case date
        case category
    }

    init(name: String, date: Date, category: TaskCategory) {
        self.name = name
        self.date = date
        self.category = category
    }

    init() {
        self.init(name: "", date: Date(), category: TaskCategory.other)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodeKeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(Date.self, forKey: .date)
        category = try container.decode(TaskCategory.self, forKey: .category)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(date, forKey: .date)
        try container.encode(category.rawValue, forKey: .category)
    }
}
