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

    var strokeColor: UIColor? {
        get {
            backgroundColor
        }
        set {
            lineView.backgroundColor = newValue
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
        addSubview(lineView)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalToConstant: 16),
        ])
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: -8),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: lineView.leadingAnchor, constant: -13),
        ])
    }
}
#endif
