//
//  HomeView.swift
//  vladmr@pm.me
//
//  Created by Volodymyr Kravchenko on 21.06.2021.
//

import SwiftUI
import PartialSheet
import Combine

// MARK: - HomeView

struct HomeView: View {

  // MARK: Internal

  @ObservedObject var viewModel: HomeViewModel

  var body: some View {
    list
      .onAppear { viewModel.action(.fetch) }
      .alert(isPresented: $viewModel.hasError) {
        Alert(title: Text("Error"),
              message: viewModel.error != nil ? Text(viewModel.error!.localizedDescription) : nil,
              dismissButton: .cancel { self.viewModel.error = nil })
      }
  }

  // MARK: Private
  @EnvironmentObject private var partialSheet: PartialSheetManager

  @ViewBuilder private var picker: some View {
    Picker(selection: $viewModel.tab, label: Text("")) {
      Text("Recents".local).tag(HomeTab.recentes)
      Text("Favourites".local).tag(HomeTab.favourites)
    }
    .pickerStyle(SegmentedPickerStyle())
    .frame(width: 200, height: 30, alignment: .leading)
    Spacer(minLength: 15)
  }

  @ViewBuilder private var errorView: some View {
    Views.error(viewModel.error?.localizedDescription)
  }

  @ViewBuilder private var list: some View {
    let columns = [GridItem.flexible, .flexible]
    ScrollView(.vertical, showsIndicators: false) {
      HStack {
        Spacer()
        picker
      }
      LazyVGrid(columns: columns) {
        ForEach(viewModel.persons, id: \.email) { person in
          Button {
            viewModel.action(.select(person))
          } label: {
            if let url = URL(string: person.picture.large) {
              AsyncImage(url: url) { Image(systemName: "person.icloud") }
            } else {
              Image(systemName: "person.fill.questionmark")
            }
          }
          .padding()
          .foregroundColor(.black)
          .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.white)
            .shadow(radius: 2, x: 0, y: 2)
          )
        }
      }
    }
  }
}
