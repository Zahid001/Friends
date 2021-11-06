//
//  FriendsBase.swift
//  Friends
//
//  Created by Md Zahidul Islam Mazumder on 6/11/21.
//

import Foundation

struct FriendsBase : Codable {
    let results : [Friend]?
    let info : Info?
}

struct Info : Codable {
    let seed : String?
    let results : Int?
    let page : Int?
    let version : String?
}


struct Friend : Codable,Identifiable,Hashable {
    
    
    var id: String?{
        return UUID().uuidString
    }
    
    let gender : String?
    let name : Name?
    let location : Location?
    let email : String?
    let login : Login?
    let dob : Dob?
    let registered : Registered?
    let phone : String?
    let cell : String?
 //   let id : Id?
    let picture : Picture?
    let nat : String?
}

struct Name : Codable,Hashable {
    let title : String?
    let first : String?
    let last : String?
}

struct Dob : Codable,Hashable {
    let date : String?
    let age : Int?
}


struct Picture : Codable,Hashable {
    let large : String?
    let medium : String?
    let thumbnail : String?
}

struct Registered : Codable,Hashable {
    let date : String?
    let age : Int?
}

struct Id : Codable,Hashable {
    let name : String?
    let value : String?
    
}

struct Login : Codable,Hashable {
    let uuid : String?
    let username : String?
    let password : String?
    let salt : String?
    let md5 : String?
    let sha1 : String?
    let sha256 : String?
}

struct Location : Codable,Hashable {
    let street : Street?
    let city : String?
    let state : String?
    let country : String?
   // let postcode : String?
    let coordinates : Coordinates?
    let timezone : Timezone?
}


struct Street : Codable,Hashable {
    let number : Int?
    let name : String?
}

struct Coordinates : Codable,Hashable {
    let latitude : String?
    let longitude : String?
}

struct Timezone : Codable,Hashable {
    let offset : String?
    let description : String?
}
