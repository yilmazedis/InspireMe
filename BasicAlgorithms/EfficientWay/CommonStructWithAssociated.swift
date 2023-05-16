/////////////////////////
// Wrong Way
struct BlogPost {
    // Common Properties
    var title: String
    
    // Article Properties
    var wordCount: Int?
    
    // Video Properties
    var videoURL: URL?
    var duration: String?
}

var incorrectBlogPost = BlogPost(title: "My Awsome Video", wordCount: 240, videoURL: nil, duration: "4:35")
var correctBlogPost = BlogPost(title: "My Awsome Video", wordCount: nil, videoURL: URL(string: "https://mywebsite.com/video"), duration: "4:35")

/////////////////////////
// Another Wrong Way
struct ArticleMetadata {
    var wordCount: Int
}

struct VideoMetadata {
    var videoURL: URL
    var duration: String
}


struct BlogPost {
    var title: String
    var articleMetadata: ArticleMetadata?
    var videoMetadata: VideoMetadata?
}
// Still, one of metadata can be nil
var incorrectBlogPost = BlogPost(title: "My Awsome Video", articleMetadata: nil, videoMetadata: nil)

/////////////////////////
// Correct Way To Do
enum Metadata {
    case article(wordCount: Int)
    case video(videoURL: URL, duration: String)
}

struct BlogPost {
    var title: String
    var metadata: Metadata
}

var correctBlogPost = BlogPost(title: "My Awsome Video", metadata: .video(videoURL: URL(string: "https://mywebsite.com/video")!, duration: "4:35"))
var correctBlogPost = BlogPost(title: "My Awsome Video", metadata: .article(wordCount: 240))

