//
//  Extensions.swift
//  firebase-chat
//
//  Created by Fernando Marins on 15/12/21.
//

import Foundation
import UIKit

extension UIView {
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return height + top
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return width + left
    }
}

extension UIViewController {
    
    func showAlert(title: String, message: String, titleAction: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: titleAction, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
