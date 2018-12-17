import RxSwift

let disposeBag = DisposeBag()

//可观察对象的创建
let myJust = {(element:String) ->Observable<String> in
    return Observable.create({ (observer) -> Disposable in
        observer.on(.next(element))
        observer.on(.next(element))
        observer.on(.completed)
        return Disposables.create()
    })
}

myJust("🍎").subscribe { (element) in
    print(element)
}.disposed(by: disposeBag)

Observable.range(start: 1, count: 10).subscribe {
    print($0)
}.disposed(by: disposeBag)

Observable.repeatElement("🍎").take(1).subscribe(onNext: { (element) in
    print(element)
}).disposed(by: disposeBag)

Observable.generate(initialState: 0, condition: {
    $0 < 3}) {$0 + 1
    }.subscribe { (element) in
        print(element)
    }.disposed(by: disposeBag)

var count = 1

let deferredSequence = Observable<String>.deferred { () -> Observable<String> in
    print("create \(count)")
    count += 1
    
    return Observable.create({ (observer) -> Disposable in
        print("Emitting...")
        observer.onNext("🐶")
        observer.onNext("🐱")
        return Disposables.create()
    })
}

deferredSequence.subscribe(onNext: { print($0)
}).disposed(by: disposeBag)

deferredSequence.subscribe(onNext: { print($0)
}).disposed(by: disposeBag)


Observable.of("🍎","🌰","🐲").do(onNext: {
    print("Intercepted:",$0)
}, onError: {
    print("Intercepted error:",$0)
}, onCompleted: {
    print("completed")
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)





