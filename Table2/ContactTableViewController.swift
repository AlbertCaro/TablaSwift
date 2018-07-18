//
//  ContactTableViewController.swift
//  Table2
//
//  Created by alumno on 18/07/18.
//  Copyright © 2018 CUValles. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem



        let cell = UINib(nibName: "DioTableViewCell", bundle: nil)

        tableView.register(cell, forCellReuseIdentifier: "newCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! DogTableViewCell
        cell.accessoryType = .detailButton
        cell.title.text = "zi \(indexPath.row)"
        cell.desc.text = "ño"
        cell.img.image = UIImage(named: "dio")

        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: "Atención", message: "¿Desea adoptar a éste DIO?", preferredStyle: .actionSheet)
        let cell = tableView.cellForRow(at: indexPath)
        /*
        if cell?.accessoryType.rawValue != 3 {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .detailButton
        }
        */

        let aceptClosure = { (action: UIAlertAction) -> Void in
            cell?.accessoryType = .checkmark
        }

        let cancelClosure = { (action: UIAlertAction) -> Void in
            cell?.accessoryType = .detailButton
        }

        let aceptAction = UIAlertAction(title: "Agüebolas", style: .default, handler: aceptClosure)
        let deleteAction = UIAlertAction(title: "Nel pastel", style: .destructive, handler: cancelClosure)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        optionMenu.addAction(aceptAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: true )
    }
    */

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let shareAction = UIContextualAction(style: .normal, title: "Compartir") { (action, sourceView, completionHandler) in
            let message = "Adoptando DIO"

            let activityController = UIActivityViewController(activityItems: [message], applicationActivities: nil)

            self.present(activityController, animated: true)
        }

        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar") { (action, sourceView, completionHandler) in
            completionHandler(true)
        }

        shareAction.backgroundColor = UIColor.black

        return UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let adoptAction = UIContextualAction(style: .normal, title: "Adoptar") { (action, sourceView, completionHandler) in
            completionHandler(true)
        }

        return UISwipeActionsConfiguration(actions: [adoptAction])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destinationController = segue.destination as! DetailViewController

        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
