enum LinkedList<Element>: CustomStringConvertible {
    case empty
    indirect case node(data: Element, next: LinkedList)
    
    var description: String {
        switch self {
        case .empty:
            return "(end)"
        case let .node(data, next):
            return "\(data), \(next.description)"
        }
    }
    
    func inserting(_ e: Element) -> LinkedList<Element> {
        switch self {
        case .empty:
            return .node(data: e, next: .empty)
        case .node:
            return .node(data: e, next: self)
        }
    }
    
    func appending(_ e: Element) -> LinkedList<Element> {
        switch self {
        case .empty:
            return .node(data: e, next: .empty)
        case let .node(oldData, next):
            return .node(data: oldData, next: next.appending(e))
        }
    }
    
    func reversed() -> LinkedList<Element> {
        switch self {
        case .empty:
            return self
        case let .node(data, next):
            return next.reversed().appending(data)
        }
    }
}

let a: LinkedList<Int> = .empty
let b: LinkedList<Int> = .node(data: 1, next: .node(data: 2, next: .empty))
print("b: \(b)") // => b: 1, 2, (end)

let c = b.inserting(0)
print("c: \(c)") // => c: 0, 1, 2, (end)
print("reversed c: \(c.reversed())") // => reversed c: 2, 1, 0, (end)
