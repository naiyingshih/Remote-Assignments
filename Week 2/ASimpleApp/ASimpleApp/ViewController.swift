//
//  ViewController.swift
//  ASimpleApp
//
//  Created by NY on 2024/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var funFacts: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var buttonText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor()
        changeBottonTextColor()
    }
    
    let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cities of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
    ]
    
    let colors: [UIColor] = [ .systemPink,
                              .systemOrange,
                              .systemGreen,
                              .systemBlue,
                              .systemGray,
                              .systemPurple,
                              .systemBrown
    ]
    
    @IBAction func showAnotherView(_ sender: UIButton) {
        funFacts.text = text.randomElement()
        changeBackgroundColor()
        changeBottonTextColor()
    }
    
    func changeBackgroundColor() {
        let randomColor = colors.randomElement()
        backgroundView.backgroundColor = randomColor
    }
    
    func changeBottonTextColor() {
        buttonText.setTitle("Show Another Fun Fact", for: .normal)
        buttonText.setTitleColor(backgroundView.backgroundColor, for: .normal)
        buttonText.setTitleColor(.lightGray, for: .highlighted)
    }
}

