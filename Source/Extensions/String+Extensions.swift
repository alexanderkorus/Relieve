//
//  String+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//

import Foundation

public extension String {
    
    /**
    Checks if all the characters inside the string are alphabets
    */
    var containsAlphabets: Bool {
        let set = CharacterSet.letters
        return self.utf16.contains {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        }
    }
    
    /**
    Returns the percent encoded string with url host allowed characters
    */
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /**
    Returns the json escaped string
    */
    var jsonEscaped: String {
        let customAllowedSet =  NSCharacterSet(charactersIn:":,").inverted
        return self.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
    }
    
    /**
    Returns the utf8 encoded data from the string
    */
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
    
    /**
    Is true if the string is a number
    */
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    /**
    Returns a NSMutableAttributedString with html encoding
    */
    func htmlAttributedString() -> NSMutableAttributedString {
        
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
            else { return NSMutableAttributedString() }
        
        guard let formattedString = try? NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) else {
            return NSMutableAttributedString()
        }
        
        return formattedString
    }
    
    /**
    Converts a String to the given dateFormat
    */
    // TODO: Add enum with different format strings: https://nsdateformatter.com
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //Your date format
        //dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        
        return dateFormatter.date(from: self)
    }
    
    /**
    Safe String to URL unwrapping. If resolves to nil, it will return a File URL
    */
    var url: URL {
        get {
            if let url = URL(string: self) {
                return url
            } else {
                return URL(fileURLWithPath: self)
            }
        }
    }

	/**
	Returns the localized String for the given key as string
	*/
	var localized: String {
		NSLocalizedString(self, comment: "")
	}

	/// Replace the passed strings to the placeholder strings in self in format {0} .. {X}
	/// - Parameter params: One or multiple strings
	func replaced(with params: String?...) -> String {
		var copy = self
		params.enumerated().forEach { idx, param in
			guard let string = param else { return }
			copy = copy.replacingOccurrences(of: "{\(idx)}", with: string)
		}
		return copy
	}

	func replaced(string: String, with param: String) -> String {
		var copy = self
		copy = copy.replacingOccurrences(of: string, with: string)
		return copy
	}

	/**
	Returns the string trimmed from all whitespaces
	*/
	func trim() -> String {
		var copy = self
		copy = copy.replacingOccurrences(of: " ", with: "")
		return copy
	}
}
