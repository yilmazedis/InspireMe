extension Date {   
    func getDaysOf(month: Int, ofYear year: Int) -> [Date] {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        let formatter = DateFormatter()
//        formatter.dateFormat = "dd MM yyyy"
//        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        var arrDates = [Date]()
        for day in 1...numDays {
            let dateString = "\(year) \(month) \(day)"
            if let date = formatter.date(from: dateString) {
                arrDates.append(date)
            }
        }
        return arrDates
    }
    
    func extractDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func isToday(day: Date) -> Bool {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "Europe/Istanbul") ?? .current
        return calendar.isDate(self, inSameDayAs: day)
    }
}
