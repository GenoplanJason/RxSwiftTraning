//
//  File.swift
//  RxSiwft
//
//  Created by Jason on 2016. 6. 14..
//  Copyright © 2016년 genoplan. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa

class Example {
    let bag = DisposeBag()
    let view = ViewController()
    
    func test() {


    }
    
    func calculatedVariable() {
        let a = Variable(1)
        let b = Variable(2)
        
        let c = Observable.combineLatest(a.asObservable(), b.asObservable()){
            $0 + $1
            }.filter{ $0 >= 0 }.map{"\($0) is positive"}
        
        c.subscribeNext{print($0)}
        
        a.value = 4
        
        b.value = -8
            
        
        print("Hello")
    }
    
    /* just를 사용하여 "Hello world"라는 문자열을 Observable하게 만들었다.
     그 다음으로 subscribe를 할 경우 Observable에서 Lazy Evaluation으로 인해 뒤늦게 이벤트를 발행한다.
     여기서는 이벤트를 받았을 경우 문자열을 프린트 하도록 했다.
     addDisposableTo메서드는 Subscription Sequence를 중단하기 위해 사용하는 메서드이다.
     이 메서드를 설명하기 위해서는 먼저 Disposable에 대해 설명해야한다.
     Disposable객체는 subscribe 메서드를 통해 반환된다.
     이 Disposable 객체의 역할은
     */
    func autoComplete() {

        
    }
    
    
}

