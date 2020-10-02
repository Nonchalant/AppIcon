extension ContentsJson {
    struct Image: Encodable {
        let filename: String
        let idiom: String
        let role: String?
        let scale: String
        let size: String
        let subtype: String?
    }
}
