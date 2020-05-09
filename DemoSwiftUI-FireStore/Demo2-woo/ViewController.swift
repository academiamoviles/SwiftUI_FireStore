//
//  ViewController.swift
//  Demo2-woo
//
//  Created by fredy asencios instructor on 4/1/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func pasarToSwiftUI(_ sender: Any) {
        let cursosList = CursosListView()
        let host = UIHostingController(rootView: cursosList)
//        self.navigationController?.pushViewController(host, animated: true)
        self.present(host, animated: true, completion: nil)
    }
    

}


struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
