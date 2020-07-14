//
//  HomeCell.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    static let reuseIdentifier = String(describing: self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: HomeCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        textLabel?.text = viewModel.name
    }
}
