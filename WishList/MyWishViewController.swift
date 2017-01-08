//
//  MyWishViewController.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/6/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

let offsetHeaderStop: CGFloat = 40.0
let offsetBlackLabelHeader: CGFloat = 95.0
let distanceWhiteLabelHeader: CGFloat = 35.0

class MyWishViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var header: UIView!
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var headerNameLabel: UILabel!
  @IBOutlet weak var headerImageView: UIImageView!
  @IBOutlet weak var headerBlurImageView: UIImageView!
  @IBOutlet weak var mainNameLabel: UILabel!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    configViewElement()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func configViewElement() {
    avatarImage.layer.cornerRadius = 10.0
    avatarImage.layer.borderWidth = 3.0
    avatarImage.layer.borderColor = UIColor.white.cgColor
    
    headerImageView.image = UIImage(named: "header_bg")
    
    headerBlurImageView.image = UIImage(named: "header_bg")?.blurredImage(withRadius: 10, iterations: 20, tintColor: UIColor.clear)
    headerBlurImageView.alpha = 0.0

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

extension MyWishViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
    
    return cell
  }
}

extension MyWishViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let offset = scrollView.contentOffset.y
    var avatarTransform = CATransform3DIdentity
    var headerTransform = CATransform3DIdentity
    
    if offset < 0 {
      let headerScaleFactor: CGFloat = -(offset) / header.bounds.height
      let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
      headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
      headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
      
      header.layer.transform = headerTransform
    } else {
      
      headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offsetHeaderStop, -offset), 0)
      
      let labelTransform = CATransform3DMakeTranslation(0, max(-distanceWhiteLabelHeader, offsetBlackLabelHeader - offset), 0)
      headerNameLabel.layer.transform = labelTransform
      
      headerBlurImageView.alpha = min(1.0, (offset - offsetBlackLabelHeader)/distanceWhiteLabelHeader)
      
      let avatarScaleFactor = (min(offsetHeaderStop, offset)) / avatarImage.bounds.height / 1.4
      let avatarSizeVariation = ((avatarImage.bounds.height * (1.0 + avatarScaleFactor)) - avatarImage.bounds.height) / 2.0
      avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0)
      avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
      
      if offset <= offsetHeaderStop {
        if avatarImage.layer.zPosition < header.layer.zPosition {
          header.layer.zPosition = 0
        }
      } else {
        if avatarImage.layer.zPosition >= header.layer.zPosition {
          header.layer.zPosition = 2
        }
      }
    }
    
    header.layer.transform = headerTransform
    avatarImage.layer.transform = avatarTransform
  }
}
