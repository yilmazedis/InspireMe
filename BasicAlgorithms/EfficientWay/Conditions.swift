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

// Used with &&
if model.priority == 1 && model.status == "UNREAD" {
    setAsWarning()
} else if model.status == "UNREAD" { // if this is true model.priority must be model.priority != 1
    setAsNormal()
} else if model.priority == 1 { // if this is true model.status must be model.status != "UNREAD"
    setAsReadForWarning()
} else {
    setAsReadForNormal()
}

// why you used && instead of using comma (,)

/*

In the updated code I provided, I used the logical AND operator (&&) instead of the comma (,) to check if both conditions are true. The reason for this is that in Swift, the comma is used to separate multiple arguments or expressions in a function call or initialization, while the logical AND operator is used to combine two or more boolean expressions to create a new boolean expression.

So in the original code, when using the comma to separate the two conditions, the conditions are evaluated separately and their results are passed as two separate arguments to the if statement. In this case, both conditions must be true for the if statement to execute the corresponding code. However, using the logical AND operator instead combines the two conditions into a single boolean expression, which is evaluated as a whole. This means that both conditions must be true for the if statement to execute the corresponding code.

Using the logical AND operator in this case is more appropriate because we want to check if both conditions are true together, not just separately. It also results in more concise and readable code.

*/

// so in the end it doesnt effect the result, right ?

/*

Using the comma (,) and the logical AND operator (&&) in this specific case will result in the same outcome, assuming that the implementation of the setAsWarning(), setAsNormal(), and setAsReadForNormal() functions are correct.

However, using the comma to separate two conditions can sometimes lead to unexpected results, especially when dealing with complex boolean expressions. Therefore, it's generally a good practice to use the logical AND operator instead when combining two or more boolean expressions. It's clearer and more explicit in showing that both conditions must be true for the code to be executed.

So while using the comma might not have a negative effect in this specific code, it's generally recommended to use the logical AND operator instead for better code readability and maintainability.

*/
