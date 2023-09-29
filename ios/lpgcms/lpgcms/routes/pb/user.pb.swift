// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: user.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

//syntax = "proto3";
//
//option java_multiple_files = true;
//option java_package = "io.grpc.examples.helloworld";
//option java_outer_classname = "HelloWorldProto";
//option objc_class_prefix = "HLW";
//
//package helloworld;
//
//// The greeting service definition.
//service Greeter {
//  // Sends a greeting.
//  rpc SayHello (HelloRequest) returns (HelloReply) {}
//}
//
//// The request message containing the user's name.
//message HelloRequest {
//  string name = 1;
//}
//
//// The response message containing the greetings.
//message HelloReply {
//  string message = 1;
//}

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Userpb_RegisterUserPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var phonenumber: String = String()

  var emailaddress: String = String()

  var password: String = String()

  /// Do we need this ?
  var floornumber: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Userpb_UserResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var message: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Userpb_UpdateUserPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var phonenumber: String = String()

  var emailaddress: String = String()

  var password: String = String()

  /// Do we need this ?
  var floornumber: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Userpb_DeleteUserPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var phonenumber: String = String()

  var emailaddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// TODO: Change the details here
struct Userpb_EventPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var phonenumber: String = String()

  var emailaddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// The response message containing the greetings
struct Userpb_PushEventResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var message: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Userpb_RegisterUserPayload: @unchecked Sendable {}
extension Userpb_UserResponse: @unchecked Sendable {}
extension Userpb_UpdateUserPayload: @unchecked Sendable {}
extension Userpb_DeleteUserPayload: @unchecked Sendable {}
extension Userpb_EventPayload: @unchecked Sendable {}
extension Userpb_PushEventResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "userpb"

extension Userpb_RegisterUserPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RegisterUserPayload"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "phonenumber"),
    3: .same(proto: "emailaddress"),
    4: .same(proto: "password"),
    5: .same(proto: "floornumber"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.phonenumber) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.emailaddress) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.password) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.floornumber) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.phonenumber.isEmpty {
      try visitor.visitSingularStringField(value: self.phonenumber, fieldNumber: 2)
    }
    if !self.emailaddress.isEmpty {
      try visitor.visitSingularStringField(value: self.emailaddress, fieldNumber: 3)
    }
    if !self.password.isEmpty {
      try visitor.visitSingularStringField(value: self.password, fieldNumber: 4)
    }
    if !self.floornumber.isEmpty {
      try visitor.visitSingularStringField(value: self.floornumber, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Userpb_RegisterUserPayload, rhs: Userpb_RegisterUserPayload) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.phonenumber != rhs.phonenumber {return false}
    if lhs.emailaddress != rhs.emailaddress {return false}
    if lhs.password != rhs.password {return false}
    if lhs.floornumber != rhs.floornumber {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Userpb_UserResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "message"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.message) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Userpb_UserResponse, rhs: Userpb_UserResponse) -> Bool {
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Userpb_UpdateUserPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdateUserPayload"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "phonenumber"),
    3: .same(proto: "emailaddress"),
    4: .same(proto: "password"),
    5: .same(proto: "floornumber"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.phonenumber) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.emailaddress) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.password) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.floornumber) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.phonenumber.isEmpty {
      try visitor.visitSingularStringField(value: self.phonenumber, fieldNumber: 2)
    }
    if !self.emailaddress.isEmpty {
      try visitor.visitSingularStringField(value: self.emailaddress, fieldNumber: 3)
    }
    if !self.password.isEmpty {
      try visitor.visitSingularStringField(value: self.password, fieldNumber: 4)
    }
    if !self.floornumber.isEmpty {
      try visitor.visitSingularStringField(value: self.floornumber, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Userpb_UpdateUserPayload, rhs: Userpb_UpdateUserPayload) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.phonenumber != rhs.phonenumber {return false}
    if lhs.emailaddress != rhs.emailaddress {return false}
    if lhs.password != rhs.password {return false}
    if lhs.floornumber != rhs.floornumber {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Userpb_DeleteUserPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DeleteUserPayload"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "phonenumber"),
    3: .same(proto: "emailaddress"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.phonenumber) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.emailaddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.phonenumber.isEmpty {
      try visitor.visitSingularStringField(value: self.phonenumber, fieldNumber: 2)
    }
    if !self.emailaddress.isEmpty {
      try visitor.visitSingularStringField(value: self.emailaddress, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Userpb_DeleteUserPayload, rhs: Userpb_DeleteUserPayload) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.phonenumber != rhs.phonenumber {return false}
    if lhs.emailaddress != rhs.emailaddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Userpb_EventPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EventPayload"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "phonenumber"),
    3: .same(proto: "emailaddress"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.phonenumber) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.emailaddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.phonenumber.isEmpty {
      try visitor.visitSingularStringField(value: self.phonenumber, fieldNumber: 2)
    }
    if !self.emailaddress.isEmpty {
      try visitor.visitSingularStringField(value: self.emailaddress, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Userpb_EventPayload, rhs: Userpb_EventPayload) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.phonenumber != rhs.phonenumber {return false}
    if lhs.emailaddress != rhs.emailaddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Userpb_PushEventResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PushEventResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "message"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.message) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Userpb_PushEventResponse, rhs: Userpb_PushEventResponse) -> Bool {
    if lhs.message != rhs.message {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
