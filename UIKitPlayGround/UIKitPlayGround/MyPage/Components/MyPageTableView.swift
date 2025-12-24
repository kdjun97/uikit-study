//
//  MyPageTableView.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/23/25
//

import UIKit

final class MyPageTableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MyPageTableView {
    func setupUI() {
        separatorInset = .zero
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 44
        separatorStyle = .none
        
        register(SupportCell.self, forCellReuseIdentifier: SupportCell.identifier)
//        delegate = self
//        dataSource = self
    }
}

//extension MyPageTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row + 1) selected")
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//
//extension MyPageTableView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: SupportCell.identifier,
//            for: indexPath
//        ) as? SupportCell
//        
//        let item = items[indexPath.row]
//        
//        cell?.configure(title: item.name ?? "-")
//        
//        return cell
//    }
//}
