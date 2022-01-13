//
//  ToDoError.swift
//  ToDo
//
//  Created by Philip Moore on 2022-01-12.
//

import Foundation
import CoreData

enum ToDoError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodingError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("Could not save ToDos, please reinstall the app.", comment: "")
        case .readError:
            return NSLocalizedString("Could not save ToDos, please reinstall the app.", comment: "")
        case .encodingError:
            return  NSLocalizedString("Could not save ToDos, please reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your ToDos, please create a new ToDo too start over.", comment: "")
        }
    }
}

struct ErrorType :Identifiable {
    let id = UUID()
    let error: ToDoError
}
