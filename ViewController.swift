//
//  ViewController.swift
//  Imageview
//
//  Created by 김태진 on 1/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false // isZoom : 확대 여부를 나타내는 변수
    var imgOn: UIImage? // imgOn : image1이 있는 UIImage 타입의 변수
    var imgOff: UIImage? // imgOff : image2가 있는 UIImage 타입의 변수
    
    // ? 란 : 옵셔널(Optionals) 라는 개념
    // 옵셔널이란 : 값이 있을 수도 있고, 없을 수도 있음을 표현하는 표현 방법
    // 즉, 값이 있을 수도 있고, 없을 수도 있다는 뜻
    
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imgview: UIImageView!
    
    override func viewDidLoad() { // 내가 만든 뷰가 메모리에 로드되었을 때 호출되는 함수
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "image1.jpeg") // imgOn에 image1을 할당
        imgOff = UIImage(named: "image2.jpeg") // imgOff에 image2를 할당
        
        imgview.image = imgOn // imgview에 imgOn 할당
        
    }


    @IBAction func btnResizeImage(_ sender: UIButton) { // 버튼 클릭시 동작하는 함수
        let scale: CGFloat = 2.0 // scale : 확대할 배율 값
        var newWidth: CGFloat, newHeight: CGFloat // newWidth, newHeight : 확대할 크기의 계산 값
        
        // CGFloat : 실수형 데이터 타입 ( 내가 알고 있는 float, double과 같은 개념 )
        // CGFloat는 32비트 환경에서는 float, 64비트 환경에서는 double로 컴파일된다. ( 그렇다고 합니다 )
        
        if(isZoom){ // true
            newWidth = imgview.frame.width / scale // newWidth : imgview의 width / scale
            newHeight = imgview.frame.height / scale // newHeight : imgview의 height / scale
            btnResize.setTitle("명주", for: .normal) // 버튼의 타이틀을 "확대"로 변경
        }
        else{ // false
            newWidth = imgview.frame.width * scale // newWidth : imgview의 width * scale
            newHeight = imgview.frame.height * scale // newHeight : imgview의 height * scale
            btnResize.setTitle("태진", for: .normal) // 버튼의 타이틀을 "축소"로 변경
        }
        imgview.frame.size = CGSize(width: newWidth, height: newHeight) //CGSize 메서드를 사용하여 이미지 뷰의 프레임 크기를 변경
        isZoom = !isZoom // isZoom의 값을 반대로 바꿈
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgview.image = imgOn
        }else{
            imgview.image = imgOff
        }
    }
}

