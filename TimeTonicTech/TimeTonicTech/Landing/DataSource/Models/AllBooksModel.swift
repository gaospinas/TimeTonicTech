import Foundation

// MARK: - AllBooksModel
struct AllBooksModel: Codable {
    var status: String?
    var sstamp: Int?
    var allBooks: AllBooks?
    var createdVNB, req: String?
}

// MARK: - AllBooks
struct AllBooks: Codable {
    var nbBooks, nbContacts: Int?
    var contacts: [String]?
    var books: [Book]?
}

// MARK: - Book
struct Book: Codable, Identifiable {
    var invited: Bool?
    var accepted: Bool?
    var archived: Bool?
    var showFPOnOpen: Bool?
    var sstamp: Int?
    var del: Bool?
    var hideMessage: String?
    var hideBookMembers: String?
    var description: String?
    var defaultTemplate: String?
    var isDownloadable: Bool?
    var canDisableSync: Bool?
    var bC: String?
    var bO: String?
    var cluster: String?
    var nbNotRead: Int?
    var nbMembers: Int?
    var members: [Member]?
    var fpForm: FPForm?
    var lastMsg: LastMsg?
    var nbMsgs: Int?
    var userPrefs: UserPrefs?
    var ownerPrefs: OwnerPrefs?
    var sbid: Int?
    var lastMsgRead: Int?
    var lastMedia: Int?
    var favorite: Bool?
    var order: Int?
    var id: String? { description }
    
    enum CodingKeys: String, CodingKey {
        case invited, accepted, archived
        case showFPOnOpen = "showFpOnOpen"
        case sstamp, del, hideMessage, hideBookMembers, description, defaultTemplate, isDownloadable, canDisableSync
        case bC = "b_c"
        case bO = "b_o"
        case cluster
        case nbNotRead, nbMembers, members, fpForm, lastMsg, nbMsgs, userPrefs, ownerPrefs, sbid, lastMsgRead, lastMedia, favorite, order
    }
    
    var coverImageURL: String? {
        guard let coverImg = ownerPrefs?.oCoverImg else { return nil }
        return "https://timetonic.com/live/dbi/in/tb/\(coverImg)"
    }
}


// MARK: - FPForm
struct FPForm: Codable {
    var fpid: Int?
    var name: String?
    var lastModified: Int?
}

// MARK: - LastMsg
struct LastMsg: Codable {
    var smid: Int?
    var uuid: String?
    var sstamp, lastCommentID: Int?
    var msgBody, msgType, msgMethod, msgColor: String?
    var nbComments, pid, nbMedias, nbEmailCids: Int?
    var nbDocs: Int?
    var bC, bO, uC: String?
    var linkMessage: String?
    var msg: String?
    var del: Bool?
    var created, lastModified: Int?
    var docs: [Doc]?
    
    enum CodingKeys: String, CodingKey {
        case smid, uuid, sstamp
        case lastCommentID = "lastCommentId"
        case msgBody, msgType, msgMethod, msgColor, nbComments, pid, nbMedias, nbEmailCids, nbDocs
        case bC = "b_c"
        case bO = "b_o"
        case uC = "u_c"
        case linkMessage
        case msg, del, created, lastModified, docs
    }
}

// MARK: - Doc
struct Doc: Codable {
    var id: Int?
    var ext, originName, internName, uuid: String?
    var size: Int?
    var type: String?
    var del: Bool?
}

// MARK: - Member
struct Member: Codable {
    var uC, invite: String?
    var memberRight, access: Int?
    var hideMessage, hideBookMembers, apiRight: String?
    
    enum CodingKeys: String, CodingKey {
        case uC = "u_c"
        case invite
        case memberRight = "right"
        case access, hideMessage, hideBookMembers, apiRight
    }
}

// MARK: - OwnerPrefs
struct OwnerPrefs: Codable {
    var fpAutoExport: Bool?
    var oCoverColor: String?
    var oCoverUseLastImg: Bool?
    var oCoverImg, oCoverType: String?
    var authorizeMemberBroadcast, acceptExternalMsg: Bool?
    var title: String?
    var notifyMobileConfidential: Bool?
}

// MARK: - UserPrefs
struct UserPrefs: Codable {
    var maxMsgsOffline: Int?
    var syncWithHubic, uCoverLetOwnerDecide: Bool?
    var uCoverColor: String?
    var uCoverUseLastImg: Bool?
    var uCoverImg, uCoverType: String?
    var inGlobalSearch, inGlobalTasks, notifyEmailCopy, notifySMSCopy: Bool?
    var notifyMobile, notifyWhenMsgInArchivedBook: Bool?
    
    enum CodingKeys: String, CodingKey {
        case maxMsgsOffline, syncWithHubic, uCoverLetOwnerDecide, uCoverColor, uCoverUseLastImg, uCoverImg, uCoverType, inGlobalSearch, inGlobalTasks, notifyEmailCopy
        case notifySMSCopy = "notifySmsCopy"
        case notifyMobile, notifyWhenMsgInArchivedBook
    }
}
