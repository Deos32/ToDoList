
import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func addTaskViewController(_ vc: AddTaskViewController, didCreate task: Task)
}

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescrTextField: UITextView!
    
    weak var delegate: AddTaskViewControllerDelegate?
    
    @IBAction func cancelPressed(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @IBAction func addPressed(_ sender: UIButton){
        let task = Task(name: taskNameTextField.text!,description: taskDescrTextField.text!)
        delegate?.addTaskViewController(self, didCreate: task)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDescrTextField.layer.borderWidth = 1
        taskDescrTextField.layer.borderColor = UIColor.black.cgColor
    }
}
