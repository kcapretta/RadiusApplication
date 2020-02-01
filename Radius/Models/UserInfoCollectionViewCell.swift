//
//  UserInfoCollectionViewCell.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/31/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class UserInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var infoIconImageView: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var interestedInLabel: UILabel!
    
    @IBOutlet weak var interestedInImageView: UIImageView!
    
    func setupCell(with userDetail: UserDetail, title: String) {
        infoIconImageView.image = userDetail.icon
        infoLabel.text = title
    }
    
    func setupInterestedInCell(with interestedInInfo: InterestedInInfo, title: String) {
        interestedInImageView.image = interestedInInfo.icon
        interestedInLabel.text = title
    }
}


enum InterestedInInfo {
    var icon: UIImage? {
        switch self {
        case .dating:
            return UIImage(named: "")
            
        case .networking:
            return UIImage(systemName: "")
            
        case .friendship:
            return UIImage(named: "")
        }
    }
    
    case dating
    case networking
    case friendship
}




enum UserDetail {
    var icon: UIImage? {
        switch self {
            
        case .ethnicity:
            return UIImage(named: "ethnicity")
            
        case .hometown:
            return UIImage(systemName: "house")
            
        case .drinking:
            return UIImage(named: "drinking")
            
        case .politics:
            return UIImage(named: "politics")
            
        case .school:
            return UIImage(systemName: "eyeglasses")
            
        case .religion:
            return UIImage(named: "religion")
            
        case .education:
            return UIImage(systemName: "book")
            
        case .height:
            return UIImage(systemName: "height")
            
        case .kids:
            return UIImage(named: "kids")
            
        case .familyPlans:
            return UIImage(named: "familyPlans")
            
        case .birthday:
            return UIImage(named: "age")
            
        case .jobTitle:
            return UIImage(named: "occupation")

        }
    }

    case jobTitle
    case birthday
    case height
    case kids
    case familyPlans
    case ethnicity
    case hometown
    case drinking
    case politics
    case school
    case religion
    case education
}
