//
//  ViewController.swift
//  HM14
//
//  Created by Evgeny Sakun on 13.01.24.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    
    var deviceArray: [Devices] = {
        let desktopComputer = Devices(deviceImageName: "desktopcomputer")
        let airpods = Devices(deviceImageName: "airpods")
        let homepod = Devices(deviceImageName: "homepod.2.fill")
        let appleWatch = Devices(deviceImageName: "applewatch")
        let macbook = Devices(deviceImageName: "macbook")
        
        return [desktopComputer, airpods, homepod, appleWatch, macbook]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 60, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.frame = CGRect(x: 0, y: 0, width: view.safeAreaLayoutGuide.layoutFrame.width, height: 200)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DeviceCollectionViewCell.self, forCellWithReuseIdentifier: "DeviceCollectionViewCell")
        collectionView.backgroundColor = .darkGray
        collectionView.reloadData()
        
        view.addSubview(collectionView)
    }

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deviceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCollectionViewCell", for: indexPath) as! DeviceCollectionViewCell
        let devices = deviceArray[indexPath.row]
        cell.backgroundColor = .systemGray3
        cell.layer.cornerRadius = 30
        cell.configure(device: devices)
        
        return cell
    }
    
    
}
