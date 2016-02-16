//
//  ViewController.swift
//  ListWrap
//
//  Created by fingent on 21/01/16.
//  Copyright © 2016 fingent. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UITextViewDelegate {

	@IBOutlet var listWrapTableView: UITableView!

	//CustomCells
	var CellIdentifier: String = "ListWrapTableViewCellID"
	var tapGesture: UITapGestureRecognizer!
	var cell:UITableViewCell = UITableViewCell()

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	override func viewWillAppear(animated: Bool) {
		//Adding Tap Gesture To Table
		tapGesture = UITapGestureRecognizer(target: self, action: "tapRecognized:")
		self.listWrapTableView.addGestureRecognizer(tapGesture)
		tapGesture.cancelsTouchesInView = false
		tapGesture.enabled =  true
	}
	override func viewWillLayoutSubviews() {
		let fontFamilyNames = UIFont.familyNames()
		for familyName in fontFamilyNames {
			print("Font Family Name = [\(familyName)]")
			let names = UIFont.fontNamesForFamilyName(familyName as String)
			print("Font Names = [\(names)]")
		}

		for view in self.view.subviews  {

			if view.isKindOfClass(UITextField) {
				UITextField.appearance().font =  UIFont(name: "Copperplate", size: 7)
			}
			if view.isKindOfClass(UILabel) {
				UILabel.appearance().font =  UIFont(name: "Copperplate", size: 7)
			}
			if view.isKindOfClass(UILabel) {
				UILabel.appearance().font =  UIFont(name: "Copperplate", size: 7)
			}
		}

	}
	func tapRecognized(recognizer: UITapGestureRecognizer){
		self.listWrapTableView.endEditing(true)
	}
	func textViewDidBeginEditing(textView: UITextView) {
		if (CellIdentifier == "ListWrapTableViewCellID")
		{
			tapGesture.enabled =  true
		}
		else
		{
			tapGesture.enabled =  false
		}
	}
	// MARK: - Table view data source
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
	{
		self.listWrapTableView.rowHeight = UITableViewAutomaticDimension
		return self.listWrapTableView.rowHeight
	}
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 8
	}
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		if (indexPath.row % 2 == 0)
		{
			let surveyCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)! as! ListWrapTableViewCell
			return surveyCell
		}
		else if (indexPath.row % 2  == 1)
		{
			let reportsCell = tableView.dequeueReusableCellWithIdentifier("ListWrapSecondTableViewCellID")! as! ListWrapSecondTableViewCell

			
			return reportsCell
		}
		else
		{
			let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "")
			return cell
		}
	}
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	{
	}
}

