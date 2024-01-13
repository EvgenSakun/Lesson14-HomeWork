//
//  DeviceCollectionViewCell.swift
//  HM14
//
//  Created by Evgeny Sakun on 13.01.24.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    
    var deviceImage = UIImageView()
    var deviceView = UIView()


    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(device: Devices) {
        deviceView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        deviceImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        deviceImage.contentMode = .scaleAspectFit
        
        let image = device.deviceImageName
        deviceImage.image = UIImage(systemName: image)
        
        addSubview(deviceView)
        deviceView.addSubview(deviceImage)
        
    }
}
