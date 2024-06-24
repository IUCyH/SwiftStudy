//
//  ViewController.swift
//  TypeSizeDisplay
//
//  Created by 홍재민 on 6/24/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ChangeTypeButton: UIButton!
    @IBOutlet weak var MaxSizeLabel: UILabel!
    @IBOutlet weak var MinSizeLabel: UILabel!
    @IBOutlet weak var TypeDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitChangeTypeButton()
    }
    
    func InitChangeTypeButton() {
        ChangeTypeButton.layer.masksToBounds = true
        ChangeTypeButton.layer.cornerRadius = 8
        
        ChangeTypeButton.menu = UIMenu(children: [
            UIAction(title: "Int", handler: { UIAction in
                self.ChangeInfoLabels(typeName: "Int", maxSize: Int.max, minSize: Int.min)
            }),
            UIAction(title: "UInt", handler: { UIAction in
                self.ChangeInfoLabels(typeName: "UInt", maxSize: UInt32.max, minSize: UInt32.min)
            }),
            UIAction(title: "Int8", handler: { UIAction in
                self.ChangeInfoLabels(typeName: "Int8", maxSize: Int8.max, minSize: Int8.min)
            }),
            UIAction(title: "Float", handler: { UIAction in
                self.ChangeInfoLabels(typeName: "Float", maxSize: Float.greatestFiniteMagnitude, minSize: Float.leastNormalMagnitude)
            }),
            UIAction(title: "Double", handler: { UIAction in
                self.ChangeInfoLabels(typeName: "Double", maxSize: Double.greatestFiniteMagnitude, minSize: Double.leastNormalMagnitude)
            })
        ])
        
        ChangeTypeButton.showsMenuAsPrimaryAction = true
        ChangeTypeButton.changesSelectionAsPrimaryAction = true
        
        ChangeInfoLabels(typeName: "Int", maxSize: Int.max, minSize: Int.min)
    }
    
    func ChangeInfoLabels<T>(typeName: String, maxSize: T, minSize: T) {
        TypeDisplayLabel.text = "Type: \(typeName)"
        MaxSizeLabel.text = "Max Size: \(maxSize)"
        MinSizeLabel.text = "Min Size: \(minSize)"
    }
}

