//
//  BaseModel.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 18/6/25.
//

import Foundation
import GRDB

protocol BaseModel: Identifiable, Codable {
    var id: Int64? { get set }
}
