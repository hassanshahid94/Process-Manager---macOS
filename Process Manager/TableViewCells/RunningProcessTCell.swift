//
//  RunningProcessTCell.swift
//  Process Manager
//
//  Created by Hassan on 3.5.2021.
//

import Cocoa

class RunningProcessTCell: NSTableCellView {

    //MARK:- Outlets
    @IBOutlet weak var btnEndTask: NSButton!
    @IBOutlet weak var imgIcon: NSImageView!
    @IBOutlet weak var lblProcessId: NSTextField!
    @IBOutlet weak var lblProcessName: NSTextField!
    
    //MARK:- Load
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }
    
}
