import Foundation

class CalendarDay {
    var day: String!
    var month: Month!
    
    enum Month {
        case previous
        case current
        case next
    }
}
