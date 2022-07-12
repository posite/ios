import Foundation

enum Rank: Int{
    case ace = 1, two, three, four, five, six
    case seven, eight, nine, ten
    case jack, queen, king
    func desc()->String{
        switch self{
        case .ace:
            return "Ace"
        case .jack:
            return "Jack"
        case .queen:
            return "Queen"
        case .king:
            return "King"
        default:
            return "\(self.rawValue)"
        }
    }
}

var r = Rank.six
//r = .seven
r.desc()
func printRank(rank:Rank){
    print("I don't know")
}
printRank(rank: r)
printRank(rank: .ace)

enum Response{
    case result(String, String)
    case error(String)
}

let res1 = Response.result("Lee","Seoul")
let res2 = Response.error("not ready")

//Property Wrapper
@propertyWrapper
struct FixCase{
    private(set) var value: String = ""
    var wrappedValue : String{
        get{value}
        set{value=newValue.uppercased()}
    }
    init(wrappedValue initalValue:String){
        self.wrappedValue = initalValue
    }
}

struct Address{
    @FixCase var city:String
    @FixCase var name:String
    @FixCase var country:String
}
var add = Address(city: "Seoul", name: "Lee", country: "Korea")
add.city = "Seoul"
add.city
