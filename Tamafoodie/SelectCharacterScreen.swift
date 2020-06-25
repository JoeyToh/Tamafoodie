//
//  SelectCharacterScreen.swift
//  Tamafoodie
//
//  Created by Toh Joey on 26/6/20.
//  Copyright © 2020 Toh Joey. All rights reserved.
//

import UIKit

class SelectCharacterScreen: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var counter : Int = 0;

    var selectedCharacter : UIImage!
    
    var imageArr = [ UIImage(named: "hamster"),
                     UIImage(named: "bunny"),
                     UIImage(named: "dog"),
                     UIImage(named: "og tama")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapNext() {
        if self.counter >= self.imageArr.count - 1 {
            counter = 0
        } else {
            counter += 1
        }
        imageView.image = imageArr[counter]
    }

    @IBAction func didTapPrevious() {
        if self.counter == 0 {
            counter = self.imageArr.count - 1
        } else {
            counter -= 1
        }
        imageView.image = imageArr[counter]
    }

    @IBAction func didTapSelect(_ sender: Any) {
        self.selectedCharacter = imageView.image!
        performSegue(withIdentifier: "selectedCharacter", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MainScreen
        vc.finalCharacter = self.selectedCharacter
    }

}
