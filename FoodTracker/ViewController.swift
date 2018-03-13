//
//  ViewController.swift
//  FoodTracker
//
//  Created by Park Tae Hyun on 2018. 3. 4..
//  Copyright © 2018년 Tae hyun Park. All rights reserved.
//

import UIKit


//회원가입 페이지에 개인정보와 사진 넣는 플랫폼 만들기(사진 넣는 것이 핵심)
class ViewController: UIViewController,UITextFieldDelegate {

   
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        pwTextField.delegate = self
        
    }
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        
        idTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
    //키보드를 내려가게 하는 함수, 이미지를 눌렀을 때 키보드를 사라지게 하기 위해서
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        //알아서 앨범 생성해줌
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        //animated- true; 밑에서 위로 올라옴, false; 그냥 나타남
        //segue로 연결한 것 아님
        //*segue; push와 modal
        //*closer; 함수를 변수로 만들어서 넘길 수 있음
        
    }
    
    
    @IBAction func joinCompleteAction(_ sender: UIButton) {
        
        let idText = idTextField.text
        let pwText = pwTextField.text
        
        idLabel.text = idText
        pwLabel.text = pwText
        
        idTextField.text = ""
        pwTextField.text = ""
    }
    
    
//
//    @IBAction func setLabelAction(_ sender: UIButton) {
//
//        let text = mealNameTextField.text
//        mealNameLabel.text = text
//        //mealNameLabel.text = mealNameTextField.text
//        mealNameTextField.text = "" //초기화
//    }
//
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // = textField.endEditing(true)
        
        return true
    }
    
}

extension ViewController:UIImagePickerControllerDelegate {
    
    //취소를 눌렀을 때 실행되는 함수
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        //화면을 끌 때 사용, comletion;화면 꺼지고 나서 어떤 동작이 일어나는지
    }
    
    //이미지를 선택하고 난후에 호출되는 함수
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        // Dictionary? Tuple? Array?
        //guard-방어; 여기를 통과해야 다음 코드도 실행됨
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
                                  //dictionary(key와 value)
                                  //java의 hash map과 같음
            UIImage else {
            return
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController:UINavigationControllerDelegate {
    

}

