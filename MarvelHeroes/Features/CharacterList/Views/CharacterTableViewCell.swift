//
//  CharacterTableViewCell.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class CharacterTableViewCell: UITableViewCell {
    
    private let thumb: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private let name: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.9
        name.lineBreakMode = .byClipping
        name.textColor = Resources.Colors.white
        return name
    }()
    
    private lazy var heart: UIButton = {
        let button = UIButton()
        button.tintColor = Resources.Colors.red
        let selected = Resources.Images.favoriteIconFilled
        let unselected = Resources.Images.favoriteIconOutlined
        button.setBackgroundImage(selected, for: .selected)
        button.setBackgroundImage(unselected, for: .normal)
        return button
    }()
    
    private var character: MarvelCharacter? {
        didSet {
            guard let char = character else { return }
            name.text = char.name
            thumb.download(image: char.thumbnail.fullPath)
        }
    }
    
    private let content = UIView()
    
    var characterWasFavorited: ((Bool) -> Void)?
    
    static func height() -> CGFloat {
        return 96
    }
    
    public init(frame: CGRect) {
        super.init(style: .default, reuseIdentifier: type(of: self).reusableIdentifier)
        self.frame = frame
        setupViewConfiguration()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
}

extension CharacterTableViewCell: ViewCodingProtocol {
    func buildViewHierarchy() {
        addSubview(content)
        content.addSubview(thumb)
        content.addSubview(heart)
        content.addSubview(name)
    }
    
    func setupConstraints() {
        
        content.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8)
            make.right.bottom.equalToSuperview().inset(8)
        }
        
        thumb.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        heart.snp.makeConstraints { make in
            make.height.width.equalTo(25)
            make.top.equalTo(name.snp.bottom).offset(16)
            make.left.equalTo(name.snp.left)
        }

        name.snp.makeConstraints { make in
            make.top.equalTo(thumb.snp.top)
            make.left.equalTo(thumb.snp.right).offset(32)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    
    func configureViews() {
        selectionStyle = .none
        backgroundColor = Resources.Colors.black
        heart.addTarget(self, action: #selector(handleHeartTouch), for: .touchUpInside)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleFavoriteNotification),
                                               name: .characterWasFavorited,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleUnfavoriteNotification),
                                               name: .characterWasUnfavorited,
                                               object: nil)
    }
}

extension CharacterTableViewCell {
    public struct Configuration {
        let character: MarvelCharacter
        let isFavorite: Bool
    }
    
    public func setup(with config: Configuration) {
        character = config.character
        heart.isSelected = config.isFavorite
    }
}

extension CharacterTableViewCell: Reusable { }

extension CharacterTableViewCell {
    @objc
    func handleHeartTouch() {
        heart.isSelected = !heart.isSelected
        characterWasFavorited?(heart.isSelected)
    }
    
    @objc
    func handleFavoriteNotification(_ notification: Notification) {
        guard let info = notification.userInfo,
              let object = info[Notification.Name.characterWasFavorited],
              let character = object as? MarvelCharacter else {
            return
        }
        if character.id == self.character?.id {
            heart.isSelected = true
        }
    }
    
    @objc
    func handleUnfavoriteNotification(_ notification: Notification) {
        guard let info = notification.userInfo,
              let object = info[Notification.Name.characterWasUnfavorited],
              let character = object as? MarvelCharacter else {
            return
        }
        if character.id == self.character?.id {
            heart.isSelected = false
        }
    }
}
