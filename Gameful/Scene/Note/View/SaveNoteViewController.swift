//
//  SaveNoteViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 23.01.2023.
//

import UIKit
import CoreData

class SaveNoteViewController: UIViewController {
    
    @IBOutlet weak var gameNameTextField: UITextField!
    @IBOutlet weak var gameOpinionTextField: UITextField!
    @IBOutlet weak var saveButtonLabel: UIButton!
    var targetName = ""
    var targetOpinion = ""
    var targetID: UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameNameTextField.text = targetName
        gameOpinionTextField.text = targetOpinion
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        // CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "GameNotes", into: context)
        saveData.setValue(gameNameTextField.text, forKey: "gameName")
        saveData.setValue(gameOpinionTextField.text, forKey: "opinion")
        saveData.setValue(UUID(), forKey: "id")
        do {
            try context.save()
            print("SUCCESSFULLY SAVED")
        } catch {
            print("ERROR : \(error.localizedDescription)")
        }
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "simpra"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
