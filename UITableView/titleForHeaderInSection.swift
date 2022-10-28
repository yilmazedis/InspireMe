func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let sectionTitle: String = self.tableView(tableView, titleForHeaderInSection: section)!
    if sectionTitle == "" {
      return nil
    }

    let title: InsetsLabel = InsetsLabel()

    title.text = sectionTitle
    title.textColor = AppColor.tableViewSection.color
    //title.backgroundColor = .clear
    title.font = .appFont(.medium, size: 14)
    title.insets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)

    return title
}
