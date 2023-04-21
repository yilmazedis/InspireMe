/*
There are several ways to implement a search algorithm that finds the closest matches to a given string. One common approach is to use a technique called approximate string matching, also known as fuzzy string matching. This involves using algorithms such as Levenshtein distance or Jaccard similarity to calculate the similarity between the search string and each item in the dataset. You can then sort the results by similarity and return the top matches.

Another approach is to use a technique called natural language processing (NLP) to process the search string and the items in the dataset, and then calculate the similarity between them using techniques like cosine similarity or Jaccard similarity.

Additionally, you can use a search engine like Elasticsearch or Solr which have built-in functionality to handle fuzzy matching.

Another method is to use string matching algorithm such as Aho-Corasick, which is an algorithm used to find all occurrences of a set of strings within another larger string.

It's important to note that the best algorithm to use will depend on the specific requirements of your application, such as the size of your dataset and the expected level of similarity between the search string and the results.
*/


/*Sure, here's an example of a search algorithm implemented in Swift that uses the Levenshtein distance algorithm to find the closest matches in a string array:
*/
import Foundation

func search(searchString: String, in array: [String]) -> [String] {
    var results: [(String, Int)] = []

    for item in array {
        let distance = levenshteinDistance(a: searchString, b: item)
        results.append((item, distance))
    }

    // Sort the results by distance
    results.sort { $0.1 < $1.1 }

    // Return the top 3 closest matches
    return results.map { $0.0 }.prefix(3)
}

func levenshteinDistance(a: String, b: String) -> Int {
    let m = a.count
    let n = b.count
    var d = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

    for i in 1...m {
        d[i][0] = i
    }

    for j in 1...n {
        d[0][j] = j
    }

    for j in 1...n {
        for i in 1...m {
            if a[a.index(a.startIndex, offsetBy: i - 1)] == b[b.index(b.startIndex, offsetBy: j - 1)] {
                d[i][j] = d[i - 1][j - 1]
            } else {
                d[i][j] = min(d[i - 1][j], d[i][j - 1], d[i - 1][j - 1]) + 1
            }
        }
    }

    return d[m][n]
}
/*
You can use this function by passing the search string and the array you want to search in as arguments. The function will return an array of the top 3 closest matches, sorted by their distance from the search string.

Please note that this is a simple example and depending on the size of your dataset it may not be efficient, also it's based on Levenshtein distance and you can use other techniques like Jaccard similarity, cosine similarity, etc.
*/


/*
Sure! Here's an example of the search algorithm implemented in Swift using Jaccard similarity:
*/
import Foundation

func search(searchString: String, in array: [String]) -> [String] {
    var results: [(String, Double)] = []

    for item in array {
        let similarity = jaccardSimilarity(a: searchString, b: item)
        results.append((item, similarity))
    }

    // Sort the results by similarity
    results.sort { $0.1 > $1.1 }

    // Return the top 3 closest matches
    return results.map { $0.0 }.prefix(3)
}

func jaccardSimilarity(a: String, b: String) -> Double {
    let aSet = Set(a)
    let bSet = Set(b)
    let intersection = aSet.intersection(bSet)
    let union = aSet.union(bSet)
    return Double(intersection.count) / Double(union.count)
}


/*This function will return an array of the top 3 closest matches sorted by their Jaccard similarity to the search string.

And here's an example of the search algorithm implemented in Swift using Cosine Similarity:*/

import Foundation

func search(searchString: String, in array: [String]) -> [String] {
    var results: [(String, Double)] = []

    let searchWords = searchString.split(separator: " ")
    let searchVector = createVector(from: searchWords)

    for item in array {
        let itemWords = item.split(separator: " ")
        let itemVector = createVector(from: itemWords)
        let similarity = cosineSimilarity(v1: searchVector, v2: itemVector)
        results.append((item, similarity))
    }

    // Sort the results by similarity
    results.sort { $0.1 > $1.1 }

    // Return the top 3 closest matches
    return results.map { $0.0 }.prefix(3)
}

func createVector(from words: [Substring]) -> [String: Double] {
    var vector: [String: Double] = [:]
    for word in words {
        if vector[word] == nil {
            vector[word] = 1
        } else {
            vector[word]! += 1
        }
    }
    return vector
}

func cosineSimilarity(v1: [String: Double], v2: [String: Double]) -> Double {
    var dotProduct = 0.0
    var v1Magnitude = 0.0
    var v2Magnitude = 0.0
    for (key, value) in v1 {
        dotProduct += value * (v2[key] ?? 0)
        v1Magnitude += pow(value, 2)
    }
    for (_, value) in v2 {
        v2Magnitude += pow(value, 2)
    }
    let magnitude = sqrt(v1Magnitude) * sqrt(v2Magnitude)
    if magnitude == 0 {
        return 0
    }
    return dotProduct / magnitude
}

// which one is the most fast do you think, if you have to suggest in sequence ?

/*
It's important to note that both of these examples are based on simple text matching and may not be suitable for more
*/


/*

The performance of each algorithm will depend on the specific requirements of your application, such as the size of your dataset and the expected level of similarity between the search string and the results.

The Levenshtein distance algorithm is a well-known algorithm that is relatively fast, even for large datasets, because it has a linear time complexity of O(m*n), where m and n are the lengths of the two strings being compared. However, it may not be the best choice if you need to find matches that are only slightly similar to the search string.

Jaccard similarity algorithm is also relatively fast, especially for large datasets, because it has a linear time complexity of O(m+n) (where m and n are the number of elements in the two sets being compared).

Cosine Similarity algorithm is also relatively fast, especially for large datasets, it has a time complexity of O(n*log(n))

In general, it's a good idea to try out different algorithms and evaluate their performance based on your specific use case. If you have a large dataset, it's probably best to use Jaccard Similarity or Cosine Similarity, because they are more efficient than Levenshtein distance algorithm. But if you want to find matches that are only slightly similar to the search string, Levenshtein distance algorithm could be the best choice.
*/



