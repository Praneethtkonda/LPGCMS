//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: user.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// The basic user service definition.
///
/// Usage: instantiate `Userpb_UserServiceClient`, then call methods of this protocol to make API calls.
internal protocol Userpb_UserServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? { get }

  func registerUser(
    _ request: Userpb_RegisterUserPayload,
    callOptions: CallOptions?
  ) -> UnaryCall<Userpb_RegisterUserPayload, Userpb_UserResponse>

  func updateUser(
    _ request: Userpb_UpdateUserPayload,
    callOptions: CallOptions?
  ) -> UnaryCall<Userpb_UpdateUserPayload, Userpb_UserResponse>

  func deleteUser(
    _ request: Userpb_DeleteUserPayload,
    callOptions: CallOptions?
  ) -> UnaryCall<Userpb_DeleteUserPayload, Userpb_UserResponse>
}

extension Userpb_UserServiceClientProtocol {
  internal var serviceName: String {
    return "userpb.UserService"
  }

  /// Service for basic user interactions
  ///
  /// - Parameters:
  ///   - request: Request to send to RegisterUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func registerUser(
    _ request: Userpb_RegisterUserPayload,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Userpb_RegisterUserPayload, Userpb_UserResponse> {
    return self.makeUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.registerUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRegisterUserInterceptors() ?? []
    )
  }

  /// Unary call to UpdateUser
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateUser(
    _ request: Userpb_UpdateUserPayload,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Userpb_UpdateUserPayload, Userpb_UserResponse> {
    return self.makeUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  /// Unary call to DeleteUser
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteUser(
    _ request: Userpb_DeleteUserPayload,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Userpb_DeleteUserPayload, Userpb_UserResponse> {
    return self.makeUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Userpb_UserServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Userpb_UserServiceNIOClient")
internal final class Userpb_UserServiceClient: Userpb_UserServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the userpb.UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Userpb_UserServiceNIOClient: Userpb_UserServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the userpb.UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// The basic user service definition.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Userpb_UserServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? { get }

  func makeRegisterUserCall(
    _ request: Userpb_RegisterUserPayload,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Userpb_RegisterUserPayload, Userpb_UserResponse>

  func makeUpdateUserCall(
    _ request: Userpb_UpdateUserPayload,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Userpb_UpdateUserPayload, Userpb_UserResponse>

  func makeDeleteUserCall(
    _ request: Userpb_DeleteUserPayload,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Userpb_DeleteUserPayload, Userpb_UserResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Userpb_UserServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Userpb_UserServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeRegisterUserCall(
    _ request: Userpb_RegisterUserPayload,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Userpb_RegisterUserPayload, Userpb_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.registerUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRegisterUserInterceptors() ?? []
    )
  }

  internal func makeUpdateUserCall(
    _ request: Userpb_UpdateUserPayload,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Userpb_UpdateUserPayload, Userpb_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  internal func makeDeleteUserCall(
    _ request: Userpb_DeleteUserPayload,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Userpb_DeleteUserPayload, Userpb_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Userpb_UserServiceAsyncClientProtocol {
  internal func registerUser(
    _ request: Userpb_RegisterUserPayload,
    callOptions: CallOptions? = nil
  ) async throws -> Userpb_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.registerUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRegisterUserInterceptors() ?? []
    )
  }

  internal func updateUser(
    _ request: Userpb_UpdateUserPayload,
    callOptions: CallOptions? = nil
  ) async throws -> Userpb_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  internal func deleteUser(
    _ request: Userpb_DeleteUserPayload,
    callOptions: CallOptions? = nil
  ) async throws -> Userpb_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: Userpb_UserServiceClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Userpb_UserServiceAsyncClient: Userpb_UserServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Userpb_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Userpb_UserServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'registerUser'.
  func makeRegisterUserInterceptors() -> [ClientInterceptor<Userpb_RegisterUserPayload, Userpb_UserResponse>]

  /// - Returns: Interceptors to use when invoking 'updateUser'.
  func makeUpdateUserInterceptors() -> [ClientInterceptor<Userpb_UpdateUserPayload, Userpb_UserResponse>]

  /// - Returns: Interceptors to use when invoking 'deleteUser'.
  func makeDeleteUserInterceptors() -> [ClientInterceptor<Userpb_DeleteUserPayload, Userpb_UserResponse>]
}

internal enum Userpb_UserServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "UserService",
    fullName: "userpb.UserService",
    methods: [
      Userpb_UserServiceClientMetadata.Methods.registerUser,
      Userpb_UserServiceClientMetadata.Methods.updateUser,
      Userpb_UserServiceClientMetadata.Methods.deleteUser,
    ]
  )

  internal enum Methods {
    internal static let registerUser = GRPCMethodDescriptor(
      name: "RegisterUser",
      path: "/userpb.UserService/RegisterUser",
      type: GRPCCallType.unary
    )

    internal static let updateUser = GRPCMethodDescriptor(
      name: "UpdateUser",
      path: "/userpb.UserService/UpdateUser",
      type: GRPCCallType.unary
    )

    internal static let deleteUser = GRPCMethodDescriptor(
      name: "DeleteUser",
      path: "/userpb.UserService/DeleteUser",
      type: GRPCCallType.unary
    )
  }
}

/// Usage: instantiate `Userpb_UserEventServiceClient`, then call methods of this protocol to make API calls.
internal protocol Userpb_UserEventServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? { get }

  func pushEvent(
    _ request: Userpb_EventPayload,
    callOptions: CallOptions?
  ) -> UnaryCall<Userpb_EventPayload, Userpb_PushEventResponse>
}

extension Userpb_UserEventServiceClientProtocol {
  internal var serviceName: String {
    return "userpb.UserEventService"
  }

  /// Unary call to PushEvent
  ///
  /// - Parameters:
  ///   - request: Request to send to PushEvent.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func pushEvent(
    _ request: Userpb_EventPayload,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Userpb_EventPayload, Userpb_PushEventResponse> {
    return self.makeUnaryCall(
      path: Userpb_UserEventServiceClientMetadata.Methods.pushEvent.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePushEventInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Userpb_UserEventServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Userpb_UserEventServiceNIOClient")
internal final class Userpb_UserEventServiceClient: Userpb_UserEventServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the userpb.UserEventService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Userpb_UserEventServiceNIOClient: Userpb_UserEventServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the userpb.UserEventService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Userpb_UserEventServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? { get }

  func makePushEventCall(
    _ request: Userpb_EventPayload,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Userpb_EventPayload, Userpb_PushEventResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Userpb_UserEventServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Userpb_UserEventServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makePushEventCall(
    _ request: Userpb_EventPayload,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Userpb_EventPayload, Userpb_PushEventResponse> {
    return self.makeAsyncUnaryCall(
      path: Userpb_UserEventServiceClientMetadata.Methods.pushEvent.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePushEventInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Userpb_UserEventServiceAsyncClientProtocol {
  internal func pushEvent(
    _ request: Userpb_EventPayload,
    callOptions: CallOptions? = nil
  ) async throws -> Userpb_PushEventResponse {
    return try await self.performAsyncUnaryCall(
      path: Userpb_UserEventServiceClientMetadata.Methods.pushEvent.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePushEventInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Userpb_UserEventServiceAsyncClient: Userpb_UserEventServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Userpb_UserEventServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Userpb_UserEventServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'pushEvent'.
  func makePushEventInterceptors() -> [ClientInterceptor<Userpb_EventPayload, Userpb_PushEventResponse>]
}

internal enum Userpb_UserEventServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "UserEventService",
    fullName: "userpb.UserEventService",
    methods: [
      Userpb_UserEventServiceClientMetadata.Methods.pushEvent,
    ]
  )

  internal enum Methods {
    internal static let pushEvent = GRPCMethodDescriptor(
      name: "PushEvent",
      path: "/userpb.UserEventService/PushEvent",
      type: GRPCCallType.unary
    )
  }
}

/// The basic user service definition.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Userpb_UserServiceProvider: CallHandlerProvider {
  var interceptors: Userpb_UserServiceServerInterceptorFactoryProtocol? { get }

  /// Service for basic user interactions
  func registerUser(request: Userpb_RegisterUserPayload, context: StatusOnlyCallContext) -> EventLoopFuture<Userpb_UserResponse>

  func updateUser(request: Userpb_UpdateUserPayload, context: StatusOnlyCallContext) -> EventLoopFuture<Userpb_UserResponse>

  func deleteUser(request: Userpb_DeleteUserPayload, context: StatusOnlyCallContext) -> EventLoopFuture<Userpb_UserResponse>
}

extension Userpb_UserServiceProvider {
  internal var serviceName: Substring {
    return Userpb_UserServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RegisterUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_RegisterUserPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_UserResponse>(),
        interceptors: self.interceptors?.makeRegisterUserInterceptors() ?? [],
        userFunction: self.registerUser(request:context:)
      )

    case "UpdateUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_UpdateUserPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_UserResponse>(),
        interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? [],
        userFunction: self.updateUser(request:context:)
      )

    case "DeleteUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_DeleteUserPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_UserResponse>(),
        interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? [],
        userFunction: self.deleteUser(request:context:)
      )

    default:
      return nil
    }
  }
}

/// The basic user service definition.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Userpb_UserServiceAsyncProvider: CallHandlerProvider, Sendable {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Userpb_UserServiceServerInterceptorFactoryProtocol? { get }

  /// Service for basic user interactions
  func registerUser(
    request: Userpb_RegisterUserPayload,
    context: GRPCAsyncServerCallContext
  ) async throws -> Userpb_UserResponse

  func updateUser(
    request: Userpb_UpdateUserPayload,
    context: GRPCAsyncServerCallContext
  ) async throws -> Userpb_UserResponse

  func deleteUser(
    request: Userpb_DeleteUserPayload,
    context: GRPCAsyncServerCallContext
  ) async throws -> Userpb_UserResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Userpb_UserServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Userpb_UserServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Userpb_UserServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Userpb_UserServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RegisterUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_RegisterUserPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_UserResponse>(),
        interceptors: self.interceptors?.makeRegisterUserInterceptors() ?? [],
        wrapping: { try await self.registerUser(request: $0, context: $1) }
      )

    case "UpdateUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_UpdateUserPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_UserResponse>(),
        interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? [],
        wrapping: { try await self.updateUser(request: $0, context: $1) }
      )

    case "DeleteUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_DeleteUserPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_UserResponse>(),
        interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? [],
        wrapping: { try await self.deleteUser(request: $0, context: $1) }
      )

    default:
      return nil
    }
  }
}

