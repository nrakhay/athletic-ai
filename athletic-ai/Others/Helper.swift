//
//  Helper.swift
//  athletic-ai
//
//  Created by Nurali Rakhay on 14.06.2023.
//

import UIKit

class Helper {
    static func makeAttributedString(text: String, targetString: String, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        // Find the range of the target string within the complete text
        let range = (text as NSString).range(of: targetString)
        
        // Apply the desired color to the target string
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        
        return attributedString
    }
}


