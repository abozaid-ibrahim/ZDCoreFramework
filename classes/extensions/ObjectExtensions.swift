//
//  ObjectExtensions.swift
//  Captumia
//
//  Created by mac on 5/12/17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation
import UIKit
extension NSAttributedString {
    static func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }
}

extension Dictionary {

    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }

    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}
extension URLResponse {
    func statusCode() -> Int {
        let httpResponse = self as! HTTPURLResponse
        return httpResponse.statusCode
    }

    func validCode() -> Bool {
        let httpResponse = self as! HTTPURLResponse
        return httpResponse.statusCode >= 200 && httpResponse.statusCode < 400
    }
}

extension Date {

        func getElapsedInterval() -> String {

            let interval = Calendar.current.dateComponents([.year, .month, .day, .hour ], from: self, to: Date())

            if let year = interval.year, year > 0 {
                return year == 1 ? "\(year)" +  s.id.year :
                    "\(year)" + s.id.years
            } else if let month = interval.month, month > 0 {
                return month == 1 ? "\(month)" + s.id.month :
                    "\(month)" +  s.id.months
            } else if let day = interval.day, day > 0 {
                return day == 1 ? "\(day)" +  s.id.day :
                    "\(day)" +  s.id.days
            } else if let hour = interval.hour, hour > 0 {
                if hour > 1 && hour < 10 {
                    return "\(hour)" + s.id.hours
                } else {
                    return "\(hour)" +  s.id.hour }

            } else {
                return s.id.a_moment

            }

        }

    func getFormattedTimeFromPicker() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = constants.default_uipicker_datetime

        let dateString = "\(self)"
        if let dateObj = dateFormatter.date(from: dateString) {

            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.string(from: dateObj)
        } else {
            return "\(self)"
        }

    }

    func getFormattedDateFromPicker() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = constants.default_uipicker_datetime
        let dateString = "\(self)"
        if let dateObj = dateFormatter.date(from: dateString) {

            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: dateObj)
        } else {
            return "\(self)"
        }
    }

    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false

        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }

        //Return Result
        return isGreater
    }

    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false

        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }

        //Return Result
        return isLess
    }

    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false

        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }

        //Return Result
        return isEqualTo
    }
    /*
     func addDays(daysToAdd: Int) -> NSDate {
     let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
     let dateWithDaysAdded: NSDate = self.dateByAddingTimeInterval(secondsInDays)
     
     //Return Result
     return dateWithDaysAdded
     }
     
     func addHours(hoursToAdd: Int) -> NSDate {
     let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
     let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInHours)
     
     //Return Result
     return dateWithHoursAdded
     }*/
}

extension NSObject {

    static func debug() {
        print(#file)
        print(#function)
        print(#line)

    }
}
extension Int {
    func cgfloat() -> CGFloat {
        return CGFloat(self)
    }
}

public extension UIDevice {

    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }

}
