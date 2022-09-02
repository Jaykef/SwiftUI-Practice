/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An editable profile view.
*/

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            VStack {
                Image(profile.profileImage)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .padding(.top, 10)
                    .shadow(radius: 5)
                    
               
                HStack {
                    Text("Name").bold()
                    Divider()
                    TextField("Username", text: $profile.username)
                    Spacer()
                }
                .padding(.top, 15)
                
                HStack {
                    Text("Major").bold()
                    Divider()
                    TextField("Major", text: $profile.major)
                    Spacer()
                }
                
                HStack {
                    Text("School").bold()
                    Divider()
                    TextField("School", text: $profile.school)
                    Spacer()
                }
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }

            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()

                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }


struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
}
