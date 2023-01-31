import UIKit

class EventEditViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        datePicker.date = selectedDate
    }
        
    @IBAction func saveAction(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = EventsList.count
        newEvent.name = nameTextField.text
        newEvent.date = datePicker.date
        
        EventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
}
