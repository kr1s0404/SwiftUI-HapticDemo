//
//  customHaptic.swift
//  HapticDemo
//
//  Created by Kris on 11/17/21.
//

import SwiftUI
import CoreHaptics

struct customHaptic: View
{
    @State private var engine: CHHapticEngine?
    @State var intensityValue: Float = 0
    @State var sharpnessValue: Float = 0
    
    var body: some View
    {
        
        VStack
        {
            Spacer()
            HStack
            {
                Text("Intensity")
                    .padding()
                Slider(value: $intensityValue)
                    .padding()
            }
            HStack
            {
                Text("Sharpness")
                    .padding()
                Slider(value: $sharpnessValue)
                    .padding()
            }
            
            VStack
            {
                Spacer()
                Text("Intensity：\(intensityValue, specifier: "%.2f")")
                    .bold()
                    .frame(width: 150, height: 60, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(10)
                    .opacity(0.8)
                Text("Sharpness：\(sharpnessValue, specifier: "%.2f")")
                    .bold()
                    .frame(width: 150, height: 60, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(10)
                    .opacity(0.8)
                Spacer()
            }
            
            VStack
            {
                Divider()
                    .padding()
                
                Text("Tap Me")
                    .frame(width: 300, height: 200)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .onAppear(perform: prepareHaptics)
                    .onTapGesture(perform: customVibration)
                Spacer()
            }
        }
    }
    
    func prepareHaptics()
    {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Fail \(error.localizedDescription)")
        }
    }
    
    func customVibration()
    {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpnessValue)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Fail \(error.localizedDescription)")
        }
    }
}

struct customHaptic_Previews: PreviewProvider
{
    static var previews: some View
    {
        customHaptic()
    }
}
