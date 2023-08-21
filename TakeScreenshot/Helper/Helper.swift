//
//  Helper.swift
//  TakeScreenshot
//
//  Created by Angelos Staboulis on 21/8/23.
//

import Foundation
import AppKit
class Helper{
    static let shared = Helper()
    private init(){}
    func showImage(viewController:ViewController)->NSImage{
        let image = CGDisplayCreateImage(.zero, rect: NSScreen.main!.frame)
        let imageData = NSBitmapImageRep(cgImage: image!)
        let nsImage = NSImage(data: imageData.tiffRepresentation!)
        let imageView = NSImageView(image: nsImage!)
        imageView.frame = NSScreen.main!.frame
        viewController.view.addSubview(imageView)
        return nsImage!
    }
    func saveScreenShot(nsImage:NSImage){
        let downloads = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]+"/"+"screenshot.png"
        FileManager.default.createFile(atPath:downloads , contents: nsImage.tiffRepresentation, attributes: [:])
    }
}
