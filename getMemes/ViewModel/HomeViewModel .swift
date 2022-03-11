//
//  ViewModel .swift
//  getMemes
//
//  Created by Norhan Boghdadi on 3/11/22.
//

import Foundation
import UIKit

class HomeViewModel: ViewModelProtocol {
    
    //MARK: - Declerations
    var memes = [Meme]()
    
    var viewController: NotifaiableController?
    
    var numberOfCharacters: Int {
        memes.count
    }
    
    
    //MARK:- Initiations
    
    init(viewController: NotifaiableController) {
        self.viewController = viewController
        DispatchQueue.main.async {
            viewController.dataLoaded()
        }
        make(request: Constants.memesURL!)
    }
    
    //MARK: - Cell data Manipulations
    
    func data(for cellAt: IndexPath) -> Meme {
        memes[cellAt.row]
    }
    
    // MARK: - Networking functions
    
    private func make(request withURL: URL) {
        var request = URLRequest(url: withURL)
        request.httpMethod = "GET"
        send(request: request)
    }
    
    private func handle(respone: (Data?, URLResponse?, Error?))   {
        guard let data = respone.0 else { return }
        do {
            memes = try process(data: data)
            viewController?.dataLoaded()
        } catch {
             print(error.localizedDescription)
        }
    }
    
    private func send(request: URLRequest) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue:OperationQueue.main)
        let task = session.dataTask(with: request) {[weak self] (data, response, error) in
            self?.handle(respone: (data, response, error))
        }
        task.resume()
    }
    
    private func process(data: Data) throws ->  [Meme] {
        let jsonData = try JSONDecoder().decode(GetMemes.self, from: data)
        return jsonData.data.memes
    }
    
}

//MARK:- Constants
private extension HomeViewModel {
    struct Constants {
        static let memesURL = URL(string: "https://api.imgflip.com/get_memes")
    }
}
