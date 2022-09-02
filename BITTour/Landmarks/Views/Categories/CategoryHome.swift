/*

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI


struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationView {
            
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(4 / 4, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
            }
            .listStyle(InsetListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .navigationBarItems(leading:
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35, alignment: .leading)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text("BIT Campus Tour")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                }
                .offset(x:-3)
            )
            .toolbar {
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                    
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
