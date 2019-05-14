//
//  BasketballAPI.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 14.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Moya

public enum BasketballAPI {
    
    static private let baseURL: URL = URL(string: "https://www.balldontlie.io/api/v1")!
    
    case teams
    
}

extension BasketballAPI: TargetType {
    
    public var baseURL: URL {
        return BasketballAPI.baseURL
    }
    
    public var path: String {
        switch self {
            case .teams:
                return "/teams"
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
