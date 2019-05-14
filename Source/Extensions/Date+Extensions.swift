//
//  Date+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

import Foundation

public extension Date {
    
    /**
    Get the age from the date
    */
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    
    /**
    convert a date to the given format string. Default: "dd.MM.yy um HH:mm"
    */
    func toReadableDate(format: String =  "dd.MM.yy um HH:mm") -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
        
    }
    
    /**
    Converts a date to a readable date string without year. E.g: Vor 2 Minuten
    */
    // TODO: add localization
    func toReadableDateWithoutYear() -> String {
        let formatter = DateFormatter()
        
        //let unitFlags: Calendar = [.Hour, .Day, .Month, .Year]
        let calendar = Calendar(identifier: .gregorian)
        var selfComponents: DateComponents? = calendar.dateComponents(in: .autoupdatingCurrent, from: self)
        var currentComponents: DateComponents? = calendar.dateComponents(in: .autoupdatingCurrent, from: Date())
        
        let timeInterval = self.timeIntervalSinceNow * -1
        print(timeInterval)
        //formatter.string(from: twentyFourHours + timeInterval) ?? "Abgelaufen")"
        let minutes = timeInterval / 60
        let hours = minutes / 60
        
        if minutes < 1 {
            formatter.dateFormat = "' Vor \(Int(timeInterval.rounded())) Sekunden"
        } else if minutes < 60 {
            formatter.dateFormat = "' Vor \(Int(minutes.rounded())) Minuten"
        } else if hours < 24 {
            if hours < 1.5 {
                formatter.dateFormat = "' Vor einer Stunde"
            } else {
                formatter.dateFormat = "' Vor \(Int(hours.rounded())) Stunden"
            }
        } else if hours < 48 {
            formatter.dateFormat = "' Gestern um 'HH:mm' Uhr"
        } else {
            
            if selfComponents?.year == currentComponents?.year {
                if selfComponents?.day == currentComponents?.day && selfComponents?.month == currentComponents?.month {
                    formatter.dateFormat = "' Heute um 'HH:mm' Uhr"
                } else {
                    formatter.dateFormat = "dd.' 'MMM' um 'HH:mm' Uhr"
                }
            } else {
                formatter.dateFormat = "dd.' 'MMM' 'yy' um 'HH:mm' Uhr"
            }
        }
        
        
        
        return formatter.string(from: self)
    }
}




public extension Date {
    
    /**
    Get user’s current calendar.
    */
    var calendar: Calendar {
        return Calendar.current
    }
    
    /**
    Era
    */
    var era: Int {
        return calendar.component(.era, from: self)
    }
    
    /**
    Year
    */
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: newValue, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /**
    Quarter
    */
    var quarter: Int {
        return calendar.component(.quarter, from: self)
    }
    
    /**
    Month
    */
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: newValue, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /**
     Week of year
     */
    var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self)
    }
    
    /**
     Week of month
     */
    var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self)
    }
    
    /**
    Weekday
    */
     var weekday: Int {
        return calendar.component(.weekday, from: self)
    }
    
    /// Day.
     var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: newValue, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Hour.
     var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: newValue, minute: minute, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Minutes.
     var minute: Int {
        get {
            return calendar.component(.minute, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: newValue, second: second, nanosecond: nanosecond)
        }
    }
    
    /// Seconds.
     var second: Int {
        get {
            return calendar.component(.second, from: self)
        }
        set {
            self = Date(calendar: calendar, timeZone: timeZone, era: era, year: year, month: month, day: day, hour: hour, minute: minute, second: newValue, nanosecond: nanosecond)
        }
    }
    
    /// Nanoseconds.
     var nanosecond: Int {
        return calendar.component(.nanosecond, from: self)
    }
    
    /// Check if date is in future.
     var isInFuture: Bool {
        return self > Date()
    }
    
    /// Check if date is in past.
     var isInPast: Bool {
        return self < Date()
    }
    
    /// Check if date is in today.
     var isInToday: Bool {
        return self.day == Date().day && self.month == Date().month && self.year == Date().year
    }
    
    /// Time zone used by system.
    var timeZone: TimeZone {
        return self.calendar.timeZone
    }
    
    /// UNIX timestamp from date.
    var unixTimestamp: Double {
        return timeIntervalSince1970
    }
}

public extension Date {
    
    /// Create a new date form calendar components.
    ///
    /// - Parameters:
    ///   - calendar: Calendar (default is current).
    ///   - timeZone: TimeZone (default is current).
    ///   - era: Era (default is current era).
    ///   - year: Year (default is current year).
    ///   - month: Month (default is current month).
    ///   - day: Day (default is today).
    ///   - hour: Hour (default is current hour).
    ///   - minute: Minute (default is current minute).
    ///   - second: Second (default is current second).
    ///   - nanosecond: Nanosecond (default is current nanosecond).
    init(
        calendar: Calendar? = Calendar.current,
        timeZone: TimeZone? = TimeZone.current,
        era: Int? = Date().era,
        year: Int? = Date().year,
        month: Int? = Date().month,
        day: Int? = Date().day,
        hour: Int? = Date().hour,
        minute: Int? = Date().minute,
        second: Int? = Date().second,
        nanosecond: Int? = Date().nanosecond) {
        
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        
        self = calendar?.date(from: components) ?? Date()
    }
    
    /// Create date object from ISO8601 string.
    ///
    /// - Parameter iso8601String: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSSZ).
    init(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self = dateFormatter.date(from: iso8601String) ?? Date()
    }
    
    /// Create new date object from UNIX timestamp.
    ///
    /// - Parameter unixTimestamp: UNIX timestamp.
    init(unixTimestamp: Double) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }
    
}
