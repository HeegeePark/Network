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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cofigureUI()
    }
}

// MARK: - Custom UI
extension LottoViewController {
    func cofigureUI() {
        titleLabel.text = "2024년 1월 13일 당첨 1102회차"
        titleLabel.font = FontStyle.lottoTitle
        titleLabel.textAlignment = .center
        
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

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleLabel.text = "\(numberList[row])회차"
        // TODO: 랜덤 로또 값 가져오기
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}
