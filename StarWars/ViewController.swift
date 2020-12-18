//
//  ViewController.swift
//  StarWars
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ForceTableView: UITableView!
    
    var forceArray: [Force] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ForceTableView.register(UINib(nibName: "ForceTableViewCell", bundle: nil), forCellReuseIdentifier: "ForceTableViewCell")
        self.ForceTableView.dataSource = self
        self.ForceTableView.prefetchDataSource = self
        self.getSomeForceUsers()
    }
    
    private func getSomeForceUsers() {
        let group = DispatchGroup()
        for index in 1...10{
            group.enter()
            NetworkingManager.shared.getDecodedObject(from: self.createForceUserURL() + "\(index)") { (force:Force?, error) in
                guard let force = force else {return}
                self.forceArray.append(force)
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.ForceTableView.reloadData()
        }
    }
    
    
    private func createForceUserURL() -> String {
        let url = "https://swapi.dev/api/people/"
        return url
    }
    
    
    /*
     COULD PROBABLY FIGURE OUT HOW TO SHOW JUST THE ACTUAL PLANET NAME BUT RAN OUT OF TIME.
     **/
    
//    private func createHomeworldURL() -> String {
//        let url = "https://swapi.dev/api/planets/"
//        return url
//    }
    
    


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForceTableViewCell", for: indexPath) as! ForceTableViewCell
        cell.configure(with: self.forceArray[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndex = IndexPath(row: self.forceArray.count - 1, section: 0)
        guard indexPaths.contains(lastIndex) else {return}
        self.getSomeForceUsers()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.ForceTableView.reloadData()
    }
}


