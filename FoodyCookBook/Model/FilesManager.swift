//
//  FilesManager.swift
//  VAJSONReadWriteDemo
//
//  Created by Vikash Anand on 09/04/21.
//

import Foundation


final class FilesManager {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private init() {}
    static let shared: FilesManager = FilesManager()
    private let fileManager = FileManager.default

    func save(meal: Meal) -> Bool {
        do {
            guard var savedMeals: [Meal] = try? FilesManager.shared.loadJSON() else { return false }
            savedMeals.append(meal)
            // Write it to document directory again
            let isSuccess = try FilesManager.shared.save(jsonObject: savedMeals)
            isSuccess ? print("Data written successfully") : print("Failure")
            return isSuccess
        } catch let error {
            print("Error: \(error.localizedDescription)")
            return false
        }
    }

    func save<T: Encodable>(jsonObject: [T], toFilename filename: String = "meals") throws -> Bool {
        try encoder.save(jsonObject: jsonObject, toFilename: filename)
    }

    func loadJSON<T: Decodable>(withFilename filename: String = "meals") throws -> [T]? {
        try decoder.loadJSON(withFilename: filename)
    }
}


extension JSONEncoder {

    fileprivate func save<T: Encodable>(jsonObject: [T], toFilename filename: String ) throws -> Bool {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")

            let data = try encode(jsonObject)
            try data.write(to: fileURL, options: [.atomicWrite])
            return true
        }
        return false
    }
}

extension JSONDecoder {

    fileprivate func loadJSON<T:Decodable>(withFilename filename: String) throws -> [T]? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")

            if fileManager.fileExists(atPath: fileURL.path) {
                let data = try Data(contentsOf: fileURL)
                do {
                    return data.count > 0 ? try decode([T].self, from: data) : []
                } catch {
                    fatalError("Couldn't parse json file with :\(filename):\n\(error)")
                }
            } else {
                let isSuccess = fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
                isSuccess ? print("File created successfully") : print("Failure")
            }
        }
        return nil
    }
}
