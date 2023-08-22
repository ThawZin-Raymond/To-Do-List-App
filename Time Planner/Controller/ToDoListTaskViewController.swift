

import UIKit

class ToDoListTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [ToDoListTask]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        getAllTasks()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))

    }
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Task", message: "Enter new Task",preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit",style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self?.createTask(name: text)
        }))
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = models[indexPath.row]
        
        let sheet = UIAlertController(title: "Edit", message: nil,preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit Task", message: "Edit the task",preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = task.name
            alert.addAction(UIAlertAction(title: "Save",style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                    return
                }
                self?.updateTask(task: task, newName: newName)
                
            }))
            
            self.present(alert, animated: true)
            
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self]_ in
            self?.deleteTask(task: task)
        }))
        
        present(sheet, animated: true)
    }
    func getAllTasks(){
        do{
            models = try context.fetch(ToDoListTask.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            
        }
    }
    func createTask(name: String){
        let newTask = ToDoListTask(context: context)
        newTask.name = name
        newTask.createdAt = Date()
        
        do {
            try context.save()
            getAllTasks()
        }catch{
            
        }
    }
    func deleteTask(task: ToDoListTask){
        context.delete(task)
        do {
            try context.save()
            getAllTasks()
        }catch{
            
        }
    }
    func updateTask(task: ToDoListTask, newName: String){
        task.name = newName
        do {
            try context.save()
            getAllTasks()
        }catch{
            
        }
    }

    



}
