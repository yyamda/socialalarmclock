//
//  CircularProfileImageView.swift
//  productTest
//
//  Created by Yuta Yamada on 7/31/23.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let displayUser: User
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        if let imageUrl = displayUser.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: width)
                .clipShape(Circle())
            
  //              .border(Color.white, width: 2)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
            
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(displayUser: User.MOCK_USERS[0], width: 120, height: 120)
    }
}
