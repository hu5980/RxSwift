import RxSwift

//PublishSubject 只能接收订阅之后的元素
let subject = PublishSubject<Int>()
subject.subscribe { (event) in
    print("Event:\(event)")
}

subject.onNext(1)
subject.onNext(2)
subject.onNext(3)
subject.onCompleted()

let disposeBag = DisposeBag()
let subjectString = PublishSubject<String>()

subjectString.asObserver().disposed(by: disposeBag)
subjectString.onNext("🐒")

subjectString.subscribe { (event) in
    print("PublishSubject:\(event)")
}
subjectString.onNext("🐶")
subjectString.onNext("🐱")

// ReplaySubject 可以接收之前的 元素 (往前追溯几个)

let replySubject = ReplaySubject<String>.create(bufferSize: 1)

replySubject.onNext("🐶")
replySubject.onNext("🐱")

replySubject.subscribe { (event) in
    print("replySubject:\(event)")
}

//BehaviorSubject 接收最近的一个值，没有的话 拿默认值

let behaviorSubject = BehaviorSubject(value: "🍎")

behaviorSubject.onNext("🐶")
behaviorSubject.onNext("🐱")

behaviorSubject.subscribe { (event) in
    print("behaviorSubject:\(event)")
}

let variable = Variable("🍎")
variable.value = ""
variable.value = ""
variable.value = ""





