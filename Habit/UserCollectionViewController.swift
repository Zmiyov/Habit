//
//  UserCollectionViewController.swift
//  Habit
//
//  Created by Vladimir Pisarenko on 30.07.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class UserCollectionViewController: UICollectionViewController {
    
    var userRequestTask: Task<Void, Never>? = nil
    deinit{ usersRequestTask?.cancel() }
    
    typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    enum ViewModel {
        typealias Section = Int
        
        struct Item: Hashable {
            let user: User
            let isFollowed: Bool
            
            func hash(into hasher: inout Hasher) {
                hasher.combine(user)
            }
            
            static func ==(_ lhs: Item, _ rhs: Item) -> Bool {
                return lhs.user == rhs.user
            }
        }
    }
    
    struct Model {
        var usersByID = [String: User]()
        var followedUsers: [User] {
            return Array(usersByID.filter { Settings.shared.followedUsersIDs.contains($0.key)}.values)
        }
    }
    
    var dataSource: DataSourceType!
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func update() {
        userRequestTask?.cancel()
        userRequestTask = Task {
            if let users = try? await UserRequest().send() {
                self.model.usersByID = users
            } else {
                self.model.usersByID = [:]
            }
            self.updateCollectionView()
            
            usersRequestTask = nil
        }
    }
    
    func updateCollectionView() {
        let users = model.usersByID.values.sorted().reduce(into: [ViewModel.Item]()) { partialResult, user in
            partialResult.append(ViewModel.Item(user: user, isFollowed: model.followedUsers.contains(user)))
        }
        
        let itemsBySection = [0 : users]
        
        dataSource.applySnapshotUsing(sectionIDs: [0], itemsBySection: itemsBySection)
    }

}
