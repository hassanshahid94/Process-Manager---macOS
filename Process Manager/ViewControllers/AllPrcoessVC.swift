//
//  AllPrcoessVC.swift
//  Process Manager
//
//  Created by Hassan on 3.5.2021.
//

import Cocoa

class AllPrcoessVC: NSViewController {

    //MARK:- Outlets
    @IBOutlet weak var tblRunningProcess: NSTableView!
    
    //MARK:- Variables
    var arrApplication: [NSRunningApplication]!
    
    //MARK:- Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        tblRunningProcess.delegate = self
        tblRunningProcess.dataSource = self
        getRunningPrcoess()
    }
    
    //MARK:- Actions
    @IBAction func btnEndTaskAction(_ sender: NSButton) {
        let isKill = kill(arrApplication[sender.tag].processIdentifier, SIGKILL)
        if isKill == -1 {
            showAlert(message: "Something went wrong. Please try again.")
        }
        else {
            getRunningPrcoess()
        }
    }
    
    //MARK:- Functions
    func getRunningPrcoess() {
        // Get all running applications
        let workspace = NSWorkspace.shared
        arrApplication = workspace.runningApplications
        tblRunningProcess.reloadData()
    }
}

//MARK:- NSTableView DataSource and Delegates
extension AllPrcoessVC: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return arrApplication == nil ? 0 : arrApplication.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "RunningProcessTCell"), owner: self) as? RunningProcessTCell else { return nil }
        cell.lblProcessName.stringValue = "Name: \(arrApplication[row].localizedName ?? "N/A")"
        cell.lblProcessId.stringValue = "ID: \(arrApplication[row].bundleIdentifier ?? "N/A")"
        cell.imgIcon.image = arrApplication[row].icon
        cell.btnEndTask.tag = row
        return cell
    }
}
