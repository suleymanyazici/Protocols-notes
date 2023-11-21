import UIKit

class Animal{
    var name: String!
    var age: Int!
}


/// Protocoller neden vardır
/// Swift Single Inheritance desteklemektedşr bu yüzden eğer biz Human classına başka bir classın özelliğinide eklemeye
/// çalışırsak burada işlemimiz başarısızlıkla sonuçlanacaktır. Çünkü Multiple Inheritance desteklemeyecektir.
/// İş buraya gelince imdada protocol yetişiyor.
/// Protocol sayesinde 2. bir classtan alamadığımız kalıtımı protocol ile classa verebiliyoruz aşağıda olduğu gibi

protocol Walkable {
    var walkable: Bool{get set}
}

/// Protocol içlerinde barındırdığı değişkenler aslında onların değişkenleri değildir
/// sadece bir değişkenin var olacağını belirler ve eğer biz bu protocolü kullanırsak bu değişkenin
/// kullanılacağı yeri göstermis olurz aslında
/// GET ve SET nedir bunlar
/// GET adı üstünde almak olduğu için içeriğin sadece okunabilir olduğunu gösterir
/// SET ise adı üstünde yerleştirmek koymaktır. Yani bu değeri değiştirebilir konumda olduğunu gösterir
/// yani  aslında get ve set birer izin mekaznızması diyebiliriz
protocol Speakable{
    var speakable: Bool{get set}
}



class Human: Animal, Speakable, Walkable{
    var speakable: Bool
    
    var walkable: Bool
    
    
    var job: String
    
    init(name :String, age: Int, speakable: Bool, walkable: Bool, job: String!) {
        self.speakable = speakable
        self.walkable = walkable
        self.job = job
        super.init()
        self.name = name
        self.age = age
    }
}


var human1 = Human(name: "İsmet", age: 50, speakable: true, walkable: true, job: "Developer")



print("\(human1.name!)\n\(human1.age!)\n\(human1.job)\n\(human1.walkable)\n\(human1.speakable)")

//-----------------------------------------------------------------------------------------------------
///Protocol içerisinde Fonksiyon kullanımı
///Protocol içerisindeki fonksiyonun süslü parantezlerinin içi boştur.
///Çünkü bu kısımlar fonksiyon içerisinde fonksiyone uygun olarak belirlenmesi gerekmektedir.
protocol Flyable{
    func flyNow(speed: Double)
}

struct Bird: Flyable{
    func flyNow(speed: Double) {
        print("Kuş \(speed)m/s hızla uçuyor")
    }
}

struct Plane: Flyable{
    func flyNow(speed: Double) {
        print("Uçak \(speed)m/s hızla uçuyor")
    }
}

let boeing = Plane()
let pigeon = Bird()

boeing.flyNow(speed: 100)
pigeon.flyNow(speed: 10)

let flyables: [Flyable] = [boeing, pigeon]



//------------------------------------------------------------------------------------


protocol Drivable{
    var speed: Int {get}
    var numberOfTires: Int{get set}
    func driveNow()
}
///Default değer atabilmek için extension içerisinde düznelicez
///Normal şartlarda extension içerisinde bu tanımlamaları yapmasaydık car structında fonksiyonu kullanmak zorunda kalacaktık
///Yapılan bu tanımlama sayesinde istenildiği taktirde kullanılabilen bir fonksiyon haline geldi
extension Drivable{
    var speed: Int{
        return 10
    }
    func driveNow(){
    }
}


struct Car: Drivable{
    var speed: Int
    var numberOfTires: Int
}

struct Bus: Drivable{
    var speed: Int
    var numberOfTires: Int
    func driveNow() {
        print("Otobüs kullanılıyor")
    }
}

var myBus = Bus(speed: 200, numberOfTires: 6)
myBus.driveNow()

print("Teker Sayisi:\(myBus.numberOfTires)\nHız:\(myBus.speed)")
