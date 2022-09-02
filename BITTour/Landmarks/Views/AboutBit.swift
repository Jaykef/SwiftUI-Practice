//
//  AboutBit.swift
//  BIT Tour
//
//  Created by Jaykef on 2021/9/20.
//

import SwiftUI

struct AboutBit: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                Image("about")
                    .resizable()
                    .aspectRatio(5/3, contentMode: .fit)
                    .cornerRadius(15)
                    .padding(14)
                    .listRowInsets(EdgeInsets())
                
                Text("Key Facts").font(.title)
                Text("History").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack{
                    Text("Incorparated")
                    Spacer()
                    Text("1940")
                }
                HStack{
                    Text("Motto")
                    Spacer()
                    Text("Virtue to approach the truth, knowledge to be profound").lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
                Text("Campus").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack{
                    Text("Professional Schools")
                    Spacer()
                    Text("9")
                }
                HStack{
                    Text("Campuses")
                    Spacer()
                    Text("3")
                }
                Text("1. Liangxiang Campus").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image("bitlake")
                        .resizable()
                        .aspectRatio(5/3, contentMode: .fit)
                        .cornerRadius(15)
                        .padding(14)
                        .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("About BIT")
        }
    }
}

struct AboutBit_Previews: PreviewProvider {
    static var previews: some View {
        AboutBit()
                .environmentObject(ModelData())
    }
}
