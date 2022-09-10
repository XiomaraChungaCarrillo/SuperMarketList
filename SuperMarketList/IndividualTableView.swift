//
//  IndividualTableView.swift
//  SuperMarketList
//
//  Created by Xio iOS on 9/09/22.
//

import UIKit
import CoreData

var productList = [Product]()

class IndividualTableView: UITableViewController{
    
    @IBOutlet var tableViewSupermarket: UITableView!
    var firstLoad = true
    
    func nonDeletedProducts() -> [Product]{
        
        var noDeleteProductList = [Product]()
        for product in productList{
            if(product.deletedDate == nil){
                noDeleteProductList.append(product)
            }
        }
        return noDeleteProductList
    }
    
    override func viewDidLoad() {
        tablewViewConfig()
        if(firstLoad) {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
            do{
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let product = result as! Product
                    productList.append(product)
                }
            } catch {
                print("Fetch Failed")
            }
        }
    }
    
    func tablewViewConfig() {
        tableViewSupermarket.register(UINib(nibName: CellList.viewIdCell, bundle: .main), forCellReuseIdentifier: CellList.viewIdCell)
        }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellList.viewIdCell, for: indexPath)
        
        let thisProduct: Product!
        thisProduct = nonDeletedProducts()[indexPath.row]
        
        if let cell = cell as? CellList {
            cell.prepareCell(with: nonDeletedProducts()[indexPath.row])
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nonDeletedProducts().count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editProduct", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editProduct"){
            let indexPath = tableView.indexPathForSelectedRow!
            let productDetail = segue.destination as? ViewController
            
            let selectedProduct: Product!
            selectedProduct = nonDeletedProducts()[indexPath.row]
            productDetail?.selectedProduct = selectedProduct
            
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
}
