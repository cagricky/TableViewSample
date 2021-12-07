//
//  ViewController.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 5.12.2021.
//

import UIKit

class MemeViewController: UIViewController {

    let tableView = UITableView()
    let viewModel = MemesViewModel()
    var pageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTableViewData()
        configureTableView()
    }
}

// MARK: - Setting Components
extension MemeViewController {
    
    func getTableViewData() {
        viewModel.delegate = self
        viewModel.loadData()
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = view.bounds.height / 2
        tableView.register(MemeCell.self, forCellReuseIdentifier: Constants.memeCellsIdentifier)
        tableView.pin(to: view)
    }
    
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
}

// MARK: - TableView DataSource & Delegate
extension MemeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.memeCellsIdentifier, for: indexPath) as! MemeCell
        cell.meme = viewModel.memes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = MemeDetailViewController()
        detailViewController.imageView.setKFImage(imageUrl: viewModel.memes[indexPath.row].url)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableView.tableFooterView = createSpinnerFooter()
        
        let contentOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.height
        
        if contentOffsetY > contentHeight - frameHeight {
            if pageNo < viewModel.divideCount - 1 {
                pageNo += 1
                self.viewModel.loadMoreData(paginating: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.tableView.reloadData()
                    self.tableView.tableFooterView = nil
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.tableView.tableFooterView = nil
                    self.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Service Observer
extension MemeViewController: MemesVMDelegate {
    
    func getMemes() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
