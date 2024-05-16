//
//  ContentView.swift
//  ListApp
//
//  Created by Sushmitha Rani on 16/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var albums: [Album] = []

var body: some View {
    NavigationView {
        List(albums){ album in
            HStack {
                AsyncImage(url: album.url)
                { phase in
                    switch phase {
                    case .failure: Image(systemName: "photo") .font(.largeTitle)
                    case .success(let image):
                        image.resizable()
                    default: ProgressView()
                        
                    }
                }
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading) {
                    Text("\(album.id)").bold()
                    Text(album.title).bold().font(.title3)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(.purple)
        .navigationTitle("Photos from API")
        .onAppear {
            fetchRemoteData()
        }
    }
    }
    private func fetchRemoteData() {
            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"  // optional
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                if let error = error {
                    print("Error while fetching data:", error)
                    return
                }

                guard let data = data else {
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([Album].self, from: data)
                    // Assigning the data to the array
                    self.albums = decodedData
                } catch let jsonError {
                    print("Failed to decode json", jsonError)
                }
            }

            task.resume()
        }
}


//https://jsonplaceholder.typicode.com/photos 1>Display data from API into list.
//2>Write unit test
//3>Push the code into GitHub.
#Preview {
    ContentView()
}
/*
 private let itemFormatter: DateFormatter = {
     let formatter = DateFormatter()
     formatter.dateStyle = .short
     formatter.timeStyle = .medium
     return formatter
 }()
 {
 @Environment(\.managedObjectContext) private var viewContext

 @FetchRequest(
     sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
     animation: .default)
 private var items: FetchedResults<Item>

 var body: some View {
     NavigationView {
         List {
             ForEach(items) { item in
                 NavigationLink {
                     Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                 } label: {
                     Text(item.timestamp!, formatter: itemFormatter)
                 }
             }
             .onDelete(perform: deleteItems)
         }
         .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                 EditButton()
             }
             ToolbarItem {
                 Button(action: addItem) {
                     Label("Add Item", systemImage: "plus")
                 }
             }
         }
         Text("Select an item")
     }
 }

 private func addItem() {
     withAnimation {
         let newItem = Item(context: viewContext)
         newItem.timestamp = Date()

         do {
             try viewContext.save()
         } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             let nsError = error as NSError
             fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
     }
 }

 private func deleteItems(offsets: IndexSet) {
     withAnimation {
         offsets.map { items[$0] }.forEach(viewContext.delete)

         do {
             try viewContext.save()
         } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             let nsError = error as NSError
             fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
     }
 }
}*/
