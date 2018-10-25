import Foundation

struct DemoData: Decodable {
    let categoryData: [Category]
    let userData: User
    let accountData: AccountResponse
    let investmentData: InvestmentResponse
    let transactionData: SearchResponse
}
