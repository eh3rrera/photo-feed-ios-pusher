//
//  PusherClientOptions.swift
//  PusherSwift
//
//  Created by Hamilton Chapman on 01/04/2016.
//
//

public enum PusherHost {
    case host(String)
    case cluster(String)

    public var stringValue: String {
        switch self {
            case .host(let host): return host
            case .cluster(let cluster): return "ws-\(cluster).pusher.com"
        }
    }
}

@objc public protocol AuthRequestBuilderProtocol {
    @available(*, deprecated: 4.0.2, message: "use requestFor(socketID: String, channelName: String) -> URLRequest? instead")
    @objc optional func requestFor(socketID: String, channel: PusherChannel) -> NSMutableURLRequest?

    @objc optional func requestFor(socketID: String, channelName: String) -> URLRequest?
}

public enum AuthMethod {
    case endpoint(authEndpoint: String)
    case authRequestBuilder(authRequestBuilder: AuthRequestBuilderProtocol)
    case inline(secret: String)
    case noMethod
}

@objc public class PusherClientOptions: NSObject {
    public var authMethod: AuthMethod
    public let attemptToReturnJSONObject: Bool
    public let autoReconnect: Bool
    public let host: String
    public let port: Int
    public let encrypted: Bool

    @nonobjc public init(
        authMethod: AuthMethod = .noMethod,
        attemptToReturnJSONObject: Bool = true,
        autoReconnect: Bool = true,
        host: PusherHost = .host("ws.pusherapp.com"),
        port: Int? = nil,
        encrypted: Bool = true) {
            self.authMethod = authMethod
            self.attemptToReturnJSONObject = attemptToReturnJSONObject
            self.autoReconnect = autoReconnect
            self.host = host.stringValue
            self.port = port ?? (encrypted ? 443 : 80)
            self.encrypted = encrypted
    }
}
