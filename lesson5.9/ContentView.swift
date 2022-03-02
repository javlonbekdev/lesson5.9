//
//  ContentView.swift
//  lesson5.9
//
//  Created by Javlonbek on 28/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack{}.frame(height: 0.5).frame(maxWidth: .infinity)
                        .background(.gray)
                    HStack{
                        RoomItem(imageSize: 70.0, isOnline: false)
                        Text("what`s on your mind")
                            .fontWeight(.medium)
                        Spacer()
                    }
                    HStack{}.frame(height: 0.5).frame(maxWidth: .infinity)
                        .background(.gray)
                    HStack(spacing: 30){
                        HStack(spacing: 0){
                            Image(systemName: "video.fill")
                            Image(systemName: "wave.3.forward")
                                .padding(.trailing,4)
                            Text("Live")
                        }
                        VStack{}.frame(width: 0.5).frame(maxHeight: .infinity)
                            .background(.gray)
                        HStack(spacing: 2){
                            Image(systemName: "photo")
                            Text("Photo")
                        }
                        VStack{}.frame(width: 0.5).frame(maxHeight: .infinity)
                            .background(.gray)
                        HStack(spacing: 2){
                            Image(systemName: "arrow.up.right.video.fill")
                            Text("Room")
                        }
                    }
                }
                VStack{
                    HStack{}.frame(height: 10).frame(maxWidth: .infinity, alignment: .topLeading).background(.gray.opacity(0.3))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            CreateRoom()
                            RoomItem(imageSize: 60.0, isOnline: false)
                            RoomItem(imageSize: 60.0, isOnline: true)
                            RoomItem(imageSize: 60.0, isOnline: false)
                            RoomItem(imageSize: 60.0, isOnline: false)
                            RoomItem(imageSize: 60.0, isOnline: true)
                        }
                    }
                    .frame(height: 100)
                    .padding(.leading, -5)
                }
                VStack{
                    HStack{}.frame(height: 10).frame(maxWidth: .infinity, alignment: .topLeading).background(.gray.opacity(0.3))
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            VStack{
                                Image("myPhoto2")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                                    .background(.white)
                                    .font(.largeTitle)
                                    .cornerRadius(30)
                                    .padding(.top, -30)
                                Spacer()
                                Text("Create a")
                                    .fontWeight(.bold)
                                Text("Story")
                                    .fontWeight(.bold)
                                    .padding(.bottom, 10)
                            }
                            .background(.gray.opacity(0.1))
                            .cornerRadius(20)
                            StoryItem()
                            StoryItem()
                            StoryItem()
                            StoryItem()
                        }.padding(.leading, 7)
                    }
                }
                VStack{
                    HStack{}.frame(height: 10).frame(maxWidth: .infinity, alignment: .topLeading).background(.gray.opacity(0.3))
                    PostItem()
                    PostItem()
                }
            }
            .navigationBarItems(
                leading: Text("facebook")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundColor(.blue),
                trailing: HStack{
                    ZStack{
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 36, height: 36)
                        Image(systemName: "magnifyingglass")
                    }
                    ZStack{
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 36, height: 36)
                        Image(systemName: "bolt.circle.fill")
                    }
                })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct RoomItem: View {
    var imageSize: Double
    var isOnline: Bool
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Image("myPhoto2")
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(imageSize/2)
                .padding(.leading)
            if isOnline{
                ZStack{
                    Circle().frame(width: imageSize*4/10, height: imageSize*4/10)
                        .foregroundColor(.white)
                    Circle().frame(width: imageSize*3/10, height: imageSize*3/10).foregroundColor(.green)
                }
            }
        }
    }
}

struct StoryItem: View {
    var body: some View {
        ZStack{
            Image("flowers")
                .resizable()
                .frame(width: 150, height: 250)
                .scaledToFit()
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Image("myPhoto2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(.blue, lineWidth: 5))
                Spacer()
                Text("Xurshidbek").fontWeight(.bold).font(.system(size: 17)).foregroundColor(.white)
                Text("Kurbonov").fontWeight(.bold).font(.system(size: 17)).foregroundColor(.white)
            }
            .padding(.top, 6).padding(.leading, -10)
        }
    }
}

struct PostItem: View {
    var body: some View {
        VStack{
            HStack{
                RoomItem(imageSize: 50.0, isOnline: true)
                VStack(alignment: .leading){
                    Text("Javlonbek")
                        .fontWeight(.bold)
                    Spacer()
                    HStack {
                        Text("18m")
                            .fontWeight(.medium)
                        Image(systemName: "globe.americas.fill")
                    }
                }
                Spacer()
                Image(systemName: "slider.vertical.3")
                    .padding()
            }
            Image("myPhoto2")
                .resizable()
                .frame(width: 360, height: 360)
                .cornerRadius(180)
                .overlay(RoundedRectangle(cornerRadius: 180).stroke(.white, lineWidth: 10))
                .overlay(RoundedRectangle(cornerRadius: 190).stroke(.gray.opacity(0.3), lineWidth: 1))
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.blue)
                Image(systemName: "heart.circle.fill")
                    .padding(.leading, -15)
                    .foregroundColor(.red)
                Text("8.4K")
                Spacer()
                Text("240 Comments 54 Shares")
            }
            HStack{}.frame(height: 0.5).frame(maxWidth: .infinity)
                .background(.gray)
            HStack{
                Spacer()
                HStack(spacing: 2){
                    Image(systemName: "hand.thumbsup.fill")
                    Text("Like")
                }
                Spacer()
                HStack(spacing: 2){
                    Image(systemName: "text.bubble.fill")
                    Text("Comment")
                }
                Spacer()
                HStack(spacing: 2){
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                    Text("Share")
                }
                Spacer()
            }
            HStack{}.frame(height: 10).frame(maxWidth: .infinity).background(.gray.opacity(0.3))
            
        }
    }
}

struct CreateRoom: View {
    var body: some View {
        HStack{
            Image(systemName: "arrow.up.right.video.fill")
                .foregroundColor(.blue)
                .font(.title)
            VStack {
                Text("Create")
                Text("Room")
            }
            .foregroundColor(.blue)
        }
        .frame(width: 150, height: 55)
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(.blue.opacity(0.3), lineWidth: 2))
        .padding(.leading)
    }
}
