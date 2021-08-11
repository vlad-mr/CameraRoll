//
//  InitialView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 11.08.2021.
//

import Combine
import Localize_Swift
import SwiftUI

// MARK: - InitialViewAction

enum InitialViewAction {
  case skip
}

// MARK: - InitialView

struct InitialView: View {

  // MARK: Internal

  @ObservedObject var viewModel: OnboardingViewModel

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          pageView
          Spacer(minLength: 30)
          Text("Welcome, have fun!")
            .font(.poppinsBold(18))
            .foregroundColor(.buttonColorEnabled)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
        }
        .padding([.leading, .trailing])
      }
      bottom
        .ignoresSafeArea(.keyboard)
        .padding([.leading, .trailing])
        .offset(y: geometry.size.height - bottomHeight)
    }
    .navigationBarItems(leading: Views.logo)
    .navigationBarTitleDisplayMode(.inline)
  }

  // MARK: Private

  private var bottomHeight: CGFloat { 90 }

  @ViewBuilder private var pageView: some View {
    tabView
      .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    Spacer(minLength: 30)
  }

  @ViewBuilder private var tabView: some View {
    TabView {
      ForEach(viewModel.images, id: \.self) { _ in
        Image("brand").resizable().scaledToFit().cornerRadius(5)
      }
    }
    .frame(minHeight: 300, idealHeight: 410)
  }

  @ViewBuilder private var bottom: some View {
    VStack(alignment: .leading) {
      Views.button(title: "Continue".local) {
        viewModel.action(.skip)
      }
      Views.links.padding(.bottom, 30)
    }
  }
}
