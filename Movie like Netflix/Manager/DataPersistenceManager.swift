//
//  File.swift
//  Movie like Netflix
//
//  Created by Luyện Hà Luyện on 05/10/2023.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case fatledToDeleteData
    }
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith( model: Title, completion: @escaping (Result<Void, Error>) ->Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.adult = model.adult
        item.poster_path = model.poster_path
        item.popularity = model.popularity ?? 0000
        item.media_type = model.media_type
        item.overview = model.overview
        item.release_date = model.release_date
        item.vote_average = model.vote_average ?? 0000
        item.vote_count = Int64(model.vote_count ?? 0000)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    func fetchtitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) ->Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.fatledToDeleteData))
        }
    }
}
