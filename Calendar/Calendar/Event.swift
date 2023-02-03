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
    
    func eventsForDateAndTime(date: Date, hour: Int) -> [Event] {
        var daysEvents = [Event]()
        for event in EventsList {
            if(Calendar.current.isDate(event.date, inSameDayAs: date)) {
                
                let eventHour = CalendarHelper().hoursFromDate(date: event.date)
                if(eventHour == hour) {
                    daysEvents.append(event)
                }
            }
        }
        return daysEvents
    }
}
