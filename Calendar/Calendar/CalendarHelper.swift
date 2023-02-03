import Foundation
import UIKit

class CalendarHelper {
    
    let calendar = Calendar.current
    // Add 1 month to a given date and return result
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    // Subtract 1 month from a given date and return result
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    // Return month string (e.g. January) for a given date
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    // Return month and day string (e.g. January 31) for a given date
    func monthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd"
        return dateFormatter.string(from: date)
    }
    
    // Return year string (e.g. 2021) for a given date
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    // Return time string (e.g. 14:30) for a given date
    func timeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    // Return number of days in a given date's month
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    // Return day of the month (1-31) for a given date
    func daysOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    // Return number of hours for a given date
    func hoursFromDate(date: Date) -> Int {
        let components = calendar.dateComponents([.hour], from: date)
        return components.hour!
    }
    
    // Return the first day of the month for a given date
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    // Return week day (0-6) for a given date
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    // Return week day string (e.g. Monday) for a given date
    func weekDayAsString(date: Date) -> String {
        
        switch weekDay(date: date) {
        case 0:
            return "Sunday"
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wednesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        default:
            return ""
        }
        
    }
    
    // Add specified number of days to a given date and return result
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    // Return the most recent Sunday for a given date
    func sundayForDate(date: Date) -> Date {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        while(current > oneWeekAgo) {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if(currentWeekDay == 1) {
                return current
            }
            
            current = addDays(date: current, days: -1)
        }
        return current
    }
}
