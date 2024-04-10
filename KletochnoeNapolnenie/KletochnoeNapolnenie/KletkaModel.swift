import Foundation

struct KletkaModel: Identifiable {
		let id: UUID = UUID()
		
		var type: KletkaType
		
		init(_ type: KletkaType) {
				self.type = type
		}
}
