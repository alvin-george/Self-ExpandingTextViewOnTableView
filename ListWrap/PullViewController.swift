	//
	//  PullViewController.swift
	//  ListWrap
	//
	//  Created by fingent on 22/01/16.
	//  Copyright © 2016 fingent. All rights reserved.
	//

	import UIKit

	class PullViewController: UIViewController,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate, UITextViewDelegate, UISearchBarDelegate {

		@IBOutlet var listWrapTableView: UITableView!

		//CustomCells
		var CellIdentifier: String = "ListWrapTableViewCellID"
		var tapGesture: UITapGestureRecognizer!
		var cell:UITableViewCell = UITableViewCell()

		let footerView = UIView()
		let scroll = UIScrollView()


		override func viewDidLoad() {
			super.viewDidLoad()
				}
		override func viewWillAppear(animated: Bool) {
			//Adding Tap Gesture To Table
			tapGesture = UITapGestureRecognizer(target: self, action: "tapRecognized:")
			self.listWrapTableView.addGestureRecognizer(tapGesture)
			tapGesture.cancelsTouchesInView = false
			tapGesture.enabled =  true


			var searchBar:UISearchBar?
			searchBar = UISearchBar(frame: CGRectMake(0, 0, 320, 44))
			searchBar!.delegate = self
			searchBar!.tintColor = UIColor.orangeColor()
			footerView.addSubview(searchBar!)

			footerView.frame = CGRectMake(0, -50, 320, 50)
			footerView.backgroundColor =  UIColor.clearColor()
			self.listWrapTableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
			self.listWrapTableView.addSubview(footerView)


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
		func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {

		}
		func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {

			if(scrollView.contentOffset.y < 0){

				print("greater than table height")
				UIView.beginAnimations(nil, context: nil)
				UIView.setAnimationDuration(0.2)
				self.listWrapTableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
				UIView.commitAnimations()
			}
			else
			{
				UIView.beginAnimations(nil, context: nil)
				UIView.setAnimationDuration(0.2)
				self.listWrapTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
				UIView.commitAnimations()
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
