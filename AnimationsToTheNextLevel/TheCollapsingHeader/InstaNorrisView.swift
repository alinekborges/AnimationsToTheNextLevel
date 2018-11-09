//
//  InstaNorrisView.swift
//  AnimationsToTheNextLevel
//
//  Created by Aline Borges on 09/11/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit

class InstaNorrisView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: HeaderView!
    
    init() {
        super.init(nibName: String(describing: InstaNorrisView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        configureViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.headerView.stopAnimations()
    }
    
    func configureViews() {
        self.tableView.contentInset.top = self.headerView.maxHeight - 20
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.register(UINib(nibName: "FactCell", bundle: Bundle.main), forCellReuseIdentifier: "FactCell")
        self.tableView.backgroundColor = .clear
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.allowsSelection = false
        self.tableView.accessibilityIdentifier = "facts_table_view"
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @IBAction func closeTap(_ sender: Any) {
        self.parentCoordinator?.handle(FlowAction.finish)
    }
    
    
}

extension InstaNorrisView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactCell") as! FactCell
        cell.setItem(fact: "Olar")
        return cell
    }
    
}

extension InstaNorrisView: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percentage = (scrollView.contentOffset.y + self.headerView.maxHeight) / (self.headerView.minHeight + self.headerView.maxHeight)
        self.headerView.fractionComplete = percentage
    }
    
}
