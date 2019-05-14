//
//  BasketballService.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 14.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Moya

class BasketballService {
    
    static private let provider = MoyaProvider<BasketballAPI>()
    
    // Get teams from basketball api
    static func getTeams(onSuccess: @escaping ([Team]) -> Void, onFail: ((Error) -> Void)? = nil) {
        
        provider.request(.teams) { result in
            
            switch result {
                case .success(let response):
                    do {
                        onSuccess(try response.map(BasketballResponse<Team>.self).data)
                    } catch {
                        onFail?(NSError(domain: "BasketballService.getTeams.ParsingError", code: 99, userInfo: nil))
                    }
                    break
                case .failure(let error):
                    onFail?(NSError(domain: "BasketballService.getTeams.MoyaError", code: error.errorCode, userInfo: nil))
            }
            
        }
        
    }
    
}
