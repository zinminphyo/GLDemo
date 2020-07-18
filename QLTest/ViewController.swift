//
//  ViewController.swift
//  QLTest
//
//  Created by Zin Min on 17/07/2020.
//  Copyright © 2020 Zin Min Phyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func mutateBtn(_ sender: UIButton) {
        
        Network.shared.apollo.perform(mutation: ReviewMutation(), context: .none, queue: .main) { (result) in
            let _ = result.mapError { (error) -> Error in
                print("Error is \(error.localizedDescription)")
                return error
            }
            
            do {
                
                let result = try result.get()
                if let resultData = result.data{
                    print("Result data is \(resultData.jsonObject)")
                }
                
            }catch {
                
                print("Result error is \(error.localizedDescription)")
                
            }
            
        }
        
        
    }
    
    @IBAction func getReviewsBtn(_ sender: UIButton) {
        
        Network.shared.apollo.fetch(query: GetReviewsQuery(), cachePolicy: .fetchIgnoringCacheCompletely, context: .none, queue: .main) { (result) in
            let _ = result.mapError { (error) -> Error in
                print("Get review error is \(error.localizedDescription)")
                return error
            }
            
            do {
                let response = try result.get()
                if let result = response.data{
                    print("Result data in get review is \(String(describing: result.reviews?.last??.stars))")
                }
            }catch {
                print("Result error in get review is \(error.localizedDescription)")
            }
        }
        
    }
    
}

