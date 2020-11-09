import Foundation

struct Dept {
    let title: String
    let code: String
    let logo: String
}

extension Dept {
    
    static let sampleData: [Dept] = [
        Dept(title: "Computer Science", code: "comp", logo: "comp_logo_2048"),
        Dept(title: "Communication Studies", code: "coms", logo: "coms")
    ]
}
