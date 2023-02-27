if model.priority == 1, model.status == "UNREAD" {
    setAsWarning()
} else if model.priority != 1, model.status == "UNREAD" {
    setAsNormal()
} else if model.priority == 1, model.status != "UNREAD" {
    setAsReadForWarning()
} else {
    setAsReadForNormal()
}



if model.priority == 1, model.status == "UNREAD" {
    setAsWarning()
} else if model.status == "UNREAD" { // if this is true model.priority must be model.priority != 1
    setAsNormal()
} else if model.priority == 1 { // if this is true model.status must be model.status != "UNREAD"
    setAsReadForWarning()
} else {
    setAsReadForNormal()
}
