//
//  ViewController.swift
//  SMCustom
//
//  Created by Track Ensure on 2021-02-25.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    @IBOutlet weak var sideBarMenu: UIBarButtonItem!
    @IBOutlet weak var containerView: UIView!
    
    var toPresentVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sideBarMenu.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.presentVCinContentView()
    }
    
    func presentVCinContentView() {
        guard let activeVC = self.toPresentVC else { return }
        self.addChild(activeVC)
        activeVC.view.frame = self.containerView.bounds
        self.containerView.addSubview(activeVC.view)
        activeVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activeVC.didMove(toParent: self)
        self.view.layoutSubviews()
        self.title = activeVC.title
    }
    
//    private func makeSettings() -> SideMenuSettings {
//      let presentationStyle = SideMenuPresentationStyle.menuSlideIn
//      presentationStyle.backgroundColor = #colorLiteral(red: 0.1969315112, green: 0.2438022494, blue: 0.3149579763, alpha: 1)
//      presentationStyle.menuStartAlpha = 1.0
//      presentationStyle.menuScaleFactor = 1.0
//      presentationStyle.onTopShadowOpacity = 1.0
//      presentationStyle.presentingEndAlpha = 0.4
//      presentationStyle.presentingScaleFactor = 1.0
//
//      var settings = SideMenuSettings()
//      settings.presentationStyle = presentationStyle
//      if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
//        settings.menuWidth = min(view.frame.width, view.frame.height) * 0.4
//      } else {
//        settings.menuWidth = min(view.frame.width, view.frame.height) * 0.7
//      }
//      let styles:[UIBlurEffect.Style?] = [nil, .dark, .light, .extraLight]
//      settings.blurEffectStyle = styles[0]
//      settings.statusBarEndAlpha = 0
//
//      return settings
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SideMenuNavigationController {
            vc.presentationStyle = .menuSlideIn
        }
    }
}


extension ViewController: SideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }
    
    func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }
    
    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
}
