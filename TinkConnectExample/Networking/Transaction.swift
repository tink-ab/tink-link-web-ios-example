import Foundation

struct Transaction: Decodable {
    let id: String
    let categoryId: String
    let date: Date
    let description: String
    let amount: Double
    let categoryType: String
}
