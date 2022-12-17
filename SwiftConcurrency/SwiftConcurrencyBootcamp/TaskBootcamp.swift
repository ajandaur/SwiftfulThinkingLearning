//
//  TaskBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 5/31/22.
//

import SwiftUI

class TaskBootcampViweModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            await MainActor.run(body: {
                self.image = UIImage(data: data)
            })
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            await MainActor.run(body: {
                self.image2 = UIImage(data: data)
            })
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TaskBootcampHomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("CLICK ME!") {
                    TaskBootcamp()
                }
            }
        }
    }
}


struct TaskBootcamp: View {
    
    @StateObject private var viewModel = TaskBootcampViweModel()
    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            if let image2 = viewModel.image2 {
                Image(uiImage: image2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await viewModel.fetchImage()
        }
    }
    //        .onDisappear {
    //            fetchImageTask?.cancel()
    //        }
    //        .onAppear {
    //
    //            fetchImageTask = Task {
    //                await viewModel.fetchImage()
    //                // this can not run until the other once above finishes running before it
    //
    //            }
    //
    //            Task {
    //                print(Thread.current)
    //                print(Task.currentPriority)
    //                await viewModel.fetchImage2()
    //            }
    
    //            Task(priority: .low) {
    //                print("LOW: \(Thread.current) : \(Task.currentPriority)")
    //            }
    //
    //            Task(priority: .medium) {
    //                print("LOW: \(Thread.current) : \(Task.currentPriority)")
    //            }
    //
    //            Task(priority: .background) {
    //                print("LOW: \(Thread.current) : \(Task.currentPriority)")
    //            }
    //
    //            Task(priority: .utility) {
    //                print("LOW: \(Thread.current) : \(Task.currentPriority)")
    //            }
    //
    //            Task(priority: .userInitiated) {
    //                print("LOW: \(Thread.current) : \(Task.currentPriority)")
    //            }
}


struct TaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootcamp()
    }
}
