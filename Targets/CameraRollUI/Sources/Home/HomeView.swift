//
//  HomeView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 21.06.2021.
//

import SwiftUI

// MARK: - HomeView

struct HomeView: View {

  // MARK: Internal

  @ObservedObject var viewModel: HomeViewModel

  var body: some View {
    VStack {
      Spacer()
      Text("Home")
      Spacer()
      picker
      Spacer()
      if let url = URL(string: "string") {
        AsyncImage(
          url: url,
          placeholder: { Text("Loading ...") },
          image: { Image(uiImage: $0)
            .resizable()
          })
          .aspectRatio(contentMode: .fit)
      } else {
        Image("brand")
      }
    }
  }

  // MARK: Private

  @ViewBuilder private var picker: some View {
    Picker(selection: $viewModel.tab, label: Text("")) {
      Text("Recents".local).tag(HomeTab.recentes)
      Text("Favourites".local).tag(HomeTab.favourites)
    }
    .pickerStyle(SegmentedPickerStyle())
    .frame(width: 200, height: 30, alignment: .leading)
    Spacer(minLength: 15)
  }
}
