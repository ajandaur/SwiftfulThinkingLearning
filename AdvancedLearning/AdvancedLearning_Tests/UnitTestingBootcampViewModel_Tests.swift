//
//  UnitTestingBootcampViewModel_Tests.swift
//  AdvancedLearning_Tests
//
//  Created by Anmol  Jandaur on 3/30/23.
//

import XCTest
@testable import AdvancedLearning
import Combine

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]


// Testing Structure: Given, When, Then

final class UnitTestingBootcampViewModel_Tests: XCTestCase {
    
    var viewModel: UnitTestingBootcampViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewModel = UnitTestingBootcampViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        viewModel = nil
        
    }

    
    func test_UnitTestingBootcampViewModel_isPremium_shouldbeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldbeFalse() {
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldbeInjectedValue() {
        // Given
        let userIsPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldbeInjected_stress() {
        for _ in 0..<10 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeEmpty() {
        // Given
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldAddItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = 10
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
      
        
        // Then
//        XCTAssertTrue(!vm.dataArray.isEmpty)
//        XCTAssertFalse(vm.dataArray.isEmpty)
//        XCTAssertEqual(vm.dataArray.count, 1)
//        XCTAssertNotEqual(vm.dataArray.count, 0)
//        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
       
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString2() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
       
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        // When
        
        // select valid item
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        // select invalid item
        vm.selectItem(item: UUID().uuidString)
        
        // Then
        XCTAssertNil(vm.selectedItem)
       
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected_stress() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)

        // Then
        XCTAssertNil(vm.selectedItem)
        XCTAssertFalse(randomItem.isEmpty)
      
       
    }
    
    
    func test_UnitTestingBootcampViewModel_saveItem_itemNotFound() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item Not Found Error") { error in
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.itemNotFound)
        }
    }

    
    func test_UnitTestingBootcampViewModel_saveItem_shouldBeThrowError_noData() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        
        for _ in 0..<loopCount {
            
            vm.addItem(item:  UUID().uuidString)
            
        }
        
        // Then
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.noData)
            XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))

        }
       
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldSaveItem() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        
        // Then
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()

        }
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithEscaping_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let expectation = XCTestExpectation(description: "Should return items after 3.0 seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithEscaping()
        
        // Then
        // New to wait before we assert.. since we are using a completion with a 3.0 delay
        wait(for: [expectation], timeout: 5.0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithCombine_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let expectation = XCTestExpectation(description: "Should return items after 3.0 seconds")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithCombine()
        
        // Then
        // New to wait before we assert.. since we are using a completion with a 3.0 delay
        wait(for: [expectation], timeout: 5.0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }

}
