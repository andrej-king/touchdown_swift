import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTY
    
    let product: Product
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            // NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // HEADER
            
            HeaderDetailView(product: product)
                .padding(.horizontal)
            
            // DETAIL TOP PART
            
            TopPartDetailView(product: product)
                .padding(.horizontal)
            
            // DETAIL BOTTOM PART
            // RATINGS + SIZES
            // DESCRIPTION
            // QUANTITY + FAVOURITE
            
            // ADD TO CART
            Spacer()
        }) //: VSTACK
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: product.red,
                green: product.green,
                blue: product.blue
            ).ignoresSafeArea(.all, edges: .all)
        )
    }
}

// MARK: - PREVIEW

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: sampleProduct)
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
