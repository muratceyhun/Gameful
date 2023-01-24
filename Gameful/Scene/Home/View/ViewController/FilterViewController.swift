//
//  FilterViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 21.01.2023.
//

import UIKit
import PanModal

class FilterViewController: UIViewController, StoryboardProtocol {
    
    @IBOutlet private weak var table: UITableView!
    let viewModel = FilterViewModel()
    var filterCallBack: ((HomeEndPoint)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "FilterTableViewTitleCell", bundle: nil)
        table.register(cellNib, forCellReuseIdentifier: "FilterTableViewTitleCell")
    }
}


//MARK: -UITableViewDataSource
extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewTitleCell", for: indexPath) as! FilterTableViewTitleCell
        cell.configure(title: viewModel.items[indexPath.row].title)
        return cell
    }
}

//MARK: -UITableViewDelegate
extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) { [weak self] in
            self?.filterCallBack?(self?.viewModel.items[indexPath.row].category ?? .all)
        }
    }
}
//MARK: -PanModalPresentable
extension FilterViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        nil
    }
    var shortFormHeight: PanModalHeight {
        return .contentHeight(256)
    }
    
    var cornerRadius: CGFloat {
        20
    }
}
    
    
    
