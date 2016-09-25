enum LinkedList<Element>: CustomStringConvertible {
    case Empty
    indirect case Node(data: Element, next: LinkedList)
    
    var description: String {
        switch self {
        case .Empty:
            return "(end)"
        case let .Node(data, next):
            return "\(data), \(next.description)"
        }
    }
    
    func inserted(_ e: Element) -> LinkedList<Element> {
        switch self {
        case .Empty:
            return .Node(data: e, next: .Empty)
        case .Node:
            return .Node(data: e, next: self)
        }
    }
    
    func appended(_ e: Element) -> LinkedList<Element> {
        switch self {
        case .Empty:
            return .Node(data: e, next: .Empty)
        case let .Node(oldData, next):
            return .Node(data: oldData, next: next.appended(e))
        }
    }
    
    func reversed() -> LinkedList<Element> {
        switch self {
        case .Empty:
            return self
        case let .Node(data, next):
            return next.reversed().appended(data)
        }
    }
}

let a: LinkedList<Int> = .Empty
let b: LinkedList<Int> = .Node(data: 1, next: .Node(data: 2, next: .Empty))
print("b: \(b)") // => b: 1, 2, (end)

let c = b.inserted(0)
print("c: \(c)") // => c: 0, 1, 2, (end)
print("reversed c: \(c.reversed())") // => reversed c: 2, 1, 0, (end)
