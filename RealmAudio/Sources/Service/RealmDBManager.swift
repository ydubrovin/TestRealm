//
//  RealmDBManager.swift
//  RealmAudio
//
//  Created by Anton Shavarin on 03.02.2021.
//

import Foundation
import RealmSwift

class RealmDBManager: NSObject {
    static let sharedManager = RealmDBManager()
    
    var isDatabaseEmpty: Bool = false
    let currentRealmDBVersion: UInt64 = 1
    var currentConfiguration: Realm.Configuration?
    
    // Mark: Initialisation
    required override init() {
        super.init()
        self.prepareRealm()
    }
    
    init(forTest: Bool) {
        super.init()
        self.prepareRealm()
    }
    
    private func prepareRealm() {
        let path = self.getRealmUrl(forTest: false)
        
        var configuration: Realm.Configuration = self.checkRealmMigration()
        
        let url = URL.init(fileURLWithPath: path)
        
        if !(FileManager.default.fileExists(atPath: url.deletingLastPathComponent().relativePath)) {
            do { try FileManager.default.createDirectory(atPath: url.deletingLastPathComponent().relativePath, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                NSLog("Exception %@ is thrown during directory %@ creation", error.localizedDescription, url.deletingLastPathComponent().relativePath)
            }
            
            isDatabaseEmpty = true
        }
        else {
            isDatabaseEmpty = false
        }
        
        configuration.fileURL = url
        NSLog("------------realm path: %@", path)
        configuration.schemaVersion = currentRealmDBVersion
        
        currentConfiguration = configuration
    }
    
    private func getRealmUrl(forTest: Bool) -> String {
        var path: String?
        let libraryDirectory: String = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? ""
        
        if (forTest) {
            path = String(format: "%@/DB_Realm/%@-%@.%@", libraryDirectory,
                          Constants.RealmDBname,
                          "Test",
                          Constants.RealmDBExtension)
        }
        else {
            path = String(format: "%@/DB_Realm/%@-%@.%@", libraryDirectory,
                          Constants.RealmDBname,
                          "base",
                          Constants.RealmDBExtension)
        }
        
        if (path != nil) {
            return path!
        }
        else {
            NSLog("Unable to get realm url")
            return ""
        }
    }
    
    private func checkRealmMigration()-> Realm.Configuration {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })
        
        // Tell Realm to use this new configuration object for the default Realm
        return config
    }
    
    // Mark: disposing db
    func deleteDatabase(forTest: Bool) {
        var path: String?
        
        let libraryDirectory: String = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? ""
        
        if (forTest) {
            path = String(format: "%@/DB_Realm/%@-%@.%@", libraryDirectory,
                          Constants.RealmDBname,
                          "Test",
                          Constants.RealmDBExtension)
        }
        else {
            path = String(format: "%@/DB_Realm/%@-%@.%@", libraryDirectory,
                          Constants.RealmDBname,
                          "base",
                          Constants.RealmDBExtension)
        }
        
        let url = URL.init(fileURLWithPath: path!)
        if (FileManager.default .fileExists(atPath: url.deletingLastPathComponent().relativePath))
        {
            do {
                try FileManager.default.removeItem(at: url)
            }
            catch {
                NSLog("Unable to delete realm database: %@", error.localizedDescription)
            }
        }
        
        NSLog("------------realm path: %@", path!);
    }
}