internal protocol Userpb_UserServiceServerInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when handling 'registerUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRegisterUserInterceptors() -> [ServerInterceptor<Userpb_RegisterUserPayload, Userpb_UserResponse>]

  /// - Returns: Interceptors to use when handling 'updateUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateUserInterceptors() -> [ServerInterceptor<Userpb_UpdateUserPayload, Userpb_UserResponse>]

  /// - Returns: Interceptors to use when handling 'deleteUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDeleteUserInterceptors() -> [ServerInterceptor<Userpb_DeleteUserPayload, Userpb_UserResponse>]
}

internal enum Userpb_UserServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "UserService",
    fullName: "userpb.UserService",
    methods: [
      Userpb_UserServiceServerMetadata.Methods.registerUser,
      Userpb_UserServiceServerMetadata.Methods.updateUser,
      Userpb_UserServiceServerMetadata.Methods.deleteUser,
    ]
  )

  internal enum Methods {
    internal static let registerUser = GRPCMethodDescriptor(
      name: "RegisterUser",
      path: "/userpb.UserService/RegisterUser",
      type: GRPCCallType.unary
    )

    internal static let updateUser = GRPCMethodDescriptor(
      name: "UpdateUser",
      path: "/userpb.UserService/UpdateUser",
      type: GRPCCallType.unary
    )

    internal static let deleteUser = GRPCMethodDescriptor(
      name: "DeleteUser",
      path: "/userpb.UserService/DeleteUser",
      type: GRPCCallType.unary
    )
  }
}
/// To build a server, implement a class that conforms to this protocol.
internal protocol Userpb_UserEventServiceProvider: CallHandlerProvider {
  var interceptors: Userpb_UserEventServiceServerInterceptorFactoryProtocol? { get }

