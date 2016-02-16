//
//  ListWrapTableViewCell.swift
//  ListWrap
//
//  Created by fingent on 21/01/16.
//  Copyright © 2016 fingent. All rights reserved.
//

import UIKit

class ListWrapTableViewCell: UITableViewCell{

	@IBOutlet var listWrapTextView: UITextView!
	
//
//	override init?(style: UITableViewCellStyle, reuseIdentifier: String!) {
//		super.init(style: style, reuseIdentifier: reuseIdentifier)
//	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
	}

	/// Custom setter so we can initialise the height of the text view
	var textString: String {
		get {
			return listWrapTextView.text
		}
		set {
			listWrapTextView.text = newValue
			textViewDidChange(listWrapTextView)
		}
	}

    override func awakeFromNib() {
        super.awakeFromNib()
		listWrapTextView.scrollEnabled = false
		listWrapTextView.delegate = self
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		if selected {
			listWrapTextView.becomeFirstResponder()
		} else {
			listWrapTextView.resignFirstResponder()
		}
    }
}
extension ListWrapTableViewCell: UITextViewDelegate {
	func textViewDidChange(textView: UITextView) {

		let size = textView.bounds.size
		let newSize = textView.sizeThatFits(CGSize(width: size.width, height: CGFloat.max))

		// Resize the cell only when cell's size is changed
		if size.height != newSize.height {
			UIView.setAnimationsEnabled(false)
			tableView?.beginUpdates()
			tableView?.endUpdates()
			UIView.setAnimationsEnabled(true)

			if let thisIndexPath = tableView?.indexPathForCell(self) {
				tableView?.scrollToRowAtIndexPath(thisIndexPath, atScrollPosition: .Bottom, animated: false)
			}
		}
	}
}
extension UITableViewCell {
	/// Search up the view hierarchy of the table view cell to find the containing table view
	var tableView: UITableView? {
		get {
			var table: UIView? = superview
			while !(table is UITableView) && table != nil {
				table = table?.superview
			}

			return table as? UITableView
		}
	}
}
