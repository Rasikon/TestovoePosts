//
//  NetworkManager.swift
//  Testovoe
//
//  Created by Rasikon on 04.07.2021.
//

import Foundation
import Alamofire

final class NetworkManager<T: Decodable> {
    
    init() {}
    
    // MARK: Public methods
    
    func fetchData(from urlString: String, completionHandler: @escaping ([T]) -> Void) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: [T].self) { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        completionHandler(value)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
