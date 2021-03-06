@testable import PointFree
import PointFreeTestSupport
import SnapshotTesting
import XCTest

class EnvVarTests: TestCase {
  func testDecoding() throws {
    let json = [
      "AIRTABLE_BASE_1": "deadbeef-base-1",
      "AIRTABLE_BASE_2": "deadbeef-base-2",
      "AIRTABLE_BASE_3": "deadbeef-base-3",
      "AIRTABLE_BEARER": "deadbeef-bearer",
      "APP_ENV": "development",
      "APP_SECRET": "deadbeefdeadbeefdeadbeefdeadbeef",
      "BASE_URL": "http://localhost:8080",
      "BASIC_AUTH_PASSWORD": "world",
      "BASIC_AUTH_USERNAME": "hello",
      "DATABASE_URL": "postgres://hello:world@localhost:5432/pointfreeco",
      "GITHUB_CLIENT_ID": "deadbeef-client-id",
      "GITHUB_CLIENT_SECRET": "deadbeef-client-secret",
      "MAILGUN_DOMAIN": "mg.domain.com",
      "MAILGUN_PRIVATE_API_KEY": "deadbeef-mg-api-key",
      "PORT": "8080",
      "STRIPE_PUBLISHABLE_KEY": "pk_test",
      "STRIPE_SECRET_KEY": "sk_test",
    ]

    let envVars = try JSONDecoder()
      .decode(EnvVars.self, from: try JSONSerialization.data(withJSONObject: json))

    let roundTrip = try JSONSerialization.jsonObject(with: try JSONEncoder().encode(envVars), options: [])
      as! [String: String]

    assertSnapshot(matching: roundTrip.sorted(by: { $0.key < $1.key }))
  }
}
