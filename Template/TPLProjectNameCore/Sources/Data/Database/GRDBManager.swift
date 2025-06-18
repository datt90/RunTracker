//
//  GRDBManager.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 18/6/25.
//

import Foundation
import GRDB

public class GRDBManager {
    
    public static let shared = GRDBManager()

    private var dbPool: DatabasePool!
    public var dbQueue: DatabaseQueue!
    
    private init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let dbURL = URL(fileURLWithPath: path).appendingPathComponent("dtswift.sqlite3")
            
            dbPool = try DatabasePool(path: dbURL.path)
            self.dbQueue = try DatabaseQueue(path: dbURL.path)
            
            try migrator.migrate(dbPool)
            print("GRDBManager: Database opened and migrated at \(dbURL.path)")
        } catch {
            print("GRDBManager: Error opening or migrating database: \(error)")
        }
    }
    
    // MARK: - Database Migrations
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.eraseDatabaseOnSchemaChange = true

        migrator.registerMigration("createUserTable") { db in
            try db
                .create(table: User.databaseTableName, ifNotExists: true) { t in
                t.autoIncrementedPrimaryKey(User.Columns.id.name)
                
                    t.column(User.Columns.username.name, .text).notNull()
                    t.column(User.Columns.email.name, .text).notNull()
            }
        }
        
        return migrator
    }
}
