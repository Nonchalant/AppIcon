struct ContentsJson: Encodable {
    let images: [Image]
    let info: Info
}

extension ContentsJson {
    struct Image: Encodable {
        let filename: String
        let idiom: String
        let platform: String?
        let scale: String?
        let size: String
    }

    struct Info: Encodable {
        let version: Int
        let author: String
    }
}
