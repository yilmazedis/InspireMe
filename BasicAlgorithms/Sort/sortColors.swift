
let colors = ["blue3", "yellow0", "red4", "orange2", "purple1"]

func sortColors(colors: [String]) -> [String] {
    
    let sorted = colors.sorted {
        $0.last! < $1.last!
    }
    
    let result = sorted.map { el -> String in
        var color = el
        color.removeLast()
        return color
    }
    
    return result
}

print(sortColors(colors: colors))
