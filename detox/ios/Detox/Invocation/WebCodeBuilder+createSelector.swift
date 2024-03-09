//
//  WebCodeBuilder+createSelector.swift (Detox)
//  Created by Asaf Korem (Wix.com) on 2024.
//

/// This extension is responsible for creating the JavaScript selector for the given predicate type
///  and value.
extension WebCodeBuilder {
	func createSelector(forType type: WebPredicateType, value: String) -> String {
		let value = value.replacingOccurrences(of: "'", with: "/'")

		switch type {
			case .id:
				return "document.getElementById('\(value)')"

			case .className:
				return "document.getElementsByClassName('\(value)').item(0)"

			case .cssSelector:
				return "document.querySelector('\(value)')"

			case .name:
				return "document.getElementsByName('\(value)').item(0)"

			case .xpath:
				return "document.evaluate('\(value)', document, null, " +
					"XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue"

			case .href:
				return "document.querySelector('a[href=\"\(value)\"]')"

			case .hrefContains:
				return "document.querySelector('a[href*=\"\(value)\"]').href"

			case .tag:
				return "document.getElementsByTagName('\(value)').item(0)"

			case .label:
				return "document.querySelector('[aria-label=\"\(value)\"]')"

			case .value:
				return "document.querySelector('[value=\"\(value)\"]')"
				
			case .accessibilityType:
				return "document.querySelector('[role=\"\(value)\"]')"
		}
	}
}
