//
//  CardView.swift
//  SwiftUI Swipe App Example
//
//  Created by Bill Skrzypczak on 11/4/23.
//

import SwiftUI

struct CardView: View {
    
    // Step 2 Define any variables you will need
    //
    var guitar: String
    @State private var offset = CGSize.zero // Where we drag a card and where it ends up
    @State private var color: Color = .gray // Color of the initial card
    
    
    // Step 3 Design your UI
    //
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 320, height: 500) // Define a frame
                .border(.black, width: 6.0) // Put a border areound it
                .cornerRadius(9) // Round the corners
                .foregroundColor(color.opacity(0.8)) // Define opacity of fill color
                .shadow(radius: 25) // Give it a nice shadow
                
                HStack{ // Add some stuff to your card
                    Text(guitar) // Some text to identify what you are working with
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Image("Tele") // A picture is worth a 1000 words
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 175)
                    
            }
        }
        
        
        // Step 4 Design the gestures required for your app
        //
        .offset(x: offset.width, y: offset.height * 0.4)     // Allows you to move the card
        .rotationEffect(.degrees(Double(offset.width / 70))) // Use rotation to exaggerate movement
        .gesture(
            DragGesture()
                .onChanged { gesture in                      // Do something when you swipe
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)    // Change the cards color
                    }
                } .onEnded { _ in                           // Do something when you stop swiping
                    withAnimation {
                        swipeCard(width: offset.width)      // Use swipeCard function to swipe the card
                        changeColor(width: offset.width)    // Use changeColor function to change color
                    }
                    
                }
                           
            )
        }
    
    // Step 5 Design a function to handle the "Swipe"
    //
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):                                 // Swipe all the way left
            print("\(guitar) removed")                      // Document that the card has been removed
            offset = CGSize(width: -500, height: 0)
        case 150...500:                                     // Swipe all the way right
            print("\(guitar) added")                        // Document that the card has been added
            offset = CGSize(width: 500, height: 0)
        default:                                            // Reset the card
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red                                    // Turn card red swipe left rejection
        case 130...500:
            color = .green                                  // Turn card green swipe right acceptance
        default:
            color = .black
        }
    }
    
    }

    // Populate the view with the first card
    //
            
            struct CardView_Previews: PreviewProvider {
                static var previews: some View {
                    
                    CardView(guitar: "Gibson")
                    
                        
                    
                }
            }
