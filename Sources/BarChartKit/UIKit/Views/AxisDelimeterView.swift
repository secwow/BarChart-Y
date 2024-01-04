//
//  LimitView.swift
//
//
//  Created by Marek Přidal on 18/10/2020.
//

#if os(iOS) || os(visionOS)
import UIKit

final class AxisDelimeterView: UIView {
    lazy var label: LimitLabel = {
        .init()
    }()

    var strokeColor: UIColor {
        get {
            UIColor(cgColor: dashedView.strokeColor)
        }
        set {
            dashedView.strokeColor = newValue.cgColor
        }
    }

    private lazy var lineView: UIView = {
        .init()
    }()

    // MARK: - Init
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // MARK: - Override
#if os(iOS)
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
#endif
    private func commonInit() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 16),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 15)
        ])

        addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
