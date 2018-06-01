//
//  String+ContentFromatting.swift
//  Mojaz
//
//  Created by abuzeid ibrahim on 5/9/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import Foundation

extension String {
    func htmlToText() -> NSAttributedString? {
        do {
            let str = try NSAttributedString(data: self.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            return str
        } catch {
            print(error)
            return nil
        }
    }

    func englishNumbers() -> String {

        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = Locale(identifier: "EN")
        var result = ""
        self.forEach({char in
            let newChar = formatter.number(from: "\(char)")
            if let c = newChar {
                result = "\(result)\( c )"

            } else {
                result = "\(result)\( char )"

            }

        })

        return result

    }
    func mojazDateFormat() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: self) {

            return (dateFormatterPrint.string(from: date ))
        }
        return self

    }
    func profileDateFormat() -> String {
        let dateFormatterGet = DateFormatter()

        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: self) {

            return (dateFormatterPrint.string(from: date ))
        }
        return self

    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
  

    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }

    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }

    func convert(from format:String,toFormat:String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        //dateFormatter.locale = Locale.init(identifier: "en_GB")
        if let dateObj = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat
            return dateFormatter.string(from: dateObj)
        } else {
            return self
        }

    }
    ////----

    subscript (i: Int) -> Character {

        return self[index(startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[Range(start ..< end)])
    }
    //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

}
