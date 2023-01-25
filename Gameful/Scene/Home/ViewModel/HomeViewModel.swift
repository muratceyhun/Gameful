//
//  HomeViewModel.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 20.01.2023.
//

import Foundation
import UIKit
import CoreData

class HomeViewModel {
    var coordinator: HomeCoordinator?
    let manager = HomeManager.shared
    var game: Game?
    var gameCategory: HomeEndPoint = .name
    var gameItems = [GameResult]()
    var errorCallBack: ((String)->())?
    var successCallBack: (()->())?
    
    func getCategoryItems() {
        if InternetStatus.shared.isInternetActive() {
            manager.getCategoryGames(type: .all) { [weak self] game, error in
                if let error = error {
                    self?.errorCallBack?(error.localizedDescription)
                } else {
                    self?.game = game
                    self?.successCallBack?()
                }
            }
        } else {
            //TODO: -FetchfromCoreData
            
        }
        
    }
    
    //MARK: -CORE DATA SAVING
    private func saveToCoreData(_ data: GameResult) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        if let savedData = NSEntityDescription.entity(forEntityName: "GameDataList", in: context) {
            let savedData = NSManagedObject(entity: savedData, insertInto: context)
            savedData.setValue(data.backgroundImage ?? "", forKey: "backgroundImage")
            savedData.setValue(data.id ?? 0, forKey: "id")
            savedData.setValue(data.name ?? "", forKey: "name")
            
            do {
                try context.save()
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    private func getFromCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GameDataList")
        request.returnsObjectsAsFaults = false // Apple documentation says this code line increase the performance of cell phone.
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject] {
                    
            }
        } catch {
            
        }
    }

}
