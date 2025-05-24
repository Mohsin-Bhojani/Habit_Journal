//  Setting View.swift
//  Habit_Journal
//
//  Created by Abbas on 23/05/2025.

import SwiftUI

struct SettingsView: View {
    var onDismiss: (() -> Void)? = nil // Optional for manual dismissal
    
    // Environment dismiss action for NavigationStack or sheet
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background Gradient
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
                // Top Bar
                HStack(spacing: 20) {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Button(action: {
                        if let onDismiss = onDismiss {
                            onDismiss()
                        } else {
                            dismiss()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Circle())
                    }
                    .padding()
                }
                
                // Placeholder content
                VStack(spacing: 16) {
                    Text("Your settings will go here.")
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide native back button
    }
}
