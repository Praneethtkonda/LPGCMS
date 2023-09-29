//
//  RegisterUser.swift
//  lpgcms
//
//  Created by Praneeth TSS on 29/09/23.
//

import Foundation
import GRPC
import NIOCore
import NIOPosix


let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
let channel = ClientConnection.insecure(group: group)
    .connect(host: "localhost", port: 50051)

let userService = Userpb_UserServiceNIOClient(channel: channel)


func TSSRegister (name: String, password: String, phonenumber: String, email: String, floornumber: String) {
    print("Starting registration")
    print(floornumber)

    var request = Userpb_RegisterUserPayload()
    request.name = name
    request.phonenumber = phonenumber
    request.emailaddress = email
    request.password = password
    request.floornumber = floornumber

    do {
        let response = try userService.registerUser(request).response.wait()
        print("RegisterUser Response: \(response.message)")
    } catch {
        print("Error registering user: \(error)")
    }
}
