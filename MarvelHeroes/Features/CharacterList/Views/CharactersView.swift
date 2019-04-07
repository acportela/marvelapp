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
        view.estimatedRowHeight = 96
        return view
    }()
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.barTintColor = Resources.Colors.red
        view.tintColor = Resources.Colors.black
        view.isTranslucent = true
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.hidesWhenStopped = true
        return indicator
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
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.center.equalToSuperview()
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.black
        tableView.backgroundColor = Resources.Colors.black
        activityIndicator.isHidden = true
    }
}
