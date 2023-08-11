//
//  Register.swift
//  GreenMood
//
//  Created by Alparslan Cafer on 17.06.2023.
//

import UIKit

struct Register {
    let fullname    : String
    let email       : String
    let password    : String
    let profileImage: UIImage
}


//MARK: - ProgressHUD

public enum AnimationType {
    case systemActivityIndicator
    case horizontalCirclesPulse
    case lineScaling
    case singleCirclePulse
    case multipleCirclePulse
    case singleCircleScaleRipple
    case multipleCircleScaleRipple
    case circleSpinFade
    case lineSpinFade
    case circleRotateChase
    case circleStrokeSpin
}



public enum AlertIcon {
    case heart
    case doc
    case bookmark
    case moon
    case star
    case exclamation
    case flag
    case message
    case question
    case bolt
    case shuffle
    case eject
    case card
    case rotate
    case like
    case dislike
    case privacy
    case cart
    case search
}

