import Foundation

protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(_ i: Int) -> Item { get }
}

struct Stack<Element>: Container {
    
    private var items = [Element]()
    
    mutating func push(_ i: Element) {
        items.append(i)
    }
    
    mutating func pop() -> Element? {
        items.popLast()
    }
    
    var count: Int {
        items.count
    }
    
    mutating func append(_ item: Element) {
        push(item)
    }
    
    subscript(_ i: Int) -> Element {
        items[i]
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.push(3)
intStack.push(4)

print(intStack[0])
print(intStack[1])

print(intStack.pop() ?? -1)
print(intStack[0])


struct Queue<Element>: Container {
    
    private var items = [Element]()
    
    var  count: Int {
        items.count
    }
    
    mutating func enqueue(_ item: Element) {
        items.insert(item, at: 0)
    }
    
    mutating func dequeue() -> Element? {
        items.popLast()
    }
    
    // when i push through a queue I have to add an element
    // to the beginning of the list so I have to shift all
    // the elements one to the left, this is O(n) complexity
    mutating func append(_ item: Element) {
        enqueue(item)
    }
    
    subscript(i: Int) -> Element {
        let reversedIndex = count - i - 1
        return items[reversedIndex]
    }
}


let c: Container = Stack<Int>()
print(c.count)
c.append(1)
