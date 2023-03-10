//
//  APIManager.swift
//  eShop
//
//  Created by Văn Khánh Vương on 24/12/2022.
//

import Alamofire

let sessionManager: Session = {
    let configuration = URLSessionConfiguration.default
    let delegate = Session.default.delegate
    let manager = Session.init(configuration: configuration,
                               delegate: delegate,
                               startRequestsImmediately: true,
                               cachedResponseHandler: nil)
    return manager
}()

protocol ApiClientProtocol {
    func request<T: Codable>(request: TargetType, dataModel: T.Type) async -> Result<T, ErrorModel>
}

final class APIManager: ApiClientProtocol {
    static var shared = APIManager()
    private init() { }
}

extension APIManager {
    func afRequest(request: TargetType) async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            let url = request.url ?? URL(fileURLWithPath: "")
            
            AF.request(
                url,
                method: request.httpMethod,
                parameters: request.parameters,
                encoding: request.encoding,
                headers: request.headers
            )
            .validate()
            .cURLDescription { description in
                print("cURLDescription: \(description)")
            }
            .responseData { response in
                if let data = response.data {
                    print("Success")
                    continuation.resume(returning: data)
                    return
                }
                if let err = response.error {
                    print("Err")
                    continuation.resume(throwing: err)
                    return
                }
                fatalError("Error while doing Alamofire url request")
            }
        }
    }
    
    func request<T: Codable>(request: TargetType, dataModel: T.Type) async -> Result<T, ErrorModel> {
        do {
            let decoder = JSONDecoder()
            let undecodedData = try await self.afRequest(request: request)
            let decodedData = try decoder.decode(dataModel, from: undecodedData)
            
            print("Success")
            return .success(decodedData)
        } catch {
            print("Err")
            return .failure(ErrorModel.unableToDecode)
        }
    }
}



