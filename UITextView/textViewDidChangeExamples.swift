public func textViewDidChange(_ textView: UITextView) {
  if textView.text.last == "\n" {
    textView.text.removeLast()
    textView.resignFirstResponder()
    return
  }
  placeholderLabel.setHidden(textView.text.isNotEmpty, animated: false)
  setLengthViews(text: textView.text)
}
