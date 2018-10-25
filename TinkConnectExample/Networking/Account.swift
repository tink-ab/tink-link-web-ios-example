import Foundation

struct Account: Decodable {
    let id: String
    let name: String
    let accountNumber: String
    let balance: Double
    let type: String
}
