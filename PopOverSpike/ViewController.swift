//
//  ViewController.swift
//  PopOverSpike
//
//  Created by Mohamed Kelany on 6/3/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit
import Popover

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func showPopover(_ sender: UIButton) {
        
        showPopover()
 
//        stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
//        stack.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
//        stack.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

    }
    
     @IBOutlet weak var testBtn: UIButton!
    
    private func showPopover() {
       
        
        let width = 0.75 * self.view.frame.width
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 82))
        //let margin =
        aView.backgroundColor = .white
        let options = [
            .type(.up),
            .cornerRadius(3),
            .animationIn(0.3),
            .blackOverlayColor(UIColor(white: 0.0, alpha: 0.2)),
            .color(UIColor.white),
            .arrowSize(CGSize(width: 16.0, height: 10.0))
            ] as [PopoverOption]

        let b1:UIButton = {
            let v = UIButton(type: .system)
            v.setTitle(NSLocalizedString("اضافه اعلان", comment: "Button"), for: .normal)

            return v
        }()
        
        let imgView1:UIImageView = {
            let img = UIImage(named: "ic_quotation")
            let imageView = UIImageView(image: img!)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            
            return imageView
            
        }()
        
        
        
        let stack1:UIStackView = {
            let s = UIStackView(frame: aView.bounds)
            s.axis = .horizontal
            s.distribution = .fillProportionally
            s.alignment = .fill
            s.spacing = 5
            s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            s.backgroundColor = .white
            
            s.addArrangedSubview(b1)
            s.addArrangedSubview(imgView1)
            
            return s
        }()
        
        let separator:UIView = {
            let sep = UIView()
            sep.backgroundColor = .black
            sep.frame.size.width = 1.0
            return sep
        }()
        
 
        
        let b2:UIButton = {
            let v = UIButton(type: .system)
            v.setTitle(NSLocalizedString("طلب تثمين", comment: "Button"), for: .normal)
            v.backgroundColor = .green
            //v.backgroundColor = .blue
            return v
        }()
        
        let imgView2:UIImageView = {
            let img = UIImage(named: "ic_newads")
            let imageView = UIImageView(image: img!)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            
            return imageView
            
        }()
        
     
        let stack2:UIStackView = {
            let s = UIStackView(frame: aView.bounds)
            s.axis = .horizontal
            s.distribution = .fillProportionally
            s.alignment = .fill
            s.spacing = 5
            s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            s.backgroundColor = .red
            s.addArrangedSubview(b2)
            s.addArrangedSubview(imgView2)
            
            return s
        }()

    
        
        var squareFrame: CGRect {
            let midX = aView.bounds.midX
            let midY = aView.bounds.midY
            let width = 0.9 * aView.frame.size.width
            let height = 0.3 * aView.frame.size.height
            return CGRect(x: midX - width / 2.0, y: midY - height / 2.0, width: width , height: height)
        }
        
        let stack:UIStackView = {
            let s = UIStackView(frame: squareFrame)
            s.axis = .horizontal
            s.distribution = .fill
            s.alignment = .fill
            s.spacing = aView.frame.size.width / 7.2
            s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            s.backgroundColor = .gray
           
            s.addArrangedSubview(stack1)
            s.addArrangedSubview(separator)
            s.addArrangedSubview(stack2)
            
            return s
        }()
        aView.addSubview(stack)


        let popover = Popover(options: options, showHandler: nil, dismissHandler: nil)
        popover.show(aView, fromView: self.testBtn)
        
    }
    
    
    
}

