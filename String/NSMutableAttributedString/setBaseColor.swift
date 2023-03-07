extension NSMutableAttributedString {
    /// Replaces the base font (typically Times) with the given font, while preserving traits like bold and italic
    func setBaseColor(baseColor: UIColor) {
        let wholeRange = NSRange(location: 0, length: length)
        beginEditing()
        enumerateAttribute(.font, in: wholeRange, options: []) { object, range, _ in
            self.removeAttribute(.foregroundColor, range: range)
            self.addAttribute(.foregroundColor, value: baseColor, range: range)
        }
        endEditing()
    }
}
