//
//  LocationInputActivationView.swift
//  UberTutorial
//
//  Created by Stephen Dowless on 9/22/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol LocationInputActivationViewDelegate {
    func presentLocationInputView()
}

class LocationInputActivationView: UIView {
    
    // MARK: - Properties
    
    var delegate: LocationInputActivationViewDelegate?
    
    let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleViewTapped() {
        delegate?.presentLocationInputView()
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        backgroundColor = .white
        addShadow()
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeholderLabel)
        placeholderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
    }
    
    func configureGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleViewTapped))
        addGestureRecognizer(tap)
    }
}
