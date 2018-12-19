import RxSwift

let disposeBag = DisposeBag()

// map
Observable.of(1,2).map{ $0*10}.subscribe(onNext: {
    print($0)
}).disposed(by:disposeBag)

struct Player{
    var score:Variable<Int>
}

let 👨 = Player(score: Variable(90))
let 👩 = Player(score: Variable(80))

let player = Variable(👨)

player.asObservable().flatMap {
    $0.score.asObservable()
    }.subscribe(onNext: {
        print($0)
    }).disposed(by:disposeBag)


