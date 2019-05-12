//
//  NSMutableAttributedString+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//


public extension NSMutableAttributedString {
    
    /**
    Apply a font and a font color to the attributed string
    */
    func with(font: UIFont, fontColor: UIColor) -> NSMutableAttributedString {
        self.enumerateAttribute(NSAttributedString.Key.font, in: NSMakeRange(0, self.length), options: .longestEffectiveRangeNotRequired, using: { (value, range, stop) in
            let originalFont = value as! UIFont
            if let newFont = applyTraitsFromFont(originalFont, to: font) {
                self.addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
                self.addAttribute(NSAttributedString.Key.foregroundColor, value: fontColor, range: range)
            }
        })
        return self
    }
    
    /**
    Ensures that the new font applies traits from the original font
    */
    private func applyTraitsFromFont(_ f1: UIFont, to f2: UIFont) -> UIFont? {
        let originalTrait = f1.fontDescriptor.symbolicTraits
        
        if originalTrait.contains(.traitBold) {
            var traits = f2.fontDescriptor.symbolicTraits
            traits.insert(.traitBold)
            if let fd = f2.fontDescriptor.withSymbolicTraits(traits) {
                return UIFont.init(descriptor: fd, size: 0)
            }
        }
        return f2
    }
    
}
