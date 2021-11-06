//
//  FriendDetailsView.swift
//  Friends
//
//  Created by Md Zahidul Islam Mazumder on 6/11/21.
//

import SwiftUI

struct FriendDetailsView: View {
    
    @StateObject var friendsDetailsVM = FriendsDetailsVM()
    
    let friend:Friend
    
    var body: some View {
//        ScrollView{
            VStack{
                
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
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    
                
                Text(friend.name?.first ?? "")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                
                Form{
                    Section(header: Text("Personal Information")) {
                      //  VStack(alignment:.leading){
                           
                            
                            Text("\(friend.name?.title ?? "") \(friend.name?.first ?? "") \(friend.name?.last ?? "")")
                                .bold()
                            
                            Text("\(friend.location?.street?.number ?? 0), \(friend.location?.street?.name ?? "")")
                            
                            Text("\(friend.location?.city ?? ""), \(friend.location?.state ?? ""), \(friend.location?.country ?? "")"  )
                            
                            HStack{
                                Text("Email:")
                                    .bold()
                                Text(friend.email ?? "")
                            }
                            .onTapGesture {
                                if let emailUrl = friendsDetailsVM.createEmailUrl(to: friend.email ?? "", subject: "", body: "") {
                                    UIApplication.shared.open(emailUrl)
                                }
                            }
                            
                            HStack{
                                Text("Cell:")
                                    .bold()
                                Text(friend.cell ?? "")
                            }
                        
                    //}
                    }
                }
            }
//        }
    }
}

//struct FriendDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendDetailsView()
//    }
//}
