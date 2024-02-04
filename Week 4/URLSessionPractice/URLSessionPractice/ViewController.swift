//
//  ViewController.swift
//  URLSessionPractice
//
//  Created by NY on 2024/2/2.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    struct Station: Codable {
        let stationID: String
        let stationName: String
        let stationAddress: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData() {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let url = URL(string: "https://remote-assignment.s3.ap-northeast-1.amazonaws.com/station")!
        
        let task = session.dataTask(with: url) {
            
            (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                return
            }
                
            do {
                let decoder = JSONDecoder()
                let station = try decoder.decode(Station.self, from: data)
                
//                // OperationQueue API
//                let queue = OperationQueue.main
//                queue.addOperation {
//                    self.updateUI(with: station)
//                }
                // GCD API
                DispatchQueue.main.async { [weak self] in
                    self?.updateUI(with: station)
                }
                
            } catch {
                print("Error info: \(error)")
            }
        }
        task.resume()
    }
    
    func updateUI(with station: Station) {
        stationIDLabel.text = "\(station.stationID)"
        stationNameLabel.text = "\(station.stationName)"
        addressLabel.text = "\(station.stationAddress)"
    }
    
}

