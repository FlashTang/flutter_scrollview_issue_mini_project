//
//  ViewController.swift
//  EmbedInScrollView
//
//  Created by Tang on 2023/3/30.
//

import UIKit
import Flutter
class ViewController: UIViewController {
    
    var flutterViewController:UIViewController!
    var scrollView:UIScrollView!
    var contentView:UIView! //container for flutterViewController.view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        self.addChild(flutterViewController)
 
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .yellow
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        contentView.backgroundColor = .green
        scrollView.addSubview(contentView)
        
        contentView.addSubview(flutterViewController.view)
        flutterViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            flutterViewController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            flutterViewController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            flutterViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            flutterViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        scrollView.contentSize = CGSize(width: 1000, height: 1000)
        
    }


}

