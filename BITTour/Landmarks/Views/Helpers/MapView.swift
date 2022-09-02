/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that presents a map of a landmark.
*/

import SwiftUI
import MapKit


struct MapViewUIKit: UIViewRepresentable {
    
    let region: MKCoordinateRegion
    let mapType : MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
    }
}

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.95931119074565, longitude: 116.31477676689818), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
    
    @State private var mapType: MKMapType = .standard

    var body: some View {
       ZStack {
          MapViewUIKit(region: region, mapType: mapType)
                    .onAppear {
                        setRegion(coordinate)
                    }
               .edgesIgnoringSafeArea(.all)
       
           VStack {
               Picker("", selection: $mapType) {
                   Text("Standard").tag(MKMapType.standard)
                   Text("Satellite").tag(MKMapType.satellite)
                   Text("Hybrid").tag(MKMapType.hybrid)
               }
               .pickerStyle(SegmentedPickerStyle())
               .font(.largeTitle)
            Spacer()
           }
       }
   }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            )
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 39.735670, longitude: 116.169728))
        }
            
    }
}
