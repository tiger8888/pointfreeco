import Foundation
import Optics
import Prelude

public let currencyFormatter = NumberFormatter()
  |> \.numberStyle .~ .currency

public let dateFormatter = DateFormatter()
  |> \.dateStyle .~ .short
  |> \.timeStyle .~ .none
  |> \.timeZone .~ TimeZone(secondsFromGMT: 0)

public let episodeDateFormatter = DateFormatter()
  |> \.dateFormat .~ "EEEE MMM d, yyyy"
  |> \.timeZone .~ TimeZone(secondsFromGMT: 0)
