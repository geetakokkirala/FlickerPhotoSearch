//
//  CardView.swift
//  FlickerPhotoSearch
//
//  Created by  Geetha on 27/02/22.
//

import SwiftUI

struct CardView: View {
    let title: String
    let urlStr: String
    
       var body: some View {
           VStack {
               UrlImageView(urlString: urlStr)
               Text(title)
                   .font(.title2)
           }
           
       }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
