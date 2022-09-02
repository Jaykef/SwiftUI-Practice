/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that summarizes a profile.
*/

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    @State private var profileImage = UIImage()
    @State private var showSheet = false
    
    func save() {
        _ = profileImage.jpegData(compressionQuality: 0.8)
    }
    
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Image(profile.profileImage)
                    .resizable()
                    .scaledToFit()
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .onTapGesture {
                       showSheet = true
                     }
                    .sheet(isPresented: $showSheet, onDismiss: save) {
                        // Pick an image from the photo library:
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$profileImage)

                        //  If you wish to take a photo from camera instead:
                        // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                        }
                    
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text(profile.major)
                Text("Beijing Institute of Technology")
                Text(profile.school)
                
                Divider()

                VStack(alignment: .center) {
                    Text("Completed Badges")
                        .font(.headline)

                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First BIT Tour")
                            HikeBadge(name: "RoboMaster")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "BIT Fifth Tour")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                            HikeBadge(name: "Apple Store")
                                .hueRotation(Angle(degrees: 90))
                        }
                        .padding(.bottom)
                    }
                }
                VStack(alignment: .center){
                    Text("Next Tour Date: ") + Text(profile.goalDate, style: .date)
                    Text("Seasonal Theme: \(profile.seasonalPhoto.rawValue)")
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Tours")
                        .font(.headline)

                    HikeView(hike: modelData.hikes[0])
                }
            }
            .padding()
            
        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
