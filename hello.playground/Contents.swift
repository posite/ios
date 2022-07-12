import Foundation

let str = "world"
print("Hello, \(str)!")

let a = 10
let b = 20.0
let c = Double(a) + b
print(type(of: a))
print(type(of: b))
print("sum=\(c)")

var d = 20
d += 30
print("d=\(d)")

let arr = ["Hello","World"]
let t = type(of:arr)
let s = "type=\(t)"
print(s)
print(arr[0])
print(arr[1])

let dict = ["Kim":12, "Lee":32]
print(type(of: dict))
print(dict["Lee"]!)
