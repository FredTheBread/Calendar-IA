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
        
        if(!nameTextField.text!.isEmpty) {
            EventsList.append(newEvent)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    class event {
        var title: String!
        var location: Location!
        var shots: Int!
        var allDay: Bool!
        var date: Date!
        
        init(title: String!, location: Location!, shots: Int!, allDay: Bool!, date: Date!) {
            self.title = title
            self.location = location
            self.shots = shots
            self.allDay = allDay
            self.date = date
        }
    }
}
