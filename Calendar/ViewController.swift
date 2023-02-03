import UIKit

// Class ViewController is a subclass of UIViewController and conforms to the UICollectionViewDelegate, UICollectionViewDataSource, and UITableViewDelegate protocols
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate {
    
    // monthLabel and collectionView are connected to the corresponding UI elements in the storyboard
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // totalSquares is an array of CalendarDay objects
    var totalSquares = [CalendarDay]()
    
    // viewDidLoad is called when the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // call setCellsView and setMonthView to initialize the view
        setCellsView()
        setMonthView()
    }

    // setCellsView sets the size of the cells in the collectionView
    func setCellsView() {
        // width is calculated as the width of the collectionView minus 5 divided by 7.5
        let width = (collectionView.frame.size.width - 5) / 7.5 
        // height is calculated as the height of the collectionView minus 5 divided by 7.5
        let height = (collectionView.frame.size.height - 5) / 7.5 
    
        // the flowLayout is cast as a UICollectionViewFlowLayout
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        // the item size of the flowLayout is set to the calculated width and height
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    // setMonthView updates the month and year displayed in the monthLabel and reloads the data in the collectionView
    func setMonthView() {
        // totalSquares is emptied
        totalSquares.removeAll()
        
        // daysInMonth is the number of days in the selectedDate
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        // firstDayOfMonth is the first day of the selectedDate
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        // startingSpaces is the number of blank spaces at the beginning of the first week of the selectedDate
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        // prevMonth is the previous month from the selectedDate
        let prevMonth = CalendarHelper().minusMonth(date: selectedDate)
        // daysInPrevMonth is the number of days in prevMonth
        let daysInPrevMonth = CalendarHelper().daysInMonth(date: prevMonth)
        
        // count is used to keep track of the number of cells created
        var count: Int = 1 
        
        // while loop continues until count is greater than 42
        while(count <= 42) {
            // calendarDay is a new CalendarDay object
            let calendarDay = CalendarDay()
            // if count is less than or equal to startingSpaces, it's a day from the previous month
            if count <= startingSpaces{
                // prevMonthDay is the previous month's day
                let prevMonthDay = daysInPrevMonth - startingSpaces + count
                calendarDay.day = String(prevMonthDay)
                calendarDay.month = CalendarDay.Month.previous
            } else if count - startingSpaces > daysInMonth {
                calendarDay.day = String(count - daysInMonth - startingSpaces)
                calendarDay.month = CalendarDay.Month.next
            }
            else {
                calendarDay.day = String(count - startingSpaces)
                calendarDay.month = CalendarDay.Month.current
            }
            // Add the calendar day to the array of total squares for the month view
            totalSquares.append(calendarDay)

            // Increment the count for each iteration
            count += 1
        }

        // Update the month label to display the selected month and year
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)

        // Reload the data in the collection view
        collectionView.reloadData()
    }
    
    // Define the function to create the cells in the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCell
        
        // Retrieve the calendar day for the current cell
        let calendarDay = totalSquares[indexPath.item]
        
        // Set the day of the month for the cell
        cell.dayOfMonth.text = calendarDay.day
        
        // Set the text color of the day of the month based on whether it is in the current, previous, or next month
        if(calendarDay.month == CalendarDay.Month.current) {
            cell.dayOfMonth.textColor = .black
        } else {
            cell.dayOfMonth.textColor = .gray
        }
        
        return cell
    }

    // Define the function to determine the number of cells in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }

    // Action to move to the previous month
    @IBAction func previousMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }

    // Action to move to the next month
    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }

    // Override function to disable autorotation
    override open var shouldAutorotate: Bool {
        return false
    }

    // Function to set the month view when the view appears
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setMonthView()
    }
}

