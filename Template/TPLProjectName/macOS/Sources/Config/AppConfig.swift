//
//  AppConfig.swift
//  TPLProjectName-macOS
//
//  Created by TPLAuthor on 2/8/25.
//

import Foundation

class AppConfig {

    private enum ConfigKeys {
        static let databaseName = "databaseName"
        static let databaseKey = "databaseKey"
        
        
    }

    private static var infoDictionary: [String: Any]? = {
        guard let dict = Bundle.main.infoDictionary else {
            print("Error: Info.plist not found in main bundle.")
            return nil
        }
        return dict
    }()

    // MARK: - Private Helper for retrieving values

    private static func value<T>(for key: String) -> T? {
        guard let dict = infoDictionary else { return nil }

        guard let value = dict[key] as? T else {
            print("Warning: '\(key)' not found or is not of expected type in Info.plist.")
            return nil
        }

        // Basic validation for strings
        if let stringValue = value as? String, stringValue.isEmpty {
            print("Warning: '\(key)' is empty in Info.plist.")
            return nil
        }

        return value
    }

    // MARK: - Public Accessors

    static var databaseKey: String? {
        return value(for: ConfigKeys.databaseKey)
    }

    static var databaseName: String? {
        return value(for: ConfigKeys.databaseName)
    }
    
    static var databaseURL: URL? {
        guard let dbName = databaseName else {
            print("Error: Database name is not set in Info.plist.")
            return nil
        }
        
        // Construct the database URL
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentsDirectory?.appendingPathComponent(dbName)
    }
}
