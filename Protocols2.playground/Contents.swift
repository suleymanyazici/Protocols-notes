import UIKit


protocol Likeable{
    var likeCount: Int { get }
    var ownerId: String { get }
}

class Comment{
    var id: String!
    var createDate: Date!
}

class Photo{
    var id: String!
    var createDate: Date!
}

///Burada extension sayesinde likeCount değişkenini mecburi olmaktan çıkardık
///Fakat Amma Velakin olaki ben bunu sadece istediğim fonksiyonlar için mecburi olmayacak şekle getirmek istiyorum. Ozaman da aşağıdaki satırdaki gibi ekleme yapmam gerekiyor
///where Self : Comment
///bu satır sayesinde Comment sınıfı ve ondan türeyenler için mecburi bir alan olmayacaktır
///Account sınıfı için mecburi olarak gelecektir

extension Likeable where Self: Comment{
    var likeCount: Int{
        return 100
    }
}

extension Likeable where Self: Account{
    var likeCount: Int{
        return 200
    }
}

///Burada Guest sınıfı comment ten oluştul
class Guest: Comment, Likeable{
    var ownerId: String
    
    init(ownerId: String) {
        self.ownerId = ownerId
    }
}

class Account: Photo,Likeable{
    var ownerId: String
    
    init(ownerId: String) {
        self.ownerId = ownerId
        
    }
}
/// Yaptığımız son güncelleme ile Account sınıfı içinde bir extension eklemesi yaptık ve bunun sonucunda
/// comment sınıfı için likeCount 100 account sınıfı için likeCount defoult olarak 200 olacaktır aşağıdaki örneklerle pekiştirelim

var account1 = Account(ownerId: "1")
print("\(account1.likeCount)")

var account2 = Guest(ownerId: "2")
print("\(account2.likeCount)")


///Protocolün Protocolü Confirm etmesi
///Protocoller de kendi aralarında inheritance olabiliyor.
///Örnek olarak aşağıdan devam edelim


protocol Protocol1{
    var name: String{get}
}

protocol Protocol2: Protocol1{
    var age: Int {get set}
}


//Bu class ta herhangi bir değişken tanımlamamıza rağmen protocol 2 den Confirm ediğildiği için tepedeki Protocol1 deki değişkenlere kadar alacaktır



class Class1: Protocol2{
    var age: Int
    var name: String
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}
