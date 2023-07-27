import UIKit

protocol DetailedWithEditViewControllerDelegate: AnyObject {
    func saveEdits()
}

class DetailedWithEditViewController: UIViewController {
    
    var task: Task?
    
    weak var delegate: DetailedWithEditViewControllerDelegate?
    
    @IBAction func editPressed(_ sender: Any) {
        toggleEditMode()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descrTextView: UITextView!
    
    
    @IBAction func savePressed(_ sender: Any) {
        task?.updateTaskTexts(name: nameTextField.text!, description: descrTextView.text!)
        toggleEditMode()
        delegate?.saveEdits()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        nameTextField.text = task?.name
        descrTextView.text = task?.description
        toggleEditMode()
    }
    
    private func toggleEditMode(){
        saveButton.isHidden = !saveButton.isHidden
        cancelButton.isHidden = !cancelButton.isHidden
        
        backButton.isHidden = !backButton.isHidden
        editButton.isHidden = !editButton.isHidden
        
        nameTextField.isUserInteractionEnabled = !nameTextField.isUserInteractionEnabled
        descrTextView.isEditable = !descrTextView.isEditable
        
        if (nameTextField.borderStyle == .none) {
            descrTextView.layer.borderWidth = 2
            nameTextField.borderStyle = .line
            nameTextField.layer.borderWidth = 2
        }
        else {
            descrTextView.layer.borderWidth = 0
            nameTextField.borderStyle = .none
            nameTextField.layer.borderWidth = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descrTextView.layer.borderWidth = 0
        descrTextView.layer.borderColor = UIColor.black.cgColor
        nameTextField.borderStyle = .none
        nameTextField.layer.borderWidth = 0
        nameTextField.layer.borderColor = UIColor.black.cgColor
        
        nameTextField.isUserInteractionEnabled = false
        descrTextView.isEditable = false
        
        nameTextField.text = task?.name
        descrTextView.text = task?.description
        
        saveButton.isHidden = true
        cancelButton.isHidden = true
    }
}
