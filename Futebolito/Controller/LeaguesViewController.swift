////
////  LeaguesViewController.swift
////  Futebolito
////
////  Created by Mario Tromba on 09/03/23.
////
//
//import UIKit
//
//class LeaguesViewController: UIViewController {
//    
//    lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .none
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .vertical
//        collectionView.setCollectionViewLayout(layout, animated: false)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        
//        return collectionView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    
//}
//
//
//extension LeaguesViewController: UICollectionViewDelegateFlowLayout , UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: indexPath)
//    //    }
//    //
//    //}
//}
