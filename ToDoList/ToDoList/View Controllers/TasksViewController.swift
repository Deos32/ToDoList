
import UIKit

protocol DataSourceDelegate: AnyObject {
    func didUpdateData(data: [Task])
}

class TasksViewController: UITableViewController, DataSourceDelegate {
    
    var tasksDataSource = TaskDataSource()
    
    var tasks: [Task]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksDataSource.delegate = self
        tasksDataSource.updateData(data: [
            Task(name: "Clean the cat", description: "", isDone: true),
            Task(name: "Clean the room", description: "", isDone: false),
            Task(name: "Go on a walk", description: "", isDone: false),
            Task(name: "Check the news", description: "", isDone: false),
            Task(name: "Sleep with cat", description: "", isDone: false)
        ])
    }
    
    func didUpdateData(data: [Task]) {
        for task in data{
            print(task)
        }
        print("TEST")
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let addTaskScreen = AddTaskViewController(nibName: nil, bundle: nil)
        
        addTaskScreen.tableView = tableView
        addTaskScreen.taskDataSource = tasksDataSource
        present(addTaskScreen, animated: true)
    }
}

extension TasksViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksDataSource.numberOfTasks()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tasksDataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        cell.task = tasksDataSource.task(at: indexPath)
        return cell
    }
}


