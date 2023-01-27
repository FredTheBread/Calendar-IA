//
//  ViewController.swift
//  Calendar
//
//  Created by Michael Cole on 27.01.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedDate = Date()
    var totalSquares = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setCellsView()
    }

    func setCellsView() {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
    
        let flowLayout = collectionView
    }
    
    @IBAction func previousMonth(_ sender: Any) {
    }
    
    @IBAction func nextMonth(_ sender: Any) {
    }
}

