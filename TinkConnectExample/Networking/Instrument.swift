import Foundation

struct Instrument: Decodable {
    let id: String
    let currency: String
    let name: String
    let price: Double
    let quantity: Double
    let profit: Double
}
