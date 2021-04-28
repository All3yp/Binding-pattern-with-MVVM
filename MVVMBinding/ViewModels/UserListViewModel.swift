//
//  UserListViewModel.swift
//  MVVMBinding
//
//  Created by Alley Pereira on 27/04/21.
//

import Foundation

//MARK: ViewModels
struct UserListViewModel {
    var userViewModels: Observable<[UserTableViewCellViewModel]> = Observable([])
}
