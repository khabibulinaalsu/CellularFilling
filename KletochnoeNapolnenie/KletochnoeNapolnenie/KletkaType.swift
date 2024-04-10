import Foundation
import SwiftUI

enum KletkaType: Int {
		
		case dead = -1
		case alive = 1
		case life = 0
		
		var icon: String {
				switch self {
						case .dead:
								return "💀"
						case .alive:
								return "💥"
						case .life:
								return "🐣"
				}
		}
		
		var title: String {
				switch self {
						case .dead:
								return "Мёртвая"
						case .alive:
								return "Живая"
						case .life:
								return "Жизнь"
				}
		}
		
		var subtitle: String {
				switch self {
						case .dead:
								return "или прикидывается"
						case .alive:
								return "и шевелится!"
						case .life:
								return "Ку-ку!"
				}
		}
		
		var colors: [Color] {
				switch self {
						case .dead:
								return [Color("dead.top"), Color("dead.bottom")]
						case .alive:
								return [Color("alive.top"), Color("alive.bottom")]
						case .life:
								return [Color("life.top"), Color("life.bottom")]
				}
		}
}
