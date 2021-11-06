//
//  FriendsView.swift
//  Friends
//
//  Created by Md Zahidul Islam Mazumder on 6/11/21.
//

import SwiftUI

struct FriendsView: View {
    
    @StateObject var friendsVM = FriendsVM()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(),alignment: .topLeading) , count: 10)
    
    
    
    var body: some View {
        
        NavigationView{
            ScrollView {
             
                LazyVGrid(columns: columns,spacing: 15) {
                    ForEach(friendsVM.friendsBase?.results ?? [], id: \.self) { friend in
                        
                        NavigationLink(destination: FriendDetailsView(friend: friend)) {
                            FriendCardView(friend: friend)
                        }
                        .buttonStyle(PlainButtonStyle())
                        

                    }

                
                }
                .padding(.horizontal)
            }
            .navigationTitle(Text("Friends"))
        }
        
        .navigationViewStyle(StackNavigationViewStyle())



    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}


struct CustomImageView: View {
    var urlString: String
    @StateObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
