//
//  CardView.swift
//  Flashcards
//

import SwiftUI

struct FlipCard: View {
    let frontText: String
    let backText: String
    let frontColor: Color
    let backColor: Color
    let icon: String
    
    @Binding var isFlipped: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .fill(isFlipped ? backColor : frontColor)
                .shadow(radius: 10)
            
            VStack(spacing: 18) {
                Image(systemName: icon)
                    .font(.system(size: 45))
                    .foregroundStyle(.white)
                
                Text(isFlipped ? "Back Side" : "Front Side")
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.75))
                
                Text(isFlipped ? backText : frontText)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
            .rotation3DEffect(
                .degrees(isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
        }
        .frame(height: 260)
        .padding(.horizontal)
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.easeInOut(duration: 0.5), value: isFlipped)
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

struct CardView: View {
    
    let cards = customCards
    
    @State private var cardIndex = 0
    @State private var isFlipped = false
    
    var body: some View {
        let currentCard = cards[cardIndex]
        
        VStack(spacing: 24) {
            Text("Study Flip")
                .font(.largeTitle.bold())
            
            Text("Tap the card to reveal the answer")
                .foregroundStyle(.secondary)
            
            FlipCard(
                frontText: currentCard.frontText,
                backText: currentCard.backText,
                frontColor: currentCard.frontColor,
                backColor: currentCard.backColor,
                icon: currentCard.icon,
                isFlipped: $isFlipped
            )
            
            HStack(spacing: 20) {
                Button("Previous") {
                    withAnimation {
                        cardIndex = cardIndex > 0 ? cardIndex - 1 : cards.count - 1
                        isFlipped = false
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Next") {
                    withAnimation {
                        cardIndex = cardIndex < cards.count - 1 ? cardIndex + 1 : 0
                        isFlipped = false
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            Text("Card \(cardIndex + 1) of \(cards.count)")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    CardView()
}
