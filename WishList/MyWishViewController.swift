//
//  MyWishViewController.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/6/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
