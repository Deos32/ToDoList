import UIKit



class TaskDataSource {
    
    weak var delegate: DataSourceDelegate?
    
    private var tasks: [Task] = []
    
    init(){
        tasks = [
            Task(name: "Clean the cat", description: "", isDone: true),
            Task(name: "Clean the room", description: "", isDone: false),
            Task(name: "Go on a walk", description: "", isDone: false),
            Task(name: "Check the news", description: "", isDone: false),
            Task(name: "Sleep with cat", description: "", isDone: false)
        ]
    }
    
    func updateData(data: [Task]){
        tasks = data
        delegate?.didUpdateData(data: tasks)
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func append(task: Task, to tableView: UITableView) {
        tasks.append(task)
        tableView.insertRows(at: [IndexPath(row: tasks.count-1, section: 0)], with: .automatic)
    }
    
    func remove(at: Int) {
        tasks.remove(at: at)
    }
    
    func task(at indexPath: IndexPath) -> Task{
        tasks[indexPath.row]
    }
}
