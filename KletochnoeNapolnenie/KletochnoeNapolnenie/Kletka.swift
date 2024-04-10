import SwiftUI

struct Kletka: View {
		
		var type: KletkaType
		
		var body: some View {
				HStack(spacing: 0) {
						Text(type.icon)
								.frame(width: 40, height: 40)
								.background(.linearGradient(
										colors: type.colors,
										startPoint: .top,
										endPoint: .bottom)
								)
								.cornerRadius(20)
								.padding(16)
						VStack(alignment: .leading, spacing: 2) {
								Text(type.title)
										.font(.system(size: 20, weight: .medium))
								Text(type.subtitle)
										.font(.system(size: 14))
						}
						Spacer()
				}
				.background(.white)
				.foregroundColor(.black)
				.cornerRadius(8)
		}
}
