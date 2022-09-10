//
//  ViewController.swift
//  SuperMarketList
//
//  Created by Xio iOS on 9/09/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descTV: UITextView!
    
    var selectedProduct: Product? = nil
    
    override func viewDidLoad() {
        descTV.layer.cornerRadius = 25
        super.viewDidLoad()
        if(selectedProduct != nil){
            titleTF.text = selectedProduct?.title
            descTV.text = selectedProduct?.desc
        }
    }

    @IBAction func saveAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedProduct == nil){
            
            if titleTF.text != "", descTV.text != "" {
                let entity = NSEntityDescription.entity(forEntityName: "Product", in: context)
                let newProduct = Product(entity: entity!, insertInto: context)
                newProduct.id = productList.count as NSNumber
                newProduct.title = titleTF.text
                newProduct.desc = descTV.text
                
                do{
                    try context.save()
                    productList.append(newProduct)
                    navigationController?.popViewController(animated: true)
                } catch {
                    print("content save error")
                }
            }
            
            
        } else {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
            do{
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let product = result as! Product
                    if(product == selectedProduct){
                        product.title = titleTF.text
                        product.desc = descTV.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            } catch {
                print("Fetch Failed")
            }
        }
    }
    
    @IBAction func deleteProduct(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        do{
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results {
                let product = result as! Product
                if(product == selectedProduct){
                    product.deletedDate = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        } catch {
            print("Fetch Failed")
        }
        
    }
}

