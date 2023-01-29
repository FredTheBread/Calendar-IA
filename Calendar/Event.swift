import Foundation

var EventsList = [Event]()

class Event {
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in EventsList {
            if(Calendar.current.isDate(event.date, inSameDayAs: date)) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
