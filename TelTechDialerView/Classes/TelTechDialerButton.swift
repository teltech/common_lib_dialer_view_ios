//
//  TelTechDialerButton.swift
//  Pods
//
//  Created by Jason Clardy on 1/12/17.
//
//

import UIKit


@IBDesignable
public class TelTechDialerButton: UIButton {
    
    @IBInspectable var mainText: NSString?
    @IBInspectable var subText: NSString?
    
    @IBInspectable var icon: UIImage?
    
    @IBInspectable var isToggle: Bool = false
    @IBInspectable var isOn: Bool = true {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? = UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        var color: UIColor = UIColor.lightGray
        var textColor: UIColor = UIColor.white

        if isHighlighted || (self.isToggle && self.isOn) {
            color = UIColor.darkGray
            textColor = UIColor.lightGray
        }
        
        let bpath: UIBezierPath = UIBezierPath(ovalIn: rect.insetBy(dx: 1, dy: 1))
        color.set()
        bpath.stroke()
        if isHighlighted || (self.isToggle && self.isOn) {
            bpath.fill()
        }
        if let icon = self.icon {
            let size = icon.size
            
            icon.draw(at: CGPoint(x: rect.width * 0.5 - size.width * 0.5, y: rect.height * 0.5 - size.height * 0.5))
        } else {
            let font = UIFont.systemFont(ofSize: 32)
            
            let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
            textStyle.alignment = NSTextAlignment.center
            
            let mainTextRect = CGRect(x: 0, y: 8, width: rect.width, height: 36)
            
            mainText?.draw(in: mainTextRect, withAttributes: [NSForegroundColorAttributeName: textColor,
                NSFontAttributeName: font,
                NSParagraphStyleAttributeName: textStyle])
            
            let subTextRect = CGRect(x: 0, y: 42, width: rect.width, height: 20)

            
            subText?.draw(in: subTextRect, withAttributes: [NSForegroundColorAttributeName: textColor,
                                                      NSFontAttributeName: UIFont.systemFont(ofSize: 8.0),
                                                      NSParagraphStyleAttributeName: textStyle])
        }
    }

}
