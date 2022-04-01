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
                .zIndex(1) // make top part (with help) on front
            
            // DETAIL BOTTOM PART
            
            VStack(alignment: .center, spacing: 0, content: {
                // RATINGS + SIZES
                RatingsSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                // DESCRIPTION
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    Text(product.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }) //: SCROLL
                
                // QUANTITY + FAVOURITE
                QuantityFavouriteDetailView()
                    .padding(.vertical, 10)
                
                // ADD TO CART
                Spacer()
                
            }) //: VSTACK
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105) // move white backgroud upper
            )
        }) //: VSTACK
        .zIndex(0) // make white bg behind
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: product.red,
                green: product.green,
                blue: product.blue
            ).ignoresSafeArea(.all, edges: .all) // colored bg
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
