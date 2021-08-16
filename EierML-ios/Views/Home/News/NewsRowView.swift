//
//  NewsRowView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 08.08.21.
//

import SwiftUI
import SwiftUIWPArticleLoader

struct NewsRowView: View {
    var article: Article

    var body: some View {
        ZStack {
            Color.primary.colorInvert()
            backgroundImage
            VStack {
                Spacer()
                ZStack {
                    VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(article.title)
                                .lineLimit(1)
                            HStack {
                                Text(article.date?.toString("E d. MMM yyyy", showToday: true) ?? "Kein Datum")
                                    .lineLimit(1)
                                    .font(.footnote)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(article.categories) { category in
                                            Text(category.name)
                                                .lineLimit(1)
                                                .font(.footnote)
                                                .foregroundColor(.white)
                                                .padding(.vertical, 1.5)
                                                .padding(.horizontal, 3)
                                                .background(Color.accentColor)
                                                .cornerRadius(5)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.trailing, 5)
                        profileImage
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
            }
        }
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }

    var backgroundImage: some View {
        VStack {
            if let featuredImageLoader = article.featuredImageLoader {
                AsyncImage(imageLoader: featuredImageLoader) {
                    ZStack {
                        ClassicBackgroundView()
                        NewsImageLoadingView()
                    }
                }
            } else {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .accentColor.opacity(0.4),
                            .accentColor.opacity(0.2)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    Image("Logo transparent")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 100)
                }
            }
        }
    }

    var profileImage: some View {
        VStack {
            if let featuredImageLoader = article.author.profileImageLoader {
                AsyncImage(imageLoader: featuredImageLoader) {
                    NewsImageLoadingView()
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing)
            }
        }
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(article: .mock)
            .frame(width: 300, height: 170, alignment: .center)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(
        _ uiView: UIVisualEffectView,
        context: UIViewRepresentableContext<Self>
    ) {
        uiView.effect = effect
    }
}
