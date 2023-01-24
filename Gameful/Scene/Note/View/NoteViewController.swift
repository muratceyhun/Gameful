//
//  NoteViewController.swift
//  Gameful
//
//  Created by Murat Ceyhun Korpeoglu on 17.01.2023.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var opinionArray = [String]()
    var idArray = [UUID]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNotes))
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = UIColor(red: 113, green: 17, blue: 255, alpha: 0.003)
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "simpra"), object: nil)
    }
    
    @objc func getData() {
        self.nameArray.removeAll(keepingCapacity: true)
        self.idArray.removeAll(keepingCapacity: true)
        self.opinionArray.removeAll(keepingCapacity: true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameNotes")
        //Apple documents give an importance to this code line in terms of memory management.
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                if let name = result.value(forKey: "gameName") as? String {
                    self.nameArray.append(name)
                }
                if let opinion = result.value(forKey: "opinion") as? String {
                    self.opinionArray.append(opinion)
                }
                
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                self.tableView.reloadData()
            }
        } catch {
            
        }
    }
    
    @objc func addNotes() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SaveNoteViewController") as? SaveNoteViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: -TableViewDataSource

extension NoteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameNotes")
        
        //Filtering is suppose to be in terms of ID because ID is unique.
        let idString = idArray[indexPath.row].uuidString
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let _ = result.value(forKey: "id") as? UUID {
                    context.delete(result)
                    nameArray.remove(at: indexPath.row)
                    idArray.remove(at: indexPath.row)
                    self.tableView.reloadData()
                    do {
                        try context.save()
                        tableView.reloadData()
                    }catch {
                    }
                }
            }
        }catch {
            
        }
    }
}

//MARK: -TableViewDelegate

extension NoteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SaveNoteViewController") as? SaveNoteViewController {
            destinationVC.targetName = nameArray[indexPath.row]
            destinationVC.targetOpinion = opinionArray[indexPath.row]
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
}
