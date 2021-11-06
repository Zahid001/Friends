//
//  FriendCardView.swift
//  Friends
//
//  Created by Md Zahidul Islam Mazumder on 6/11/21.
//

import SwiftUI

struct FriendCardView: View {
    
    let friend:Friend
    
    var body: some View {
        VStack(alignment:.leading){
            

            
            AsyncImage(
                url: URL(string: friend.picture?.large ?? "") ?? URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")! ,
                placeholder: { Text("Loading ...") },
                image: {
                    
                    Image(uiImage: $0)
                        .resizable()
                    // .scaledToFit()
                    // .frame(minWidth:10,maxWidth: .infinity)
                }
            )
            
            
            
            Text("\(friend.name?.title ?? "") \(friend.name?.first ?? "") \(friend.name?.last ?? "")")
                .bold()
                .lineLimit(1)
            
            Text(friend.location?.country ?? "")
               // .padding(.bottom,2)
            
            
            
        }
    }
}

//struct FriendCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendCardView()
//    }
//}


