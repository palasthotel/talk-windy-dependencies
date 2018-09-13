//
//  ViewController.swift
//  Todo
//
//  Created by Benni on 17.07.18.
//  Copyright © 2018 BenBoecker. All rights reserved.
//

import UIKit
import Wind


fileprivate typealias WindProtocols = (
	AutomaticDependencyHandling &
	DirectResolver &
	DependsOnTodoCollection
)


// MARK: - TodoTableViewController
class TodoTableViewController: UITableViewController, WindProtocols {
	var dependencies: [String : [Component]] = [:]

	let dateFormatter: DateFormatter = {
		let df = DateFormatter()
		df.dateStyle = .medium
		df.timeStyle = .short
		return df
	}()
}


// MARK: - UIViewController overrides
extension TodoTableViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.setRightBarButtonItems([editButtonItem, navigationItem.rightBarButtonItem!], animated: false)
	}
}


// MARK: - UITableViewController overrides
extension TodoTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return todoCollection.todos.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
		let todo = todoCollection.todos[indexPath.row]

		cell.textLabel?.text = todo.text
		cell.detailTextLabel?.text = dateFormatter.string(from: todo.date)
		cell.accessoryType = todo.isDone ? .checkmark : .none
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		todoCollection.todos[indexPath.row].isDone.toggle()
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		guard editingStyle == .delete else { return }
		todoCollection.delete(todoCollection.todos[indexPath.row])

		tableView.performBatchUpdates({
			tableView.deleteRows(at: [indexPath], with: .automatic)
		})

		if todoCollection.todos.count == 0 {
			setEditing(false, animated: true)
		}
	}
}


// MARK: - Private methods and properties
private extension TodoTableViewController {
	@IBAction func addTodo(_ sender: Any) {
		let alertController = UIAlertController(title: "Neue Aufgabe", message: "", preferredStyle: .alert)
		alertController.addTextField()
		alertController.addAction(UIAlertAction(title: "OK", style: .default) { action in
			guard let text = alertController.textFields?.first?.text else { return }
			self.todoCollection.createTodo(with: text)

			self.tableView?.performBatchUpdates({
				self.tableView?.insertRows(at: [IndexPath(row: self.todoCollection.todos.count - 1, section: 0)], with: .automatic)
			})

		})
		present(alertController, animated: true, completion: nil)
	}
}

