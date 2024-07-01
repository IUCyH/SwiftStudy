//
//  PopupVC.swift
//  TimesTableOX_UIKit
//
//  Created by 홍재민 on 7/1/24.
//

import UIKit

class PopupVC: UIViewController {
    
    private let storyBoard = UIStoryboard.init(name: "Popup", bundle: nil)
    private var closeEvent: (() -> Void)?
    private var correctCount: Int = 0
    private var incorrectCount: Int = 0
    
    @IBOutlet weak private var correctCountLabel: UILabel!
    @IBOutlet weak private var incorrectCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCorrectCountLabel()
        setIncorrectCountLabel()
    }
    
    func setCorrectCountLabel() {
        correctCountLabel.text = "맞은 문제: \(correctCount)"
    }
    
    func setIncorrectCountLabel() {
        incorrectCountLabel.text = "틀린 문제: \(incorrectCount)"
    }
    
    func getVC() -> UIViewController {
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "Popup")
        
        return popupVC
    }
    
    func openPopup(viewController: UIViewController, totalCorrectCount: Int, totalIncorrectCount: Int, closeEvent: @escaping () -> Void) {
        guard let vc = getVC() as? PopupVC else { return }
        
        vc.correctCount = totalCorrectCount
        vc.incorrectCount = totalIncorrectCount
        vc.closeEvent = { closeEvent() }
        
        vc.modalPresentationStyle = .overFullScreen
        viewController.present(vc, animated: false)
    }
    
    @IBAction func closePopup(_ sender: Any) {
        guard let closeEvent else { return }
        
        closeEvent()
        self.dismiss(animated: false)
    }
}
