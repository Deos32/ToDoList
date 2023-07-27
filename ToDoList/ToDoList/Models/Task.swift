import Foundation

class Task: Codable {
    private (set) var name: String?
    private (set) var description: String?
    private (set) var isDone: Bool = false
    
    init(name: String? = nil, description: String? = nil) {
        self.name = name
        self.description = description
    }
    
    func updateTaskState() {
        isDone = !isDone
    }
    
    func updateTaskTexts(name: String, description: String){
        self.name = name
        self.description = description
    }
}
