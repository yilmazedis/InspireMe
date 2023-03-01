import UIKit

protocol QuickSelectTableViewDelegate: AnyObject {
    func didLongPress(at indexPath: IndexPath?)
    func didEndLongPress(at indexPath: IndexPath?)
}

final class QuickSelectTableView: UITableView {
    
    private enum SelectionMode {
        case selecting, deselecting, none
        
        var toBool: Bool? {
            switch self {
            case .selecting: return true
            case .deselecting: return false
            case .none: return nil
            }
        }
    }
    
    weak var longPressDelegate: QuickSelectTableViewDelegate?

    private var selectionMode: SelectionMode = .none

    private lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongTapChange(_:)))
        recognizer.minimumPressDuration = 0.15
        recognizer.delaysTouchesBegan = true
        return recognizer
    }()
    
    private var pointedIndexPath: IndexPath? {
        let point = longPressRecognizer.location(in: self)
        return indexPathForRow(at: point)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    private func setup() {
        gestureRecognizers?.append(longPressRecognizer)
        allowsMultipleSelection = true
    }
    
    @objc private func didLongTapChange(_ gestureRecognizer: UILongPressGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            if let indexPath = pointedIndexPath, let cellIsSelected = cellForRow(at: indexPath)?.isSelected {
                longPressDelegate?.didLongPress(at: pointedIndexPath)
                
                setItem(isSelected: !cellIsSelected, indexPath: indexPath)
            
                selectionMode = cellIsSelected ? .deselecting : .selecting
            } else {
                selectionMode = .none
            }
        default:
            longPressDelegate?.didEndLongPress(at: pointedIndexPath)
            selectionMode = .none
        }
    }
    
    private func setItem(isSelected: Bool, indexPath: IndexPath) {
        if isSelected {
            selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
            delegate?.tableView?(self, didSelectRowAt: indexPath)
        } else {
            deselectRow(at: indexPath, animated: false)
            delegate?.tableView?(self, didDeselectRowAt: indexPath)
        }
    }
    
    func selectOneRow(isSelected: Bool, indexPath: IndexPath) {
        if isSelected {
            selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.middle)
            delegate?.tableView?(self, didSelectRowAt: indexPath)
        }
    }
}
