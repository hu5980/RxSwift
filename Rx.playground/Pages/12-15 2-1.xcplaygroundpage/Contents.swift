
import Foundation
import RxSwift

let disposeBag = DisposeBag()

Observable<String>.never().subscribe { () in
    print("永远不执行")
}.disposed(by: disposeBag)

Observable<Int>.empty().subscribe { (event) in
    print(event)
}.disposed(by: disposeBag)

let error = NSError (domain: "error", code: 1001, userInfo: nil)

Observable<Int>.error(error).subscribe { () in
    print(error.code) }.addDisposableTo(disposeBag)

Observable.just("🍎").subscribe { (event) in
    print(event)
}.disposed(by: disposeBag)

Observable.of("🐱","🐶","🐭").subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

Observable.from(["🐱","🐶","🐭"]).subscribe(onNext: { (element) in
    print(element)
}).disposed(by: disposeBag)

