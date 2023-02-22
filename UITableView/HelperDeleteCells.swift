
  func deselectAll() {
      selectedIndexes.forEach { indexPath in
          tableView.deselectRow(at: indexPath, animated: false)
      }
  }

  private func deleteSelectedCells() {
      let rows = selectedIndexes.map { $0.row }
      output.deleteAllNotification(at: rows)
      tableView.deleteRows(at: selectedIndexes, with: .fade)
  }

  private func deleteAllCells() {
      output.deleteAllNotification()
      tableView.deleteRows(at: iterateAllCells(), with: .fade)
  }

  private func deleteNotification(row: IndexPath) {
      output.deleteNotification(at: row.row )
      let indexPath = IndexPath(item: row.row , section: 0)
      tableView.deleteRows(at: [indexPath], with: .fade)
  }

  private func selectAllCells() {
      iterateAllCells().forEach { indexPath in
          tableView.selectOneRow(isSelected: isSelectingMode, indexPath: indexPath)
      }
  }

  private func iterateAllCells() -> [IndexPath] {
      var indexPaths: [IndexPath] = []
      for section in 0..<tableView.numberOfSections {
          for row in 0..<tableView.numberOfRows(inSection: section) {
              let indexPath = IndexPath(row: row, section: section)
              indexPaths.append(indexPath)
          }
      }
      return indexPaths
  }

/// for item
  func deleteNotification(at index: Int) {
      items.remove(at: index)
  }

  func deleteAllNotification() {
      items.removeAll()
  }

  func deleteAllNotification(at indicesToRemove: [Int]) {
      for index in indicesToRemove.sorted(by: >) {
          items.remove(at: index)
      }
  }
