import SwiftUI

struct scroll3: View {
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10, id: \.self) { i in
                    VStack {
                        // この部分がスクロールしない
                        Text("Date: \(i)")
                            .padding()
                            .background(Color.blue)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // 同期された縦のScrollView
                        SynchronizedScrollView(scrollOffset: $scrollOffset) {
                            VStack {
                                ForEach(0..<3, id: \.self) { j in
                                    Text("Item: \(j)")
                                        .padding()
                                        .background(Color.gray.opacity(0.5))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SynchronizedScrollView<Content: View>: UIViewRepresentable {
    @Binding var scrollOffset: CGFloat
    let content: () -> Content
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        let hostView = UIHostingController(rootView: content())
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(hostView.view)
        
        NSLayoutConstraint.activate([
            hostView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        if uiView.contentOffset.y != scrollOffset {
            uiView.contentOffset.y = scrollOffset
        }
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: SynchronizedScrollView
        
        init(_ parent: SynchronizedScrollView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.scrollOffset = scrollView.contentOffset.y
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






#Preview {
    scroll3()
}
