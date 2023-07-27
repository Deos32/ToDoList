import UIKit

protocol TaskCellDelegate: AnyObject{
    func UpdateData()
}

class TaskCell : UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var stateButton: UIButton!
    
    weak var delegate: TaskCellDelegate?
    
    private func makeAttributedAtring(string: String, doStrike: Bool) -> NSMutableAttributedString{
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: string)
        if !doStrike { return attributeString }
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
    
    private func switchState() {
        if  task.isDone {
            taskLabel.attributedText = makeAttributedAtring(string: task.name!,doStrike: true)
            stateButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }
        else {
            stateButton.setImage(UIImage(), for: .normal)
            taskLabel.attributedText = makeAttributedAtring(string: task.name!,doStrike: false)
        }
    }
    
    var task: Task! {
        didSet{
            switchState()
        }
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func stateButtonPressed(_ sender: UIButton) {
        task.updateTaskState()
        delegate?.UpdateData()
        switchState()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stateButton.layer.cornerRadius = 5
        stateButton.layer.borderWidth = 2
    }
}
