/*
A view showing featured BIT landmarks.
*/

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selection: Tab = .featured
    @State private var showingProfile = false
    
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Explore", systemImage: "star")
                }
                .tag(Tab.featured)
            
            AboutBit()
                .tabItem {
                    Label("About BIT", systemImage: "book")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("Sceneries", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
