import RxSwift

let disposeBag = DisposeBag()

// startWith
Observable.of("🐱","🐶")
    .startWith("一")
    .startWith("二")
    .startWith("三")
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


//merge  两个流合并成一个流 只有两个都结束的时候才会结束
let subject1 = PublishSubject<String>()
let subject2 = PublishSubject<String>()

Observable.of(subject1,subject2).merge().subscribe(onNext: {print($0)}, onError: { (error) in
    print(error)
}, onCompleted: {
    print("completed")
}).disposed(by: disposeBag)

subject1.onNext("A")
subject2.onNext("B")
subject1.onCompleted()
subject2.onCompleted()


