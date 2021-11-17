//
//  defaultHaptic.swift
//  HapticDemo
//
//  Created by Kris on 11/17/21.
//

import SwiftUI

class HapticManger
{
    static let instance = HapticManger()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func imapct(style: UIImpactFeedbackGenerator.FeedbackStyle)
    {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct defaultHaptic: View
{
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Spacer()
                Text("UINotification")
                    .padding()
                    .background(Color.red)
                    .font(.largeTitle)
                    .cornerRadius(10)
                    .opacity(0.8)
                HStack
                {
                    Button("Success") {HapticManger.instance.notification(type: .success)}
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    Button("Warning") {HapticManger.instance.notification(type: .warning)}
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    Button("Error") {HapticManger.instance.notification(type: .error)}
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                Spacer()
                Divider()
                Spacer()
                VStack
                {
                    Text("UIImpact")
                        .padding()
                        .background(Color.red)
                        .font(.largeTitle)
                        .cornerRadius(10)
                        .opacity(0.8)
                    HStack
                    {
                        Button("Soft") {HapticManger.instance.imapct(style: .soft)}
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        Button("Light") {HapticManger.instance.imapct(style: .light)}
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        Button("Medium") {HapticManger.instance.imapct(style: .medium)}
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    
                    HStack
                    {
                        Button("Rigid") {HapticManger.instance.imapct(style: .rigid)}
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        Button("Heavy") {HapticManger.instance.imapct(style: .heavy)}
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }
                Spacer()
            }
            .navigationTitle(Text("Tap on blue texts !!"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct defaultHaptic_Previews: PreviewProvider
{
    static var previews: some View
    {
        defaultHaptic()
    }
}
