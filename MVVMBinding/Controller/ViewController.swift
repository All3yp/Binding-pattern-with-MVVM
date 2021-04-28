//
//  ViewController.swift
//  MVVMBinding
//
//  Created by Alley Pereira on 27/04/21.
//

import UIKit

//MARK: Controller

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var viewModel = UserListViewModel()

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Users"

        viewModel.userViewModels.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        fetchData()
    }

    // table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userViewModels.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.userViewModels.value?[indexPath.row].name
        return cell
    }

    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let userModels = try JSONDecoder().decode([User].self, from: data)

                self.viewModel.userViewModels.value = userModels.compactMap({
                    UserTableViewCellViewModel(name: $0.name)
                })
            }
            catch {

            }
        }
        task.resume()
    }
}

