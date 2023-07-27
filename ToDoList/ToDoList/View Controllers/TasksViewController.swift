
import UIKit

class TasksViewController: UITableViewController, AddTaskViewControllerDelegate, TaskCellDelegate, DetailedWithEditViewControllerDelegate {
        
    var tasksDataSource = TaskDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let addTaskScreen = AddTaskViewController(nibName: nil, bundle: nil)
        addTaskScreen.delegate = self
        present(addTaskScreen, animated: true)
    }
    
    func UpdateData() {
        tasksDataSource.saveChanges()
    }
    
    func addTaskViewController(_ vc: AddTaskViewController, didCreate task: Task) {
        tasksDataSource.append(task: task)
        tableView.insertRows(at: [IndexPath(row: tasksDataSource.numberOfTasks()-1, section: 0)], with: .automatic)
        vc.dismiss(animated: true)
    }
    
    func saveEdits() {
        tasksDataSource.saveChanges()
        tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedWithEditViewController = DetailedWithEditViewController()
        detailedWithEditViewController.task = tasksDataSource.task(at: indexPath)
        detailedWithEditViewController.delegate = self
        present(detailedWithEditViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        cell.delegate = self
        cell.task = tasksDataSource.task(at: indexPath)
        return cell
    }
}


