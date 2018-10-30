import Foundation
import Realm
import RealmSwift

class ToDo: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var isComplete: Bool = false
    @objc dynamic var dueDate: Date = Date()
    @objc dynamic var notes: String? = nil
    
    static let realm = try! Realm()
    
    init(title:String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
        super.init()
    }
    
    required init(){
        super.init()
    }
    required init(realm: RLMRealm, schema: RLMObjectSchema){
        super.init(realm: realm, schema: schema)
    }
    required init(value: Any, schema: RLMSchema){
        super.init(value: value, schema: schema)
    }
    static func loadToDos() -> [ToDo]? {
        var todos = [ToDo]()
        let todoObjects = realm.objects(ToDo.self)
        print(#function, todoObjects.count)
        todoObjects.forEach{ todos.append($0)}
        return todos
    }
    
    static func loadSampleToDos() -> [ToDo] {
        return [
            ToDo(title: "Купить хлеб", isComplete: false, dueDate: Date(), notes: "Бородинский"),
            ToDo(title: "Заказать торт", isComplete: false, dueDate: Date(), notes: "Заметка 2"),
            ToDo(title: "Сдать вещи в химчистку", isComplete: false, dueDate: Date(), notes: "Заметка 3"),
            ToDo(title: "Помыть машину", isComplete: false, dueDate: Date(), notes: "Заметка 4"),
        ]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
