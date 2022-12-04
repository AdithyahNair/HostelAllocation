//
//  Network.swift
//  HostelAllocation
//
//  Created by Adithyah Nair on 02/12/22.
//

import Foundation

protocol NetworkDelegate: AnyObject {
    func didReceiveData(data: Any)
    func didNotReceiveData(title: String, message: String)
}

class Network {
    // MARK: - Properties

    let localhostURL = "http://localhost:8888/HostelAllocation/service.php"

    // MARK: - Functions

    func request(query: String) -> URLRequest {
        let url = URL(string: localhostURL)
        guard let url = url else { fatalError("Could not create URL from Localhost") }
        return URLRequest(url: url)
    }

    func response(request: URLRequest, query: String, completion: @escaping (Data?) -> Void) {
        var request = request
        request.httpMethod = "POST"
        request.httpBody = query.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                completion(data)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    func parseJSON(data: Data, completion: @escaping ([Student]?) -> Void) {
        let decoder = JSONDecoder()
        do {
            if let decodedData = try decoder.decode([Student]?.self, from: data) {
                completion(decodedData)
                return
            }
        } catch {
            print("Error decoding data: \(error)")
        }
    }
}
