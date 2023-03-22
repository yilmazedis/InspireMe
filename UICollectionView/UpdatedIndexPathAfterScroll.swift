func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    currentIndex = Int(abs(scrollView.contentOffset.x) / CGFloat((41 + 8 / 2)))
}
