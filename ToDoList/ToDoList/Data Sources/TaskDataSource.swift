import Foundation

class TaskDataSource {
    
    private var tasks: [Task] = []
    
    init(){
        tasks = loadData()
    }
    
    private func saveData(_ tasks: [Task]){
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(tasks){
            UserDefaults.standard.set(encodedData,forKey: "ToDoList")
        }
    }
    
    private func loadData() -> [Task]{
        guard let data = UserDefaults.standard.data(forKey: "ToDoList") else { return [] }
        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode([Task].self, from: data) {
            return decodedData
        }
        return []
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func saveChanges() {
        saveData(tasks)
    }
    
    func append(task: Task) {
        tasks.append(task)
        saveData(tasks)
    }
    
    func remove(at: Int) {
        tasks.remove(at: at)
        saveData(tasks)
    }
    
    func task(at indexPath: IndexPath) -> Task{
        tasks[indexPath.row]
    }
}
