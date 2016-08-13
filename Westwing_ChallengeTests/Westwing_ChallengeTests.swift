//
//  Westwing_ChallengeTests.swift
//  Westwing_ChallengeTests
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import XCTest
@testable import Westwing_Challenge

class Westwing_ChallengeTests: XCTestCase {
    
    var detailViewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        detailViewController = storyboard.instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
        
        UIApplication.sharedApplication().keyWindow!.rootViewController = detailViewController

        
        detailViewController.itemModel = MainListModel()
        
        
   
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDetailViewController() {
        let model = detailViewController.itemModel
        model?.name = "Test Name"
        detailViewController.setViewData()
        XCTAssert(detailViewController.nameLabel.text == model?.name)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
