import SwiftUI

struct TopPartDetailView: View {
    // MARK: - PROPERTY
    
    @State private var isAnimating: Bool = false
    
    let product: Product
    
    // MARK: - BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            // PRICE
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(product.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            }) //: VSTACK
            .offset(y: isAnimating ? -50 : -75)
            
            Spacer()
            
            // PHOTO
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)
            
        }) //: HSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        })
    }
}

// MARK: - PREVIEW

struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView(product: sampleProduct)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
