//
//  LottoViewController.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var fakeTextFieldView: UIView!
    
    var lottoPickerView = UIPickerView()
    
    let numberList: [Int] = Array(1...1025).reversed()
    var lotto: Lotto? {
        didSet {
            udpateLottoResult()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LottoAPI.fetchLotto(date: 1102) { lotto in
            self.lotto = lotto
        }
        
        cofigureUI()
    }
    
    @IBAction func pickerViewDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func udpateLottoResult() {
        guard let lotto = lotto else { return }
        
        let lottoInfo = LottoInfo(lotto: lotto)
        
        titleLabel.text = lottoInfo.title
        resultLabel.text = lottoInfo.result
    }
}

// MARK: - Custom UI
extension LottoViewController {
    func cofigureUI() {
        titleLabel.text = "2024년 1월 13일 당첨 1102회차"
        titleLabel.font = FontStyle.lottoTitle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        
        resultLabel.text = "1 1 1 1 1 1 1"
        resultLabel.font = FontStyle.lottoResult
        resultLabel.textAlignment = .center
        
        cofigurePickerView()
    }
    
    func cofigurePickerView() {
        numberTextField.tintColor = .clear
        numberTextField.backgroundColor = .clear
        numberTextField.inputView = lottoPickerView
        
        fakeTextFieldView.backgroundColor = ColorStyle.lottoAccentColor
        fakeTextFieldView.setCornerRadius()
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // TODO: 랜덤 로또 값 가져오기
        LottoAPI.fetchLotto(date: row) { lotto in
            self.lotto = lotto
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}
