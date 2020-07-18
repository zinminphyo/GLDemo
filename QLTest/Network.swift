//
//  Network.swift
//  QLTest
//
//  Created by Zin Min on 17/07/2020.
//  Copyright © 2020 Zin Min Phyo. All rights reserved.
//

import Foundation
import Apollo


class Network {
    static let shared = Network()
    
    private (set) lazy  var apollo = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)
}
