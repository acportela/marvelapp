//
//  CharactersView.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharactersView: UIView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.barTintColor = Resources.Colors.lightRed
        return view
    }()
    
    public override init(frame: CGRect = .zero) {
        
        super.init(frame: frame)
        
        setupViewConfiguration()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension CharactersView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(searchBar)
    }
    
    func setupConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(56)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.black
    }
    
}
