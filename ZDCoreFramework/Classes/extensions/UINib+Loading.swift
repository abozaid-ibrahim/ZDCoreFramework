//
//  UINib+Loading.swift
//  FBSnapshotTestCase
//
//  Created by abuzeid ibrahim on 6/1/18.
//

import UIKit

extension UINib {
    class func from(name: String) -> UINib {
        return  UINib(nibName: name, bundle: nil)
    }
}
