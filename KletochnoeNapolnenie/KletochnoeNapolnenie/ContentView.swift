import SwiftUI

struct ContentView: View {
		
		@State private var kletki: [KletkaModel] = [KletkaModel]()
		@State private var state: Int = 0
		
    var body: some View {
				ZStack(alignment: .top) {
						LinearGradient(colors: [Color("background"), .black], startPoint: .top, endPoint: .bottom)
								.ignoresSafeArea()
						VStack {
								Text("Клеточное наполнение")
										.font(.system(size: 20, weight: .medium))
										.foregroundColor(.white)
								ScrollViewReader { proxy in
										ScrollView {
												VStack(spacing: 4) {
														ForEach(kletki) { kletka in
																Kletka(type: kletka.type)
																		.padding(.horizontal, 16)
																		.id(kletka.id)
														}
												}
										}
										.onChange(of: kletki.count) { _ in
												withAnimation {
														proxy.scrollTo(kletki.last?.id)
												}
										}
								}
								Spacer()
								Button {
										if kletki.count > 0 {
												withAnimation {
														createCell()
												}
										} else {
												createCell()
										}
								} label: {
										Text("СОТВОРИТЬ")
												.font(.system(size: 14, weight: .medium))
												.foregroundColor(.white)
												.frame(maxWidth: .infinity, minHeight: 36)
												.background(Color("button"))
												.cornerRadius(4)
												.padding(.horizontal, 16)
								}
						}
				}
    }
		
		private func createCell() {
				
				var create: Int = .random(in: 0...1)
				if create == 0 {
						create = -1
				}
				
				if state * create > 0 {
						state += create
				} else {
						state = create
				}
				
				if let type = KletkaType(rawValue: create) {
						kletki.append(KletkaModel(type))
				}
				
				switch state {
						case 3:
								kletki.append(KletkaModel(.life))
						case -3:
								if let ind = kletki.lastIndex(where: { kletka in
										kletka.type == .life
								}) {
										if ind == kletki.count - 4 {
												kletki.remove(at: ind)
										}
								}
						default:
								return
				}
				state = 0
		}
}
