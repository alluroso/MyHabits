//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Алексей Калинин on 27.02.2023.
//

import UIKit

class HabitDetailsViewController: UIViewController {

    private var habit: Habit

    private lazy var cell = "habitDetailsID"

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private lazy var headerTable: UILabel = {
        let label = UILabel()
        label.text =  "АКТИВНОСТЬ"
        label.font = .footnote
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init (habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        constraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = "\(habit.name)"
    }

    private func setupNavigationBar() {
        navigationItem.title = "\(habit.name)"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .purpleCustom

        let rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(onEditHabit))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.addSubview(headerTable)
        tableView.backgroundColor = .lightGrayCustom
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "habitDetailsID")
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -22),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            headerTable.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 47),
            headerTable.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 16)
        ])
    }

    @objc func onEditHabit() {
        let habitVC = HabitViewController(habit: habit)
        habitVC.onRemove = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: false)
        }
        let habitNavigationVC = UINavigationController(rootViewController: habitVC)
        habitNavigationVC.modalPresentationStyle = .fullScreen
        present(habitNavigationVC, animated: true, completion: nil)
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitDetailsID", for: indexPath)
        let habitIndex = abs(indexPath.row - HabitsStore.shared.dates.count + 1)
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: habitIndex)
        let date = HabitsStore.shared.dates[habitIndex]
        if HabitsStore.shared.habit(habit, isTrackedIn: date) {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            cell.tintColor = .purpleCustom
        }
        return cell
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerTable
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
}
