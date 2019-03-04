//
//  TableViewController.swift
//  Gourmet_King
//
//  Created by Yoshiki Kishimoto on 2019/03/04.
//  Copyright © 2019 Yoshiki Kishimoto. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let restruant = ["Mondatta", "俺のフレンチ"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restruant.count
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text  = restruant[indexPath.row]
        
        return cell
    }


}
