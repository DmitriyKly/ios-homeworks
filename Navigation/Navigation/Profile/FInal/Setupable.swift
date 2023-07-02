//
//  Setupable.swift
//  Navigation
//
//  Created by dmitriy on 2/7/2023.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
