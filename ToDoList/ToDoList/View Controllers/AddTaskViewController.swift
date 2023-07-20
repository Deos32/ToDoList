
import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescrTextField: UITextView!
    
    var taskDataSource: TaskDataSource?
    var tableView: UITableView?
    
    
    @IBAction func cancelPressed(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @IBAction func addPressed(_ sender: UIButton){
        let task = Task(name: taskNameTextField.text!,description: taskDescrTextField.text!)
        taskDataSource?.append(task: task, to: tableView!)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDescrTextField.layer.borderWidth = 1
        taskDescrTextField.layer.borderColor = UIColor.black.cgColor
    }
}
