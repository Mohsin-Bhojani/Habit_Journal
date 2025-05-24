//  InsightView.swift
//  Habit_Journal
//
//  Created by Abbas on 23/05/2025.

import SwiftUI

struct InsightsView: View {
    var onDismiss: () -> Void

    var body: some View {
        ZStack {
            // 🌌 Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 20/255, green: 30/255, blue: 48/255),
                    Color(red: 36/255, green: 123/255, blue: 160/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                // 🧭 Top Bar
                HStack {
                    Text("Insights")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 16) // Left padding

                    Spacer()

                    Button(action: onDismiss) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.15))
                            .clipShape(Circle())
                    }
                    .padding()
                }

                // 📊 Placeholder Content
                VStack(spacing: 16) {
                    Text("Your habit insights will appear here.")
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                Spacer()
            }
        }
    }
}

struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView {
            // No-op dismiss action for preview
        }
        .preferredColorScheme(.dark)
        .previewDisplayName("Insights View Preview")
    }
}
