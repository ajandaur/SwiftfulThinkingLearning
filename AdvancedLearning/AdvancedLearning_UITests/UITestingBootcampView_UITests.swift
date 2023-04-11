//
//  UITestingBootcampView_UITests.swift
//  AdvancedLearning_UITests
//
//  Created by Anmol  Jandaur on 4/7/23.
//

import XCTest

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

import XCTest

class UITestingBootcampView_UITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
    
        continueAfterFailure = false

        app.launch()
    }

    override func tearDownWithError() throws {
      
        
    }
    
    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: false)
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
       
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }

    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
       tapAlertButton()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
//        sleep(1)
        let exists = alertOKButton.waitForExistence(timeout: 5.0)
        
        XCTAssertTrue(exists)
        alertOKButton.tap()

        
        // Then
        XCTAssertFalse(alert.exists)
    
                                        
    }
    
    func tapAlertButton() {
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigationToDestination() {
        
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
       // When
        tapNavigationLink(shouldDismissDestination: false)
    
        // Then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)

    
        
    }
    
    func tapNavigationLink(shouldDismissDestination: Bool) {
        let navLinkButton = app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navLinkButton.tap()
        
        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome"]
            backButton.tap()
        }
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigationToDestinationAndGoBack() {
        
        
        // Given
        signUpAndSignIn(shouldTypeOnKeyboard: true)
        
        // When
        tapNavigationLink(shouldDismissDestination: true)

        
        // Then
        let navBar = app.navigationBars("Welcome")
        XCTAssertTrue(navBar.exists)
    }
    
    
}

// MARK: Functions

extension UITestingBootcampView_UITests {
    
    
    func signUpAndSignIn(shouldTypeOnKeyboard: Bool) {
        
        let textfield = app.textFields["SignUpTextField"]
        
        // When
        textfield.tap()
        
        if shouldTypeOnKeyboard {
            let keyA = app.keys["A"]
            keyA.tap()
            let keya = app.keys["a"]
            keya.tap()
            keya.tap()
        }

        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
}
