//
//  IssueCommentHrCell.swift
//  Freetime
//
//  Created by Ryan Nystrom on 6/20/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

final class IssueCommentHrCell: IssueCommentBaseCell, ListBindable {

    static let inset = UIEdgeInsets(
        top: 0,
        left: Styles.Sizes.commentGutter,
        bottom: Styles.Sizes.rowSpacing,
        right: Styles.Sizes.commentGutter
    )

    let hr = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

       contentView.addSubview(configureHRView())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure UI
    private func configureHRView() -> UIView {
        hr.backgroundColor = Styles.Colors.Gray.lighter.color
        hr.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(IssueCommentHrCell.inset)
        }

        return hr
    }

    // MARK: ListBindable

    func bindViewModel(_ viewModel: Any) {}

}
