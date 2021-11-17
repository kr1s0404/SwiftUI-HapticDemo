//
//  ContentView.swift
//  HapticDemo
//
//  Created by Kris on 11/17/21.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        TabView
        {
            defaultHaptic().tabItem({
                NavigationLink(destination: defaultHaptic(), label: {
                    Image(systemName: "square.dashed.inset.filled")
                    Text("Default Haptic").tag(1)
                })
            })
            
            customHaptic().tabItem({
                NavigationLink(destination: customHaptic(), label: {
                    Image(systemName: "slider.horizontal.below.rectangle")
                    Text("Custom Haptic").tag(2)
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
