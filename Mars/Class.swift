//
//  Class.swift
//  Mars
//
//  Created by Austin Childress on 8/12/16.
//  Copyright © 2016 Mars Dev. All rights reserved.
//

import Foundation

class Class: NSObject, NSCoding {
    var name = "Sample Name"
    var level = 999
    var iclass = "Sample Class"
    var date = "1/1/1"
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("classes")
    
    init?(namet: String, levelt: Int, iclasst: String, datet: String) {
        self.name = namet
        self.level = levelt
        self.iclass = iclasst
        self.date = datet
        super.init()
        
        if namet.isEmpty || iclasst.isEmpty {
            return nil
        }
        
    }
    
    struct PropertyKey {
        static let nameKey = "name"
        static let levelKey = "level"
        static let classKey = "class"
        static let dateKey = "date"
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(iclass, forKey: PropertyKey.classKey)
        aCoder.encode(level, forKey: PropertyKey.levelKey)
        aCoder.encode(date, forKey: PropertyKey.dateKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let level = aDecoder.decodeInt32(forKey: PropertyKey.levelKey)
        let iclass = aDecoder.decodeObject(forKey: PropertyKey.classKey) as! String
        let date = aDecoder.decodeObject(forKey: PropertyKey.dateKey) as! String
        self.init(namet: name, levelt: Int(level), iclasst: iclass, datet: date)
    }
    
}