  func pushEvent(request: Userpb_EventPayload, context: StatusOnlyCallContext) -> EventLoopFuture<Userpb_PushEventResponse>
}

extension Userpb_UserEventServiceProvider {
  internal var serviceName: Substring {
    return Userpb_UserEventServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "PushEvent":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_EventPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_PushEventResponse>(),
        interceptors: self.interceptors?.makePushEventInterceptors() ?? [],
        userFunction: self.pushEvent(request:context:)
      )

    default:
      return nil
    }
  }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Userpb_UserEventServiceAsyncProvider: CallHandlerProvider, Sendable {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Userpb_UserEventServiceServerInterceptorFactoryProtocol? { get }

  func pushEvent(
    request: Userpb_EventPayload,
    context: GRPCAsyncServerCallContext
  ) async throws -> Userpb_PushEventResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Userpb_UserEventServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Userpb_UserEventServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Userpb_UserEventServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Userpb_UserEventServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "PushEvent":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Userpb_EventPayload>(),
        responseSerializer: ProtobufSerializer<Userpb_PushEventResponse>(),
        interceptors: self.interceptors?.makePushEventInterceptors() ?? [],
        wrapping: { try await self.pushEvent(request: $0, context: $1) }
      )

    default:
      return nil
    }
  }
}

internal protocol Userpb_UserEventServiceServerInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when handling 'pushEvent'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePushEventInterceptors() -> [ServerInterceptor<Userpb_EventPayload, Userpb_PushEventResponse>]
}

internal enum Userpb_UserEventServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "UserEventService",
    fullName: "userpb.UserEventService",
    methods: [
      Userpb_UserEventServiceServerMetadata.Methods.pushEvent,
    ]
  )

  internal enum Methods {
    internal static let pushEvent = GRPCMethodDescriptor(
      name: "PushEvent",
      path: "/userpb.UserEventService/PushEvent",
      type: GRPCCallType.unary
    )
  }
}
