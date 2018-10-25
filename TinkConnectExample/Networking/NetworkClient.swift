import Foundation

struct NetworkClient {
    private let session: URLSession

    private let jsonEncoder = JSONEncoder()
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()

    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func getDemoData(code: String, completionHandler: @escaping (DemoResponse?, URLResponse?, Error?) -> Void) {
        let body = ["code": code]

        var urlRequest = URLRequest(url: Constants.demoDataUrl, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        urlRequest.httpMethod = HTTPMethod.POST.rawValue
        urlRequest.httpBody = try? jsonEncoder.encode(body)
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        request(urlRequest, completionHandler: completionHandler)
    }

    private func request<T: Decodable>(_ request: URLRequest, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) {
        session.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let result = try self.jsonDecoder.decode(T.self, from: data)
                    completionHandler(result, response, error)
                } catch {
                    completionHandler(nil, response, error)
                }
            } else {
                completionHandler(nil, response, error)
            }
        }.resume()
    }
}
