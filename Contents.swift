class Node {
    var children: ([Character: Node], [Character:Node])
    var isWord: Bool
    init() {
        children = ([Character:Node](), [Character:Node]())
        isWord = false
    }
}

class Trie {
    var root: Node
    init() {
        root = Node()
    }
    
    func searchTree(node: Node) -> Node? {
        if node.children.0.count > 0 || node.children.1.count > 0{
            print("\(node.children)")
            if node.isWord == false {
                let leftKey = node.children.0.keys.first
                let rightKey = node.children.1.keys.first
                
                let nextLeftNode = node.children.0[leftKey!]
                let nextRightNode = node.children.1[rightKey!]
                searchTree(node: nextLeftNode!)
                searchTree(node: nextRightNode!)
            }
            return node
        }
        return nil
    }
}



var root = Trie()


var tail = Node()
tail.isWord = true

var nilNode = Node()


var d = Node()
d.children = (["d": tail], ["\0": nilNode]) // '\0' ASCII for NULL

var r = Node()
r.children = (["r": d], ["\0": nilNode])


var p = Node()
p.children = (["p": tail], ["\0": nilNode])

var i = Node()
i.children = (["i": p], ["\0": nilNode])


var a = Node()
a.children = (["a": r], ["h": i])


var e = Node()
e.children = (["e": tail], ["\0": tail])

var rNode5 = Node()
rNode5.children = (["i": e], ["y": tail] )

var c = Node()
c.children = (["c": a], ["t": rNode5])


print("\0 means NULL in ASCII characters \n\n")

print("Traversing through all nodes")
root.searchTree(node: c)

print("\nTraversing starting from node 5")
root.searchTree(node: rNode5)



