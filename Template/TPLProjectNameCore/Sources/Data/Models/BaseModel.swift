//
//  BaseModel.swift
//  TPLProjectNameCore
//
//  Created by TPLAuthor on 18/6/25.
//

import Foundation
import GRDB

protocol BaseModel: Codable, Identifiable, Equatable {
    var id: Int64? { get set }
}
