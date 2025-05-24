//  HomeView.swift
//  Habit_Journal
//
//  Created by Abbas on 23/05/2025.

import SwiftUI

enum HomeDestination: Hashable {
    case settings
}

struct HomeView: View {
    @State private var showMenu = false
    @State private var showInsightsSheet = false
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
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

                VStack {
                    HStack {
                        Text("HabitFlow")
                            .font(.title2)
                            .bold()
                            .padding(.trailing)

                        Spacer()

                        Button(action: {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title2)
                                .padding()
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }

                // Blur background when menu is active
                if showMenu {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation {
                                showMenu = false
                            }
                        }
                        .blur(radius: 4)
                        .zIndex(0.5)
                }

                // Pull-up menu
                if showMenu {
                    VStack {
                        Spacer()

                        VStack(spacing: 16) {
                            Button(action: {
                                withAnimation {
                                    showMenu = false
                                    // Handle Sort action here
                                }
                            }) {
                                Text("Sort")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(12)
                            }

                            Button(action: {
                                withAnimation {
                                    showMenu = false
                                    showInsightsSheet = true
                                }
                            }) {
                                Text("Insights")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(12)
                            }

                            Button(action: {
                                withAnimation {
                                    showMenu = false
                                    // Push SettingsView via navigation path
                                    path.append(HomeDestination.settings)
                                }
                            }) {
                                Text("Settings")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(12)
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    .zIndex(1)
                }
            }
            // Present InsightsView as a sheet
            .sheet(isPresented: $showInsightsSheet) {
                InsightsView {
                    showInsightsSheet = false
                }
            }
            // Navigation destination for settings push
            .navigationDestination(for: HomeDestination.self) { destination in
                switch destination {
                case .settings:
                    SettingsView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
