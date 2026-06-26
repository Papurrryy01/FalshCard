import SwiftUI

struct CustomCard {
    let frontText: String
    let backText: String
    let frontColor: Color
    let backColor: Color
    let icon: String
}

let customCards: [CustomCard] = [
    CustomCard(
        frontText: "What helps you stay focused?",
        backText: "Taking small breaks and removing distractions.",
        frontColor: .orange,
        backColor: .pink,
        icon: "brain.head.profile"
    ),
    CustomCard(
        frontText: "What makes a good app design?",
        backText: "Simple screens, clear buttons, and easy navigation.",
        frontColor: .purple,
        backColor: .blue,
        icon: "iphone"
    ),
    CustomCard(
        frontText: "Why do we use SwiftUI?",
        backText: "To build iOS apps with cleaner and easier code.",
        frontColor: .teal,
        backColor: .green,
        icon: "swift"
    )
]
