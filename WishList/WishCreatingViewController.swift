//
//  WishCreatingViewController.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/10/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class WishCreatingViewController: UIViewController {
  
  @IBOutlet weak var wishDetailsTextView: UITextView!
  @IBOutlet weak var textViewContainerView: UIView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    textViewContainerView.layer.cornerRadius = 10.0
    textViewContainerView.layer.borderWidth = 1.0
    textViewContainerView.layer.borderColor = UIColor.black.cgColor
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func cancelTapped(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func saveTapped(_ sender: Any) {
  }
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
