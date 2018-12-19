import RxSwift

let disposeBag = DisposeBag()

// startWith
//Observable.of("🐱","🐶")
//    .startWith("一")
//    .startWith("二")
//    .startWith("三")
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)


//merge  两个流合并成一个流 只有两个都结束的时候才会结束
let subject1 = PublishSubject<String>()
let subject2 = PublishSubject<String>()

//Observable.of(subject1,subject2).merge().subscribe(onNext: {print($0)}, onError: { (error) in
//    print(error)
//}, onCompleted: {
//    print("completed")
//}).disposed(by: disposeBag)

subject1.onNext("A")
subject2.onNext("B")
subject1.onCompleted()
subject2.onCompleted()


//zip 两个流中的元素 组合成一个元素

let strSubject = PublishSubject<String>()
let intSubject = PublishSubject<Int>()


//Observable.zip(strSubject, intSubject) { (stringElement, IntElement) in
//    "\(stringElement):\(IntElement)"
//    }.subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)

strSubject.onNext("A")
strSubject.onNext("B")

intSubject.onNext(1)
intSubject.onNext(2)

strSubject.onCompleted()
intSubject.onCompleted()


//combineLastest  跟最近的可以进行结合 按照时间的线去走

let combineStrSubject = PublishSubject<String>()
let combineIntSubject = PublishSubject<Int>()

//Observable.combineLatest(combineStrSubject, combineIntSubject) { (stringElement, IntElement)  in
//    "\(stringElement):\(IntElement)"
//    }.subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)

combineStrSubject.onNext("A")
combineIntSubject.onNext(1)
combineIntSubject.onNext(2)
combineStrSubject.onNext("B")
combineStrSubject.onNext("C")
combineStrSubject.onNext("A")


//switchLatest 选择最后的流
let subject3 = BehaviorSubject(value: "⚽️")
let subject4 = BehaviorSubject(value: "🍎")

let variable = Variable(subject3)
variable.asObservable().switchLatest().subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
subject3.onNext("🌰")
variable.value = subject4
subject3.onNext("🍐")
subject3.onNext("⚾️")
subject4.onNext("🍌")







