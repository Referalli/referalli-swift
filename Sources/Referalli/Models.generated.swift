// Code generated from the Referalli OpenAPI document. DO NOT EDIT.
// Changes belong in the generator, which overwrites this file.

import Foundation

public struct Ok: Codable, Sendable, Equatable {
    public var ok: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
    }

    public init(ok: Bool) {
        self.ok = ok
    }
}

public struct OkStatus: Codable, Sendable, Equatable {
    public var ok: Bool
    public var status: String

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case status = "status"
    }

    public init(ok: Bool, status: String) {
        self.ok = ok
        self.status = status
    }
}

public struct AmountsValueItem: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var amountMinor: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case amountMinor = "amountMinor"
    }

    public init(currency: String, amountMinor: Int) {
        self.currency = currency
        self.amountMinor = amountMinor
    }
}

public typealias Amounts = [AmountsValueItem]

public struct Balance: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var pending: Int
    /// Integer minor units (cents).
    public var approved: Int
    /// Integer minor units (cents).
    public var paid: Int
    /// Integer minor units (cents).
    public var reversed: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case pending = "pending"
        case approved = "approved"
        case paid = "paid"
        case reversed = "reversed"
    }

    public init(currency: String, pending: Int, approved: Int, paid: Int, reversed: Int) {
        self.currency = currency
        self.pending = pending
        self.approved = approved
        self.paid = paid
        self.reversed = reversed
    }
}

public struct ProgramSettingsRiskPolicy: Codable, Sendable, Equatable {
    public var holdBotScore: Double
    public var holdDisposableEmail: Bool
    public var holdVelocity: Int
    public var holdUnverifiedEmail: Bool
    public var holdSelfReferral: Bool
    public var holdRiskScore: Double
    public var holdHighRiskLevel: Bool

    enum CodingKeys: String, CodingKey {
        case holdBotScore = "holdBotScore"
        case holdDisposableEmail = "holdDisposableEmail"
        case holdVelocity = "holdVelocity"
        case holdUnverifiedEmail = "holdUnverifiedEmail"
        case holdSelfReferral = "holdSelfReferral"
        case holdRiskScore = "holdRiskScore"
        case holdHighRiskLevel = "holdHighRiskLevel"
    }

    public init(holdBotScore: Double, holdDisposableEmail: Bool, holdVelocity: Int, holdUnverifiedEmail: Bool, holdSelfReferral: Bool, holdRiskScore: Double, holdHighRiskLevel: Bool) {
        self.holdBotScore = holdBotScore
        self.holdDisposableEmail = holdDisposableEmail
        self.holdVelocity = holdVelocity
        self.holdUnverifiedEmail = holdUnverifiedEmail
        self.holdSelfReferral = holdSelfReferral
        self.holdRiskScore = holdRiskScore
        self.holdHighRiskLevel = holdHighRiskLevel
    }
}

public struct ProgramSettingsWidget: Codable, Sendable, Equatable {
    public var autoEnroll: Bool
    public var destinationUrl: String?

    enum CodingKeys: String, CodingKey {
        case autoEnroll = "autoEnroll"
        case destinationUrl = "destinationUrl"
    }

    public init(autoEnroll: Bool, destinationUrl: String? = nil) {
        self.autoEnroll = autoEnroll
        self.destinationUrl = destinationUrl
    }
}

public struct ProgramSettingsMobileAppOption1IosOption1: Codable, Sendable, Equatable {
    public var teamId: String
    public var bundleId: String

    enum CodingKeys: String, CodingKey {
        case teamId = "teamId"
        case bundleId = "bundleId"
    }

    public init(teamId: String, bundleId: String) {
        self.teamId = teamId
        self.bundleId = bundleId
    }
}

public struct ProgramSettingsMobileAppOption1AndroidOption1: Codable, Sendable, Equatable {
    public var packageName: String
    public var sha256CertFingerprints: [String]

    enum CodingKeys: String, CodingKey {
        case packageName = "packageName"
        case sha256CertFingerprints = "sha256CertFingerprints"
    }

    public init(packageName: String, sha256CertFingerprints: [String]) {
        self.packageName = packageName
        self.sha256CertFingerprints = sha256CertFingerprints
    }
}

public struct ProgramSettingsMobileAppOption1: Codable, Sendable, Equatable {
    public var ios: ProgramSettingsMobileAppOption1IosOption1?
    public var android: ProgramSettingsMobileAppOption1AndroidOption1?

    enum CodingKeys: String, CodingKey {
        case ios = "ios"
        case android = "android"
    }

    public init(ios: ProgramSettingsMobileAppOption1IosOption1? = nil, android: ProgramSettingsMobileAppOption1AndroidOption1? = nil) {
        self.ios = ios
        self.android = android
    }
}

public struct ProgramSettings: Codable, Sendable, Equatable {
    public var probabilisticPolicy: String
    public var selfReferralPolicy: String
    public var splitCommissions: Bool
    public var utmTemplate: [String: String]
    public var allowPaidSearch: Bool
    public var challengeLinks: Bool
    public var settlement: String
    public var riskPolicy: ProgramSettingsRiskPolicy
    public var widget: ProgramSettingsWidget
    public var refereeReward: GetOpenapiJsonResponse?
    /// The mobile apps that open this program's links (universal links / App Links), or null.
    public var mobileApp: ProgramSettingsMobileAppOption1?

    enum CodingKeys: String, CodingKey {
        case probabilisticPolicy = "probabilisticPolicy"
        case selfReferralPolicy = "selfReferralPolicy"
        case splitCommissions = "splitCommissions"
        case utmTemplate = "utmTemplate"
        case allowPaidSearch = "allowPaidSearch"
        case challengeLinks = "challengeLinks"
        case settlement = "settlement"
        case riskPolicy = "riskPolicy"
        case widget = "widget"
        case refereeReward = "refereeReward"
        case mobileApp = "mobileApp"
    }

    public init(probabilisticPolicy: String, selfReferralPolicy: String, splitCommissions: Bool, utmTemplate: [String: String], allowPaidSearch: Bool, challengeLinks: Bool, settlement: String, riskPolicy: ProgramSettingsRiskPolicy, widget: ProgramSettingsWidget, refereeReward: GetOpenapiJsonResponse? = nil, mobileApp: ProgramSettingsMobileAppOption1? = nil) {
        self.probabilisticPolicy = probabilisticPolicy
        self.selfReferralPolicy = selfReferralPolicy
        self.splitCommissions = splitCommissions
        self.utmTemplate = utmTemplate
        self.allowPaidSearch = allowPaidSearch
        self.challengeLinks = challengeLinks
        self.settlement = settlement
        self.riskPolicy = riskPolicy
        self.widget = widget
        self.refereeReward = refereeReward
        self.mobileApp = mobileApp
    }
}

public struct ProgramPublicPage: Codable, Sendable, Equatable {
    public var pitch: String
    public var autoApprove: Bool

    enum CodingKeys: String, CodingKey {
        case pitch = "pitch"
        case autoApprove = "autoApprove"
    }

    public init(pitch: String, autoApprove: Bool) {
        self.pitch = pitch
        self.autoApprove = autoApprove
    }
}

public struct Program: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var slug: String
    public var attributionModel: String
    public var cookieWindowDays: Int
    public var signupToConversionDays: Int
    public var termsMd: String
    public var status: String
    public var publicHandle: String?
    public var settings: ProgramSettings
    public var publicPage: ProgramPublicPage
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case attributionModel = "attributionModel"
        case cookieWindowDays = "cookieWindowDays"
        case signupToConversionDays = "signupToConversionDays"
        case termsMd = "termsMd"
        case status = "status"
        case publicHandle = "publicHandle"
        case settings = "settings"
        case publicPage = "publicPage"
        case createdAt = "createdAt"
    }

    public init(id: String, name: String, slug: String, attributionModel: String, cookieWindowDays: Int, signupToConversionDays: Int, termsMd: String, status: String, publicHandle: String? = nil, settings: ProgramSettings, publicPage: ProgramPublicPage, createdAt: String) {
        self.id = id
        self.name = name
        self.slug = slug
        self.attributionModel = attributionModel
        self.cookieWindowDays = cookieWindowDays
        self.signupToConversionDays = signupToConversionDays
        self.termsMd = termsMd
        self.status = status
        self.publicHandle = publicHandle
        self.settings = settings
        self.publicPage = publicPage
        self.createdAt = createdAt
    }
}

public struct Partner: Codable, Sendable, Equatable {
    public var id: String
    public var email: String
    public var displayName: String
    public var externalRef: String?
    public var status: String
    public var tags: [String]
    public var notes: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case displayName = "displayName"
        case externalRef = "externalRef"
        case status = "status"
        case tags = "tags"
        case notes = "notes"
        case createdAt = "createdAt"
    }

    public init(id: String, email: String, displayName: String, externalRef: String? = nil, status: String, tags: [String], notes: String? = nil, createdAt: String) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.externalRef = externalRef
        self.status = status
        self.tags = tags
        self.notes = notes
        self.createdAt = createdAt
    }
}

public struct NetworkWarning: Codable, Sendable, Equatable {
    public var flagged: Bool
    public var reason: String?
    /// Other merchants that banned this account; 0 below the threshold (2). Never says which.
    public var bannedByOtherMerchants: Int

    enum CodingKeys: String, CodingKey {
        case flagged = "flagged"
        case reason = "reason"
        case bannedByOtherMerchants = "bannedByOtherMerchants"
    }

    public init(flagged: Bool, reason: String? = nil, bannedByOtherMerchants: Int) {
        self.flagged = flagged
        self.reason = reason
        self.bannedByOtherMerchants = bannedByOtherMerchants
    }
}

public struct Enrollment: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case status = "status"
    }

    public init(id: String, programId: String, partnerId: String, status: String) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.status = status
    }
}

public struct Link: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    /// Lowercase; matched case-insensitively.
    public var code: String
    public var destinationUrl: String
    /// Absolute link, on the org's verified link domain when it has one.
    public var shortUrl: String
    public var clicks: Int
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case code = "code"
        case destinationUrl = "destinationUrl"
        case shortUrl = "shortUrl"
        case clicks = "clicks"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, partnerId: String, code: String, destinationUrl: String, shortUrl: String, clicks: Int, createdAt: String) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.code = code
        self.destinationUrl = destinationUrl
        self.shortUrl = shortUrl
        self.clicks = clicks
        self.createdAt = createdAt
    }
}

public struct CreatedLink: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var code: String
    public var destinationUrl: String
    public var shortUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case code = "code"
        case destinationUrl = "destinationUrl"
        case shortUrl = "shortUrl"
    }

    public init(id: String, programId: String, partnerId: String, code: String, destinationUrl: String, shortUrl: String? = nil) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.code = code
        self.destinationUrl = destinationUrl
        self.shortUrl = shortUrl
    }
}

public struct Coupon: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var code: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case code = "code"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, partnerId: String, code: String, createdAt: String) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.code = code
        self.createdAt = createdAt
    }
}

public struct ReasonNote: Codable, Sendable, Equatable {
    public var code: String
    public var values: [String: Double]?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case values = "values"
    }

    public init(code: String, values: [String: Double]? = nil) {
        self.code = code
        self.values = values
    }
}

public struct PayoutScheduleValueOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var dayOfMonth: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dayOfMonth = "dayOfMonth"
    }

    public init(kind: String, dayOfMonth: Int) {
        self.kind = kind
        self.dayOfMonth = dayOfMonth
    }
}

public struct PayoutScheduleValueOption2: Codable, Sendable, Equatable {
    public var kind: String
    /// 0 = Sunday … 6 = Saturday
    public var dayOfWeek: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dayOfWeek = "dayOfWeek"
    }

    public init(kind: String, dayOfWeek: Int) {
        self.kind = kind
        self.dayOfWeek = dayOfWeek
    }
}

public struct PayoutScheduleValueOption3: Codable, Sendable, Equatable {
    public var kind: String
    public var days: [Int]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case days = "days"
    }

    public init(kind: String, days: [Int]) {
        self.kind = kind
        self.days = days
    }
}

public struct PayoutScheduleValueOption4: Codable, Sendable, Equatable {
    public var kind: String
    public var dates: [String]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dates = "dates"
    }

    public init(kind: String, dates: [String]) {
        self.kind = kind
        self.dates = dates
    }
}

public typealias PayoutSchedule = JSONValue

public struct AttributionReasoning: Codable, Sendable, Equatable {
    public var model: String?
    public var consideredTouchpoints: Int?
    public var windowDays: Int?
    public var notes: [String]?
    public var noteCodes: [ReasonNote]?

    enum CodingKeys: String, CodingKey {
        case model = "model"
        case consideredTouchpoints = "consideredTouchpoints"
        case windowDays = "windowDays"
        case notes = "notes"
        case noteCodes = "noteCodes"
    }

    public init(model: String? = nil, consideredTouchpoints: Int? = nil, windowDays: Int? = nil, notes: [String]? = nil, noteCodes: [ReasonNote]? = nil) {
        self.model = model
        self.consideredTouchpoints = consideredTouchpoints
        self.windowDays = windowDays
        self.notes = notes
        self.noteCodes = noteCodes
    }
}

public struct ReferralTouchCreditsItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var weight: Double
    public var clickId: String?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case weight = "weight"
        case clickId = "clickId"
    }

    public init(partnerId: String, weight: Double, clickId: String? = nil) {
        self.partnerId = partnerId
        self.weight = weight
        self.clickId = clickId
    }
}

public struct Referral: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var customerRef: String
    public var source: String
    public var matchedVia: String
    public var confidence: Double
    public var clickId: String?
    public var linkId: String?
    public var status: String
    public var ts: String
    public var windowExpiresAt: String
    public var touchCredits: [ReferralTouchCreditsItem]
    public var reasoning: AttributionReasoning

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case customerRef = "customerRef"
        case source = "source"
        case matchedVia = "matchedVia"
        case confidence = "confidence"
        case clickId = "clickId"
        case linkId = "linkId"
        case status = "status"
        case ts = "ts"
        case windowExpiresAt = "windowExpiresAt"
        case touchCredits = "touchCredits"
        case reasoning = "reasoning"
    }

    public init(id: String, programId: String, partnerId: String, customerRef: String, source: String, matchedVia: String, confidence: Double, clickId: String? = nil, linkId: String? = nil, status: String, ts: String, windowExpiresAt: String, touchCredits: [ReferralTouchCreditsItem], reasoning: AttributionReasoning) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.customerRef = customerRef
        self.source = source
        self.matchedVia = matchedVia
        self.confidence = confidence
        self.clickId = clickId
        self.linkId = linkId
        self.status = status
        self.ts = ts
        self.windowExpiresAt = windowExpiresAt
        self.touchCredits = touchCredits
        self.reasoning = reasoning
    }
}

public typealias SignupReasonCode = String

public struct AssociateResponseReferralOption1TouchCreditsItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var weight: Double
    public var clickId: String?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case weight = "weight"
        case clickId = "clickId"
    }

    public init(partnerId: String, weight: Double, clickId: String? = nil) {
        self.partnerId = partnerId
        self.weight = weight
        self.clickId = clickId
    }
}

public struct AssociateResponseReferralOption1: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var customerRef: String
    public var source: String
    public var matchedVia: String
    public var confidence: Double
    public var clickId: String?
    public var linkId: String?
    public var status: String
    public var ts: String
    public var windowExpiresAt: String
    public var touchCredits: [AssociateResponseReferralOption1TouchCreditsItem]
    public var reasoning: AttributionReasoning
    public var orgId: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case customerRef = "customerRef"
        case source = "source"
        case matchedVia = "matchedVia"
        case confidence = "confidence"
        case clickId = "clickId"
        case linkId = "linkId"
        case status = "status"
        case ts = "ts"
        case windowExpiresAt = "windowExpiresAt"
        case touchCredits = "touchCredits"
        case reasoning = "reasoning"
        case orgId = "orgId"
    }

    public init(id: String, programId: String, partnerId: String, customerRef: String, source: String, matchedVia: String, confidence: Double, clickId: String? = nil, linkId: String? = nil, status: String, ts: String, windowExpiresAt: String, touchCredits: [AssociateResponseReferralOption1TouchCreditsItem], reasoning: AttributionReasoning, orgId: String) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.customerRef = customerRef
        self.source = source
        self.matchedVia = matchedVia
        self.confidence = confidence
        self.clickId = clickId
        self.linkId = linkId
        self.status = status
        self.ts = ts
        self.windowExpiresAt = windowExpiresAt
        self.touchCredits = touchCredits
        self.reasoning = reasoning
        self.orgId = orgId
    }
}

public struct AssociateResponseReasoning: Codable, Sendable, Equatable {
    public var notes: [String]

    enum CodingKeys: String, CodingKey {
        case notes = "notes"
    }

    public init(notes: [String]) {
        self.notes = notes
    }
}

public struct AssociateResponse: Codable, Sendable, Equatable {
    /// null when no partner matched (not an error).
    public var referral: AssociateResponseReferralOption1?
    public var reasoning: AssociateResponseReasoning?

    enum CodingKeys: String, CodingKey {
        case referral = "referral"
        case reasoning = "reasoning"
    }

    public init(referral: AssociateResponseReferralOption1? = nil, reasoning: AssociateResponseReasoning? = nil) {
        self.referral = referral
        self.reasoning = reasoning
    }
}

public struct CommissionEvent: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var referralId: String?
    public var type: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var relatedCommissionId: String?
    public var holdUntil: String?
    public var level: Int?
    public var memo: String?
    /// Set on paid events the merchant settled itself (store_credit).
    public var settlementMethod: String?
    public var settlementReference: String?
    public var ts: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case referralId = "referralId"
        case type = "type"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case relatedCommissionId = "relatedCommissionId"
        case holdUntil = "holdUntil"
        case level = "level"
        case memo = "memo"
        case settlementMethod = "settlementMethod"
        case settlementReference = "settlementReference"
        case ts = "ts"
    }

    public init(id: String, programId: String, partnerId: String, referralId: String? = nil, type: String, amountMinor: Int, currency: String, relatedCommissionId: String? = nil, holdUntil: String? = nil, level: Int? = nil, memo: String? = nil, settlementMethod: String? = nil, settlementReference: String? = nil, ts: String) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.referralId = referralId
        self.type = type
        self.amountMinor = amountMinor
        self.currency = currency
        self.relatedCommissionId = relatedCommissionId
        self.holdUntil = holdUntil
        self.level = level
        self.memo = memo
        self.settlementMethod = settlementMethod
        self.settlementReference = settlementReference
        self.ts = ts
    }
}

/// An earned line also carries its net, state and the events recorded against it.
public struct CommissionLine: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var referralId: String?
    public var type: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var relatedCommissionId: String?
    public var holdUntil: String?
    public var level: Int?
    public var memo: String?
    /// Set on paid events the merchant settled itself (store_credit).
    public var settlementMethod: String?
    public var settlementReference: String?
    public var ts: String
    public var billingEventId: String?
    /// Integer minor units (cents).
    public var netMinor: Int?
    public var state: String?
    public var events: [CommissionEvent]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case referralId = "referralId"
        case type = "type"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case relatedCommissionId = "relatedCommissionId"
        case holdUntil = "holdUntil"
        case level = "level"
        case memo = "memo"
        case settlementMethod = "settlementMethod"
        case settlementReference = "settlementReference"
        case ts = "ts"
        case billingEventId = "billingEventId"
        case netMinor = "netMinor"
        case state = "state"
        case events = "events"
    }

    public init(id: String, programId: String, partnerId: String, referralId: String? = nil, type: String, amountMinor: Int, currency: String, relatedCommissionId: String? = nil, holdUntil: String? = nil, level: Int? = nil, memo: String? = nil, settlementMethod: String? = nil, settlementReference: String? = nil, ts: String, billingEventId: String? = nil, netMinor: Int? = nil, state: String? = nil, events: [CommissionEvent]? = nil) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.referralId = referralId
        self.type = type
        self.amountMinor = amountMinor
        self.currency = currency
        self.relatedCommissionId = relatedCommissionId
        self.holdUntil = holdUntil
        self.level = level
        self.memo = memo
        self.settlementMethod = settlementMethod
        self.settlementReference = settlementReference
        self.ts = ts
        self.billingEventId = billingEventId
        self.netMinor = netMinor
        self.state = state
        self.events = events
    }
}

public struct Settlement: Codable, Sendable, Equatable {
    public var commissionId: String
    public var paidEventId: String
    public var partnerId: String
    public var programId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var method: String
    public var reference: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case commissionId = "commissionId"
        case paidEventId = "paidEventId"
        case partnerId = "partnerId"
        case programId = "programId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case method = "method"
        case reference = "reference"
        case status = "status"
    }

    public init(commissionId: String, paidEventId: String, partnerId: String, programId: String, amountMinor: Int, currency: String, method: String, reference: String, status: String) {
        self.commissionId = commissionId
        self.paidEventId = paidEventId
        self.partnerId = partnerId
        self.programId = programId
        self.amountMinor = amountMinor
        self.currency = currency
        self.method = method
        self.reference = reference
        self.status = status
    }
}

public struct CommissionRule: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var version: Int
    public var config: GetOpenapiJsonResponse
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case version = "version"
        case config = "config"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, version: Int, config: GetOpenapiJsonResponse, createdAt: String) {
        self.id = id
        self.programId = programId
        self.version = version
        self.config = config
        self.createdAt = createdAt
    }
}

public struct ValueMapping: Codable, Sendable, Equatable {
    public var cash: String?
    public var creditApplied: String?
    public var discount: String?
    public var cost: String?
    public var productRef: String?
    public var unit: String
    /// Bumped on every save (the built-in extractor is 1).
    public var version: Int

    enum CodingKeys: String, CodingKey {
        case cash = "cash"
        case creditApplied = "creditApplied"
        case discount = "discount"
        case cost = "cost"
        case productRef = "productRef"
        case unit = "unit"
        case version = "version"
    }

    public init(cash: String? = nil, creditApplied: String? = nil, discount: String? = nil, cost: String? = nil, productRef: String? = nil, unit: String, version: Int) {
        self.cash = cash
        self.creditApplied = creditApplied
        self.discount = discount
        self.cost = cost
        self.productRef = productRef
        self.unit = unit
        self.version = version
    }
}

public struct ValueMappingPreviewValue: Codable, Sendable, Equatable {
    /// Integer minor units (cents).
    public var cashMinor: Int
    /// Integer minor units (cents).
    public var creditAppliedMinor: Int
    /// Integer minor units (cents).
    public var discountMinor: Int
    /// Integer minor units (cents).
    public var costMinor: Int?
    public var productRef: String?
    public var fields: [String: Double]
    /// Mapped paths holding an unreadable value; read as 0.
    public var warnings: [String]?
    public var source: String?
    public var mappingVersion: Int?

    enum CodingKeys: String, CodingKey {
        case cashMinor = "cashMinor"
        case creditAppliedMinor = "creditAppliedMinor"
        case discountMinor = "discountMinor"
        case costMinor = "costMinor"
        case productRef = "productRef"
        case fields = "fields"
        case warnings = "warnings"
        case source = "source"
        case mappingVersion = "mappingVersion"
    }

    public init(cashMinor: Int, creditAppliedMinor: Int, discountMinor: Int, costMinor: Int? = nil, productRef: String? = nil, fields: [String: Double], warnings: [String]? = nil, source: String? = nil, mappingVersion: Int? = nil) {
        self.cashMinor = cashMinor
        self.creditAppliedMinor = creditAppliedMinor
        self.discountMinor = discountMinor
        self.costMinor = costMinor
        self.productRef = productRef
        self.fields = fields
        self.warnings = warnings
        self.source = source
        self.mappingVersion = mappingVersion
    }
}

public struct ValueMappingPreviewWouldRecordItem: Codable, Sendable, Equatable {
    public var kind: String
    public var currency: String
    public var confidence: String
    public var source: String
    public var extractionVersion: Int
    /// Integer minor units (cents).
    public var cashMinor: Int?
    /// Integer minor units (cents).
    public var creditAppliedMinor: Int?
    /// Integer minor units (cents).
    public var discountMinor: Int?
    /// Integer minor units (cents).
    public var costMinor: Int?
    public var productRef: String?

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case currency = "currency"
        case confidence = "confidence"
        case source = "source"
        case extractionVersion = "extractionVersion"
        case cashMinor = "cashMinor"
        case creditAppliedMinor = "creditAppliedMinor"
        case discountMinor = "discountMinor"
        case costMinor = "costMinor"
        case productRef = "productRef"
    }

    public init(kind: String, currency: String, confidence: String, source: String, extractionVersion: Int, cashMinor: Int? = nil, creditAppliedMinor: Int? = nil, discountMinor: Int? = nil, costMinor: Int? = nil, productRef: String? = nil) {
        self.kind = kind
        self.currency = currency
        self.confidence = confidence
        self.source = source
        self.extractionVersion = extractionVersion
        self.cashMinor = cashMinor
        self.creditAppliedMinor = creditAppliedMinor
        self.discountMinor = discountMinor
        self.costMinor = costMinor
        self.productRef = productRef
    }
}

public struct ValueMappingPreviewEventsItemValue: Codable, Sendable, Equatable {
    /// Integer minor units (cents).
    public var cashMinor: Int
    /// Integer minor units (cents).
    public var creditAppliedMinor: Int
    /// Integer minor units (cents).
    public var discountMinor: Int
    /// Integer minor units (cents).
    public var costMinor: Int?
    public var productRef: String?
    public var fields: [String: Double]
    /// Mapped paths holding an unreadable value; read as 0.
    public var warnings: [String]?
    public var source: String?
    public var mappingVersion: Int?

    enum CodingKeys: String, CodingKey {
        case cashMinor = "cashMinor"
        case creditAppliedMinor = "creditAppliedMinor"
        case discountMinor = "discountMinor"
        case costMinor = "costMinor"
        case productRef = "productRef"
        case fields = "fields"
        case warnings = "warnings"
        case source = "source"
        case mappingVersion = "mappingVersion"
    }

    public init(cashMinor: Int, creditAppliedMinor: Int, discountMinor: Int, costMinor: Int? = nil, productRef: String? = nil, fields: [String: Double], warnings: [String]? = nil, source: String? = nil, mappingVersion: Int? = nil) {
        self.cashMinor = cashMinor
        self.creditAppliedMinor = creditAppliedMinor
        self.discountMinor = discountMinor
        self.costMinor = costMinor
        self.productRef = productRef
        self.fields = fields
        self.warnings = warnings
        self.source = source
        self.mappingVersion = mappingVersion
    }
}

public struct ValueMappingPreviewEventsItemWouldRecordItem: Codable, Sendable, Equatable {
    public var kind: String
    public var currency: String
    public var confidence: String
    public var source: String
    public var extractionVersion: Int
    /// Integer minor units (cents).
    public var cashMinor: Int?
    /// Integer minor units (cents).
    public var creditAppliedMinor: Int?
    /// Integer minor units (cents).
    public var discountMinor: Int?
    /// Integer minor units (cents).
    public var costMinor: Int?
    public var productRef: String?

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case currency = "currency"
        case confidence = "confidence"
        case source = "source"
        case extractionVersion = "extractionVersion"
        case cashMinor = "cashMinor"
        case creditAppliedMinor = "creditAppliedMinor"
        case discountMinor = "discountMinor"
        case costMinor = "costMinor"
        case productRef = "productRef"
    }

    public init(kind: String, currency: String, confidence: String, source: String, extractionVersion: Int, cashMinor: Int? = nil, creditAppliedMinor: Int? = nil, discountMinor: Int? = nil, costMinor: Int? = nil, productRef: String? = nil) {
        self.kind = kind
        self.currency = currency
        self.confidence = confidence
        self.source = source
        self.extractionVersion = extractionVersion
        self.cashMinor = cashMinor
        self.creditAppliedMinor = creditAppliedMinor
        self.discountMinor = discountMinor
        self.costMinor = costMinor
        self.productRef = productRef
    }
}

public struct ValueMappingPreviewEventsItem: Codable, Sendable, Equatable {
    public var currency: String
    public var value: ValueMappingPreviewEventsItemValue
    public var wouldRecord: [ValueMappingPreviewEventsItemWouldRecordItem]
    public var index: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case value = "value"
        case wouldRecord = "wouldRecord"
        case index = "index"
    }

    public init(currency: String, value: ValueMappingPreviewEventsItemValue, wouldRecord: [ValueMappingPreviewEventsItemWouldRecordItem], index: Int) {
        self.currency = currency
        self.value = value
        self.wouldRecord = wouldRecord
        self.index = index
    }
}

public struct ValueMappingPreview: Codable, Sendable, Equatable {
    public var mappingVersion: Int
    /// Single-event payloads.
    public var currency: String?
    public var value: ValueMappingPreviewValue?
    public var wouldRecord: [ValueMappingPreviewWouldRecordItem]?
    /// A generic-connector body with an events array: one result per element.
    public var events: [ValueMappingPreviewEventsItem]?

    enum CodingKeys: String, CodingKey {
        case mappingVersion = "mappingVersion"
        case currency = "currency"
        case value = "value"
        case wouldRecord = "wouldRecord"
        case events = "events"
    }

    public init(mappingVersion: Int, currency: String? = nil, value: ValueMappingPreviewValue? = nil, wouldRecord: [ValueMappingPreviewWouldRecordItem]? = nil, events: [ValueMappingPreviewEventsItem]? = nil) {
        self.mappingVersion = mappingVersion
        self.currency = currency
        self.value = value
        self.wouldRecord = wouldRecord
        self.events = events
    }
}

public struct BillingConnectionRotation: Codable, Sendable, Equatable {
    public var inProgress: Bool
    public var previousSecretExpiresAt: String?

    enum CodingKeys: String, CodingKey {
        case inProgress = "inProgress"
        case previousSecretExpiresAt = "previousSecretExpiresAt"
    }

    public init(inProgress: Bool, previousSecretExpiresAt: String? = nil) {
        self.inProgress = inProgress
        self.previousSecretExpiresAt = previousSecretExpiresAt
    }
}

public struct BillingConnection: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    public var name: String
    /// paused: its webhook URL refuses events until resumed.
    public var status: String
    public var createdAt: String
    public var webhookUrl: String
    /// The provider sends thin webhooks: set API credentials (Recurly, BigCommerce).
    public var needsCredentials: Bool
    public var hasCredentials: Bool
    /// Where cash / credit / discount / cost live in this connection's payload; null uses the built-in extractor.
    public var valueMapping: ValueMapping?
    public var rotation: BillingConnectionRotation

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case name = "name"
        case status = "status"
        case createdAt = "createdAt"
        case webhookUrl = "webhookUrl"
        case needsCredentials = "needsCredentials"
        case hasCredentials = "hasCredentials"
        case valueMapping = "valueMapping"
        case rotation = "rotation"
    }

    public init(id: String, provider: String, name: String, status: String, createdAt: String, webhookUrl: String, needsCredentials: Bool, hasCredentials: Bool, valueMapping: ValueMapping? = nil, rotation: BillingConnectionRotation) {
        self.id = id
        self.provider = provider
        self.name = name
        self.status = status
        self.createdAt = createdAt
        self.webhookUrl = webhookUrl
        self.needsCredentials = needsCredentials
        self.hasCredentials = hasCredentials
        self.valueMapping = valueMapping
        self.rotation = rotation
    }
}

public struct CreatedBillingConnection: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    /// Returned only here.
    public var webhookSecret: String
    /// Path to register with the provider.
    public var webhookUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case webhookSecret = "webhookSecret"
        case webhookUrl = "webhookUrl"
    }

    public init(id: String, provider: String, webhookSecret: String, webhookUrl: String) {
        self.id = id
        self.provider = provider
        self.webhookSecret = webhookSecret
        self.webhookUrl = webhookUrl
    }
}

public struct BillingEvent: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    public var type: String
    public var customerRef: String
    public var invoiceRef: String?
    /// Integer minor units (cents).
    public var amountGross: Int
    /// Integer minor units (cents).
    public var tax: Int
    /// Integer minor units (cents).
    public var fees: Int
    public var currency: String
    public var occurredAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case type = "type"
        case customerRef = "customerRef"
        case invoiceRef = "invoiceRef"
        case amountGross = "amountGross"
        case tax = "tax"
        case fees = "fees"
        case currency = "currency"
        case occurredAt = "occurredAt"
    }

    public init(id: String, provider: String, type: String, customerRef: String, invoiceRef: String? = nil, amountGross: Int, tax: Int, fees: Int, currency: String, occurredAt: String) {
        self.id = id
        self.provider = provider
        self.type = type
        self.customerRef = customerRef
        self.invoiceRef = invoiceRef
        self.amountGross = amountGross
        self.tax = tax
        self.fees = fees
        self.currency = currency
        self.occurredAt = occurredAt
    }
}

public struct WebhookEndpointRotation: Codable, Sendable, Equatable {
    public var inProgress: Bool
    public var previousSecretExpiresAt: String?

    enum CodingKeys: String, CodingKey {
        case inProgress = "inProgress"
        case previousSecretExpiresAt = "previousSecretExpiresAt"
    }

    public init(inProgress: Bool, previousSecretExpiresAt: String? = nil) {
        self.inProgress = inProgress
        self.previousSecretExpiresAt = previousSecretExpiresAt
    }
}

public struct WebhookEndpoint: Codable, Sendable, Equatable {
    public var id: String
    public var url: String
    public var topics: [String]
    /// null: every program. Otherwise only events about these programs (org-wide events such as payouts are not sent).
    public var programIds: [String]?
    public var status: String
    /// Also send the deprecated body-only legacy signature header.
    public var legacySignature: Bool
    public var rotation: WebhookEndpointRotation
    /// When the current run of failed deliveries began.
    public var failingSince: String?
    public var disabledAt: String?
    public var disabledReason: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case topics = "topics"
        case programIds = "programIds"
        case status = "status"
        case legacySignature = "legacySignature"
        case rotation = "rotation"
        case failingSince = "failingSince"
        case disabledAt = "disabledAt"
        case disabledReason = "disabledReason"
        case createdAt = "createdAt"
    }

    public init(id: String, url: String, topics: [String], programIds: [String]? = nil, status: String, legacySignature: Bool, rotation: WebhookEndpointRotation, failingSince: String? = nil, disabledAt: String? = nil, disabledReason: String? = nil, createdAt: String) {
        self.id = id
        self.url = url
        self.topics = topics
        self.programIds = programIds
        self.status = status
        self.legacySignature = legacySignature
        self.rotation = rotation
        self.failingSince = failingSince
        self.disabledAt = disabledAt
        self.disabledReason = disabledReason
        self.createdAt = createdAt
    }
}

public struct WebhookDelivery: Codable, Sendable, Equatable {
    public var id: String
    public var endpointId: String
    public var topic: String
    public var status: String
    public var attempts: Int
    public var lastStatusCode: Int?
    public var lastAttemptAt: String?
    /// When a pending delivery is next tried; null once settled.
    public var nextAt: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case endpointId = "endpointId"
        case topic = "topic"
        case status = "status"
        case attempts = "attempts"
        case lastStatusCode = "lastStatusCode"
        case lastAttemptAt = "lastAttemptAt"
        case nextAt = "nextAt"
        case createdAt = "createdAt"
    }

    public init(id: String, endpointId: String, topic: String, status: String, attempts: Int, lastStatusCode: Int? = nil, lastAttemptAt: String? = nil, nextAt: String? = nil, createdAt: String) {
        self.id = id
        self.endpointId = endpointId
        self.topic = topic
        self.status = status
        self.attempts = attempts
        self.lastStatusCode = lastStatusCode
        self.lastAttemptAt = lastAttemptAt
        self.nextAt = nextAt
        self.createdAt = createdAt
    }
}

public struct PayoutProfile: Codable, Sendable, Equatable {
    public var partnerId: String
    public var method: String
    public var payoutCurrency: String
    /// Integer minor units (cents).
    public var minThresholdMinor: Int
    public var taxFormType: String?
    public var taxFormSubmittedAt: String?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case method = "method"
        case payoutCurrency = "payoutCurrency"
        case minThresholdMinor = "minThresholdMinor"
        case taxFormType = "taxFormType"
        case taxFormSubmittedAt = "taxFormSubmittedAt"
    }

    public init(partnerId: String, method: String, payoutCurrency: String, minThresholdMinor: Int, taxFormType: String? = nil, taxFormSubmittedAt: String? = nil) {
        self.partnerId = partnerId
        self.method = method
        self.payoutCurrency = payoutCurrency
        self.minThresholdMinor = minThresholdMinor
        self.taxFormType = taxFormType
        self.taxFormSubmittedAt = taxFormSubmittedAt
    }
}

public struct TaxProfile: Codable, Sendable, Equatable {
    public var legalName: String?
    public var address: String?
    public var country: String?
    public var vatId: String?
    public var ein: String?
    public var domesticVatBps: Int?
    public var viesCheck: Bool
    public var filingProvider: String
    public var filingConnected: Bool

    enum CodingKeys: String, CodingKey {
        case legalName = "legalName"
        case address = "address"
        case country = "country"
        case vatId = "vatId"
        case ein = "ein"
        case domesticVatBps = "domesticVatBps"
        case viesCheck = "viesCheck"
        case filingProvider = "filingProvider"
        case filingConnected = "filingConnected"
    }

    public init(legalName: String? = nil, address: String? = nil, country: String? = nil, vatId: String? = nil, ein: String? = nil, domesticVatBps: Int? = nil, viesCheck: Bool, filingProvider: String, filingConnected: Bool) {
        self.legalName = legalName
        self.address = address
        self.country = country
        self.vatId = vatId
        self.ein = ein
        self.domesticVatBps = domesticVatBps
        self.viesCheck = viesCheck
        self.filingProvider = filingProvider
        self.filingConnected = filingConnected
    }
}

public struct TaxFilingDocumentsItem: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case status = "status"
    }

    public init(id: String, partnerId: String, amountMinor: Int, status: String) {
        self.id = id
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.status = status
    }
}

public struct TaxFiling: Codable, Sendable, Equatable {
    public var id: String
    public var taxYear: Int
    public var kind: String
    public var provider: String
    public var providerFilingId: String?
    public var status: String
    public var recipientCount: Int
    /// Integer minor units (cents).
    public var totalMinor: Int
    public var error: String?
    public var documents: [TaxFilingDocumentsItem]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case taxYear = "taxYear"
        case kind = "kind"
        case provider = "provider"
        case providerFilingId = "providerFilingId"
        case status = "status"
        case recipientCount = "recipientCount"
        case totalMinor = "totalMinor"
        case error = "error"
        case documents = "documents"
    }

    public init(id: String, taxYear: Int, kind: String, provider: String, providerFilingId: String? = nil, status: String, recipientCount: Int, totalMinor: Int, error: String? = nil, documents: [TaxFilingDocumentsItem]) {
        self.id = id
        self.taxYear = taxYear
        self.kind = kind
        self.provider = provider
        self.providerFilingId = providerFilingId
        self.status = status
        self.recipientCount = recipientCount
        self.totalMinor = totalMinor
        self.error = error
        self.documents = documents
    }
}

public struct NecPreviewRecipientsItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var name: String?
    public var email: String?
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var issues: [String]

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case name = "name"
        case email = "email"
        case amountMinor = "amountMinor"
        case issues = "issues"
    }

    public init(partnerId: String, name: String? = nil, email: String? = nil, amountMinor: Int, issues: [String]) {
        self.partnerId = partnerId
        self.name = name
        self.email = email
        self.amountMinor = amountMinor
        self.issues = issues
    }
}

public struct NecPreview: Codable, Sendable, Equatable {
    public var taxYear: Int
    public var payerReady: Bool
    public var payerIssues: [String]
    public var recipients: [NecPreviewRecipientsItem]

    enum CodingKeys: String, CodingKey {
        case taxYear = "taxYear"
        case payerReady = "payerReady"
        case payerIssues = "payerIssues"
        case recipients = "recipients"
    }

    public init(taxYear: Int, payerReady: Bool, payerIssues: [String], recipients: [NecPreviewRecipientsItem]) {
        self.taxYear = taxYear
        self.payerReady = payerReady
        self.payerIssues = payerIssues
        self.recipients = recipients
    }
}

/// The partner. Absent on invoices issued before 2026-10.
public struct InvoiceSupplier: Codable, Sendable, Equatable {
    public var name: String?
    public var address: String?
    public var country: String?
    public var vatId: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case country = "country"
        case vatId = "vatId"
    }

    public init(name: String? = nil, address: String? = nil, country: String? = nil, vatId: String? = nil) {
        self.name = name
        self.address = address
        self.country = country
        self.vatId = vatId
    }
}

/// The merchant, issuing the invoice on the partner’s behalf.
public struct InvoiceCustomer: Codable, Sendable, Equatable {
    public var name: String?
    public var address: String?
    public var country: String?
    public var vatId: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case country = "country"
        case vatId = "vatId"
    }

    public init(name: String? = nil, address: String? = nil, country: String? = nil, vatId: String? = nil) {
        self.name = name
        self.address = address
        self.country = country
        self.vatId = vatId
    }
}

public struct InvoiceSelfBilling: Codable, Sendable, Equatable {
    public var agreementVersion: String?
    public var acceptedAt: String?

    enum CodingKeys: String, CodingKey {
        case agreementVersion = "agreementVersion"
        case acceptedAt = "acceptedAt"
    }

    public init(agreementVersion: String? = nil, acceptedAt: String? = nil) {
        self.agreementVersion = agreementVersion
        self.acceptedAt = acceptedAt
    }
}

public struct Invoice: Codable, Sendable, Equatable {
    /// Sequential per merchant per year: SBI-2026-1, -2, …
    public var number: String
    public var issuedAt: String
    public var lines: [JSONValue]
    public var vatNote: String
    /// The partner. Absent on invoices issued before 2026-10.
    public var supplier: InvoiceSupplier?
    /// The merchant, issuing the invoice on the partner’s behalf.
    public var customer: InvoiceCustomer?
    public var currency: String?
    /// Integer minor units (cents).
    public var netMinor: Int?
    public var vatTreatment: String?
    public var vatRateBps: Int?
    /// Integer minor units (cents).
    public var vatMinor: Int?
    /// Integer minor units (cents).
    public var grossMinor: Int?
    public var selfBilling: InvoiceSelfBilling?

    enum CodingKeys: String, CodingKey {
        case number = "number"
        case issuedAt = "issuedAt"
        case lines = "lines"
        case vatNote = "vatNote"
        case supplier = "supplier"
        case customer = "customer"
        case currency = "currency"
        case netMinor = "netMinor"
        case vatTreatment = "vatTreatment"
        case vatRateBps = "vatRateBps"
        case vatMinor = "vatMinor"
        case grossMinor = "grossMinor"
        case selfBilling = "selfBilling"
    }

    public init(number: String, issuedAt: String, lines: [JSONValue], vatNote: String, supplier: InvoiceSupplier? = nil, customer: InvoiceCustomer? = nil, currency: String? = nil, netMinor: Int? = nil, vatTreatment: String? = nil, vatRateBps: Int? = nil, vatMinor: Int? = nil, grossMinor: Int? = nil, selfBilling: InvoiceSelfBilling? = nil) {
        self.number = number
        self.issuedAt = issuedAt
        self.lines = lines
        self.vatNote = vatNote
        self.supplier = supplier
        self.customer = customer
        self.currency = currency
        self.netMinor = netMinor
        self.vatTreatment = vatTreatment
        self.vatRateBps = vatRateBps
        self.vatMinor = vatMinor
        self.grossMinor = grossMinor
        self.selfBilling = selfBilling
    }
}

public struct PayoutRunCreatedPayoutsItemFxAppliedItem: Codable, Sendable, Equatable {
    public var from: String
    public var to: String
    public var rate: Double
    public var ts: String

    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case rate = "rate"
        case ts = "ts"
    }

    public init(from: String, to: String, rate: Double, ts: String) {
        self.from = from
        self.to = to
        self.rate = rate
        self.ts = ts
    }
}

public struct PayoutRunCreatedPayoutsItem: Codable, Sendable, Equatable {
    public var payoutId: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var rail: String
    public var fxApplied: [PayoutRunCreatedPayoutsItemFxAppliedItem]
    public var invoice: Invoice

    enum CodingKeys: String, CodingKey {
        case payoutId = "payoutId"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case rail = "rail"
        case fxApplied = "fxApplied"
        case invoice = "invoice"
    }

    public init(payoutId: String, partnerId: String, amountMinor: Int, currency: String, rail: String, fxApplied: [PayoutRunCreatedPayoutsItemFxAppliedItem], invoice: Invoice) {
        self.payoutId = payoutId
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.currency = currency
        self.rail = rail
        self.fxApplied = fxApplied
        self.invoice = invoice
    }
}

public struct PayoutRunCreatedSkippedItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case reason = "reason"
    }

    public init(partnerId: String, reason: String) {
        self.partnerId = partnerId
        self.reason = reason
    }
}

public struct PayoutRunCreated: Codable, Sendable, Equatable {
    public var runId: String
    public var payouts: [PayoutRunCreatedPayoutsItem]
    public var skipped: [PayoutRunCreatedSkippedItem]

    enum CodingKeys: String, CodingKey {
        case runId = "runId"
        case payouts = "payouts"
        case skipped = "skipped"
    }

    public init(runId: String, payouts: [PayoutRunCreatedPayoutsItem], skipped: [PayoutRunCreatedSkippedItem]) {
        self.runId = runId
        self.payouts = payouts
        self.skipped = skipped
    }
}

public struct PayoutRun: Codable, Sendable, Equatable {
    public var id: String
    public var status: String
    public var summary: GetOpenapiJsonResponse?
    public var createdAt: String
    public var executedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case summary = "summary"
        case createdAt = "createdAt"
        case executedAt = "executedAt"
    }

    public init(id: String, status: String, summary: GetOpenapiJsonResponse? = nil, createdAt: String, executedAt: String? = nil) {
        self.id = id
        self.status = status
        self.summary = summary
        self.createdAt = createdAt
        self.executedAt = executedAt
    }
}

public struct Payout: Codable, Sendable, Equatable {
    public var id: String
    public var runId: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var status: String
    public var rail: String
    public var railRef: String?
    public var failureReason: String?
    public var sentAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case runId = "runId"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case status = "status"
        case rail = "rail"
        case railRef = "railRef"
        case failureReason = "failureReason"
        case sentAt = "sentAt"
    }

    public init(id: String, runId: String, partnerId: String, amountMinor: Int, currency: String, status: String, rail: String, railRef: String? = nil, failureReason: String? = nil, sentAt: String? = nil) {
        self.id = id
        self.runId = runId
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.currency = currency
        self.status = status
        self.rail = rail
        self.railRef = railRef
        self.failureReason = failureReason
        self.sentAt = sentAt
    }
}

public struct FxRate: Codable, Sendable, Equatable {
    public var base: String
    public var quote: String
    /// Decimal string, never a float.
    public var rate: String
    public var effectiveAt: String
    /// 'manual' (your own), 'ecb' (the daily feed), or 'fixture' (platform sample).
    public var source: String
    public var scope: String
    /// When a manual override was cleared, handing the pair back to the feed.
    public var retiredAt: String?

    enum CodingKeys: String, CodingKey {
        case base = "base"
        case quote = "quote"
        case rate = "rate"
        case effectiveAt = "effectiveAt"
        case source = "source"
        case scope = "scope"
        case retiredAt = "retiredAt"
    }

    public init(base: String, quote: String, rate: String, effectiveAt: String, source: String, scope: String, retiredAt: String? = nil) {
        self.base = base
        self.quote = quote
        self.rate = rate
        self.effectiveAt = effectiveAt
        self.source = source
        self.scope = scope
        self.retiredAt = retiredAt
    }
}

public struct Org: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var plan: String
    public var settings: GetOpenapiJsonResponse
    public var trackingToken: String
    public var payoutKycRequired: Bool
    /// False for the org's test org (test mode).
    public var livemode: Bool
    /// On a test org: the live org it belongs to.
    public var liveOrgId: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case plan = "plan"
        case settings = "settings"
        case trackingToken = "trackingToken"
        case payoutKycRequired = "payoutKycRequired"
        case livemode = "livemode"
        case liveOrgId = "liveOrgId"
    }

    public init(id: String, name: String, plan: String, settings: GetOpenapiJsonResponse, trackingToken: String, payoutKycRequired: Bool, livemode: Bool, liveOrgId: String? = nil) {
        self.id = id
        self.name = name
        self.plan = plan
        self.settings = settings
        self.trackingToken = trackingToken
        self.payoutKycRequired = payoutKycRequired
        self.livemode = livemode
        self.liveOrgId = liveOrgId
    }
}

public struct Member: Codable, Sendable, Equatable {
    public var userId: String
    public var role: String
    public var email: String
    public var name: String?

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case role = "role"
        case email = "email"
        case name = "name"
    }

    public init(userId: String, role: String, email: String, name: String? = nil) {
        self.userId = userId
        self.role = role
        self.email = email
        self.name = name
    }
}

public struct IssuedApiKey: Codable, Sendable, Equatable {
    public var id: String
    /// The full key, shown once.
    public var key: String
    public var scopes: [String]
    public var publishable: Bool
    public var allowedOrigins: [String]
    public var apiVersion: String
    /// False for a test-mode key (rk_test_…).
    public var livemode: Bool
    public var owner: String?
    public var expiresAt: String?
    public var pairId: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case key = "key"
        case scopes = "scopes"
        case publishable = "publishable"
        case allowedOrigins = "allowedOrigins"
        case apiVersion = "apiVersion"
        case livemode = "livemode"
        case owner = "owner"
        case expiresAt = "expiresAt"
        case pairId = "pairId"
    }

    public init(id: String, key: String, scopes: [String], publishable: Bool, allowedOrigins: [String], apiVersion: String, livemode: Bool, owner: String? = nil, expiresAt: String? = nil, pairId: String? = nil) {
        self.id = id
        self.key = key
        self.scopes = scopes
        self.publishable = publishable
        self.allowedOrigins = allowedOrigins
        self.apiVersion = apiVersion
        self.livemode = livemode
        self.owner = owner
        self.expiresAt = expiresAt
        self.pairId = pairId
    }
}

public struct ApiKeyCreatedByOption1: Codable, Sendable, Equatable {
    public var type: String
    public var id: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
    }

    public init(type: String, id: String) {
        self.type = type
        self.id = id
    }
}

public struct ApiKey: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var prefix: String
    public var scopes: [String]
    /// The API version this key is pinned to (what it gets without a Referalli-Version header).
    public var apiVersion: String
    public var publishable: Bool
    public var allowedOrigins: [String]
    public var livemode: Bool
    /// The developer or service the key belongs to.
    public var owner: String?
    /// Shared by a live/test pair minted together.
    public var pairId: String?
    public var createdBy: ApiKeyCreatedByOption1?
    public var expiresAt: String?
    public var expired: Bool
    /// Updated at most once a minute.
    public var lastUsedAt: String?
    public var createdAt: String
    public var revokedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case prefix = "prefix"
        case scopes = "scopes"
        case apiVersion = "apiVersion"
        case publishable = "publishable"
        case allowedOrigins = "allowedOrigins"
        case livemode = "livemode"
        case owner = "owner"
        case pairId = "pairId"
        case createdBy = "createdBy"
        case expiresAt = "expiresAt"
        case expired = "expired"
        case lastUsedAt = "lastUsedAt"
        case createdAt = "createdAt"
        case revokedAt = "revokedAt"
    }

    public init(id: String, name: String, prefix: String, scopes: [String], apiVersion: String, publishable: Bool, allowedOrigins: [String], livemode: Bool, owner: String? = nil, pairId: String? = nil, createdBy: ApiKeyCreatedByOption1? = nil, expiresAt: String? = nil, expired: Bool, lastUsedAt: String? = nil, createdAt: String, revokedAt: String? = nil) {
        self.id = id
        self.name = name
        self.prefix = prefix
        self.scopes = scopes
        self.apiVersion = apiVersion
        self.publishable = publishable
        self.allowedOrigins = allowedOrigins
        self.livemode = livemode
        self.owner = owner
        self.pairId = pairId
        self.createdBy = createdBy
        self.expiresAt = expiresAt
        self.expired = expired
        self.lastUsedAt = lastUsedAt
        self.createdAt = createdAt
        self.revokedAt = revokedAt
    }
}

public struct AuthConnectionRotation: Codable, Sendable, Equatable {
    public var inProgress: Bool
    public var previousSecretExpiresAt: String?

    enum CodingKeys: String, CodingKey {
        case inProgress = "inProgress"
        case previousSecretExpiresAt = "previousSecretExpiresAt"
    }

    public init(inProgress: Bool, previousSecretExpiresAt: String? = nil) {
        self.inProgress = inProgress
        self.previousSecretExpiresAt = previousSecretExpiresAt
    }
}

public struct AuthConnection: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    public var programId: String
    public var name: String
    public var status: String
    public var createdAt: String
    public var rotation: AuthConnectionRotation
    /// Signed-protocol connections: the Atlas instance, or a custom label.
    public var instanceId: String?
    public var autoEnrollUsers: Bool?
    public var destinationUrl: String?
    public var signatureVersion: String?
    /// True once signatureVersion is v2 or the connection has seen a v2 call.
    public var requiresV2: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case programId = "programId"
        case name = "name"
        case status = "status"
        case createdAt = "createdAt"
        case rotation = "rotation"
        case instanceId = "instanceId"
        case autoEnrollUsers = "autoEnrollUsers"
        case destinationUrl = "destinationUrl"
        case signatureVersion = "signatureVersion"
        case requiresV2 = "requiresV2"
    }

    public init(id: String, provider: String, programId: String, name: String, status: String, createdAt: String, rotation: AuthConnectionRotation, instanceId: String? = nil, autoEnrollUsers: Bool? = nil, destinationUrl: String? = nil, signatureVersion: String? = nil, requiresV2: Bool? = nil) {
        self.id = id
        self.provider = provider
        self.programId = programId
        self.name = name
        self.status = status
        self.createdAt = createdAt
        self.rotation = rotation
        self.instanceId = instanceId
        self.autoEnrollUsers = autoEnrollUsers
        self.destinationUrl = destinationUrl
        self.signatureVersion = signatureVersion
        self.requiresV2 = requiresV2
    }
}

public struct CreatedAuthConnection: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    /// Returned only here.
    public var secret: String
    /// Webhook connectors: Clerk, Supabase, WorkOS, generic.
    public var webhookUrl: String?
    public var metadataKeys: [String: String]?
    /// Signed-protocol connections (atlas, custom).
    public var programId: String?
    public var instanceId: String?
    public var autoEnrollUsers: Bool?
    public var destinationUrl: String?
    public var signupsUrl: String?
    public var eraseUrl: String?
    public var exportUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case secret = "secret"
        case webhookUrl = "webhookUrl"
        case metadataKeys = "metadataKeys"
        case programId = "programId"
        case instanceId = "instanceId"
        case autoEnrollUsers = "autoEnrollUsers"
        case destinationUrl = "destinationUrl"
        case signupsUrl = "signupsUrl"
        case eraseUrl = "eraseUrl"
        case exportUrl = "exportUrl"
    }

    public init(id: String, provider: String, secret: String, webhookUrl: String? = nil, metadataKeys: [String: String]? = nil, programId: String? = nil, instanceId: String? = nil, autoEnrollUsers: Bool? = nil, destinationUrl: String? = nil, signupsUrl: String? = nil, eraseUrl: String? = nil, exportUrl: String? = nil) {
        self.id = id
        self.provider = provider
        self.secret = secret
        self.webhookUrl = webhookUrl
        self.metadataKeys = metadataKeys
        self.programId = programId
        self.instanceId = instanceId
        self.autoEnrollUsers = autoEnrollUsers
        self.destinationUrl = destinationUrl
        self.signupsUrl = signupsUrl
        self.eraseUrl = eraseUrl
        self.exportUrl = exportUrl
    }
}

public struct FraudCase: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String?
    public var referralId: String?
    public var kind: String
    public var status: String
    public var evidence: GetOpenapiJsonResponse?
    public var action: String?
    public var createdAt: String
    public var resolvedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case referralId = "referralId"
        case kind = "kind"
        case status = "status"
        case evidence = "evidence"
        case action = "action"
        case createdAt = "createdAt"
        case resolvedAt = "resolvedAt"
    }

    public init(id: String, partnerId: String? = nil, referralId: String? = nil, kind: String, status: String, evidence: GetOpenapiJsonResponse? = nil, action: String? = nil, createdAt: String, resolvedAt: String? = nil) {
        self.id = id
        self.partnerId = partnerId
        self.referralId = referralId
        self.kind = kind
        self.status = status
        self.evidence = evidence
        self.action = action
        self.createdAt = createdAt
        self.resolvedAt = resolvedAt
    }
}

public struct CustomerExport: Codable, Sendable, Equatable {
    public var customerRef: String
    public var referrals: [GetOpenapiJsonResponse]
    public var associations: [GetOpenapiJsonResponse]
    public var identityLinks: [GetOpenapiJsonResponse]
    public var billingEvents: [GetOpenapiJsonResponse]
    public var conversionEvents: [GetOpenapiJsonResponse]

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case referrals = "referrals"
        case associations = "associations"
        case identityLinks = "identityLinks"
        case billingEvents = "billingEvents"
        case conversionEvents = "conversionEvents"
    }

    public init(customerRef: String, referrals: [GetOpenapiJsonResponse], associations: [GetOpenapiJsonResponse], identityLinks: [GetOpenapiJsonResponse], billingEvents: [GetOpenapiJsonResponse], conversionEvents: [GetOpenapiJsonResponse]) {
        self.customerRef = customerRef
        self.referrals = referrals
        self.associations = associations
        self.identityLinks = identityLinks
        self.billingEvents = billingEvents
        self.conversionEvents = conversionEvents
    }
}

public struct PartnerExport: Codable, Sendable, Equatable {
    public var partner: GetOpenapiJsonResponse
    public var enrollments: [GetOpenapiJsonResponse]
    public var links: [GetOpenapiJsonResponse]
    public var coupons: [GetOpenapiJsonResponse]
    public var payoutProfile: GetOpenapiJsonResponse?
    public var commissionEvents: [GetOpenapiJsonResponse]
    public var payouts: [GetOpenapiJsonResponse]

    enum CodingKeys: String, CodingKey {
        case partner = "partner"
        case enrollments = "enrollments"
        case links = "links"
        case coupons = "coupons"
        case payoutProfile = "payoutProfile"
        case commissionEvents = "commissionEvents"
        case payouts = "payouts"
    }

    public init(partner: GetOpenapiJsonResponse, enrollments: [GetOpenapiJsonResponse], links: [GetOpenapiJsonResponse], coupons: [GetOpenapiJsonResponse], payoutProfile: GetOpenapiJsonResponse? = nil, commissionEvents: [GetOpenapiJsonResponse], payouts: [GetOpenapiJsonResponse]) {
        self.partner = partner
        self.enrollments = enrollments
        self.links = links
        self.coupons = coupons
        self.payoutProfile = payoutProfile
        self.commissionEvents = commissionEvents
        self.payouts = payouts
    }
}

public struct PrivacyRequest: Codable, Sendable, Equatable {
    public var id: String
    public var type: String
    public var subject: GetOpenapiJsonResponse
    public var status: String
    public var error: String?
    public var createdAt: String
    public var completedAt: String?
    public var resultUrl: String?
    /// Erasure receipts, on the single-request read.
    public var result: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case subject = "subject"
        case status = "status"
        case error = "error"
        case createdAt = "createdAt"
        case completedAt = "completedAt"
        case resultUrl = "resultUrl"
        case result = "result"
    }

    public init(id: String, type: String, subject: GetOpenapiJsonResponse, status: String, error: String? = nil, createdAt: String, completedAt: String? = nil, resultUrl: String? = nil, result: GetOpenapiJsonResponse? = nil) {
        self.id = id
        self.type = type
        self.subject = subject
        self.status = status
        self.error = error
        self.createdAt = createdAt
        self.completedAt = completedAt
        self.resultUrl = resultUrl
        self.result = result
    }
}

public struct GraphReferral: Codable, Sendable, Equatable {
    public var referralId: String
    public var customerRef: String
    public var status: String
    public var matchedVia: String
    public var ts: String
    public var revenue: Amounts
    public var commission: Amounts
    public var partner: GraphPartner?

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case customerRef = "customerRef"
        case status = "status"
        case matchedVia = "matchedVia"
        case ts = "ts"
        case revenue = "revenue"
        case commission = "commission"
        case partner = "partner"
    }

    public init(referralId: String, customerRef: String, status: String, matchedVia: String, ts: String, revenue: Amounts, commission: Amounts, partner: GraphPartner? = nil) {
        self.referralId = referralId
        self.customerRef = customerRef
        self.status = status
        self.matchedVia = matchedVia
        self.ts = ts
        self.revenue = revenue
        self.commission = commission
        self.partner = partner
    }
}

public struct GraphPartner: Codable, Sendable, Equatable {
    public var partnerId: String
    public var displayName: String
    public var email: String
    public var externalRef: String?
    public var status: String
    public var commission: Amounts
    public var referrals: [GraphReferral]

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case displayName = "displayName"
        case email = "email"
        case externalRef = "externalRef"
        case status = "status"
        case commission = "commission"
        case referrals = "referrals"
    }

    public init(partnerId: String, displayName: String, email: String, externalRef: String? = nil, status: String, commission: Amounts, referrals: [GraphReferral]) {
        self.partnerId = partnerId
        self.displayName = displayName
        self.email = email
        self.externalRef = externalRef
        self.status = status
        self.commission = commission
        self.referrals = referrals
    }
}

public struct CreatorProfileStats: Codable, Sendable, Equatable {
    public var programs: Int
    public var clicks: Int
    public var referrals: Int
    public var repeatPayerRate: Double?

    enum CodingKeys: String, CodingKey {
        case programs = "programs"
        case clicks = "clicks"
        case referrals = "referrals"
        case repeatPayerRate = "repeatPayerRate"
    }

    public init(programs: Int, clicks: Int, referrals: Int, repeatPayerRate: Double? = nil) {
        self.programs = programs
        self.clicks = clicks
        self.referrals = referrals
        self.repeatPayerRate = repeatPayerRate
    }
}

public struct CreatorProfile: Codable, Sendable, Equatable {
    public var accountId: String
    public var name: String?
    /// Only on your own profile.
    public var email: String?
    public var published: Bool
    public var headline: String
    public var bio: String
    public var categories: [String]
    public var languages: [String]
    public var country: String
    public var channels: [GetOpenapiJsonResponse]
    public var website: String
    public var minAudience: Int
    public var acceptsInvites: Bool
    public var audience: GetOpenapiJsonResponse
    public var engagementBps: Int
    public var stats: CreatorProfileStats
    public var invited: Bool?

    enum CodingKeys: String, CodingKey {
        case accountId = "accountId"
        case name = "name"
        case email = "email"
        case published = "published"
        case headline = "headline"
        case bio = "bio"
        case categories = "categories"
        case languages = "languages"
        case country = "country"
        case channels = "channels"
        case website = "website"
        case minAudience = "minAudience"
        case acceptsInvites = "acceptsInvites"
        case audience = "audience"
        case engagementBps = "engagementBps"
        case stats = "stats"
        case invited = "invited"
    }

    public init(accountId: String, name: String? = nil, email: String? = nil, published: Bool, headline: String, bio: String, categories: [String], languages: [String], country: String, channels: [GetOpenapiJsonResponse], website: String, minAudience: Int, acceptsInvites: Bool, audience: GetOpenapiJsonResponse, engagementBps: Int, stats: CreatorProfileStats, invited: Bool? = nil) {
        self.accountId = accountId
        self.name = name
        self.email = email
        self.published = published
        self.headline = headline
        self.bio = bio
        self.categories = categories
        self.languages = languages
        self.country = country
        self.channels = channels
        self.website = website
        self.minAudience = minAudience
        self.acceptsInvites = acceptsInvites
        self.audience = audience
        self.engagementBps = engagementBps
        self.stats = stats
        self.invited = invited
    }
}

public struct EmailSettings: Codable, Sendable, Equatable {
    public var provider: String?
    /// The key itself is write-only and never returned.
    public var hasApiKey: Bool
    public var fromAddress: String?
    public var fromName: String?
    public var replyTo: String?
    public var defaultLocale: String
    public var logoUrl: String?
    public var primaryColor: String?
    public var domainStatus: String
    public var domainCheckedAt: String?

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case hasApiKey = "hasApiKey"
        case fromAddress = "fromAddress"
        case fromName = "fromName"
        case replyTo = "replyTo"
        case defaultLocale = "defaultLocale"
        case logoUrl = "logoUrl"
        case primaryColor = "primaryColor"
        case domainStatus = "domainStatus"
        case domainCheckedAt = "domainCheckedAt"
    }

    public init(provider: String? = nil, hasApiKey: Bool, fromAddress: String? = nil, fromName: String? = nil, replyTo: String? = nil, defaultLocale: String, logoUrl: String? = nil, primaryColor: String? = nil, domainStatus: String, domainCheckedAt: String? = nil) {
        self.provider = provider
        self.hasApiKey = hasApiKey
        self.fromAddress = fromAddress
        self.fromName = fromName
        self.replyTo = replyTo
        self.defaultLocale = defaultLocale
        self.logoUrl = logoUrl
        self.primaryColor = primaryColor
        self.domainStatus = domainStatus
        self.domainCheckedAt = domainCheckedAt
    }
}

public struct EmailRendered: Codable, Sendable, Equatable {
    public var locale: String
    public var subject: String
    public var text: String
    public var html: String
    public var source: String

    enum CodingKeys: String, CodingKey {
        case locale = "locale"
        case subject = "subject"
        case text = "text"
        case html = "html"
        case source = "source"
    }

    public init(locale: String, subject: String, text: String, html: String, source: String) {
        self.locale = locale
        self.subject = subject
        self.text = text
        self.html = html
        self.source = source
    }
}

public struct Notification: Codable, Sendable, Equatable {
    public var id: String
    public var topic: String
    public var message: String
    public var data: GetOpenapiJsonResponse?
    public var readAt: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case message = "message"
        case data = "data"
        case readAt = "readAt"
        case createdAt = "createdAt"
    }

    public init(id: String, topic: String, message: String, data: GetOpenapiJsonResponse? = nil, readAt: String? = nil, createdAt: String) {
        self.id = id
        self.topic = topic
        self.message = message
        self.data = data
        self.readAt = readAt
        self.createdAt = createdAt
    }
}

public struct Passport: Codable, Sendable, Equatable {
    public var claims: GetOpenapiJsonResponse
    public var signature: String
    public var algorithm: String
    public var publicKey: String

    enum CodingKeys: String, CodingKey {
        case claims = "claims"
        case signature = "signature"
        case algorithm = "algorithm"
        case publicKey = "publicKey"
    }

    public init(claims: GetOpenapiJsonResponse, signature: String, algorithm: String, publicKey: String) {
        self.claims = claims
        self.signature = signature
        self.algorithm = algorithm
        self.publicKey = publicKey
    }
}

public struct IncidentUpdatesItem: Codable, Sendable, Equatable {
    public var id: String
    public var body: String
    public var state: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case body = "body"
        case state = "state"
        case createdAt = "createdAt"
    }

    public init(id: String, body: String, state: String, createdAt: String) {
        self.id = id
        self.body = body
        self.state = state
        self.createdAt = createdAt
    }
}

public struct Incident: Codable, Sendable, Equatable {
    public var id: String
    public var title: String
    public var state: String
    public var severity: String
    public var body: String
    public var components: [String]
    public var startedAt: String
    public var resolvedAt: String?
    public var updatedAt: String
    public var updates: [IncidentUpdatesItem]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case state = "state"
        case severity = "severity"
        case body = "body"
        case components = "components"
        case startedAt = "startedAt"
        case resolvedAt = "resolvedAt"
        case updatedAt = "updatedAt"
        case updates = "updates"
    }

    public init(id: String, title: String, state: String, severity: String, body: String, components: [String], startedAt: String, resolvedAt: String? = nil, updatedAt: String, updates: [IncidentUpdatesItem]) {
        self.id = id
        self.title = title
        self.state = state
        self.severity = severity
        self.body = body
        self.components = components
        self.startedAt = startedAt
        self.resolvedAt = resolvedAt
        self.updatedAt = updatedAt
        self.updates = updates
    }
}

public struct RetentionPolicy: Codable, Sendable, Equatable {
    public var clicks: Int?
    public var visits: Int?
    public var billingPayloads: Int?
    public var webhookDeliveries: Int?
    public var notifications: Int?
    public var auditLog: Int?

    enum CodingKeys: String, CodingKey {
        case clicks = "clicks"
        case visits = "visits"
        case billingPayloads = "billingPayloads"
        case webhookDeliveries = "webhookDeliveries"
        case notifications = "notifications"
        case auditLog = "auditLog"
    }

    public init(clicks: Int? = nil, visits: Int? = nil, billingPayloads: Int? = nil, webhookDeliveries: Int? = nil, notifications: Int? = nil, auditLog: Int? = nil) {
        self.clicks = clicks
        self.visits = visits
        self.billingPayloads = billingPayloads
        self.webhookDeliveries = webhookDeliveries
        self.notifications = notifications
        self.auditLog = auditLog
    }
}

public struct RetentionLimitsValue: Codable, Sendable, Equatable {
    public var minDays: Int
    public var defaultDays: Int?

    enum CodingKeys: String, CodingKey {
        case minDays = "minDays"
        case defaultDays = "defaultDays"
    }

    public init(minDays: Int, defaultDays: Int? = nil) {
        self.minDays = minDays
        self.defaultDays = defaultDays
    }
}

public struct RetentionLastRunOption1: Codable, Sendable, Equatable {
    public var at: String
    public var result: GetOpenapiJsonResponse

    enum CodingKeys: String, CodingKey {
        case at = "at"
        case result = "result"
    }

    public init(at: String, result: GetOpenapiJsonResponse) {
        self.at = at
        self.result = result
    }
}

public struct Retention: Codable, Sendable, Equatable {
    public var policy: RetentionPolicy
    public var limits: [String: RetentionLimitsValue]
    public var lastRun: RetentionLastRunOption1?

    enum CodingKeys: String, CodingKey {
        case policy = "policy"
        case limits = "limits"
        case lastRun = "lastRun"
    }

    public init(policy: RetentionPolicy, limits: [String: RetentionLimitsValue], lastRun: RetentionLastRunOption1? = nil) {
        self.policy = policy
        self.limits = limits
        self.lastRun = lastRun
    }
}

public struct PartnerGroupBaseOption1Option1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PartnerGroupBaseOption1Option2: Codable, Sendable, Equatable {
    public var kind: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PartnerGroup: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var name: String
    public var base: JSONValue?
    public var holdDays: Int?
    public var minThresholdMinor: Int?
    public var payoutCurrency: String?
    public var onboardingMessage: String?
    public var onboardingChecklist: [String]
    public var members: Int?
    public var archivedAt: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case name = "name"
        case base = "base"
        case holdDays = "holdDays"
        case minThresholdMinor = "minThresholdMinor"
        case payoutCurrency = "payoutCurrency"
        case onboardingMessage = "onboardingMessage"
        case onboardingChecklist = "onboardingChecklist"
        case members = "members"
        case archivedAt = "archivedAt"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, name: String, base: JSONValue? = nil, holdDays: Int? = nil, minThresholdMinor: Int? = nil, payoutCurrency: String? = nil, onboardingMessage: String? = nil, onboardingChecklist: [String], members: Int? = nil, archivedAt: String? = nil, createdAt: String) {
        self.id = id
        self.programId = programId
        self.name = name
        self.base = base
        self.holdDays = holdDays
        self.minThresholdMinor = minThresholdMinor
        self.payoutCurrency = payoutCurrency
        self.onboardingMessage = onboardingMessage
        self.onboardingChecklist = onboardingChecklist
        self.members = members
        self.archivedAt = archivedAt
        self.createdAt = createdAt
    }
}

public struct PromotionEffectOption1BaseOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PromotionEffectOption1BaseOption2: Codable, Sendable, Equatable {
    public var kind: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PromotionEffectOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var base: JSONValue

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case base = "base"
    }

    public init(kind: String, base: JSONValue) {
        self.kind = kind
        self.base = base
    }
}

public struct PromotionEffectOption2: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct Promotion: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var name: String
    public var groupId: String?
    public var effect: JSONValue
    public var startsAt: String
    public var endsAt: String
    public var endedAt: String?
    public var status: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case name = "name"
        case groupId = "groupId"
        case effect = "effect"
        case startsAt = "startsAt"
        case endsAt = "endsAt"
        case endedAt = "endedAt"
        case status = "status"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, name: String, groupId: String? = nil, effect: JSONValue, startsAt: String, endsAt: String, endedAt: String? = nil, status: String, createdAt: String) {
        self.id = id
        self.programId = programId
        self.name = name
        self.groupId = groupId
        self.effect = effect
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.endedAt = endedAt
        self.status = status
        self.createdAt = createdAt
    }
}

public struct IntegrationConnection: Codable, Sendable, Equatable {
    public var id: String
    public var kind: String
    public var status: String
    public var config: GetOpenapiJsonResponse
    public var hasCredential: Bool
    public var lastError: String?
    public var lastSuccessAt: String?
    public var pausedUntil: String?
    public var createdAt: String
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case kind = "kind"
        case status = "status"
        case config = "config"
        case hasCredential = "hasCredential"
        case lastError = "lastError"
        case lastSuccessAt = "lastSuccessAt"
        case pausedUntil = "pausedUntil"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    public init(id: String, kind: String, status: String, config: GetOpenapiJsonResponse, hasCredential: Bool, lastError: String? = nil, lastSuccessAt: String? = nil, pausedUntil: String? = nil, createdAt: String, updatedAt: String) {
        self.id = id
        self.kind = kind
        self.status = status
        self.config = config
        self.hasCredential = hasCredential
        self.lastError = lastError
        self.lastSuccessAt = lastSuccessAt
        self.pausedUntil = pausedUntil
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

public struct IntegrationDelivery: Codable, Sendable, Equatable {
    public var id: String
    public var kind: String
    public var targetId: String
    public var eventId: String
    public var topic: String
    public var status: String
    public var attempts: Int
    public var nextAt: String
    public var lastError: String?
    public var sentAt: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case kind = "kind"
        case targetId = "targetId"
        case eventId = "eventId"
        case topic = "topic"
        case status = "status"
        case attempts = "attempts"
        case nextAt = "nextAt"
        case lastError = "lastError"
        case sentAt = "sentAt"
        case createdAt = "createdAt"
    }

    public init(id: String, kind: String, targetId: String, eventId: String, topic: String, status: String, attempts: Int, nextAt: String, lastError: String? = nil, sentAt: String? = nil, createdAt: String) {
        self.id = id
        self.kind = kind
        self.targetId = targetId
        self.eventId = eventId
        self.topic = topic
        self.status = status
        self.attempts = attempts
        self.nextAt = nextAt
        self.lastError = lastError
        self.sentAt = sentAt
        self.createdAt = createdAt
    }
}

public struct ZapierHook: Codable, Sendable, Equatable {
    public var id: String
    public var event: String
    public var targetUrl: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case event = "event"
        case targetUrl = "target_url"
        case createdAt = "createdAt"
    }

    public init(id: String, event: String, targetUrl: String, createdAt: String) {
        self.id = id
        self.event = event
        self.targetUrl = targetUrl
        self.createdAt = createdAt
    }
}

/// Recorded treatment referrals that got referee credit.
public struct RoiIncrementalTreatment: Codable, Sendable, Equatable {
    public var n: Int
    /// Integer minor units (cents).
    public var cashAfterPerReferralMinor: Int
    public var profitAfterPerReferralMinor: Int?

    enum CodingKeys: String, CodingKey {
        case n = "n"
        case cashAfterPerReferralMinor = "cashAfterPerReferralMinor"
        case profitAfterPerReferralMinor = "profitAfterPerReferralMinor"
    }

    public init(n: Int, cashAfterPerReferralMinor: Int, profitAfterPerReferralMinor: Int? = nil) {
        self.n = n
        self.cashAfterPerReferralMinor = cashAfterPerReferralMinor
        self.profitAfterPerReferralMinor = profitAfterPerReferralMinor
    }
}

/// Recorded control (holdout) referrals: no credit.
public struct RoiIncrementalControl: Codable, Sendable, Equatable {
    public var n: Int
    /// Integer minor units (cents).
    public var cashAfterPerReferralMinor: Int
    public var profitAfterPerReferralMinor: Int?

    enum CodingKeys: String, CodingKey {
        case n = "n"
        case cashAfterPerReferralMinor = "cashAfterPerReferralMinor"
        case profitAfterPerReferralMinor = "profitAfterPerReferralMinor"
    }

    public init(n: Int, cashAfterPerReferralMinor: Int, profitAfterPerReferralMinor: Int? = nil) {
        self.n = n
        self.cashAfterPerReferralMinor = cashAfterPerReferralMinor
        self.profitAfterPerReferralMinor = profitAfterPerReferralMinor
    }
}

/// Referrals in range left out of both groups, by reason.
public struct RoiIncrementalExcludedReferrals: Codable, Sendable, Equatable {
    public var unrecorded: Int
    public var treatmentWithoutCredit: Int
    public var controlWithCredit: Int

    enum CodingKeys: String, CodingKey {
        case unrecorded = "unrecorded"
        case treatmentWithoutCredit = "treatmentWithoutCredit"
        case controlWithCredit = "controlWithCredit"
    }

    public init(unrecorded: Int, treatmentWithoutCredit: Int, controlWithCredit: Int) {
        self.unrecorded = unrecorded
        self.treatmentWithoutCredit = treatmentWithoutCredit
        self.controlWithCredit = controlWithCredit
    }
}

public struct RoiIncrementalExcludedItem: Codable, Sendable, Equatable {
    public var eventId: String
    public var currency: String
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case eventId = "eventId"
        case currency = "currency"
        case reason = "reason"
    }

    public init(eventId: String, currency: String, reason: String) {
        self.eventId = eventId
        self.currency = currency
        self.reason = reason
    }
}

/// Present with model=incremental.
public struct RoiIncremental: Codable, Sendable, Equatable {
    public var currency: String
    public var windowDays: Int
    public var holdoutBps: Int
    /// Recorded treatment referrals that got referee credit.
    public var treatment: RoiIncrementalTreatment
    /// Recorded control (holdout) referrals: no credit.
    public var control: RoiIncrementalControl
    /// Treatment minus control cash after the first qualifying payment, per referral.
    public var liftMinorPerReferral: Int
    public var liftProfitMinorPerReferral: Int?
    /// Referee credit cost per treatment referral. Only credit: control referrals also earn no commission, and that withheld commission is not counted here.
    public var creditCostPerReferralMinor: Int
    /// Lift profit ÷ credit cost per referral; null when not eligible, no margin or no cost. The denominator is referee credit only: the commission withheld from control referrals is not in it, so the lift also reflects that commission difference.
    public var incrementalRoi: Double?
    public var eligible: Bool
    public var reason: String?
    /// Referrals from before groups were recorded: naive ROI only.
    public var unrecordedReferrals: Int
    /// Referrals in range left out of both groups, by reason.
    public var excludedReferrals: RoiIncrementalExcludedReferrals
    public var excluded: [RoiIncrementalExcludedItem]

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case windowDays = "windowDays"
        case holdoutBps = "holdoutBps"
        case treatment = "treatment"
        case control = "control"
        case liftMinorPerReferral = "liftMinorPerReferral"
        case liftProfitMinorPerReferral = "liftProfitMinorPerReferral"
        case creditCostPerReferralMinor = "creditCostPerReferralMinor"
        case incrementalRoi = "incrementalRoi"
        case eligible = "eligible"
        case reason = "reason"
        case unrecordedReferrals = "unrecordedReferrals"
        case excludedReferrals = "excludedReferrals"
        case excluded = "excluded"
    }

    public init(currency: String, windowDays: Int, holdoutBps: Int, treatment: RoiIncrementalTreatment, control: RoiIncrementalControl, liftMinorPerReferral: Int, liftProfitMinorPerReferral: Int? = nil, creditCostPerReferralMinor: Int, incrementalRoi: Double? = nil, eligible: Bool, reason: String? = nil, unrecordedReferrals: Int, excludedReferrals: RoiIncrementalExcludedReferrals, excluded: [RoiIncrementalExcludedItem]) {
        self.currency = currency
        self.windowDays = windowDays
        self.holdoutBps = holdoutBps
        self.treatment = treatment
        self.control = control
        self.liftMinorPerReferral = liftMinorPerReferral
        self.liftProfitMinorPerReferral = liftProfitMinorPerReferral
        self.creditCostPerReferralMinor = creditCostPerReferralMinor
        self.incrementalRoi = incrementalRoi
        self.eligible = eligible
        self.reason = reason
        self.unrecordedReferrals = unrecordedReferrals
        self.excludedReferrals = excludedReferrals
        self.excluded = excluded
    }
}

public struct RoiProjectionCohortsItem: Codable, Sendable, Equatable {
    public var programId: String?
    public var role: String
    public var eligible: Bool
    public var reason: String?
    public var closedGrants: Int
    public var openGrants: Int
    /// First day the cohort's median profit/cost ratio reaches 1.0; null when it doesn't within the window.
    public var medianCrossingDay: Int?
    /// Last day with at least 50 closed grants observed that far: the curve stops there.
    public var curveThroughDay: Int?
    public var noCrossingReason: String?
    /// Open grants past the crossing day without paying back.
    public var behindCohort: Int?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case role = "role"
        case eligible = "eligible"
        case reason = "reason"
        case closedGrants = "closedGrants"
        case openGrants = "openGrants"
        case medianCrossingDay = "medianCrossingDay"
        case curveThroughDay = "curveThroughDay"
        case noCrossingReason = "noCrossingReason"
        case behindCohort = "behindCohort"
    }

    public init(programId: String? = nil, role: String, eligible: Bool, reason: String? = nil, closedGrants: Int, openGrants: Int, medianCrossingDay: Int? = nil, curveThroughDay: Int? = nil, noCrossingReason: String? = nil, behindCohort: Int? = nil) {
        self.programId = programId
        self.role = role
        self.eligible = eligible
        self.reason = reason
        self.closedGrants = closedGrants
        self.openGrants = openGrants
        self.medianCrossingDay = medianCrossingDay
        self.curveThroughDay = curveThroughDay
        self.noCrossingReason = noCrossingReason
        self.behindCohort = behindCohort
    }
}

/// Present with includeProjection=true.
public struct RoiProjection: Codable, Sendable, Equatable {
    /// Always "projection": expected figures, never actuals.
    public var label: String
    public var eligible: Bool
    public var reason: String?
    public var closedGrants: Int
    public var openGrants: Int
    /// Open grants in cohorts with at least 50 closed grants.
    public var projectedGrants: Int
    /// Share of projected open grants expected to pay back (already paid back included).
    public var expectedPaidBackShareBps: Int?
    public var medianExpectedPaybackDays: Int?
    public var cohorts: [RoiProjectionCohortsItem]

    enum CodingKeys: String, CodingKey {
        case label = "label"
        case eligible = "eligible"
        case reason = "reason"
        case closedGrants = "closedGrants"
        case openGrants = "openGrants"
        case projectedGrants = "projectedGrants"
        case expectedPaidBackShareBps = "expectedPaidBackShareBps"
        case medianExpectedPaybackDays = "medianExpectedPaybackDays"
        case cohorts = "cohorts"
    }

    public init(label: String, eligible: Bool, reason: String? = nil, closedGrants: Int, openGrants: Int, projectedGrants: Int, expectedPaidBackShareBps: Int? = nil, medianExpectedPaybackDays: Int? = nil, cohorts: [RoiProjectionCohortsItem]) {
        self.label = label
        self.eligible = eligible
        self.reason = reason
        self.closedGrants = closedGrants
        self.openGrants = openGrants
        self.projectedGrants = projectedGrants
        self.expectedPaidBackShareBps = expectedPaidBackShareBps
        self.medianExpectedPaybackDays = medianExpectedPaybackDays
        self.cohorts = cohorts
    }
}

public struct RoiSummaryCoverage: Codable, Sendable, Equatable {
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var creditAppliedReportedBps: Int?
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var marginCoveredBps: Int?
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var inferredShareBps: Int?

    enum CodingKeys: String, CodingKey {
        case creditAppliedReportedBps = "creditAppliedReportedBps"
        case marginCoveredBps = "marginCoveredBps"
        case inferredShareBps = "inferredShareBps"
    }

    public init(creditAppliedReportedBps: Int? = nil, marginCoveredBps: Int? = nil, inferredShareBps: Int? = nil) {
        self.creditAppliedReportedBps = creditAppliedReportedBps
        self.marginCoveredBps = marginCoveredBps
        self.inferredShareBps = inferredShareBps
    }
}

public struct RoiSummaryTargetOption1: Codable, Sendable, Equatable {
    public var targetRoiBps: Int
    public var status: String

    enum CodingKeys: String, CodingKey {
        case targetRoiBps = "targetRoiBps"
        case status = "status"
    }

    public init(targetRoiBps: Int, status: String) {
        self.targetRoiBps = targetRoiBps
        self.status = status
    }
}

public struct RoiSummary: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var creditCostMinor: Int
    /// Integer minor units (cents).
    public var cashAfterMinor: Int
    public var profitAfterMinor: Int?
    public var netMinor: Int?
    /// Profit after ÷ cost, 4 decimals; null with no cost or unknown profit.
    public var roi: Double?
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var paidBackShareBps: Int?
    public var medianPaybackDays: Double?
    public var grants: Int
    public var profitSources: [String: Int]
    public var coverage: RoiSummaryCoverage
    /// Face not yet used, expired or revoked, in the reporting currency.
    public var outstandingCreditMinor: Int
    /// Outstanding credit priced by each grant's cost model; null when a model needs a margin and none is known.
    public var outstandingCostIfUsedMinor: Int?
    /// Native currencies of the grants in scope (ignoring the currency filter), most grants first.
    public var currencies: [String]
    public var incremental: RoiIncremental?
    public var projection: RoiProjection?
    /// With programId: status against the program's targetRoiBps (unknown when ROI is null); null when it sets no target.
    public var target: RoiSummaryTargetOption1?

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case creditCostMinor = "creditCostMinor"
        case cashAfterMinor = "cashAfterMinor"
        case profitAfterMinor = "profitAfterMinor"
        case netMinor = "netMinor"
        case roi = "roi"
        case paidBackShareBps = "paidBackShareBps"
        case medianPaybackDays = "medianPaybackDays"
        case grants = "grants"
        case profitSources = "profitSources"
        case coverage = "coverage"
        case outstandingCreditMinor = "outstandingCreditMinor"
        case outstandingCostIfUsedMinor = "outstandingCostIfUsedMinor"
        case currencies = "currencies"
        case incremental = "incremental"
        case projection = "projection"
        case target = "target"
    }

    public init(currency: String, creditCostMinor: Int, cashAfterMinor: Int, profitAfterMinor: Int? = nil, netMinor: Int? = nil, roi: Double? = nil, paidBackShareBps: Int? = nil, medianPaybackDays: Double? = nil, grants: Int, profitSources: [String: Int], coverage: RoiSummaryCoverage, outstandingCreditMinor: Int, outstandingCostIfUsedMinor: Int? = nil, currencies: [String], incremental: RoiIncremental? = nil, projection: RoiProjection? = nil, target: RoiSummaryTargetOption1? = nil) {
        self.currency = currency
        self.creditCostMinor = creditCostMinor
        self.cashAfterMinor = cashAfterMinor
        self.profitAfterMinor = profitAfterMinor
        self.netMinor = netMinor
        self.roi = roi
        self.paidBackShareBps = paidBackShareBps
        self.medianPaybackDays = medianPaybackDays
        self.grants = grants
        self.profitSources = profitSources
        self.coverage = coverage
        self.outstandingCreditMinor = outstandingCreditMinor
        self.outstandingCostIfUsedMinor = outstandingCostIfUsedMinor
        self.currencies = currencies
        self.incremental = incremental
        self.projection = projection
        self.target = target
    }
}

public struct RoiGrantMetricsExcludedItem: Codable, Sendable, Equatable {
    public var eventId: String
    public var currency: String
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case eventId = "eventId"
        case currency = "currency"
        case reason = "reason"
    }

    public init(eventId: String, currency: String, reason: String) {
        self.eventId = eventId
        self.currency = currency
        self.reason = reason
    }
}

public struct RoiGrantMetrics: Codable, Sendable, Equatable {
    public var grantId: String
    public var role: String
    public var currency: String
    /// Integer minor units (cents).
    public var faceMinor: Int
    /// Integer minor units (cents).
    public var usedMinor: Int
    /// Integer minor units (cents).
    public var costMinor: Int
    /// Integer minor units (cents).
    public var cashAfterMinor: Int
    public var profitAfterMinor: Int?
    public var netMinor: Int?
    /// Profit after ÷ cost, 4 decimals; null with no cost or unknown profit.
    public var roi: Double?
    public var paidBack: Bool?
    public var paybackDays: Int?
    public var profitSource: String
    public var inferredShareBps: Int
    public var windowDays: Int
    public var excluded: [RoiGrantMetricsExcludedItem]

    enum CodingKeys: String, CodingKey {
        case grantId = "grantId"
        case role = "role"
        case currency = "currency"
        case faceMinor = "faceMinor"
        case usedMinor = "usedMinor"
        case costMinor = "costMinor"
        case cashAfterMinor = "cashAfterMinor"
        case profitAfterMinor = "profitAfterMinor"
        case netMinor = "netMinor"
        case roi = "roi"
        case paidBack = "paidBack"
        case paybackDays = "paybackDays"
        case profitSource = "profitSource"
        case inferredShareBps = "inferredShareBps"
        case windowDays = "windowDays"
        case excluded = "excluded"
    }

    public init(grantId: String, role: String, currency: String, faceMinor: Int, usedMinor: Int, costMinor: Int, cashAfterMinor: Int, profitAfterMinor: Int? = nil, netMinor: Int? = nil, roi: Double? = nil, paidBack: Bool? = nil, paybackDays: Int? = nil, profitSource: String, inferredShareBps: Int, windowDays: Int, excluded: [RoiGrantMetricsExcludedItem]) {
        self.grantId = grantId
        self.role = role
        self.currency = currency
        self.faceMinor = faceMinor
        self.usedMinor = usedMinor
        self.costMinor = costMinor
        self.cashAfterMinor = cashAfterMinor
        self.profitAfterMinor = profitAfterMinor
        self.netMinor = netMinor
        self.roi = roi
        self.paidBack = paidBack
        self.paybackDays = paybackDays
        self.profitSource = profitSource
        self.inferredShareBps = inferredShareBps
        self.windowDays = windowDays
        self.excluded = excluded
    }
}

public struct RoiGrant: Codable, Sendable, Equatable {
    public var id: String
    public var source: String
    public var role: String
    public var status: String
    public var customerRef: String?
    public var partnerId: String?
    public var referralId: String?
    public var programId: String?
    public var grantCurrency: String
    public var grantedAt: String
    public var expiresAt: String?
    public var currency: String
    /// Integer minor units (cents).
    public var faceMinor: Int
    /// Integer minor units (cents).
    public var usedMinor: Int
    /// Integer minor units (cents).
    public var costMinor: Int
    /// Integer minor units (cents).
    public var cashAfterMinor: Int
    public var profitAfterMinor: Int?
    public var netMinor: Int?
    /// Profit after ÷ cost, 4 decimals; null with no cost or unknown profit.
    public var roi: Double?
    public var paidBack: Bool?
    public var paybackDays: Int?
    public var profitSource: String
    public var inferredShareBps: Int
    public var windowDays: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case source = "source"
        case role = "role"
        case status = "status"
        case customerRef = "customerRef"
        case partnerId = "partnerId"
        case referralId = "referralId"
        case programId = "programId"
        case grantCurrency = "grantCurrency"
        case grantedAt = "grantedAt"
        case expiresAt = "expiresAt"
        case currency = "currency"
        case faceMinor = "faceMinor"
        case usedMinor = "usedMinor"
        case costMinor = "costMinor"
        case cashAfterMinor = "cashAfterMinor"
        case profitAfterMinor = "profitAfterMinor"
        case netMinor = "netMinor"
        case roi = "roi"
        case paidBack = "paidBack"
        case paybackDays = "paybackDays"
        case profitSource = "profitSource"
        case inferredShareBps = "inferredShareBps"
        case windowDays = "windowDays"
    }

    public init(id: String, source: String, role: String, status: String, customerRef: String? = nil, partnerId: String? = nil, referralId: String? = nil, programId: String? = nil, grantCurrency: String, grantedAt: String, expiresAt: String? = nil, currency: String, faceMinor: Int, usedMinor: Int, costMinor: Int, cashAfterMinor: Int, profitAfterMinor: Int? = nil, netMinor: Int? = nil, roi: Double? = nil, paidBack: Bool? = nil, paybackDays: Int? = nil, profitSource: String, inferredShareBps: Int, windowDays: Int) {
        self.id = id
        self.source = source
        self.role = role
        self.status = status
        self.customerRef = customerRef
        self.partnerId = partnerId
        self.referralId = referralId
        self.programId = programId
        self.grantCurrency = grantCurrency
        self.grantedAt = grantedAt
        self.expiresAt = expiresAt
        self.currency = currency
        self.faceMinor = faceMinor
        self.usedMinor = usedMinor
        self.costMinor = costMinor
        self.cashAfterMinor = cashAfterMinor
        self.profitAfterMinor = profitAfterMinor
        self.netMinor = netMinor
        self.roi = roi
        self.paidBack = paidBack
        self.paybackDays = paybackDays
        self.profitSource = profitSource
        self.inferredShareBps = inferredShareBps
        self.windowDays = windowDays
    }
}

public struct RoiPatternEntrySubject: Codable, Sendable, Equatable {
    public var customerRef: String?
    public var partnerId: String?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case partnerId = "partnerId"
    }

    public init(customerRef: String? = nil, partnerId: String? = nil) {
        self.customerRef = customerRef
        self.partnerId = partnerId
    }
}

public struct RoiPatternEntry: Codable, Sendable, Equatable {
    public var subject: RoiPatternEntrySubject
    public var programId: String?
    /// The key numbers behind the match; the keys depend on the pattern.
    public var detail: [String: JSONValue]

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case programId = "programId"
        case detail = "detail"
    }

    public init(subject: RoiPatternEntrySubject, programId: String? = nil, detail: [String: JSONValue]) {
        self.subject = subject
        self.programId = programId
        self.detail = detail
    }
}

public struct RoiTraceSubject: Codable, Sendable, Equatable {
    public var type: String
    public var id: String
    public var customerRefs: [String]
    public var partnerId: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case customerRefs = "customerRefs"
        case partnerId = "partnerId"
    }

    public init(type: String, id: String, customerRefs: [String], partnerId: String? = nil) {
        self.type = type
        self.id = id
        self.customerRefs = customerRefs
        self.partnerId = partnerId
    }
}

public struct RoiTraceEventsItem: Codable, Sendable, Equatable {
    public var id: String
    public var kind: String
    public var occurredAt: String
    /// currency plus the minor-unit amounts this kind carries.
    public var amounts: [String: JSONValue?]
    public var confidence: String
    public var source: String
    public var superseded: Bool
    public var links: [String: String?]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case kind = "kind"
        case occurredAt = "occurredAt"
        case amounts = "amounts"
        case confidence = "confidence"
        case source = "source"
        case superseded = "superseded"
        case links = "links"
    }

    public init(id: String, kind: String, occurredAt: String, amounts: [String: JSONValue?], confidence: String, source: String, superseded: Bool, links: [String: String?]) {
        self.id = id
        self.kind = kind
        self.occurredAt = occurredAt
        self.amounts = amounts
        self.confidence = confidence
        self.source = source
        self.superseded = superseded
        self.links = links
    }
}

public struct RoiTraceRunningNetItem: Codable, Sendable, Equatable {
    public var at: String
    public var netMinor: Int?

    enum CodingKeys: String, CodingKey {
        case at = "at"
        case netMinor = "netMinor"
    }

    public init(at: String, netMinor: Int? = nil) {
        self.at = at
        self.netMinor = netMinor
    }
}

public struct RoiTraceExcludedItem: Codable, Sendable, Equatable {
    public var eventId: String
    public var currency: String
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case eventId = "eventId"
        case currency = "currency"
        case reason = "reason"
    }

    public init(eventId: String, currency: String, reason: String) {
        self.eventId = eventId
        self.currency = currency
        self.reason = reason
    }
}

public struct RoiTrace: Codable, Sendable, Equatable {
    public var subject: RoiTraceSubject
    public var events: [RoiTraceEventsItem]
    public var grants: [RoiGrantMetrics]
    /// One point per event: cumulative credit net (profit after − credit cost) in the reporting currency. Commissions are not in it.
    public var runningNet: [RoiTraceRunningNetItem]
    /// Rows left out of runningNet: no fx rate into the reporting currency on their date.
    public var excluded: [RoiTraceExcludedItem]

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case events = "events"
        case grants = "grants"
        case runningNet = "runningNet"
        case excluded = "excluded"
    }

    public init(subject: RoiTraceSubject, events: [RoiTraceEventsItem], grants: [RoiGrantMetrics], runningNet: [RoiTraceRunningNetItem], excluded: [RoiTraceExcludedItem]) {
        self.subject = subject
        self.events = events
        self.grants = grants
        self.runningNet = runningNet
        self.excluded = excluded
    }
}

public struct AuditLogEntry: Codable, Sendable, Equatable {
    public var id: String
    public var actorType: String
    public var actorId: String
    public var action: String
    public var subjectType: String
    public var subjectId: String
    public var data: GetOpenapiJsonResponse
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case actorType = "actorType"
        case actorId = "actorId"
        case action = "action"
        case subjectType = "subjectType"
        case subjectId = "subjectId"
        case data = "data"
        case createdAt = "createdAt"
    }

    public init(id: String, actorType: String, actorId: String, action: String, subjectType: String, subjectId: String, data: GetOpenapiJsonResponse, createdAt: String) {
        self.id = id
        self.actorType = actorType
        self.actorId = actorId
        self.action = action
        self.subjectType = subjectType
        self.subjectId = subjectId
        self.data = data
        self.createdAt = createdAt
    }
}

public struct EmailTemplateEventLocalesItemDefault: Codable, Sendable, Equatable {
    public var subject: String
    public var body: String
    public var cta: String

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case body = "body"
        case cta = "cta"
    }

    public init(subject: String, body: String, cta: String) {
        self.subject = subject
        self.body = body
        self.cta = cta
    }
}

public struct EmailTemplateEventLocalesItemOverrideOption1: Codable, Sendable, Equatable {
    public var subject: String
    public var text: String
    public var html: String?
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case text = "text"
        case html = "html"
        case updatedAt = "updatedAt"
    }

    public init(subject: String, text: String, html: String? = nil, updatedAt: String) {
        self.subject = subject
        self.text = text
        self.html = html
        self.updatedAt = updatedAt
    }
}

public struct EmailTemplateEventLocalesItem: Codable, Sendable, Equatable {
    public var locale: String
    public var `default`: EmailTemplateEventLocalesItemDefault
    public var override: EmailTemplateEventLocalesItemOverrideOption1?

    enum CodingKeys: String, CodingKey {
        case locale = "locale"
        case `default` = "default"
        case override = "override"
    }

    public init(locale: String, `default`: EmailTemplateEventLocalesItemDefault, override: EmailTemplateEventLocalesItemOverrideOption1? = nil) {
        self.locale = locale
        self.`default` = `default`
        self.override = override
    }
}

public struct EmailTemplateEvent: Codable, Sendable, Equatable {
    public var event: String
    public var audience: String
    public var placeholders: [String]
    public var locales: [EmailTemplateEventLocalesItem]

    enum CodingKeys: String, CodingKey {
        case event = "event"
        case audience = "audience"
        case placeholders = "placeholders"
        case locales = "locales"
    }

    public init(event: String, audience: String, placeholders: [String], locales: [EmailTemplateEventLocalesItem]) {
        self.event = event
        self.audience = audience
        self.placeholders = placeholders
        self.locales = locales
    }
}

public struct ErrorError: Codable, Sendable, Equatable {
    public var code: String
    public var message: String
    public var details: JSONValue?
    public var requestId: String?
    /// The docs entry for this error code: what it means and how to fix it.
    public var docsUrl: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
        case details = "details"
        case requestId = "requestId"
        case docsUrl = "docs_url"
    }

    public init(code: String, message: String, details: JSONValue? = nil, requestId: String? = nil, docsUrl: String) {
        self.code = code
        self.message = message
        self.details = details
        self.requestId = requestId
        self.docsUrl = docsUrl
    }
}

public struct ErrorModel: Codable, Sendable, Equatable {
    public var error: ErrorError

    enum CodingKeys: String, CodingKey {
        case error = "error"
    }

    public init(error: ErrorError) {
        self.error = error
    }
}

/// `data` of a `click.recorded` event: Fires for every click (tracked link redirects, `?via=` landings, server-side clicks). High volume: subscribe only if you need click-level data.
public struct ClickRecordedEventData: Codable, Sendable, Equatable {
    public var clickId: String
    public var programId: String
    public var partnerId: String
    public var linkId: String?

    enum CodingKeys: String, CodingKey {
        case clickId = "clickId"
        case programId = "programId"
        case partnerId = "partnerId"
        case linkId = "linkId"
    }

    public init(clickId: String, programId: String, partnerId: String, linkId: String? = nil) {
        self.clickId = clickId
        self.programId = programId
        self.partnerId = partnerId
        self.linkId = linkId
    }
}

/// A tracked click was recorded: the `click.recorded` delivery body.
public struct ClickRecordedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ClickRecordedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ClickRecordedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.created` event: A new referral: from `POST /v1/referrals/associate`, an auth-platform sign-up, a mobile install, a won deal or an agent attribution.
public struct ReferralCreatedEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String
    public var matchedVia: String

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
        case matchedVia = "matchedVia"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String, matchedVia: String) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
        self.matchedVia = matchedVia
    }
}

/// A customer was attributed to a partner: the `referral.created` delivery body.
public struct ReferralCreatedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralCreatedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralCreatedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.held` event: A risk or self-referral check put the referral in `pending_review`; `reasons` says why and `caseId` is the fraud case opened for it.
public struct ReferralHeldEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String
    public var reasons: [String]
    public var caseId: String

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
        case reasons = "reasons"
        case caseId = "caseId"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String, reasons: [String], caseId: String) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
        self.reasons = reasons
        self.caseId = caseId
    }
}

/// A referral was held for review: the `referral.held` delivery body.
public struct ReferralHeldEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralHeldEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralHeldEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.approved` event: Back to `active`: approved by the merchant, a fraud case dismissed (`reason: "fraud_case_dismissed"`, with `caseId`), or a hold released by email verification (`reason: "email_verified"`).
public struct ReferralApprovedEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String
    public var reason: String?
    public var caseId: String?

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
        case reason = "reason"
        case caseId = "caseId"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String, reason: String? = nil, caseId: String? = nil) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
        self.reason = reason
        self.caseId = caseId
    }
}

/// A held referral was approved: the `referral.approved` delivery body.
public struct ReferralApprovedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralApprovedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralApprovedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.voided` event: It earns nothing more: voided by the merchant, a fraud case (`reason` `fraud_case_voided` or `partner_banned`, with `caseId`) or an identity provider (`fraud_confirmed`).
public struct ReferralVoidedEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String
    public var reason: String?
    public var caseId: String?

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
        case reason = "reason"
        case caseId = "caseId"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String, reason: String? = nil, caseId: String? = nil) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
        self.reason = reason
        self.caseId = caseId
    }
}

/// A referral was voided: the `referral.voided` delivery body.
public struct ReferralVoidedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralVoidedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralVoidedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.paused` event: The merchant paused the referral: it earns no new commissions until resumed.
public struct ReferralPausedEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
    }
}

/// A referral was paused: the `referral.paused` delivery body.
public struct ReferralPausedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralPausedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralPausedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.resumed` event: The referral is `active` again.
public struct ReferralResumedEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
    }
}

/// A paused referral was resumed: the `referral.resumed` delivery body.
public struct ReferralResumedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralResumedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralResumedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.reassigned` event: The merchant reassigned the referral; the payload names the new partner, with the previous one in `previousPartnerId` and `previousPartnerExternalRef`.
public struct ReferralReassignedEventData: Codable, Sendable, Equatable {
    public var referralId: String
    public var programId: String
    public var partnerId: String
    /// The partner's id in your own system (its externalRef), or null.
    public var partnerExternalRef: String?
    /// Your id for the referred customer.
    public var customerRef: String
    public var status: String
    public var previousPartnerId: String
    public var previousPartnerExternalRef: String?

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case customerRef = "customerRef"
        case status = "status"
        case previousPartnerId = "previousPartnerId"
        case previousPartnerExternalRef = "previousPartnerExternalRef"
    }

    public init(referralId: String, programId: String, partnerId: String, partnerExternalRef: String? = nil, customerRef: String, status: String, previousPartnerId: String, previousPartnerExternalRef: String? = nil) {
        self.referralId = referralId
        self.programId = programId
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.customerRef = customerRef
        self.status = status
        self.previousPartnerId = previousPartnerId
        self.previousPartnerExternalRef = previousPartnerExternalRef
    }
}

/// A referral moved to another partner: the `referral.reassigned` delivery body.
public struct ReferralReassignedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralReassignedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralReassignedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referral.rejected` event: A self-referral the program's `selfReferralPolicy: "reject"` refused, so no referral exists. A `fraud.case_opened` follows.
public struct ReferralRejectedEventData: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var customerRef: String
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case customerRef = "customerRef"
        case reason = "reason"
    }

    public init(programId: String, partnerId: String, customerRef: String, reason: String) {
        self.programId = programId
        self.partnerId = partnerId
        self.customerRef = customerRef
        self.reason = reason
    }
}

/// A self-referral was refused: the `referral.rejected` delivery body.
public struct ReferralRejectedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: ReferralRejectedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: ReferralRejectedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `customer.aliased` event: The app changed a user's id after their sign-up was filed (through an auth connection); their referrals now use `toCustomerRef`.
public struct CustomerAliasedEventData: Codable, Sendable, Equatable {
    public var fromCustomerRef: String
    public var toCustomerRef: String
    public var referralIds: [String]
    public var partnerId: String?

    enum CodingKeys: String, CodingKey {
        case fromCustomerRef = "fromCustomerRef"
        case toCustomerRef = "toCustomerRef"
        case referralIds = "referralIds"
        case partnerId = "partnerId"
    }

    public init(fromCustomerRef: String, toCustomerRef: String, referralIds: [String], partnerId: String? = nil) {
        self.fromCustomerRef = fromCustomerRef
        self.toCustomerRef = toCustomerRef
        self.referralIds = referralIds
        self.partnerId = partnerId
    }
}

/// A customer's id changed: the `customer.aliased` delivery body.
public struct CustomerAliasedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: CustomerAliasedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: CustomerAliasedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `commission.earned` event: A payment (or a signup, trial or product-event bounty) earned a partner a commission line. Payment fields are null for bounties.
public struct CommissionEarnedEventData: Codable, Sendable, Equatable {
    public var commissionId: String
    public var partnerId: String
    public var programId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String
    public var referralId: String?
    public var customerRef: String?
    public var billingEventId: String?
    /// The billing provider's own event id.
    public var providerEventId: String?
    public var invoiceRef: String?
    /// Your own id for the customer when known (an auth-connection user id), or null.
    public var customerExternalRef: String?
    public var partnerExternalRef: String?
    /// 0 for the direct partner, 1 to 5 for sub-affiliate levels.
    public var level: Int
    public var memo: String
    public var basisMinor: Int?

    enum CodingKeys: String, CodingKey {
        case commissionId = "commissionId"
        case partnerId = "partnerId"
        case programId = "programId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case referralId = "referralId"
        case customerRef = "customerRef"
        case billingEventId = "billingEventId"
        case providerEventId = "providerEventId"
        case invoiceRef = "invoiceRef"
        case customerExternalRef = "customerExternalRef"
        case partnerExternalRef = "partnerExternalRef"
        case level = "level"
        case memo = "memo"
        case basisMinor = "basisMinor"
    }

    public init(commissionId: String, partnerId: String, programId: String, amountMinor: Int, currency: String, referralId: String? = nil, customerRef: String? = nil, billingEventId: String? = nil, providerEventId: String? = nil, invoiceRef: String? = nil, customerExternalRef: String? = nil, partnerExternalRef: String? = nil, level: Int, memo: String, basisMinor: Int? = nil) {
        self.commissionId = commissionId
        self.partnerId = partnerId
        self.programId = programId
        self.amountMinor = amountMinor
        self.currency = currency
        self.referralId = referralId
        self.customerRef = customerRef
        self.billingEventId = billingEventId
        self.providerEventId = providerEventId
        self.invoiceRef = invoiceRef
        self.customerExternalRef = customerExternalRef
        self.partnerExternalRef = partnerExternalRef
        self.level = level
        self.memo = memo
        self.basisMinor = basisMinor
    }
}

/// A commission line was earned: the `commission.earned` delivery body.
public struct CommissionEarnedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: CommissionEarnedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: CommissionEarnedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `commission.reversed` event: A refund or dispute clawed back an earned line. `commissionId` and `relatedCommissionId` are the original line, `reversalId` the new `reversed` event; `amountMinor` is negative.
public struct CommissionReversedEventData: Codable, Sendable, Equatable {
    public var commissionId: String
    public var relatedCommissionId: String
    public var reversalId: String
    public var partnerId: String
    public var programId: String
    /// Negative: the amount taken back.
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String
    public var referralId: String?
    public var customerRef: String?
    public var billingEventId: String?
    /// The billing provider's own event id.
    public var providerEventId: String?
    public var invoiceRef: String?
    /// Your own id for the customer when known (an auth-connection user id), or null.
    public var customerExternalRef: String?
    public var partnerExternalRef: String?
    /// 0 for the direct partner, 1 to 5 for sub-affiliate levels.
    public var level: Int
    public var memo: String

    enum CodingKeys: String, CodingKey {
        case commissionId = "commissionId"
        case relatedCommissionId = "relatedCommissionId"
        case reversalId = "reversalId"
        case partnerId = "partnerId"
        case programId = "programId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case referralId = "referralId"
        case customerRef = "customerRef"
        case billingEventId = "billingEventId"
        case providerEventId = "providerEventId"
        case invoiceRef = "invoiceRef"
        case customerExternalRef = "customerExternalRef"
        case partnerExternalRef = "partnerExternalRef"
        case level = "level"
        case memo = "memo"
    }

    public init(commissionId: String, relatedCommissionId: String, reversalId: String, partnerId: String, programId: String, amountMinor: Int, currency: String, referralId: String? = nil, customerRef: String? = nil, billingEventId: String? = nil, providerEventId: String? = nil, invoiceRef: String? = nil, customerExternalRef: String? = nil, partnerExternalRef: String? = nil, level: Int, memo: String) {
        self.commissionId = commissionId
        self.relatedCommissionId = relatedCommissionId
        self.reversalId = reversalId
        self.partnerId = partnerId
        self.programId = programId
        self.amountMinor = amountMinor
        self.currency = currency
        self.referralId = referralId
        self.customerRef = customerRef
        self.billingEventId = billingEventId
        self.providerEventId = providerEventId
        self.invoiceRef = invoiceRef
        self.customerExternalRef = customerExternalRef
        self.partnerExternalRef = partnerExternalRef
        self.level = level
        self.memo = memo
    }
}

/// A commission line was reversed: the `commission.reversed` delivery body.
public struct CommissionReversedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: CommissionReversedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: CommissionReversedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `commission.settled` event: The merchant paid the line itself (`store_credit`, or `merchant_credit` for programs that settle as they earn), outside payout runs.
public struct CommissionSettledEventData: Codable, Sendable, Equatable {
    public var commissionId: String
    public var partnerId: String
    public var programId: String
    public var referralId: String?
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String
    public var method: String
    public var reference: String

    enum CodingKeys: String, CodingKey {
        case commissionId = "commissionId"
        case partnerId = "partnerId"
        case programId = "programId"
        case referralId = "referralId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case method = "method"
        case reference = "reference"
    }

    public init(commissionId: String, partnerId: String, programId: String, referralId: String? = nil, amountMinor: Int, currency: String, method: String, reference: String) {
        self.commissionId = commissionId
        self.partnerId = partnerId
        self.programId = programId
        self.referralId = referralId
        self.amountMinor = amountMinor
        self.currency = currency
        self.method = method
        self.reference = reference
    }
}

/// A commission line was settled by the merchant: the `commission.settled` delivery body.
public struct CommissionSettledEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: CommissionSettledEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: CommissionSettledEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `partner.applied` event: An application waiting for approval. `enrollmentId` is absent for applications from the public program page.
public struct PartnerAppliedEventData: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var enrollmentId: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case enrollmentId = "enrollmentId"
    }

    public init(programId: String, partnerId: String, enrollmentId: String? = nil) {
        self.programId = programId
        self.partnerId = partnerId
        self.enrollmentId = enrollmentId
    }
}

/// A partner applied to a program: the `partner.applied` delivery body.
public struct PartnerAppliedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PartnerAppliedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PartnerAppliedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `partner.enrolled` event: The merchant (or an import) enrolled the partner in a program, approved at once.
public struct PartnerEnrolledEventData: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var enrollmentId: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case enrollmentId = "enrollmentId"
    }

    public init(programId: String, partnerId: String, enrollmentId: String) {
        self.programId = programId
        self.partnerId = partnerId
        self.enrollmentId = enrollmentId
    }
}

/// A partner was enrolled: the `partner.enrolled` delivery body.
public struct PartnerEnrolledEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PartnerEnrolledEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PartnerEnrolledEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `partner.approved` event: An application was approved, or a partner joined a program that approves at once. `enrollmentId` is present when approved from an application.
public struct PartnerApprovedEventData: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var enrollmentId: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case enrollmentId = "enrollmentId"
    }

    public init(programId: String, partnerId: String, enrollmentId: String? = nil) {
        self.programId = programId
        self.partnerId = partnerId
        self.enrollmentId = enrollmentId
    }
}

/// A partner was approved: the `partner.approved` delivery body.
public struct PartnerApprovedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PartnerApprovedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PartnerApprovedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `partner.level_up` event: Partner leveling promoted the partner; `referrals` is the count that qualified them.
public struct PartnerLevelUpEventData: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var level: String
    public var referrals: Int

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case level = "level"
        case referrals = "referrals"
    }

    public init(programId: String, partnerId: String, level: String, referrals: Int) {
        self.programId = programId
        self.partnerId = partnerId
        self.level = level
        self.referrals = referrals
    }
}

/// A partner reached a new level: the `partner.level_up` delivery body.
public struct PartnerLevelUpEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PartnerLevelUpEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PartnerLevelUpEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `payout.scheduled` event: A payout run included the partner; nothing has been paid yet.
public struct PayoutScheduledEventData: Codable, Sendable, Equatable {
    public var payoutId: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case payoutId = "payoutId"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(payoutId: String, partnerId: String, amountMinor: Int, currency: String) {
        self.payoutId = payoutId
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

/// A payout was created in a run: the `payout.scheduled` delivery body.
public struct PayoutScheduledEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PayoutScheduledEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PayoutScheduledEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `payout.submitted` event: The payout provider accepted the payout and settles it asynchronously; `payout.sent` or `payout.failed` follows.
public struct PayoutSubmittedEventData: Codable, Sendable, Equatable {
    public var payoutId: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case payoutId = "payoutId"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(payoutId: String, partnerId: String, amountMinor: Int, currency: String) {
        self.payoutId = payoutId
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

/// A payout was submitted to the provider: the `payout.submitted` delivery body.
public struct PayoutSubmittedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PayoutSubmittedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PayoutSubmittedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `payout.sent` event: The money left: the provider confirmed the payout (at once, or later through its settlement webhook).
public struct PayoutSentEventData: Codable, Sendable, Equatable {
    public var payoutId: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case payoutId = "payoutId"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(payoutId: String, partnerId: String, amountMinor: Int, currency: String) {
        self.payoutId = payoutId
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

/// A payout was paid: the `payout.sent` delivery body.
public struct PayoutSentEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PayoutSentEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PayoutSentEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `payout.failed` event: The provider refused or failed the payout; `reason` is its message. The lines go back to the partner's approved balance.
public struct PayoutFailedEventData: Codable, Sendable, Equatable {
    public var payoutId: String
    public var partnerId: String
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case payoutId = "payoutId"
        case partnerId = "partnerId"
        case reason = "reason"
    }

    public init(payoutId: String, partnerId: String, reason: String) {
        self.payoutId = payoutId
        self.partnerId = partnerId
        self.reason = reason
    }
}

/// A payout failed: the `payout.failed` delivery body.
public struct PayoutFailedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PayoutFailedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PayoutFailedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `payout.cancelled` event: One per payout when an unexecuted payout run is cancelled.
public struct PayoutCancelledEventData: Codable, Sendable, Equatable {
    public var payoutId: String
    public var partnerId: String

    enum CodingKeys: String, CodingKey {
        case payoutId = "payoutId"
        case partnerId = "partnerId"
    }

    public init(payoutId: String, partnerId: String) {
        self.payoutId = payoutId
        self.partnerId = partnerId
    }
}

/// A payout was cancelled: the `payout.cancelled` delivery body.
public struct PayoutCancelledEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PayoutCancelledEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PayoutCancelledEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `tax.form_delivered` event: A filed 1099-NEC was accepted and delivered; `emailed` says whether the filing provider also emailed it.
public struct TaxFormDeliveredEventData: Codable, Sendable, Equatable {
    public var documentId: String
    public var partnerId: String
    public var taxYear: Int
    public var form: String
    public var corrected: Bool
    public var emailed: Bool

    enum CodingKeys: String, CodingKey {
        case documentId = "documentId"
        case partnerId = "partnerId"
        case taxYear = "taxYear"
        case form = "form"
        case corrected = "corrected"
        case emailed = "emailed"
    }

    public init(documentId: String, partnerId: String, taxYear: Int, form: String, corrected: Bool, emailed: Bool) {
        self.documentId = documentId
        self.partnerId = partnerId
        self.taxYear = taxYear
        self.form = form
        self.corrected = corrected
        self.emailed = emailed
    }
}

/// A tax form was delivered to a partner: the `tax.form_delivered` delivery body.
public struct TaxFormDeliveredEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: TaxFormDeliveredEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: TaxFormDeliveredEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `referee_reward.earned` event: The friend's side of a double-sided program: the referred customer's reward was issued.
public struct RefereeRewardEarnedEventData: Codable, Sendable, Equatable {
    public var rewardId: String
    public var referralId: String
    public var programId: String
    public var customerRef: String
    public var customerExternalRef: String?
    public var kind: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String
    public var code: String?
    public var billingEventId: String?
    public var commissionId: String?

    enum CodingKeys: String, CodingKey {
        case rewardId = "rewardId"
        case referralId = "referralId"
        case programId = "programId"
        case customerRef = "customerRef"
        case customerExternalRef = "customerExternalRef"
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case code = "code"
        case billingEventId = "billingEventId"
        case commissionId = "commissionId"
    }

    public init(rewardId: String, referralId: String, programId: String, customerRef: String, customerExternalRef: String? = nil, kind: String, amountMinor: Int, currency: String, code: String? = nil, billingEventId: String? = nil, commissionId: String? = nil) {
        self.rewardId = rewardId
        self.referralId = referralId
        self.programId = programId
        self.customerRef = customerRef
        self.customerExternalRef = customerExternalRef
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
        self.code = code
        self.billingEventId = billingEventId
        self.commissionId = commissionId
    }
}

/// A referred customer earned their reward: the `referee_reward.earned` delivery body.
public struct RefereeRewardEarnedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: RefereeRewardEarnedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: RefereeRewardEarnedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `credit.redeemed` event: From `POST /v1/rewards/{id}/redeem` or `POST /v1/rewards/redeem-by-code`. `amountMinor` is what this redemption used (capped at the balance); a repeated `externalId` does not fire again.
public struct CreditRedeemedEventData: Codable, Sendable, Equatable {
    public var grantId: String
    public var rewardId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    /// What is left on the grant afterwards.
    public var remainingMinor: Int

    enum CodingKeys: String, CodingKey {
        case grantId = "grantId"
        case rewardId = "rewardId"
        case amountMinor = "amountMinor"
        case remainingMinor = "remainingMinor"
    }

    public init(grantId: String, rewardId: String, amountMinor: Int, remainingMinor: Int) {
        self.grantId = grantId
        self.rewardId = rewardId
        self.amountMinor = amountMinor
        self.remainingMinor = remainingMinor
    }
}

/// A referee reward was redeemed: the `credit.redeemed` delivery body.
public struct CreditRedeemedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: CreditRedeemedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: CreditRedeemedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `billing_event.recorded` event: Fires once per newly recorded billing event from any connection, never for duplicates.
public struct BillingEventRecordedEventData: Codable, Sendable, Equatable {
    public var billingEventId: String
    public var type: String
    public var customerRef: String
    /// Lowercase ISO 4217 code.
    public var currency: String
    /// Integer minor units (cents).
    public var amountMinor: Int

    enum CodingKeys: String, CodingKey {
        case billingEventId = "billingEventId"
        case type = "type"
        case customerRef = "customerRef"
        case currency = "currency"
        case amountMinor = "amountMinor"
    }

    public init(billingEventId: String, type: String, customerRef: String, currency: String, amountMinor: Int) {
        self.billingEventId = billingEventId
        self.type = type
        self.customerRef = customerRef
        self.currency = currency
        self.amountMinor = amountMinor
    }
}

/// A billing event was recorded: the `billing_event.recorded` delivery body.
public struct BillingEventRecordedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: BillingEventRecordedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: BillingEventRecordedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `roi.payback_reached` event: Once per credit grant, the first time its recipient's profit after it covered its cost. A later refund that un-pays it doesn't fire it again.
public struct RoiPaybackReachedEventData: Codable, Sendable, Equatable {
    public var grantId: String
    /// Whole days from the grant until it paid back.
    public var paybackDays: Int
    /// Profit after minus cost, when it paid back.
    public var netMinor: Int
    /// Lowercase ISO 4217 code.
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case grantId = "grantId"
        case paybackDays = "paybackDays"
        case netMinor = "netMinor"
        case currency = "currency"
    }

    public init(grantId: String, paybackDays: Int, netMinor: Int, currency: String) {
        self.grantId = grantId
        self.paybackDays = paybackDays
        self.netMinor = netMinor
        self.currency = currency
    }
}

/// A credit grant paid back: the `roi.payback_reached` delivery body.
public struct RoiPaybackReachedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: RoiPaybackReachedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: RoiPaybackReachedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `roi.pattern_detected` event: A daily summary, at most once per pattern per day, only when the set of matching subjects changed and `count` is above zero. Read the full list from `GET /v1/roi/patterns/{pattern}`.
public struct RoiPatternDetectedEventData: Codable, Sendable, Equatable {
    public var pattern: String
    /// Subjects matching today.
    public var count: Int
    /// Of those, how many were not in the pattern's last report.
    public var newCount: Int
    /// Up to 10 ids: credit grant ids for the first two patterns, partner ids for the others.
    public var sample: [String]

    enum CodingKeys: String, CodingKey {
        case pattern = "pattern"
        case count = "count"
        case newCount = "newCount"
        case sample = "sample"
    }

    public init(pattern: String, count: Int, newCount: Int, sample: [String]) {
        self.pattern = pattern
        self.count = count
        self.newCount = newCount
        self.sample = sample
    }
}

/// A value pattern changed: the `roi.pattern_detected` delivery body.
public struct RoiPatternDetectedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: RoiPatternDetectedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: RoiPatternDetectedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `fraud.case_opened` event: A case is waiting in the queue. `kind` is `self_referral`, `quality`, `ring`, `identity_risk` or `value_pattern`; the other fields depend on it (`partnerId`, `referralId`, ring `members`, identity-risk `reasons`, value `pattern`). A self-referral rejected by policy has `referralId: null` and `rejected: true`.
public struct FraudCaseOpenedEventData: Codable, Sendable, Equatable {
    public var caseId: String
    public var kind: String
    public var partnerId: String?
    public var referralId: String?
    public var members: [String]?
    public var reasons: [String]?
    public var pattern: String?
    public var rejected: Bool?

    enum CodingKeys: String, CodingKey {
        case caseId = "caseId"
        case kind = "kind"
        case partnerId = "partnerId"
        case referralId = "referralId"
        case members = "members"
        case reasons = "reasons"
        case pattern = "pattern"
        case rejected = "rejected"
    }

    public init(caseId: String, kind: String, partnerId: String? = nil, referralId: String? = nil, members: [String]? = nil, reasons: [String]? = nil, pattern: String? = nil, rejected: Bool? = nil) {
        self.caseId = caseId
        self.kind = kind
        self.partnerId = partnerId
        self.referralId = referralId
        self.members = members
        self.reasons = reasons
        self.pattern = pattern
        self.rejected = rejected
    }
}

/// A fraud case was opened: the `fraud.case_opened` delivery body.
public struct FraudCaseOpenedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: FraudCaseOpenedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: FraudCaseOpenedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `deal.submitted` event: A B2B deal waiting for the merchant to approve.
public struct DealSubmittedEventData: Codable, Sendable, Equatable {
    public var dealId: String
    public var partnerId: String
    public var company: String

    enum CodingKeys: String, CodingKey {
        case dealId = "dealId"
        case partnerId = "partnerId"
        case company = "company"
    }

    public init(dealId: String, partnerId: String, company: String) {
        self.dealId = dealId
        self.partnerId = partnerId
        self.company = company
    }
}

/// A partner registered a deal: the `deal.submitted` delivery body.
public struct DealSubmittedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: DealSubmittedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: DealSubmittedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `dispute.resolved` event: The merchant resolved a partner's dispute with the `resolution` note.
public struct DisputeResolvedEventData: Codable, Sendable, Equatable {
    public var disputeId: String
    public var resolution: String

    enum CodingKeys: String, CodingKey {
        case disputeId = "disputeId"
        case resolution = "resolution"
    }

    public init(disputeId: String, resolution: String) {
        self.disputeId = disputeId
        self.resolution = resolution
    }
}

/// A partner dispute was resolved: the `dispute.resolved` delivery body.
public struct DisputeResolvedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: DisputeResolvedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: DisputeResolvedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `privacy.request_completed` event: An access or erasure request opened with `POST /v1/privacy/requests` completed or failed; `found` is present when completed.
public struct PrivacyRequestCompletedEventData: Codable, Sendable, Equatable {
    public var requestId: String
    public var type: String
    public var status: String
    public var found: Bool?

    enum CodingKeys: String, CodingKey {
        case requestId = "requestId"
        case type = "type"
        case status = "status"
        case found = "found"
    }

    public init(requestId: String, type: String, status: String, found: Bool? = nil) {
        self.requestId = requestId
        self.type = type
        self.status = status
        self.found = found
    }
}

/// A data-subject request finished: the `privacy.request_completed` delivery body.
public struct PrivacyRequestCompletedEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: PrivacyRequestCompletedEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: PrivacyRequestCompletedEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

/// `data` of a `webhook_endpoint.disabled` event: Sent to your other active endpoints when one is disabled after every delivery failed for 5 days.
public struct WebhookEndpointDisabledEventData: Codable, Sendable, Equatable {
    public var endpointId: String
    public var url: String
    public var reason: String
    public var lastStatusCode: Int?
    public var days: Int

    enum CodingKeys: String, CodingKey {
        case endpointId = "endpointId"
        case url = "url"
        case reason = "reason"
        case lastStatusCode = "lastStatusCode"
        case days = "days"
    }

    public init(endpointId: String, url: String, reason: String, lastStatusCode: Int? = nil, days: Int) {
        self.endpointId = endpointId
        self.url = url
        self.reason = reason
        self.lastStatusCode = lastStatusCode
        self.days = days
    }
}

/// A failing webhook endpoint was disabled: the `webhook_endpoint.disabled` delivery body.
public struct WebhookEndpointDisabledEvent: Codable, Sendable, Equatable {
    /// The event id (`evt_…`); the same event delivered to several endpoints has the same id.
    public var id: String
    public var topic: String
    public var orgId: String
    /// false for events from test mode.
    public var livemode: Bool
    public var createdAt: String
    public var data: WebhookEndpointDisabledEventData

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case topic = "topic"
        case orgId = "orgId"
        case livemode = "livemode"
        case createdAt = "createdAt"
        case data = "data"
    }

    public init(id: String, topic: String, orgId: String, livemode: Bool, createdAt: String, data: WebhookEndpointDisabledEventData) {
        self.id = id
        self.topic = topic
        self.orgId = orgId
        self.livemode = livemode
        self.createdAt = createdAt
        self.data = data
    }
}

public struct PostTOrgTokenVisitResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var clickId: String?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case clickId = "clickId"
    }

    public init(ok: Bool, clickId: String? = nil) {
        self.ok = ok
        self.clickId = clickId
    }
}

public struct GetTOrgTokenCodesCodeResponseRefereeRewardOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int?
    /// Integer minor units (cents).
    public var amountMinor: Int?
    /// Integer minor units (cents).
    public var capMinor: Int?
    public var currency: String
    public var on: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
        case amountMinor = "amountMinor"
        case capMinor = "capMinor"
        case currency = "currency"
        case on = "on"
    }

    public init(kind: String, bps: Int? = nil, amountMinor: Int? = nil, capMinor: Int? = nil, currency: String, on: String) {
        self.kind = kind
        self.bps = bps
        self.amountMinor = amountMinor
        self.capMinor = capMinor
        self.currency = currency
        self.on = on
    }
}

public struct GetTOrgTokenCodesCodeResponse: Codable, Sendable, Equatable {
    public var valid: Bool
    /// First name only.
    public var partnerDisplayName: String
    public var refereeReward: GetTOrgTokenCodesCodeResponseRefereeRewardOption1?

    enum CodingKeys: String, CodingKey {
        case valid = "valid"
        case partnerDisplayName = "partnerDisplayName"
        case refereeReward = "refereeReward"
    }

    public init(valid: Bool, partnerDisplayName: String, refereeReward: GetTOrgTokenCodesCodeResponseRefereeRewardOption1? = nil) {
        self.valid = valid
        self.partnerDisplayName = partnerDisplayName
        self.refereeReward = refereeReward
    }
}

public struct GetTOrgTokenWidgetMeResponseProgram: Codable, Sendable, Equatable {
    public var id: String
    public var name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

public struct GetTOrgTokenWidgetMeResponsePartner: Codable, Sendable, Equatable {
    public var displayName: String

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
    }

    public init(displayName: String) {
        self.displayName = displayName
    }
}

public struct GetTOrgTokenWidgetMeResponseShareOption1: Codable, Sendable, Equatable {
    public var x: String
    public var facebook: String
    public var linkedin: String
    public var whatsapp: String
    public var email: String

    enum CodingKeys: String, CodingKey {
        case x = "x"
        case facebook = "facebook"
        case linkedin = "linkedin"
        case whatsapp = "whatsapp"
        case email = "email"
    }

    public init(x: String, facebook: String, linkedin: String, whatsapp: String, email: String) {
        self.x = x
        self.facebook = facebook
        self.linkedin = linkedin
        self.whatsapp = whatsapp
        self.email = email
    }
}

public struct GetTOrgTokenWidgetMeResponseProgress: Codable, Sendable, Equatable {
    public var clicks: Int
    public var signups: Int
    public var payingCustomers: Int

    enum CodingKeys: String, CodingKey {
        case clicks = "clicks"
        case signups = "signups"
        case payingCustomers = "payingCustomers"
    }

    public init(clicks: Int, signups: Int, payingCustomers: Int) {
        self.clicks = clicks
        self.signups = signups
        self.payingCustomers = payingCustomers
    }
}

public struct GetTOrgTokenWidgetMeResponseEarningsItem: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var pending: Int
    /// Integer minor units (cents).
    public var approved: Int
    /// Integer minor units (cents).
    public var paid: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case pending = "pending"
        case approved = "approved"
        case paid = "paid"
    }

    public init(currency: String, pending: Int, approved: Int, paid: Int) {
        self.currency = currency
        self.pending = pending
        self.approved = approved
        self.paid = paid
    }
}

public struct GetTOrgTokenWidgetMeResponseRefereeRewardOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int?
    /// Integer minor units (cents).
    public var amountMinor: Int?
    /// Integer minor units (cents).
    public var capMinor: Int?
    public var currency: String
    public var on: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
        case amountMinor = "amountMinor"
        case capMinor = "capMinor"
        case currency = "currency"
        case on = "on"
    }

    public init(kind: String, bps: Int? = nil, amountMinor: Int? = nil, capMinor: Int? = nil, currency: String, on: String) {
        self.kind = kind
        self.bps = bps
        self.amountMinor = amountMinor
        self.capMinor = capMinor
        self.currency = currency
        self.on = on
    }
}

public struct GetTOrgTokenWidgetMeResponse: Codable, Sendable, Equatable {
    public var program: GetTOrgTokenWidgetMeResponseProgram
    public var partner: GetTOrgTokenWidgetMeResponsePartner
    public var code: String?
    public var coupon: String?
    public var link: String?
    public var share: GetTOrgTokenWidgetMeResponseShareOption1?
    public var progress: GetTOrgTokenWidgetMeResponseProgress
    public var earnings: [GetTOrgTokenWidgetMeResponseEarningsItem]
    public var refereeReward: GetTOrgTokenWidgetMeResponseRefereeRewardOption1?

    enum CodingKeys: String, CodingKey {
        case program = "program"
        case partner = "partner"
        case code = "code"
        case coupon = "coupon"
        case link = "link"
        case share = "share"
        case progress = "progress"
        case earnings = "earnings"
        case refereeReward = "refereeReward"
    }

    public init(program: GetTOrgTokenWidgetMeResponseProgram, partner: GetTOrgTokenWidgetMeResponsePartner, code: String? = nil, coupon: String? = nil, link: String? = nil, share: GetTOrgTokenWidgetMeResponseShareOption1? = nil, progress: GetTOrgTokenWidgetMeResponseProgress, earnings: [GetTOrgTokenWidgetMeResponseEarningsItem], refereeReward: GetTOrgTokenWidgetMeResponseRefereeRewardOption1? = nil) {
        self.program = program
        self.partner = partner
        self.code = code
        self.coupon = coupon
        self.link = link
        self.share = share
        self.progress = progress
        self.earnings = earnings
        self.refereeReward = refereeReward
    }
}

public struct GetTOrgTokenMobileResolveResponse: Codable, Sendable, Equatable {
    public var matched: Bool
    public var clickId: String?
    public var code: String?
    public var destination: String?
    public var programId: String?
    /// How the click was matched, strongest first: the exact user agent, the device hint on the same network, or the exact IP alone.
    public var matchType: String?

    enum CodingKeys: String, CodingKey {
        case matched = "matched"
        case clickId = "clickId"
        case code = "code"
        case destination = "destination"
        case programId = "programId"
        case matchType = "matchType"
    }

    public init(matched: Bool, clickId: String? = nil, code: String? = nil, destination: String? = nil, programId: String? = nil, matchType: String? = nil) {
        self.matched = matched
        self.clickId = clickId
        self.code = code
        self.destination = destination
        self.programId = programId
        self.matchType = matchType
    }
}

public struct PostTOrgTokenMobileInstallResponse: Codable, Sendable, Equatable {
    public var attributed: Bool
    public var referralId: String?
    public var partnerId: String?
    public var programId: String

    enum CodingKeys: String, CodingKey {
        case attributed = "attributed"
        case referralId = "referralId"
        case partnerId = "partnerId"
        case programId = "programId"
    }

    public init(attributed: Bool, referralId: String? = nil, partnerId: String? = nil, programId: String) {
        self.attributed = attributed
        self.referralId = referralId
        self.partnerId = partnerId
        self.programId = programId
    }
}

public struct GetWellKnownAppleAppSiteAssociationResponseApplinksDetailsItemComponentsItem: Codable, Sendable, Equatable {
    public var value: String

    enum CodingKeys: String, CodingKey {
        case value = "/"
    }

    public init(value: String) {
        self.value = value
    }
}

public struct GetWellKnownAppleAppSiteAssociationResponseApplinksDetailsItem: Codable, Sendable, Equatable {
    public var appIDs: [String]
    public var components: [GetWellKnownAppleAppSiteAssociationResponseApplinksDetailsItemComponentsItem]

    enum CodingKeys: String, CodingKey {
        case appIDs = "appIDs"
        case components = "components"
    }

    public init(appIDs: [String], components: [GetWellKnownAppleAppSiteAssociationResponseApplinksDetailsItemComponentsItem]) {
        self.appIDs = appIDs
        self.components = components
    }
}

public struct GetWellKnownAppleAppSiteAssociationResponseApplinks: Codable, Sendable, Equatable {
    public var details: [GetWellKnownAppleAppSiteAssociationResponseApplinksDetailsItem]

    enum CodingKeys: String, CodingKey {
        case details = "details"
    }

    public init(details: [GetWellKnownAppleAppSiteAssociationResponseApplinksDetailsItem]) {
        self.details = details
    }
}

public struct GetWellKnownAppleAppSiteAssociationResponse: Codable, Sendable, Equatable {
    public var applinks: GetWellKnownAppleAppSiteAssociationResponseApplinks

    enum CodingKeys: String, CodingKey {
        case applinks = "applinks"
    }

    public init(applinks: GetWellKnownAppleAppSiteAssociationResponseApplinks) {
        self.applinks = applinks
    }
}

public struct GetWellKnownAssetlinksJsonResponseValueItemTarget: Codable, Sendable, Equatable {
    public var namespace: String
    public var packageName: String
    public var sha256CertFingerprints: [String]

    enum CodingKeys: String, CodingKey {
        case namespace = "namespace"
        case packageName = "package_name"
        case sha256CertFingerprints = "sha256_cert_fingerprints"
    }

    public init(namespace: String, packageName: String, sha256CertFingerprints: [String]) {
        self.namespace = namespace
        self.packageName = packageName
        self.sha256CertFingerprints = sha256CertFingerprints
    }
}

public struct GetWellKnownAssetlinksJsonResponseValueItem: Codable, Sendable, Equatable {
    public var relation: [String]
    public var target: GetWellKnownAssetlinksJsonResponseValueItemTarget

    enum CodingKeys: String, CodingKey {
        case relation = "relation"
        case target = "target"
    }

    public init(relation: [String], target: GetWellKnownAssetlinksJsonResponseValueItemTarget) {
        self.relation = relation
        self.target = target
    }
}

public typealias GetWellKnownAssetlinksJsonResponse = [GetWellKnownAssetlinksJsonResponseValueItem]

public struct PostAgentsRegisterResponse: Codable, Sendable, Equatable {
    public var agentId: String
    public var wallet: String
    public var instantPayout: Bool

    enum CodingKeys: String, CodingKey {
        case agentId = "agentId"
        case wallet = "wallet"
        case instantPayout = "instantPayout"
    }

    public init(agentId: String, wallet: String, instantPayout: Bool) {
        self.agentId = agentId
        self.wallet = wallet
        self.instantPayout = instantPayout
    }
}

public struct PostTOrgTokenAgentAttributeResponse: Codable, Sendable, Equatable {
    public var attributed: Bool
    public var referralId: String
    public var agentWallet: String

    enum CodingKeys: String, CodingKey {
        case attributed = "attributed"
        case referralId = "referralId"
        case agentWallet = "agentWallet"
    }

    public init(attributed: Bool, referralId: String, agentWallet: String) {
        self.attributed = attributed
        self.referralId = referralId
        self.agentWallet = agentWallet
    }
}

public struct PostTOrgTokenAgentNegotiateResponse: Codable, Sendable, Equatable {
    public var decision: String
    public var rateBps: Int?
    public var counterBps: Int?
    public var partnerId: String?
    public var reason: String

    enum CodingKeys: String, CodingKey {
        case decision = "decision"
        case rateBps = "rateBps"
        case counterBps = "counterBps"
        case partnerId = "partnerId"
        case reason = "reason"
    }

    public init(decision: String, rateBps: Int? = nil, counterBps: Int? = nil, partnerId: String? = nil, reason: String) {
        self.decision = decision
        self.rateBps = rateBps
        self.counterBps = counterBps
        self.partnerId = partnerId
        self.reason = reason
    }
}

public struct PostTOrgTokenConsentResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var customerRef: String
    public var granted: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case customerRef = "customerRef"
        case granted = "granted"
    }

    public init(ok: Bool, customerRef: String, granted: Bool) {
        self.ok = ok
        self.customerRef = customerRef
        self.granted = granted
    }
}

public struct GetVersionsResponseVersionsItem: Codable, Sendable, Equatable {
    public var version: String
    public var released: String
    public var changes: [String]

    enum CodingKeys: String, CodingKey {
        case version = "version"
        case released = "released"
        case changes = "changes"
    }

    public init(version: String, released: String, changes: [String]) {
        self.version = version
        self.released = released
        self.changes = changes
    }
}

public struct GetVersionsResponse: Codable, Sendable, Equatable {
    public var latest: String
    public var versions: [GetVersionsResponseVersionsItem]
    public var deprecationPolicy: String

    enum CodingKeys: String, CodingKey {
        case latest = "latest"
        case versions = "versions"
        case deprecationPolicy = "deprecationPolicy"
    }

    public init(latest: String, versions: [GetVersionsResponseVersionsItem], deprecationPolicy: String) {
        self.latest = latest
        self.versions = versions
        self.deprecationPolicy = deprecationPolicy
    }
}

public struct GetAuthProvidersResponseDetailsItem: Codable, Sendable, Equatable {
    public var id: String
    /// The provider, for the sign-in button.
    public var name: String
    /// Atlas, which has its own branded one-click button.
    public var atlas: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case atlas = "atlas"
    }

    public init(id: String, name: String, atlas: Bool) {
        self.id = id
        self.name = name
        self.atlas = atlas
    }
}

public struct GetAuthProvidersResponse: Codable, Sendable, Equatable {
    public var providers: [String]
    public var details: [GetAuthProvidersResponseDetailsItem]

    enum CodingKeys: String, CodingKey {
        case providers = "providers"
        case details = "details"
    }

    public init(providers: [String], details: [GetAuthProvidersResponseDetailsItem]) {
        self.providers = providers
        self.details = details
    }
}

public struct PostAuthLogoutResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var logoutUrl: String?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case logoutUrl = "logoutUrl"
    }

    public init(ok: Bool, logoutUrl: String? = nil) {
        self.ok = ok
        self.logoutUrl = logoutUrl
    }
}

public struct PostOrgsResponse: Codable, Sendable, Equatable {
    public var orgId: String

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
    }

    public init(orgId: String) {
        self.orgId = orgId
    }
}

public struct GetMeResponseUserOption1: Codable, Sendable, Equatable {
    public var id: String
    public var email: String
    public var name: String?
    public var emailVerified: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case name = "name"
        case emailVerified = "emailVerified"
    }

    public init(id: String, email: String, name: String? = nil, emailVerified: Bool) {
        self.id = id
        self.email = email
        self.name = name
        self.emailVerified = emailVerified
    }
}

public struct GetMeResponseMembershipsItem: Codable, Sendable, Equatable {
    public var orgId: String
    public var role: String
    public var roiDigest: Bool?

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case role = "role"
        case roiDigest = "roiDigest"
    }

    public init(orgId: String, role: String, roiDigest: Bool? = nil) {
        self.orgId = orgId
        self.role = role
        self.roiDigest = roiDigest
    }
}

/// Set when called with an API key (user is then null).
public struct GetMeResponseApiKey: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var prefix: String
    public var scopes: [String]
    /// The API version this key is pinned to (what it gets without a Referalli-Version header).
    public var apiVersion: String?
    public var livemode: Bool
    public var publishable: Bool
    public var owner: String?
    public var expiresAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case prefix = "prefix"
        case scopes = "scopes"
        case apiVersion = "apiVersion"
        case livemode = "livemode"
        case publishable = "publishable"
        case owner = "owner"
        case expiresAt = "expiresAt"
    }

    public init(id: String, name: String, prefix: String, scopes: [String], apiVersion: String? = nil, livemode: Bool, publishable: Bool, owner: String? = nil, expiresAt: String? = nil) {
        self.id = id
        self.name = name
        self.prefix = prefix
        self.scopes = scopes
        self.apiVersion = apiVersion
        self.livemode = livemode
        self.publishable = publishable
        self.owner = owner
        self.expiresAt = expiresAt
    }
}

public struct GetMeResponseOrg: Codable, Sendable, Equatable {
    public var id: String
    public var name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

public struct GetMeResponse: Codable, Sendable, Equatable {
    public var user: GetMeResponseUserOption1?
    public var memberships: [GetMeResponseMembershipsItem]
    /// Set when called with an API key (user is then null).
    public var apiKey: GetMeResponseApiKey?
    public var org: GetMeResponseOrg?

    enum CodingKeys: String, CodingKey {
        case user = "user"
        case memberships = "memberships"
        case apiKey = "apiKey"
        case org = "org"
    }

    public init(user: GetMeResponseUserOption1? = nil, memberships: [GetMeResponseMembershipsItem], apiKey: GetMeResponseApiKey? = nil, org: GetMeResponseOrg? = nil) {
        self.user = user
        self.memberships = memberships
        self.apiKey = apiKey
        self.org = org
    }
}

public struct GetHostsCurrentResponseValueOption1Branding: Codable, Sendable, Equatable {
    public var logoUrl: String
    public var theme: [String: String]

    enum CodingKeys: String, CodingKey {
        case logoUrl = "logoUrl"
        case theme = "theme"
    }

    public init(logoUrl: String, theme: [String: String]) {
        self.logoUrl = logoUrl
        self.theme = theme
    }
}

public struct GetHostsCurrentResponseValueOption1ProgramsItem: Codable, Sendable, Equatable {
    public var handle: String
    public var name: String

    enum CodingKeys: String, CodingKey {
        case handle = "handle"
        case name = "name"
    }

    public init(handle: String, name: String) {
        self.handle = handle
        self.name = name
    }
}

public struct GetHostsCurrentResponseValueOption1: Codable, Sendable, Equatable {
    /// A merchant's verified partner-portal domain.
    public var kind: String
    public var orgId: String
    public var orgName: String
    public var branding: GetHostsCurrentResponseValueOption1Branding
    /// The org's active programs with a public signup page (/join/:handle).
    public var programs: [GetHostsCurrentResponseValueOption1ProgramsItem]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case orgId = "orgId"
        case orgName = "orgName"
        case branding = "branding"
        case programs = "programs"
    }

    public init(kind: String, orgId: String, orgName: String, branding: GetHostsCurrentResponseValueOption1Branding, programs: [GetHostsCurrentResponseValueOption1ProgramsItem]) {
        self.kind = kind
        self.orgId = orgId
        self.orgName = orgName
        self.branding = branding
        self.programs = programs
    }
}

public struct GetHostsCurrentResponseValueOption2: Codable, Sendable, Equatable {
    /// A merchant's verified link domain.
    public var kind: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
    }

    public init(kind: String) {
        self.kind = kind
    }
}

public struct GetHostsCurrentResponseValueOption3: Codable, Sendable, Equatable {
    /// Referalli's own app.
    public var kind: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
    }

    public init(kind: String) {
        self.kind = kind
    }
}

public typealias GetHostsCurrentResponse = JSONValue

public struct PostMobilePurchasesResponse: Codable, Sendable, Equatable {
    public var conversions: Int
    public var linesCreated: Int
    public var reversals: Int

    enum CodingKeys: String, CodingKey {
        case conversions = "conversions"
        case linesCreated = "linesCreated"
        case reversals = "reversals"
    }

    public init(conversions: Int, linesCreated: Int, reversals: Int) {
        self.conversions = conversions
        self.linesCreated = linesCreated
        self.reversals = reversals
    }
}

public struct PatchOrgResponse: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var plan: String
    public var settings: GetOpenapiJsonResponse
    public var payoutKycRequired: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case plan = "plan"
        case settings = "settings"
        case payoutKycRequired = "payout_kyc_required"
    }

    public init(id: String, name: String, plan: String, settings: GetOpenapiJsonResponse, payoutKycRequired: Bool) {
        self.id = id
        self.name = name
        self.plan = plan
        self.settings = settings
        self.payoutKycRequired = payoutKycRequired
    }
}

public struct GetOrgMembersResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Member]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Member], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostOrgMembersResponse: Codable, Sendable, Equatable {
    public var userId: String
    public var role: String

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case role = "role"
    }

    public init(userId: String, role: String) {
        self.userId = userId
        self.role = role
    }
}

public struct PatchOrgMembersUserIdResponse: Codable, Sendable, Equatable {
    public var userId: String
    public var role: String

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case role = "role"
    }

    public init(userId: String, role: String) {
        self.userId = userId
        self.role = role
    }
}

public struct PutOrgPayoutScheduleResponse: Codable, Sendable, Equatable {
    public var dayOfMonth: Int?
    public var schedule: PayoutSchedule?
    public var nextRunDate: String?

    enum CodingKeys: String, CodingKey {
        case dayOfMonth = "dayOfMonth"
        case schedule = "schedule"
        case nextRunDate = "nextRunDate"
    }

    public init(dayOfMonth: Int? = nil, schedule: PayoutSchedule? = nil, nextRunDate: String? = nil) {
        self.dayOfMonth = dayOfMonth
        self.schedule = schedule
        self.nextRunDate = nextRunDate
    }
}

public struct GetOrgPayoutScheduleResponseProgramsItemOverrideOption1Option2: Codable, Sendable, Equatable {
    public var kind: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
    }

    public init(kind: String) {
        self.kind = kind
    }
}

public struct GetOrgPayoutScheduleResponseProgramsItem: Codable, Sendable, Equatable {
    public var programId: String
    public var name: String
    public var override: JSONValue?
    public var nextRunDate: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case name = "name"
        case override = "override"
        case nextRunDate = "nextRunDate"
    }

    public init(programId: String, name: String, override: JSONValue? = nil, nextRunDate: String? = nil) {
        self.programId = programId
        self.name = name
        self.override = override
        self.nextRunDate = nextRunDate
    }
}

public struct GetOrgPayoutScheduleResponse: Codable, Sendable, Equatable {
    public var schedule: PayoutSchedule?
    public var nextRunDate: String?
    public var programs: [GetOrgPayoutScheduleResponseProgramsItem]

    enum CodingKeys: String, CodingKey {
        case schedule = "schedule"
        case nextRunDate = "nextRunDate"
        case programs = "programs"
    }

    public init(schedule: PayoutSchedule? = nil, nextRunDate: String? = nil, programs: [GetOrgPayoutScheduleResponseProgramsItem]) {
        self.schedule = schedule
        self.nextRunDate = nextRunDate
        self.programs = programs
    }
}

public struct PutProgramsIdPayoutScheduleResponseScheduleOption1Option2: Codable, Sendable, Equatable {
    public var kind: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
    }

    public init(kind: String) {
        self.kind = kind
    }
}

public struct PutProgramsIdPayoutScheduleResponse: Codable, Sendable, Equatable {
    public var programId: String
    public var schedule: JSONValue?
    public var nextRunDate: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case schedule = "schedule"
        case nextRunDate = "nextRunDate"
    }

    public init(programId: String, schedule: JSONValue? = nil, nextRunDate: String? = nil) {
        self.programId = programId
        self.schedule = schedule
        self.nextRunDate = nextRunDate
    }
}

public struct PutPartnersIdVatResponse: Codable, Sendable, Equatable {
    public var vatId: String?
    public var vatCountry: String?
    public var vatVerifiedAt: String?
    public var selfBillingAcceptedAt: String?
    public var selfBillingVersion: String?

    enum CodingKeys: String, CodingKey {
        case vatId = "vatId"
        case vatCountry = "vatCountry"
        case vatVerifiedAt = "vatVerifiedAt"
        case selfBillingAcceptedAt = "selfBillingAcceptedAt"
        case selfBillingVersion = "selfBillingVersion"
    }

    public init(vatId: String? = nil, vatCountry: String? = nil, vatVerifiedAt: String? = nil, selfBillingAcceptedAt: String? = nil, selfBillingVersion: String? = nil) {
        self.vatId = vatId
        self.vatCountry = vatCountry
        self.vatVerifiedAt = vatVerifiedAt
        self.selfBillingAcceptedAt = selfBillingAcceptedAt
        self.selfBillingVersion = selfBillingVersion
    }
}

public struct GetPartnerOrgsOrgIdSelfBillingResponse: Codable, Sendable, Equatable {
    public var vatId: String?
    public var vatCountry: String?
    public var vatVerifiedAt: String?
    public var selfBillingAcceptedAt: String?
    public var selfBillingVersion: String?
    public var currentVersion: String

    enum CodingKeys: String, CodingKey {
        case vatId = "vatId"
        case vatCountry = "vatCountry"
        case vatVerifiedAt = "vatVerifiedAt"
        case selfBillingAcceptedAt = "selfBillingAcceptedAt"
        case selfBillingVersion = "selfBillingVersion"
        case currentVersion = "currentVersion"
    }

    public init(vatId: String? = nil, vatCountry: String? = nil, vatVerifiedAt: String? = nil, selfBillingAcceptedAt: String? = nil, selfBillingVersion: String? = nil, currentVersion: String) {
        self.vatId = vatId
        self.vatCountry = vatCountry
        self.vatVerifiedAt = vatVerifiedAt
        self.selfBillingAcceptedAt = selfBillingAcceptedAt
        self.selfBillingVersion = selfBillingVersion
        self.currentVersion = currentVersion
    }
}

public struct PostPartnerOrgsOrgIdSelfBillingResponse: Codable, Sendable, Equatable {
    public var vatId: String?
    public var vatCountry: String?
    public var vatVerifiedAt: String?
    public var selfBillingAcceptedAt: String?
    public var selfBillingVersion: String?
    public var currentVersion: String

    enum CodingKeys: String, CodingKey {
        case vatId = "vatId"
        case vatCountry = "vatCountry"
        case vatVerifiedAt = "vatVerifiedAt"
        case selfBillingAcceptedAt = "selfBillingAcceptedAt"
        case selfBillingVersion = "selfBillingVersion"
        case currentVersion = "currentVersion"
    }

    public init(vatId: String? = nil, vatCountry: String? = nil, vatVerifiedAt: String? = nil, selfBillingAcceptedAt: String? = nil, selfBillingVersion: String? = nil, currentVersion: String) {
        self.vatId = vatId
        self.vatCountry = vatCountry
        self.vatVerifiedAt = vatVerifiedAt
        self.selfBillingAcceptedAt = selfBillingAcceptedAt
        self.selfBillingVersion = selfBillingVersion
        self.currentVersion = currentVersion
    }
}

public struct PutOrgTaxFilingResponse: Codable, Sendable, Equatable {
    public var provider: String
    public var connected: Bool

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case connected = "connected"
    }

    public init(provider: String, connected: Bool) {
        self.provider = provider
        self.connected = connected
    }
}

public struct GetTax1099FilingsResponseDataItemDocumentsItem: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case amountMinor = "amountMinor"
        case status = "status"
    }

    public init(id: String, partnerId: String, amountMinor: Int, status: String) {
        self.id = id
        self.partnerId = partnerId
        self.amountMinor = amountMinor
        self.status = status
    }
}

public struct GetTax1099FilingsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var taxYear: Int
    public var kind: String
    public var provider: String
    public var providerFilingId: String?
    public var status: String
    public var recipientCount: Int
    /// Integer minor units (cents).
    public var totalMinor: Int
    public var error: String?
    public var documents: [GetTax1099FilingsResponseDataItemDocumentsItem]
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case taxYear = "taxYear"
        case kind = "kind"
        case provider = "provider"
        case providerFilingId = "providerFilingId"
        case status = "status"
        case recipientCount = "recipientCount"
        case totalMinor = "totalMinor"
        case error = "error"
        case documents = "documents"
        case createdAt = "createdAt"
    }

    public init(id: String, taxYear: Int, kind: String, provider: String, providerFilingId: String? = nil, status: String, recipientCount: Int, totalMinor: Int, error: String? = nil, documents: [GetTax1099FilingsResponseDataItemDocumentsItem], createdAt: String) {
        self.id = id
        self.taxYear = taxYear
        self.kind = kind
        self.provider = provider
        self.providerFilingId = providerFilingId
        self.status = status
        self.recipientCount = recipientCount
        self.totalMinor = totalMinor
        self.error = error
        self.documents = documents
        self.createdAt = createdAt
    }
}

public struct GetTax1099FilingsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetTax1099FilingsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetTax1099FilingsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostTax1099FilingsIdRefreshResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetPartnerTaxDocumentsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String
    public var taxYear: Int
    public var form: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var status: String
    public var correctionOf: String?
    public var deliveredAt: String?
    public var createdAt: String
    public var orgId: String
    public var orgName: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case taxYear = "taxYear"
        case form = "form"
        case amountMinor = "amountMinor"
        case status = "status"
        case correctionOf = "correctionOf"
        case deliveredAt = "deliveredAt"
        case createdAt = "createdAt"
        case orgId = "orgId"
        case orgName = "orgName"
    }

    public init(id: String, partnerId: String, taxYear: Int, form: String, amountMinor: Int, status: String, correctionOf: String? = nil, deliveredAt: String? = nil, createdAt: String, orgId: String, orgName: String) {
        self.id = id
        self.partnerId = partnerId
        self.taxYear = taxYear
        self.form = form
        self.amountMinor = amountMinor
        self.status = status
        self.correctionOf = correctionOf
        self.deliveredAt = deliveredAt
        self.createdAt = createdAt
        self.orgId = orgId
        self.orgName = orgName
    }
}

public struct GetPartnerTaxDocumentsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerTaxDocumentsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerTaxDocumentsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetStatusResponseComponentsItem: Codable, Sendable, Equatable {
    public var id: String
    public var state: String
    public var detail: [String: JSONValue]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case state = "state"
        case detail = "detail"
    }

    public init(id: String, state: String, detail: [String: JSONValue]) {
        self.id = id
        self.state = state
        self.detail = detail
    }
}

public struct GetStatusResponse: Codable, Sendable, Equatable {
    public var state: String
    public var components: [GetStatusResponseComponentsItem]
    public var openIncidents: [Incident]
    public var checkedAt: String

    enum CodingKeys: String, CodingKey {
        case state = "state"
        case components = "components"
        case openIncidents = "openIncidents"
        case checkedAt = "checkedAt"
    }

    public init(state: String, components: [GetStatusResponseComponentsItem], openIncidents: [Incident], checkedAt: String) {
        self.state = state
        self.components = components
        self.openIncidents = openIncidents
        self.checkedAt = checkedAt
    }
}

public struct GetStatusIncidentsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Incident]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Incident], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetOrgReferralParamsResponse: Codable, Sendable, Equatable {
    /// Always read: via, ref, aff.
    public var builtIn: [String]
    public var params: [String]

    enum CodingKeys: String, CodingKey {
        case builtIn = "builtIn"
        case params = "params"
    }

    public init(builtIn: [String], params: [String]) {
        self.builtIn = builtIn
        self.params = params
    }
}

public struct GetProgramsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Program]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Program], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetProgramsIdEnrollmentsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String
    public var partnerEmail: String
    public var partnerName: String
    public var status: String
    public var createdAt: String
    public var networkWarning: NetworkWarning

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case partnerEmail = "partnerEmail"
        case partnerName = "partnerName"
        case status = "status"
        case createdAt = "createdAt"
        case networkWarning = "networkWarning"
    }

    public init(id: String, partnerId: String, partnerEmail: String, partnerName: String, status: String, createdAt: String, networkWarning: NetworkWarning) {
        self.id = id
        self.partnerId = partnerId
        self.partnerEmail = partnerEmail
        self.partnerName = partnerName
        self.status = status
        self.createdAt = createdAt
        self.networkWarning = networkWarning
    }
}

public struct GetProgramsIdEnrollmentsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetProgramsIdEnrollmentsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetProgramsIdEnrollmentsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostProgramsIdEnrollmentsEnrollmentIdApproveResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct PostProgramsIdEnrollmentsEnrollmentIdRejectResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetPartnersResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Partner]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Partner], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public typealias GetPartnersIdResponse = JSONValue

public struct GetPartnersIdEnrollmentsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var programName: String
    public var status: String
    public var groupId: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case programName = "programName"
        case status = "status"
        case groupId = "groupId"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, programName: String, status: String, groupId: String? = nil, createdAt: String) {
        self.id = id
        self.programId = programId
        self.programName = programName
        self.status = status
        self.groupId = groupId
        self.createdAt = createdAt
    }
}

public struct GetPartnersIdEnrollmentsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnersIdEnrollmentsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnersIdEnrollmentsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public typealias GetProgramsIdGraphResponse = JSONValue

/// mode "both": the live and test twins.
public struct PostApiKeysResponseValueOption2: Codable, Sendable, Equatable {
    public var pairId: String
    public var live: IssuedApiKey
    public var test: IssuedApiKey

    enum CodingKeys: String, CodingKey {
        case pairId = "pairId"
        case live = "live"
        case test = "test"
    }

    public init(pairId: String, live: IssuedApiKey, test: IssuedApiKey) {
        self.pairId = pairId
        self.live = live
        self.test = test
    }
}

public typealias PostApiKeysResponse = JSONValue

public struct GetApiKeysResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [ApiKey]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [ApiKey], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PatchApiKeysIdResponse: Codable, Sendable, Equatable {
    public var id: String
    public var apiVersion: String
    public var owner: String?
    public var expiresAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case apiVersion = "apiVersion"
        case owner = "owner"
        case expiresAt = "expiresAt"
    }

    public init(id: String, apiVersion: String, owner: String? = nil, expiresAt: String? = nil) {
        self.id = id
        self.apiVersion = apiVersion
        self.owner = owner
        self.expiresAt = expiresAt
    }
}

public struct DeleteApiKeysIdResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var revoked: [String]

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case revoked = "revoked"
    }

    public init(ok: Bool, revoked: [String]) {
        self.ok = ok
        self.revoked = revoked
    }
}

public struct GetAuditLogsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [AuditLogEntry]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [AuditLogEntry], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetTestClockResponse: Codable, Sendable, Equatable {
    public var now: String
    /// How far the test clock is ahead of real time.
    public var offsetSeconds: Int

    enum CodingKeys: String, CodingKey {
        case now = "now"
        case offsetSeconds = "offsetSeconds"
    }

    public init(now: String, offsetSeconds: Int) {
        self.now = now
        self.offsetSeconds = offsetSeconds
    }
}

public struct PostTestClockAdvanceResponse: Codable, Sendable, Equatable {
    public var now: String
    public var offsetSeconds: Int
    /// Held commission lines approved because their hold ended.
    public var approved: Int
    /// Scheduled payout runs that fell due and ran.
    public var payoutRuns: Int

    enum CodingKeys: String, CodingKey {
        case now = "now"
        case offsetSeconds = "offsetSeconds"
        case approved = "approved"
        case payoutRuns = "payoutRuns"
    }

    public init(now: String, offsetSeconds: Int, approved: Int, payoutRuns: Int) {
        self.now = now
        self.offsetSeconds = offsetSeconds
        self.approved = approved
        self.payoutRuns = payoutRuns
    }
}

public struct GetTestEmailsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var event: String
    public var to: String
    public var subject: String
    public var text: String
    public var html: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case event = "event"
        case to = "to"
        case subject = "subject"
        case text = "text"
        case html = "html"
        case createdAt = "createdAt"
    }

    public init(id: String, event: String, to: String, subject: String, text: String, html: String, createdAt: String) {
        self.id = id
        self.event = event
        self.to = to
        self.subject = subject
        self.text = text
        self.html = html
        self.createdAt = createdAt
    }
}

public struct GetTestEmailsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetTestEmailsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetTestEmailsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostCliDeviceCodesResponse: Codable, Sendable, Equatable {
    /// Secret: the CLI polls with it.
    public var deviceCode: String
    public var userCode: String
    public var verificationUri: String
    public var verificationUriComplete: String
    public var expiresIn: Int
    public var interval: Int

    enum CodingKeys: String, CodingKey {
        case deviceCode = "deviceCode"
        case userCode = "userCode"
        case verificationUri = "verificationUri"
        case verificationUriComplete = "verificationUriComplete"
        case expiresIn = "expiresIn"
        case interval = "interval"
    }

    public init(deviceCode: String, userCode: String, verificationUri: String, verificationUriComplete: String, expiresIn: Int, interval: Int) {
        self.deviceCode = deviceCode
        self.userCode = userCode
        self.verificationUri = verificationUri
        self.verificationUriComplete = verificationUriComplete
        self.expiresIn = expiresIn
        self.interval = interval
    }
}

public struct PostCliDeviceCodesTokenResponse: Codable, Sendable, Equatable {
    public var status: String
    /// The issued API key, returned once when approved.
    public var key: String?
    public var orgId: String?
    public var orgName: String?
    public var scopes: [String]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case key = "key"
        case orgId = "orgId"
        case orgName = "orgName"
        case scopes = "scopes"
    }

    public init(status: String, key: String? = nil, orgId: String? = nil, orgName: String? = nil, scopes: [String]? = nil) {
        self.status = status
        self.key = key
        self.orgId = orgId
        self.orgName = orgName
        self.scopes = scopes
    }
}

public struct GetCliDeviceCodesUserCodeResponse: Codable, Sendable, Equatable {
    public var userCode: String
    public var clientName: String?
    public var createdAt: String
    public var expiresAt: String

    enum CodingKeys: String, CodingKey {
        case userCode = "userCode"
        case clientName = "clientName"
        case createdAt = "createdAt"
        case expiresAt = "expiresAt"
    }

    public init(userCode: String, clientName: String? = nil, createdAt: String, expiresAt: String) {
        self.userCode = userCode
        self.clientName = clientName
        self.createdAt = createdAt
        self.expiresAt = expiresAt
    }
}

public struct PostCliDeviceCodesUserCodeApproveResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var keyId: String
    public var scopes: [String]

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case keyId = "keyId"
        case scopes = "scopes"
    }

    public init(ok: Bool, keyId: String, scopes: [String]) {
        self.ok = ok
        self.keyId = keyId
        self.scopes = scopes
    }
}

public struct PostCliListenersResponse: Codable, Sendable, Equatable {
    public var id: String
    /// Signs forwarded events (Standard Webhooks); shown once.
    public var secret: String
    public var topics: [String]
    public var idleTimeoutSec: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case secret = "secret"
        case topics = "topics"
        case idleTimeoutSec = "idleTimeoutSec"
    }

    public init(id: String, secret: String, topics: [String], idleTimeoutSec: Int) {
        self.id = id
        self.secret = secret
        self.topics = topics
        self.idleTimeoutSec = idleTimeoutSec
    }
}

public struct GetCliListenersIdEventsResponseEventsItem: Codable, Sendable, Equatable {
    public var id: String
    public var eventId: String
    public var topic: String
    /// The exact bytes to forward.
    public var body: String
    public var headers: [String: String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case eventId = "eventId"
        case topic = "topic"
        case body = "body"
        case headers = "headers"
    }

    public init(id: String, eventId: String, topic: String, body: String, headers: [String: String]) {
        self.id = id
        self.eventId = eventId
        self.topic = topic
        self.body = body
        self.headers = headers
    }
}

public struct GetCliListenersIdEventsResponse: Codable, Sendable, Equatable {
    public var events: [GetCliListenersIdEventsResponseEventsItem]

    enum CodingKeys: String, CodingKey {
        case events = "events"
    }

    public init(events: [GetCliListenersIdEventsResponseEventsItem]) {
        self.events = events
    }
}

public struct PostCliTriggerResponseDeliveredTo: Codable, Sendable, Equatable {
    public var listeners: Int
    public var endpoints: Int

    enum CodingKeys: String, CodingKey {
        case listeners = "listeners"
        case endpoints = "endpoints"
    }

    public init(listeners: Int, endpoints: Int) {
        self.listeners = listeners
        self.endpoints = endpoints
    }
}

public struct PostCliTriggerResponse: Codable, Sendable, Equatable {
    public var eventId: String
    public var topic: String
    public var payload: GetOpenapiJsonResponse
    public var deliveredTo: PostCliTriggerResponseDeliveredTo

    enum CodingKeys: String, CodingKey {
        case eventId = "eventId"
        case topic = "topic"
        case payload = "payload"
        case deliveredTo = "deliveredTo"
    }

    public init(eventId: String, topic: String, payload: GetOpenapiJsonResponse, deliveredTo: PostCliTriggerResponseDeliveredTo) {
        self.eventId = eventId
        self.topic = topic
        self.payload = payload
        self.deliveredTo = deliveredTo
    }
}

public struct GetCliTopicsResponse: Codable, Sendable, Equatable {
    public var topics: [String]

    enum CodingKeys: String, CodingKey {
        case topics = "topics"
    }

    public init(topics: [String]) {
        self.topics = topics
    }
}

public struct GetCliLogsResponseEntriesItem: Codable, Sendable, Equatable {
    public var seq: Int
    public var requestId: String
    public var method: String
    public var path: String
    public var status: Int
    public var latencyMs: Int
    public var actorType: String
    public var actorId: String?
    public var ts: String

    enum CodingKeys: String, CodingKey {
        case seq = "seq"
        case requestId = "requestId"
        case method = "method"
        case path = "path"
        case status = "status"
        case latencyMs = "latencyMs"
        case actorType = "actorType"
        case actorId = "actorId"
        case ts = "ts"
    }

    public init(seq: Int, requestId: String, method: String, path: String, status: Int, latencyMs: Int, actorType: String, actorId: String? = nil, ts: String) {
        self.seq = seq
        self.requestId = requestId
        self.method = method
        self.path = path
        self.status = status
        self.latencyMs = latencyMs
        self.actorType = actorType
        self.actorId = actorId
        self.ts = ts
    }
}

public struct GetCliLogsResponse: Codable, Sendable, Equatable {
    public var entries: [GetCliLogsResponseEntriesItem]
    public var cursor: Int

    enum CodingKeys: String, CodingKey {
        case entries = "entries"
        case cursor = "cursor"
    }

    public init(entries: [GetCliLogsResponseEntriesItem], cursor: Int) {
        self.entries = entries
        self.cursor = cursor
    }
}

public struct GetLinksResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Link]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Link], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostCouponsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var code: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
    }

    public init(id: String, code: String) {
        self.id = id
        self.code = code
    }
}

public struct GetCouponsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Coupon]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Coupon], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostWidgetTokensResponse: Codable, Sendable, Equatable {
    public var token: String
    public var partnerId: String
    public var expiresAt: String

    enum CodingKeys: String, CodingKey {
        case token = "token"
        case partnerId = "partnerId"
        case expiresAt = "expiresAt"
    }

    public init(token: String, partnerId: String, expiresAt: String) {
        self.token = token
        self.partnerId = partnerId
        self.expiresAt = expiresAt
    }
}

public struct GetReferralsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Referral]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Referral], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetReferralsIdJourneyResponseTouchCreditsItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var weight: Double
    public var clickId: String?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case weight = "weight"
        case clickId = "clickId"
    }

    public init(partnerId: String, weight: Double, clickId: String? = nil) {
        self.partnerId = partnerId
        self.weight = weight
        self.clickId = clickId
    }
}

public struct GetReferralsIdJourneyResponseTouchpointsItem: Codable, Sendable, Equatable {
    public var clickId: String
    public var ts: String
    public var url: String?
    public var linkId: String?
    public var fraudScore: Int
    public var eligible: Bool
    public var weight: Double
    public var winner: Bool

    enum CodingKeys: String, CodingKey {
        case clickId = "clickId"
        case ts = "ts"
        case url = "url"
        case linkId = "linkId"
        case fraudScore = "fraudScore"
        case eligible = "eligible"
        case weight = "weight"
        case winner = "winner"
    }

    public init(clickId: String, ts: String, url: String? = nil, linkId: String? = nil, fraudScore: Int, eligible: Bool, weight: Double, winner: Bool) {
        self.clickId = clickId
        self.ts = ts
        self.url = url
        self.linkId = linkId
        self.fraudScore = fraudScore
        self.eligible = eligible
        self.weight = weight
        self.winner = winner
    }
}

public struct GetReferralsIdJourneyResponse: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var customerRef: String
    public var source: String
    public var matchedVia: String
    public var confidence: Double
    public var clickId: String?
    public var linkId: String?
    public var status: String
    public var ts: String
    public var windowExpiresAt: String
    public var touchCredits: [GetReferralsIdJourneyResponseTouchCreditsItem]
    public var reasoning: AttributionReasoning
    public var touchpoints: [GetReferralsIdJourneyResponseTouchpointsItem]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case customerRef = "customerRef"
        case source = "source"
        case matchedVia = "matchedVia"
        case confidence = "confidence"
        case clickId = "clickId"
        case linkId = "linkId"
        case status = "status"
        case ts = "ts"
        case windowExpiresAt = "windowExpiresAt"
        case touchCredits = "touchCredits"
        case reasoning = "reasoning"
        case touchpoints = "touchpoints"
    }

    public init(id: String, programId: String, partnerId: String, customerRef: String, source: String, matchedVia: String, confidence: Double, clickId: String? = nil, linkId: String? = nil, status: String, ts: String, windowExpiresAt: String, touchCredits: [GetReferralsIdJourneyResponseTouchCreditsItem], reasoning: AttributionReasoning, touchpoints: [GetReferralsIdJourneyResponseTouchpointsItem]) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.customerRef = customerRef
        self.source = source
        self.matchedVia = matchedVia
        self.confidence = confidence
        self.clickId = clickId
        self.linkId = linkId
        self.status = status
        self.ts = ts
        self.windowExpiresAt = windowExpiresAt
        self.touchCredits = touchCredits
        self.reasoning = reasoning
        self.touchpoints = touchpoints
    }
}

public struct PostAttributionReplayResponse: Codable, Sendable, Equatable {
    public var recomputed: Int
    public var changed: Int

    enum CodingKeys: String, CodingKey {
        case recomputed = "recomputed"
        case changed = "changed"
    }

    public init(recomputed: Int, changed: Int) {
        self.recomputed = recomputed
        self.changed = changed
    }
}

public struct PostTrackEventsResponse: Codable, Sendable, Equatable {
    public var clickId: String?
    public var eventId: String?
    public var event: String?
    public var recorded: Bool?
    public var referralId: String?
    public var duplicate: Bool?
    public var commissionId: String?
    /// Integer minor units (cents).
    public var amountMinor: Int?
    public var currency: String?

    enum CodingKeys: String, CodingKey {
        case clickId = "clickId"
        case eventId = "eventId"
        case event = "event"
        case recorded = "recorded"
        case referralId = "referralId"
        case duplicate = "duplicate"
        case commissionId = "commissionId"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(clickId: String? = nil, eventId: String? = nil, event: String? = nil, recorded: Bool? = nil, referralId: String? = nil, duplicate: Bool? = nil, commissionId: String? = nil, amountMinor: Int? = nil, currency: String? = nil) {
        self.clickId = clickId
        self.eventId = eventId
        self.event = event
        self.recorded = recorded
        self.referralId = referralId
        self.duplicate = duplicate
        self.commissionId = commissionId
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostCommissionRulesResponse: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var version: Int
    public var config: GetOpenapiJsonResponse

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case version = "version"
        case config = "config"
    }

    public init(id: String, programId: String, version: Int, config: GetOpenapiJsonResponse) {
        self.id = id
        self.programId = programId
        self.version = version
        self.config = config
    }
}

public struct GetCommissionRulesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [CommissionRule]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [CommissionRule], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetCommissionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [CommissionEvent]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [CommissionEvent], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnersIdBalancesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Balance]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Balance], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostCommissionsApproveDueResponse: Codable, Sendable, Equatable {
    public var approved: Int

    enum CodingKeys: String, CodingKey {
        case approved = "approved"
    }

    public init(approved: Int) {
        self.approved = approved
    }
}

public struct PostCommissionsIdAdjustResponse: Codable, Sendable, Equatable {
    public var id: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
    }

    public init(id: String) {
        self.id = id
    }
}

public struct PutBillingConnectionsIdSecretResponse: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    public var ok: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case ok = "ok"
    }

    public init(id: String, provider: String, ok: Bool) {
        self.id = id
        self.provider = provider
        self.ok = ok
    }
}

public struct PutBillingConnectionsIdCredentialsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    public var ok: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case ok = "ok"
    }

    public init(id: String, provider: String, ok: Bool) {
        self.id = id
        self.provider = provider
        self.ok = ok
    }
}

public struct GetBillingConnectionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [BillingConnection]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [BillingConnection], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutBillingConnectionsIdValueMappingResponse: Codable, Sendable, Equatable {
    public var id: String
    public var valueMapping: ValueMapping

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case valueMapping = "valueMapping"
    }

    public init(id: String, valueMapping: ValueMapping) {
        self.id = id
        self.valueMapping = valueMapping
    }
}

public struct PostBillingConnectionsIdRotateSecretResponse: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    /// Returned only here. The previous secret keeps verifying until previousSecretExpiresAt.
    public var webhookSecret: String
    public var previousSecretExpiresAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case webhookSecret = "webhookSecret"
        case previousSecretExpiresAt = "previousSecretExpiresAt"
    }

    public init(id: String, provider: String, webhookSecret: String, previousSecretExpiresAt: String) {
        self.id = id
        self.provider = provider
        self.webhookSecret = webhookSecret
        self.previousSecretExpiresAt = previousSecretExpiresAt
    }
}

public struct GetBillingEventsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [BillingEvent]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [BillingEvent], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutPartnersIdPayoutProfileResponse: Codable, Sendable, Equatable {
    public var id: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
    }

    public init(id: String) {
        self.id = id
    }
}

public struct PatchPartnersIdPayoutProfileResponse: Codable, Sendable, Equatable {
    public var partnerId: String
    public var method: String
    public var payoutCurrency: String
    /// Integer minor units (cents).
    public var minThresholdMinor: Int

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case method = "method"
        case payoutCurrency = "payoutCurrency"
        case minThresholdMinor = "minThresholdMinor"
    }

    public init(partnerId: String, method: String, payoutCurrency: String, minThresholdMinor: Int) {
        self.partnerId = partnerId
        self.method = method
        self.payoutCurrency = payoutCurrency
        self.minThresholdMinor = minThresholdMinor
    }
}

public struct PostPayoutRunsIdExecuteResponse: Codable, Sendable, Equatable {
    public var sent: Int
    public var submitted: Int
    public var failed: Int

    enum CodingKeys: String, CodingKey {
        case sent = "sent"
        case submitted = "submitted"
        case failed = "failed"
    }

    public init(sent: Int, submitted: Int, failed: Int) {
        self.sent = sent
        self.submitted = submitted
        self.failed = failed
    }
}

public struct PostPayoutRunsIdCancelResponse: Codable, Sendable, Equatable {
    public var cancelled: Int

    enum CodingKeys: String, CodingKey {
        case cancelled = "cancelled"
    }

    public init(cancelled: Int) {
        self.cancelled = cancelled
    }
}

public struct GetPayoutRunsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [PayoutRun]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [PayoutRun], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPayoutsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Payout]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Payout], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetTax1099ResponseDataItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var taxFormType: String
    /// Integer minor units (cents).
    public var totalPaidUsdMinor: Int
    public var requiresForm: Bool
    public var fxMissingCurrencies: [String]

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case taxFormType = "taxFormType"
        case totalPaidUsdMinor = "totalPaidUsdMinor"
        case requiresForm = "requiresForm"
        case fxMissingCurrencies = "fxMissingCurrencies"
    }

    public init(partnerId: String, taxFormType: String, totalPaidUsdMinor: Int, requiresForm: Bool, fxMissingCurrencies: [String]) {
        self.partnerId = partnerId
        self.taxFormType = taxFormType
        self.totalPaidUsdMinor = totalPaidUsdMinor
        self.requiresForm = requiresForm
        self.fxMissingCurrencies = fxMissingCurrencies
    }
}

public struct GetTax1099Response: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetTax1099ResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetTax1099ResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetFxRatesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [FxRate]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [FxRate], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetOrgFxFeedResponse: Codable, Sendable, Equatable {
    public var enabled: Bool
    public var source: String
    public var lastRateDate: String?

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case source = "source"
        case lastRateDate = "lastRateDate"
    }

    public init(enabled: Bool, source: String, lastRateDate: String? = nil) {
        self.enabled = enabled
        self.source = source
        self.lastRateDate = lastRateDate
    }
}

public struct PutOrgFxFeedResponse: Codable, Sendable, Equatable {
    public var enabled: Bool
    public var source: String
    public var synced: Int

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case source = "source"
        case synced = "synced"
    }

    public init(enabled: Bool, source: String, synced: Int) {
        self.enabled = enabled
        self.source = source
        self.synced = synced
    }
}

public struct PostFxRatesSyncResponse: Codable, Sendable, Equatable {
    public var orgId: String
    public var date: String?
    public var inserted: Int

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case date = "date"
        case inserted = "inserted"
    }

    public init(orgId: String, date: String? = nil, inserted: Int) {
        self.orgId = orgId
        self.date = date
        self.inserted = inserted
    }
}

public struct PostFxRatesClearOverrideResponse: Codable, Sendable, Equatable {
    public var base: String
    public var quote: String
    public var cleared: Int

    enum CodingKeys: String, CodingKey {
        case base = "base"
        case quote = "quote"
        case cleared = "cleared"
    }

    public init(base: String, quote: String, cleared: Int) {
        self.base = base
        self.quote = quote
        self.cleared = cleared
    }
}

public struct GetPayoutConnectionsResponseDataItem: Codable, Sendable, Equatable {
    public var provider: String
    public var env: String
    public var status: String
    public var connectedAt: String

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case env = "env"
        case status = "status"
        case connectedAt = "connectedAt"
    }

    public init(provider: String, env: String, status: String, connectedAt: String) {
        self.provider = provider
        self.env = env
        self.status = status
        self.connectedAt = connectedAt
    }
}

public struct GetPayoutConnectionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPayoutConnectionsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPayoutConnectionsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutPayoutConnectionsProviderResponse: Codable, Sendable, Equatable {
    public var provider: String
    public var env: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case env = "env"
        case status = "status"
    }

    public init(provider: String, env: String, status: String) {
        self.provider = provider
        self.env = env
        self.status = status
    }
}

public struct DeletePayoutConnectionsProviderResponse: Codable, Sendable, Equatable {
    public var provider: String
    public var removed: Bool

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case removed = "removed"
    }

    public init(provider: String, removed: Bool) {
        self.provider = provider
        self.removed = removed
    }
}

public struct PostFraudInvalidTrafficScanResponsePartnersItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var clicks: Int
    public var probability: Double
    public var label: String
    public var contributions: [String: Double]

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case clicks = "clicks"
        case probability = "probability"
        case label = "label"
        case contributions = "contributions"
    }

    public init(partnerId: String, clicks: Int, probability: Double, label: String, contributions: [String: Double]) {
        self.partnerId = partnerId
        self.clicks = clicks
        self.probability = probability
        self.label = label
        self.contributions = contributions
    }
}

public struct PostFraudInvalidTrafficScanResponse: Codable, Sendable, Equatable {
    public var window: String
    public var partners: [PostFraudInvalidTrafficScanResponsePartnersItem]
    public var flagged: Int

    enum CodingKeys: String, CodingKey {
        case window = "window"
        case partners = "partners"
        case flagged = "flagged"
    }

    public init(window: String, partners: [PostFraudInvalidTrafficScanResponsePartnersItem], flagged: Int) {
        self.window = window
        self.partners = partners
        self.flagged = flagged
    }
}

public struct GetFraudCasesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [FraudCase]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [FraudCase], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnersIdQualityResponseLiveMetrics: Codable, Sendable, Equatable {
    public var customers: Double
    public var repeatPayerRate: Double
    public var refundRate: Double
    public var disputeRate: Double
    public var trialToPaidRate: Double
    public var identityRiskRate: Double?
    public var valuePatternPenalty: Double?

    enum CodingKeys: String, CodingKey {
        case customers = "customers"
        case repeatPayerRate = "repeatPayerRate"
        case refundRate = "refundRate"
        case disputeRate = "disputeRate"
        case trialToPaidRate = "trialToPaidRate"
        case identityRiskRate = "identityRiskRate"
        case valuePatternPenalty = "valuePatternPenalty"
    }

    public init(customers: Double, repeatPayerRate: Double, refundRate: Double, disputeRate: Double, trialToPaidRate: Double, identityRiskRate: Double? = nil, valuePatternPenalty: Double? = nil) {
        self.customers = customers
        self.repeatPayerRate = repeatPayerRate
        self.refundRate = refundRate
        self.disputeRate = disputeRate
        self.trialToPaidRate = trialToPaidRate
        self.identityRiskRate = identityRiskRate
        self.valuePatternPenalty = valuePatternPenalty
    }
}

public struct GetPartnersIdQualityResponseLive: Codable, Sendable, Equatable {
    public var score: Double
    public var metrics: GetPartnersIdQualityResponseLiveMetrics

    enum CodingKeys: String, CodingKey {
        case score = "score"
        case metrics = "metrics"
    }

    public init(score: Double, metrics: GetPartnersIdQualityResponseLiveMetrics) {
        self.score = score
        self.metrics = metrics
    }
}

public struct GetPartnersIdQualityResponseLastSnapshotOption1: Codable, Sendable, Equatable {
    public var score: Double
    public var metrics: GetOpenapiJsonResponse
    public var computedAt: String

    enum CodingKeys: String, CodingKey {
        case score = "score"
        case metrics = "metrics"
        case computedAt = "computedAt"
    }

    public init(score: Double, metrics: GetOpenapiJsonResponse, computedAt: String) {
        self.score = score
        self.metrics = metrics
        self.computedAt = computedAt
    }
}

public struct GetPartnersIdQualityResponse: Codable, Sendable, Equatable {
    public var partnerId: String
    public var live: GetPartnersIdQualityResponseLive
    public var lastSnapshot: GetPartnersIdQualityResponseLastSnapshotOption1?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case live = "live"
        case lastSnapshot = "lastSnapshot"
    }

    public init(partnerId: String, live: GetPartnersIdQualityResponseLive, lastSnapshot: GetPartnersIdQualityResponseLastSnapshotOption1? = nil) {
        self.partnerId = partnerId
        self.live = live
        self.lastSnapshot = lastSnapshot
    }
}

public struct PostQualityRecomputeResponse: Codable, Sendable, Equatable {
    public var partners: Int
    public var casesOpened: Int
    public var suspended: Int

    enum CodingKeys: String, CodingKey {
        case partners = "partners"
        case casesOpened = "casesOpened"
        case suspended = "suspended"
    }

    public init(partners: Int, casesOpened: Int, suspended: Int) {
        self.partners = partners
        self.casesOpened = casesOpened
        self.suspended = suspended
    }
}

public struct PostFraudDetectRingsResponse: Codable, Sendable, Equatable {
    public var ringsFound: Int

    enum CodingKeys: String, CodingKey {
        case ringsFound = "ringsFound"
    }

    public init(ringsFound: Int) {
        self.ringsFound = ringsFound
    }
}

public struct GetReportsFilteredClicksResponseDataItem: Codable, Sendable, Equatable {
    public var day: String
    public var filtered: Int
    public var total: Int
    public var avgScore: Double

    enum CodingKeys: String, CodingKey {
        case day = "day"
        case filtered = "filtered"
        case total = "total"
        case avgScore = "avgScore"
    }

    public init(day: String, filtered: Int, total: Int, avgScore: Double) {
        self.day = day
        self.filtered = filtered
        self.total = total
        self.avgScore = avgScore
    }
}

public struct GetReportsFilteredClicksResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetReportsFilteredClicksResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetReportsFilteredClicksResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAnalyticsOverviewResponseFunnel: Codable, Sendable, Equatable {
    public var clickToSignup: Double
    public var signupToPaid: Double

    enum CodingKeys: String, CodingKey {
        case clickToSignup = "clickToSignup"
        case signupToPaid = "signupToPaid"
    }

    public init(clickToSignup: Double, signupToPaid: Double) {
        self.clickToSignup = clickToSignup
        self.signupToPaid = signupToPaid
    }
}

public struct GetAnalyticsOverviewResponse: Codable, Sendable, Equatable {
    public var clicks: Int
    public var filteredClicks: Int
    public var visitors: Int
    public var signups: Int
    public var payments: Int
    /// Integer minor units (cents).
    public var revenueMinor: Int
    /// Integer minor units (cents).
    public var commissionEarnedMinor: Int
    /// Integer minor units (cents).
    public var commissionReversedMinor: Int
    public var activePartners: Int
    public var funnel: GetAnalyticsOverviewResponseFunnel

    enum CodingKeys: String, CodingKey {
        case clicks = "clicks"
        case filteredClicks = "filteredClicks"
        case visitors = "visitors"
        case signups = "signups"
        case payments = "payments"
        case revenueMinor = "revenueMinor"
        case commissionEarnedMinor = "commissionEarnedMinor"
        case commissionReversedMinor = "commissionReversedMinor"
        case activePartners = "activePartners"
        case funnel = "funnel"
    }

    public init(clicks: Int, filteredClicks: Int, visitors: Int, signups: Int, payments: Int, revenueMinor: Int, commissionEarnedMinor: Int, commissionReversedMinor: Int, activePartners: Int, funnel: GetAnalyticsOverviewResponseFunnel) {
        self.clicks = clicks
        self.filteredClicks = filteredClicks
        self.visitors = visitors
        self.signups = signups
        self.payments = payments
        self.revenueMinor = revenueMinor
        self.commissionEarnedMinor = commissionEarnedMinor
        self.commissionReversedMinor = commissionReversedMinor
        self.activePartners = activePartners
        self.funnel = funnel
    }
}

public struct GetAnalyticsTimeseriesResponseDataItem: Codable, Sendable, Equatable {
    public var day: String
    public var value: Double

    enum CodingKeys: String, CodingKey {
        case day = "day"
        case value = "value"
    }

    public init(day: String, value: Double) {
        self.day = day
        self.value = value
    }
}

public struct GetAnalyticsTimeseriesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAnalyticsTimeseriesResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAnalyticsTimeseriesResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAnalyticsCohortLtvResponseDataItem: Codable, Sendable, Equatable {
    public var cohort: String
    public var customers: Int
    /// Integer minor units (cents).
    public var revenueMinor: Int
    /// Integer minor units (cents).
    public var ltvMinor: Int

    enum CodingKeys: String, CodingKey {
        case cohort = "cohort"
        case customers = "customers"
        case revenueMinor = "revenueMinor"
        case ltvMinor = "ltvMinor"
    }

    public init(cohort: String, customers: Int, revenueMinor: Int, ltvMinor: Int) {
        self.cohort = cohort
        self.customers = customers
        self.revenueMinor = revenueMinor
        self.ltvMinor = ltvMinor
    }
}

public struct GetAnalyticsCohortLtvResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAnalyticsCohortLtvResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAnalyticsCohortLtvResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAnalyticsByGeoResponseDataItem: Codable, Sendable, Equatable {
    public var geo: String
    public var referrals: Int
    /// Integer minor units (cents).
    public var revenueMinor: Int

    enum CodingKeys: String, CodingKey {
        case geo = "geo"
        case referrals = "referrals"
        case revenueMinor = "revenueMinor"
    }

    public init(geo: String, referrals: Int, revenueMinor: Int) {
        self.geo = geo
        self.referrals = referrals
        self.revenueMinor = revenueMinor
    }
}

public struct GetAnalyticsByGeoResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAnalyticsByGeoResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAnalyticsByGeoResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAnalyticsByChannelResponseDataItem: Codable, Sendable, Equatable {
    public var channel: String
    public var referrals: Int
    /// Integer minor units (cents).
    public var revenueMinor: Int

    enum CodingKeys: String, CodingKey {
        case channel = "channel"
        case referrals = "referrals"
        case revenueMinor = "revenueMinor"
    }

    public init(channel: String, referrals: Int, revenueMinor: Int) {
        self.channel = channel
        self.referrals = referrals
        self.revenueMinor = revenueMinor
    }
}

public struct GetAnalyticsByChannelResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAnalyticsByChannelResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAnalyticsByChannelResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAnalyticsCouponPerformanceResponseDataItem: Codable, Sendable, Equatable {
    public var code: String
    public var partnerId: String
    public var referrals: Int
    /// Integer minor units (cents).
    public var revenueMinor: Int

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case partnerId = "partnerId"
        case referrals = "referrals"
        case revenueMinor = "revenueMinor"
    }

    public init(code: String, partnerId: String, referrals: Int, revenueMinor: Int) {
        self.code = code
        self.partnerId = partnerId
        self.referrals = referrals
        self.revenueMinor = revenueMinor
    }
}

public struct GetAnalyticsCouponPerformanceResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAnalyticsCouponPerformanceResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAnalyticsCouponPerformanceResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetReportsPartnerPerformanceResponseValueItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var displayName: String
    public var email: String
    public var status: String
    public var clicks: Int
    public var referrals: Int
    public var payments: Int
    /// Integer minor units (cents).
    public var revenueMinor: Int
    /// Integer minor units (cents).
    public var earnedMinor: Int
    /// Integer minor units (cents).
    public var reversedMinor: Int

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case displayName = "displayName"
        case email = "email"
        case status = "status"
        case clicks = "clicks"
        case referrals = "referrals"
        case payments = "payments"
        case revenueMinor = "revenueMinor"
        case earnedMinor = "earnedMinor"
        case reversedMinor = "reversedMinor"
    }

    public init(partnerId: String, displayName: String, email: String, status: String, clicks: Int, referrals: Int, payments: Int, revenueMinor: Int, earnedMinor: Int, reversedMinor: Int) {
        self.partnerId = partnerId
        self.displayName = displayName
        self.email = email
        self.status = status
        self.clicks = clicks
        self.referrals = referrals
        self.payments = payments
        self.revenueMinor = revenueMinor
        self.earnedMinor = earnedMinor
        self.reversedMinor = reversedMinor
    }
}

public typealias GetReportsPartnerPerformanceResponse = [GetReportsPartnerPerformanceResponseValueItem]

public struct GetProfitabilitySettingsResponse: Codable, Sendable, Equatable {
    public var reportingCurrency: String
    public var defaultMarginBps: Int?
    public var creditCostModel: String
    public var creditCostRatioBps: Int?
    public var inference: String
    public var creditDraw: String
    public var windowDays: Int
    public var churnWindowDays: Int
    public var countReferrerSpend: Bool
    public var costToServeMinorPerMonth: Int?
    public var taxFeesReduceProfit: Bool
    public var valuePatternWeight: Double
    /// Target ROI as a multiple in bps (20000 = 2.0x); unset or null = no target.
    public var targetRoiBps: Int?

    enum CodingKeys: String, CodingKey {
        case reportingCurrency = "reportingCurrency"
        case defaultMarginBps = "defaultMarginBps"
        case creditCostModel = "creditCostModel"
        case creditCostRatioBps = "creditCostRatioBps"
        case inference = "inference"
        case creditDraw = "creditDraw"
        case windowDays = "windowDays"
        case churnWindowDays = "churnWindowDays"
        case countReferrerSpend = "countReferrerSpend"
        case costToServeMinorPerMonth = "costToServeMinorPerMonth"
        case taxFeesReduceProfit = "taxFeesReduceProfit"
        case valuePatternWeight = "valuePatternWeight"
        case targetRoiBps = "targetRoiBps"
    }

    public init(reportingCurrency: String, defaultMarginBps: Int? = nil, creditCostModel: String, creditCostRatioBps: Int? = nil, inference: String, creditDraw: String, windowDays: Int, churnWindowDays: Int, countReferrerSpend: Bool, costToServeMinorPerMonth: Int? = nil, taxFeesReduceProfit: Bool, valuePatternWeight: Double, targetRoiBps: Int? = nil) {
        self.reportingCurrency = reportingCurrency
        self.defaultMarginBps = defaultMarginBps
        self.creditCostModel = creditCostModel
        self.creditCostRatioBps = creditCostRatioBps
        self.inference = inference
        self.creditDraw = creditDraw
        self.windowDays = windowDays
        self.churnWindowDays = churnWindowDays
        self.countReferrerSpend = countReferrerSpend
        self.costToServeMinorPerMonth = costToServeMinorPerMonth
        self.taxFeesReduceProfit = taxFeesReduceProfit
        self.valuePatternWeight = valuePatternWeight
        self.targetRoiBps = targetRoiBps
    }
}

public struct GetProfitabilityProductsResponse: Codable, Sendable, Equatable {
    public var data: [GetProfitabilityProductsProductRefResponse]

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    public init(data: [GetProfitabilityProductsProductRefResponse]) {
        self.data = data
    }
}

public struct GetProfitabilityProductsProductRefResponse: Codable, Sendable, Equatable {
    public var productRef: String
    public var marginBps: Int?
    public var unitCostMinor: Int?
    public var currency: String
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case productRef = "productRef"
        case marginBps = "marginBps"
        case unitCostMinor = "unitCostMinor"
        case currency = "currency"
        case updatedAt = "updatedAt"
    }

    public init(productRef: String, marginBps: Int? = nil, unitCostMinor: Int? = nil, currency: String, updatedAt: String) {
        self.productRef = productRef
        self.marginBps = marginBps
        self.unitCostMinor = unitCostMinor
        self.currency = currency
        self.updatedAt = updatedAt
    }
}

public struct PostProfitabilityRebuildResponse: Codable, Sendable, Equatable {
    public var jobId: String

    enum CodingKeys: String, CodingKey {
        case jobId = "jobId"
    }

    public init(jobId: String) {
        self.jobId = jobId
    }
}

public struct GetProfitabilityRebuildJobIdResponse: Codable, Sendable, Equatable {
    public var status: String
    public var processed: Int
    public var total: Int
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case processed = "processed"
        case total = "total"
        case error = "error"
    }

    public init(status: String, processed: Int, total: Int, error: String? = nil) {
        self.status = status
        self.processed = processed
        self.total = total
        self.error = error
    }
}

public struct GetRoiBreakdownResponseDataItemCoverage: Codable, Sendable, Equatable {
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var creditAppliedReportedBps: Int?
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var marginCoveredBps: Int?
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var inferredShareBps: Int?

    enum CodingKeys: String, CodingKey {
        case creditAppliedReportedBps = "creditAppliedReportedBps"
        case marginCoveredBps = "marginCoveredBps"
        case inferredShareBps = "inferredShareBps"
    }

    public init(creditAppliedReportedBps: Int? = nil, marginCoveredBps: Int? = nil, inferredShareBps: Int? = nil) {
        self.creditAppliedReportedBps = creditAppliedReportedBps
        self.marginCoveredBps = marginCoveredBps
        self.inferredShareBps = inferredShareBps
    }
}

/// Partner and program rows: their referrals, both sides, commissions included.
public struct GetRoiBreakdownResponseDataItemReferrals: Codable, Sendable, Equatable {
    public var count: Int
    /// Integer minor units (cents).
    public var costMinor: Int
    /// Integer minor units (cents).
    public var cashCommissionMinor: Int
    public var netMinor: Int?
    /// Profit after ÷ cost, 4 decimals; null with no cost or unknown profit.
    public var roi: Double?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case costMinor = "costMinor"
        case cashCommissionMinor = "cashCommissionMinor"
        case netMinor = "netMinor"
        case roi = "roi"
    }

    public init(count: Int, costMinor: Int, cashCommissionMinor: Int, netMinor: Int? = nil, roi: Double? = nil) {
        self.count = count
        self.costMinor = costMinor
        self.cashCommissionMinor = cashCommissionMinor
        self.netMinor = netMinor
        self.roi = roi
    }
}

public struct GetRoiBreakdownResponseDataItem: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var creditCostMinor: Int
    /// Integer minor units (cents).
    public var cashAfterMinor: Int
    public var profitAfterMinor: Int?
    public var netMinor: Int?
    /// Profit after ÷ cost, 4 decimals; null with no cost or unknown profit.
    public var roi: Double?
    /// Basis points (10000 = 100%); null when there is nothing to divide by.
    public var paidBackShareBps: Int?
    public var medianPaybackDays: Double?
    public var grants: Int
    public var profitSources: [String: Int]
    public var coverage: GetRoiBreakdownResponseDataItemCoverage
    /// Face not yet used, expired or revoked, in the reporting currency.
    public var outstandingCreditMinor: Int
    /// Outstanding credit priced by each grant's cost model; null when a model needs a margin and none is known.
    public var outstandingCostIfUsedMinor: Int?
    public var key: String
    public var label: String
    /// Partner and program rows: their referrals, both sides, commissions included.
    public var referrals: GetRoiBreakdownResponseDataItemReferrals?

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case creditCostMinor = "creditCostMinor"
        case cashAfterMinor = "cashAfterMinor"
        case profitAfterMinor = "profitAfterMinor"
        case netMinor = "netMinor"
        case roi = "roi"
        case paidBackShareBps = "paidBackShareBps"
        case medianPaybackDays = "medianPaybackDays"
        case grants = "grants"
        case profitSources = "profitSources"
        case coverage = "coverage"
        case outstandingCreditMinor = "outstandingCreditMinor"
        case outstandingCostIfUsedMinor = "outstandingCostIfUsedMinor"
        case key = "key"
        case label = "label"
        case referrals = "referrals"
    }

    public init(currency: String, creditCostMinor: Int, cashAfterMinor: Int, profitAfterMinor: Int? = nil, netMinor: Int? = nil, roi: Double? = nil, paidBackShareBps: Int? = nil, medianPaybackDays: Double? = nil, grants: Int, profitSources: [String: Int], coverage: GetRoiBreakdownResponseDataItemCoverage, outstandingCreditMinor: Int, outstandingCostIfUsedMinor: Int? = nil, key: String, label: String, referrals: GetRoiBreakdownResponseDataItemReferrals? = nil) {
        self.currency = currency
        self.creditCostMinor = creditCostMinor
        self.cashAfterMinor = cashAfterMinor
        self.profitAfterMinor = profitAfterMinor
        self.netMinor = netMinor
        self.roi = roi
        self.paidBackShareBps = paidBackShareBps
        self.medianPaybackDays = medianPaybackDays
        self.grants = grants
        self.profitSources = profitSources
        self.coverage = coverage
        self.outstandingCreditMinor = outstandingCreditMinor
        self.outstandingCostIfUsedMinor = outstandingCostIfUsedMinor
        self.key = key
        self.label = label
        self.referrals = referrals
    }
}

public struct GetRoiBreakdownResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetRoiBreakdownResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetRoiBreakdownResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetRoiGrantsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [RoiGrant]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [RoiGrant], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetRoiPatternsResponsePatterns: Codable, Sendable, Equatable {
    public var creditOnly: [RoiPatternEntry]
    public var churnAtExhaustion: [RoiPatternEntry]
    public var bonusCollector: [RoiPatternEntry]
    public var negativePartner: [RoiPatternEntry]

    enum CodingKeys: String, CodingKey {
        case creditOnly = "credit_only"
        case churnAtExhaustion = "churn_at_exhaustion"
        case bonusCollector = "bonus_collector"
        case negativePartner = "negative_partner"
    }

    public init(creditOnly: [RoiPatternEntry], churnAtExhaustion: [RoiPatternEntry], bonusCollector: [RoiPatternEntry], negativePartner: [RoiPatternEntry]) {
        self.creditOnly = creditOnly
        self.churnAtExhaustion = churnAtExhaustion
        self.bonusCollector = bonusCollector
        self.negativePartner = negativePartner
    }
}

public struct GetRoiPatternsResponse: Codable, Sendable, Equatable {
    public var patterns: GetRoiPatternsResponsePatterns

    enum CodingKeys: String, CodingKey {
        case patterns = "patterns"
    }

    public init(patterns: GetRoiPatternsResponsePatterns) {
        self.patterns = patterns
    }
}

public struct GetRoiPatternsPatternResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [RoiPatternEntry]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [RoiPatternEntry], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetRoiDataQualityResponseGapsItemFix: Codable, Sendable, Equatable {
    public var text: String
    public var href: String

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case href = "href"
    }

    public init(text: String, href: String) {
        self.text = text
        self.href = href
    }
}

public struct GetRoiDataQualityResponseGapsItem: Codable, Sendable, Equatable {
    public var code: String
    public var count: Int
    public var fix: GetRoiDataQualityResponseGapsItemFix

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case count = "count"
        case fix = "fix"
    }

    public init(code: String, count: Int, fix: GetRoiDataQualityResponseGapsItemFix) {
        self.code = code
        self.count = count
        self.fix = fix
    }
}

public struct GetRoiDataQualityResponse: Codable, Sendable, Equatable {
    public var paymentsTotal: Int
    public var paymentsWithCreditInfo: Int
    public var productsWithMargin: Int
    public var productsSeen: Int
    public var partnersLinked: Int
    public var partnersTotal: Int
    public var excludedForFx: Int
    public var gaps: [GetRoiDataQualityResponseGapsItem]

    enum CodingKeys: String, CodingKey {
        case paymentsTotal = "paymentsTotal"
        case paymentsWithCreditInfo = "paymentsWithCreditInfo"
        case productsWithMargin = "productsWithMargin"
        case productsSeen = "productsSeen"
        case partnersLinked = "partnersLinked"
        case partnersTotal = "partnersTotal"
        case excludedForFx = "excludedForFx"
        case gaps = "gaps"
    }

    public init(paymentsTotal: Int, paymentsWithCreditInfo: Int, productsWithMargin: Int, productsSeen: Int, partnersLinked: Int, partnersTotal: Int, excludedForFx: Int, gaps: [GetRoiDataQualityResponseGapsItem]) {
        self.paymentsTotal = paymentsTotal
        self.paymentsWithCreditInfo = paymentsWithCreditInfo
        self.productsWithMargin = productsWithMargin
        self.productsSeen = productsSeen
        self.partnersLinked = partnersLinked
        self.partnersTotal = partnersTotal
        self.excludedForFx = excludedForFx
        self.gaps = gaps
    }
}

public struct PostValueEventsResponseResultsItem: Codable, Sendable, Equatable {
    public var index: Int
    public var id: String
    public var created: Bool
    public var superseded: [String]

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case id = "id"
        case created = "created"
        case superseded = "superseded"
    }

    public init(index: Int, id: String, created: Bool, superseded: [String]) {
        self.index = index
        self.id = id
        self.created = created
        self.superseded = superseded
    }
}

public struct PostValueEventsResponseErrorsItem: Codable, Sendable, Equatable {
    public var index: Int
    public var message: String

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case message = "message"
    }

    public init(index: Int, message: String) {
        self.index = index
        self.message = message
    }
}

public struct PostValueEventsResponse: Codable, Sendable, Equatable {
    public var results: [PostValueEventsResponseResultsItem]
    public var errors: [PostValueEventsResponseErrorsItem]

    enum CodingKeys: String, CodingKey {
        case results = "results"
        case errors = "errors"
    }

    public init(results: [PostValueEventsResponseResultsItem], errors: [PostValueEventsResponseErrorsItem]) {
        self.results = results
        self.errors = errors
    }
}

public struct PostValueImportResponseValueOption1ErrorsItem: Codable, Sendable, Equatable {
    public var row: Int
    public var error: String

    enum CodingKeys: String, CodingKey {
        case row = "row"
        case error = "error"
    }

    public init(row: Int, error: String) {
        self.row = row
        self.error = error
    }
}

public struct PostValueImportResponseValueOption1: Codable, Sendable, Equatable {
    public var rows: [[String: JSONValue]]
    public var errors: [PostValueImportResponseValueOption1ErrorsItem]
    public var total: Int

    enum CodingKeys: String, CodingKey {
        case rows = "rows"
        case errors = "errors"
        case total = "total"
    }

    public init(rows: [[String: JSONValue]], errors: [PostValueImportResponseValueOption1ErrorsItem], total: Int) {
        self.rows = rows
        self.errors = errors
        self.total = total
    }
}

public struct PostValueImportResponseValueOption2ErrorsItem: Codable, Sendable, Equatable {
    public var row: Int
    public var error: String

    enum CodingKeys: String, CodingKey {
        case row = "row"
        case error = "error"
    }

    public init(row: Int, error: String) {
        self.row = row
        self.error = error
    }
}

public struct PostValueImportResponseValueOption2: Codable, Sendable, Equatable {
    public var recorded: Int
    public var duplicates: Int
    public var errors: [PostValueImportResponseValueOption2ErrorsItem]

    enum CodingKeys: String, CodingKey {
        case recorded = "recorded"
        case duplicates = "duplicates"
        case errors = "errors"
    }

    public init(recorded: Int, duplicates: Int, errors: [PostValueImportResponseValueOption2ErrorsItem]) {
        self.recorded = recorded
        self.duplicates = duplicates
        self.errors = errors
    }
}

public struct PostValueImportResponseValueOption3: Codable, Sendable, Equatable {
    /// Status 202: the file is recorded in the background; poll GET /v1/value/import/{jobId}.
    public var jobId: String

    enum CodingKeys: String, CodingKey {
        case jobId = "jobId"
    }

    public init(jobId: String) {
        self.jobId = jobId
    }
}

public typealias PostValueImportResponse = JSONValue

public struct GetValueImportJobIdResponseErrorsItem: Codable, Sendable, Equatable {
    public var row: Int
    public var error: String

    enum CodingKeys: String, CodingKey {
        case row = "row"
        case error = "error"
    }

    public init(row: Int, error: String) {
        self.row = row
        self.error = error
    }
}

public struct GetValueImportJobIdResponse: Codable, Sendable, Equatable {
    public var status: String
    /// Parsed rows handed to recording so far.
    public var processed: Int
    /// Parsed rows to record (rows that failed to parse are only in errors).
    public var total: Int
    public var recorded: Int
    public var duplicates: Int
    /// Parse and record errors so far, by spreadsheet row (header is row 1).
    public var errors: [GetValueImportJobIdResponseErrorsItem]
    /// Why the job failed ('stale': its process stopped).
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case processed = "processed"
        case total = "total"
        case recorded = "recorded"
        case duplicates = "duplicates"
        case errors = "errors"
        case error = "error"
    }

    public init(status: String, processed: Int, total: Int, recorded: Int, duplicates: Int, errors: [GetValueImportJobIdResponseErrorsItem], error: String? = nil) {
        self.status = status
        self.processed = processed
        self.total = total
        self.recorded = recorded
        self.duplicates = duplicates
        self.errors = errors
        self.error = error
    }
}

public struct GetPartnerKycStatusResponse: Codable, Sendable, Equatable {
    public var kycStatus: String
    public var sanctionsStatus: String
    public var verifiedAt: String?

    enum CodingKeys: String, CodingKey {
        case kycStatus = "kycStatus"
        case sanctionsStatus = "sanctionsStatus"
        case verifiedAt = "verifiedAt"
    }

    public init(kycStatus: String, sanctionsStatus: String, verifiedAt: String? = nil) {
        self.kycStatus = kycStatus
        self.sanctionsStatus = sanctionsStatus
        self.verifiedAt = verifiedAt
    }
}

public struct PostPartnerKycSubmitResponse: Codable, Sendable, Equatable {
    public var kycStatus: String
    public var sanctionsStatus: String

    enum CodingKeys: String, CodingKey {
        case kycStatus = "kycStatus"
        case sanctionsStatus = "sanctionsStatus"
    }

    public init(kycStatus: String, sanctionsStatus: String) {
        self.kycStatus = kycStatus
        self.sanctionsStatus = sanctionsStatus
    }
}

public struct GetPartnerMeResponseAccount: Codable, Sendable, Equatable {
    public var id: String
    public var email: String
    public var name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case name = "name"
    }

    public init(id: String, email: String, name: String? = nil) {
        self.id = id
        self.email = email
        self.name = name
    }
}

public struct GetPartnerMeResponseMembershipsItemProgramsItem: Codable, Sendable, Equatable {
    public var programId: String
    public var name: String
    public var slug: String
    public var enrollmentId: String
    public var enrollmentStatus: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case name = "name"
        case slug = "slug"
        case enrollmentId = "enrollmentId"
        case enrollmentStatus = "enrollmentStatus"
    }

    public init(programId: String, name: String, slug: String, enrollmentId: String, enrollmentStatus: String) {
        self.programId = programId
        self.name = name
        self.slug = slug
        self.enrollmentId = enrollmentId
        self.enrollmentStatus = enrollmentStatus
    }
}

public struct GetPartnerMeResponseMembershipsItem: Codable, Sendable, Equatable {
    public var orgId: String
    public var orgName: String
    public var partnerId: String
    public var programs: [GetPartnerMeResponseMembershipsItemProgramsItem]

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case orgName = "orgName"
        case partnerId = "partnerId"
        case programs = "programs"
    }

    public init(orgId: String, orgName: String, partnerId: String, programs: [GetPartnerMeResponseMembershipsItemProgramsItem]) {
        self.orgId = orgId
        self.orgName = orgName
        self.partnerId = partnerId
        self.programs = programs
    }
}

public struct GetPartnerMeResponse: Codable, Sendable, Equatable {
    public var account: GetPartnerMeResponseAccount?
    public var memberships: [GetPartnerMeResponseMembershipsItem]

    enum CodingKeys: String, CodingKey {
        case account = "account"
        case memberships = "memberships"
    }

    public init(account: GetPartnerMeResponseAccount? = nil, memberships: [GetPartnerMeResponseMembershipsItem]) {
        self.account = account
        self.memberships = memberships
    }
}

public struct GetPartnerStatsResponseDataItem: Codable, Sendable, Equatable {
    public var orgId: String
    public var partnerId: String
    public var clicks: Int
    public var referrals: Int
    public var payments: Int
    public var balances: [Balance]

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case partnerId = "partnerId"
        case clicks = "clicks"
        case referrals = "referrals"
        case payments = "payments"
        case balances = "balances"
    }

    public init(orgId: String, partnerId: String, clicks: Int, referrals: Int, payments: Int, balances: [Balance]) {
        self.orgId = orgId
        self.partnerId = partnerId
        self.clicks = clicks
        self.referrals = referrals
        self.payments = payments
        self.balances = balances
    }
}

public struct GetPartnerStatsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerStatsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerStatsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerLinksResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var orgId: String
    public var programId: String
    public var code: String
    public var destinationUrl: String
    public var shortPath: String
    /// Absolute link, on the merchant's verified link domain when it has one.
    public var shortUrl: String
    public var directParam: String
    public var clicks: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case orgId = "orgId"
        case programId = "programId"
        case code = "code"
        case destinationUrl = "destinationUrl"
        case shortPath = "shortPath"
        case shortUrl = "shortUrl"
        case directParam = "directParam"
        case clicks = "clicks"
    }

    public init(id: String, orgId: String, programId: String, code: String, destinationUrl: String, shortPath: String, shortUrl: String, directParam: String, clicks: Int) {
        self.id = id
        self.orgId = orgId
        self.programId = programId
        self.code = code
        self.destinationUrl = destinationUrl
        self.shortPath = shortPath
        self.shortUrl = shortUrl
        self.directParam = directParam
        self.clicks = clicks
    }
}

public struct GetPartnerLinksResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerLinksResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerLinksResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerAssetsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var orgId: String
    public var orgName: String
    public var programId: String
    public var programName: String
    public var kind: String
    public var title: String
    public var content: String
    public var dimensions: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case orgId = "orgId"
        case orgName = "orgName"
        case programId = "programId"
        case programName = "programName"
        case kind = "kind"
        case title = "title"
        case content = "content"
        case dimensions = "dimensions"
        case createdAt = "createdAt"
    }

    public init(id: String, orgId: String, orgName: String, programId: String, programName: String, kind: String, title: String, content: String, dimensions: String, createdAt: String) {
        self.id = id
        self.orgId = orgId
        self.orgName = orgName
        self.programId = programId
        self.programName = programName
        self.kind = kind
        self.title = title
        self.content = content
        self.dimensions = dimensions
        self.createdAt = createdAt
    }
}

public struct GetPartnerAssetsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerAssetsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerAssetsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerDisputesResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var orgId: String
    public var orgName: String
    public var referralId: String?
    public var kind: String
    public var status: String
    public var detail: String
    public var resolution: String?
    public var createdAt: String
    public var resolvedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case orgId = "orgId"
        case orgName = "orgName"
        case referralId = "referralId"
        case kind = "kind"
        case status = "status"
        case detail = "detail"
        case resolution = "resolution"
        case createdAt = "createdAt"
        case resolvedAt = "resolvedAt"
    }

    public init(id: String, orgId: String, orgName: String, referralId: String? = nil, kind: String, status: String, detail: String, resolution: String? = nil, createdAt: String, resolvedAt: String? = nil) {
        self.id = id
        self.orgId = orgId
        self.orgName = orgName
        self.referralId = referralId
        self.kind = kind
        self.status = status
        self.detail = detail
        self.resolution = resolution
        self.createdAt = createdAt
        self.resolvedAt = resolvedAt
    }
}

public struct GetPartnerDisputesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerDisputesResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerDisputesResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerReferralsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var orgId: String
    public var programId: String
    /// Redacted to the last 4 characters.
    public var customer: String
    public var status: String
    public var matchedVia: String
    public var ts: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case orgId = "orgId"
        case programId = "programId"
        case customer = "customer"
        case status = "status"
        case matchedVia = "matchedVia"
        case ts = "ts"
    }

    public init(id: String, orgId: String, programId: String, customer: String, status: String, matchedVia: String, ts: String) {
        self.id = id
        self.orgId = orgId
        self.programId = programId
        self.customer = customer
        self.status = status
        self.matchedVia = matchedVia
        self.ts = ts
    }
}

public struct GetPartnerReferralsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerReferralsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerReferralsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerReferralsIdTransparencyResponse: Codable, Sendable, Equatable {
    public var referralId: String
    public var status: String
    public var matchedVia: String
    public var confidence: Double
    public var model: String?
    public var windowDays: Int?
    public var consideredTouchpoints: Int
    public var yourCreditWeight: Double
    public var notes: [String]
    public var noteCodes: [ReasonNote]

    enum CodingKeys: String, CodingKey {
        case referralId = "referralId"
        case status = "status"
        case matchedVia = "matchedVia"
        case confidence = "confidence"
        case model = "model"
        case windowDays = "windowDays"
        case consideredTouchpoints = "consideredTouchpoints"
        case yourCreditWeight = "yourCreditWeight"
        case notes = "notes"
        case noteCodes = "noteCodes"
    }

    public init(referralId: String, status: String, matchedVia: String, confidence: Double, model: String? = nil, windowDays: Int? = nil, consideredTouchpoints: Int, yourCreditWeight: Double, notes: [String], noteCodes: [ReasonNote]) {
        self.referralId = referralId
        self.status = status
        self.matchedVia = matchedVia
        self.confidence = confidence
        self.model = model
        self.windowDays = windowDays
        self.consideredTouchpoints = consideredTouchpoints
        self.yourCreditWeight = yourCreditWeight
        self.notes = notes
        self.noteCodes = noteCodes
    }
}

public struct GetPartnerPayoutsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var orgId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var status: String
    public var rail: String
    public var sentAt: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case orgId = "orgId"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case status = "status"
        case rail = "rail"
        case sentAt = "sentAt"
        case createdAt = "createdAt"
    }

    public init(id: String, orgId: String, amountMinor: Int, currency: String, status: String, rail: String, sentAt: String? = nil, createdAt: String) {
        self.id = id
        self.orgId = orgId
        self.amountMinor = amountMinor
        self.currency = currency
        self.status = status
        self.rail = rail
        self.sentAt = sentAt
        self.createdAt = createdAt
    }
}

public struct GetPartnerPayoutsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerPayoutsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerPayoutsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutPartnerOrgsOrgIdPayoutProfileResponse: Codable, Sendable, Equatable {
    public var id: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
    }

    public init(id: String) {
        self.id = id
    }
}

public struct GetPartnerProgramsProgramIdLeaderboardResponseContestOption1: Codable, Sendable, Equatable {
    public var startsAt: String
    public var endsAt: String
    public var prize: String?

    enum CodingKeys: String, CodingKey {
        case startsAt = "startsAt"
        case endsAt = "endsAt"
        case prize = "prize"
    }

    public init(startsAt: String, endsAt: String, prize: String? = nil) {
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.prize = prize
    }
}

public struct GetPartnerProgramsProgramIdLeaderboardResponseRowsItem: Codable, Sendable, Equatable {
    public var rank: Int
    public var name: String
    /// Integer minor units (cents).
    public var approvedMinor: Int
    public var you: Bool

    enum CodingKeys: String, CodingKey {
        case rank = "rank"
        case name = "name"
        case approvedMinor = "approvedMinor"
        case you = "you"
    }

    public init(rank: Int, name: String, approvedMinor: Int, you: Bool) {
        self.rank = rank
        self.name = name
        self.approvedMinor = approvedMinor
        self.you = you
    }
}

public struct GetPartnerProgramsProgramIdLeaderboardResponse: Codable, Sendable, Equatable {
    public var contest: GetPartnerProgramsProgramIdLeaderboardResponseContestOption1?
    public var rows: [GetPartnerProgramsProgramIdLeaderboardResponseRowsItem]

    enum CodingKeys: String, CodingKey {
        case contest = "contest"
        case rows = "rows"
    }

    public init(contest: GetPartnerProgramsProgramIdLeaderboardResponseContestOption1? = nil, rows: [GetPartnerProgramsProgramIdLeaderboardResponseRowsItem]) {
        self.contest = contest
        self.rows = rows
    }
}

public struct PostPartnerProgramsProgramIdApplyResponse: Codable, Sendable, Equatable {
    public var enrollmentId: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case enrollmentId = "enrollmentId"
        case status = "status"
    }

    public init(enrollmentId: String, status: String) {
        self.enrollmentId = enrollmentId
        self.status = status
    }
}

public struct PostWebhookEndpointsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var url: String
    public var topics: [String]
    public var programIds: [String]?
    public var legacySignature: Bool
    /// Returned only here. whsec_ + base64 key (Standard Webhooks).
    public var secret: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case topics = "topics"
        case programIds = "programIds"
        case legacySignature = "legacySignature"
        case secret = "secret"
    }

    public init(id: String, url: String, topics: [String], programIds: [String]? = nil, legacySignature: Bool, secret: String) {
        self.id = id
        self.url = url
        self.topics = topics
        self.programIds = programIds
        self.legacySignature = legacySignature
        self.secret = secret
    }
}

public struct GetWebhookEndpointsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [WebhookEndpoint]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [WebhookEndpoint], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostWebhookEndpointsIdRotateSecretResponse: Codable, Sendable, Equatable {
    public var id: String
    /// The new secret, shown once. The old one keeps signing until previousSecretExpiresAt.
    public var secret: String
    public var previousSecretExpiresAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case secret = "secret"
        case previousSecretExpiresAt = "previousSecretExpiresAt"
    }

    public init(id: String, secret: String, previousSecretExpiresAt: String) {
        self.id = id
        self.secret = secret
        self.previousSecretExpiresAt = previousSecretExpiresAt
    }
}

public struct GetWebhookDeliveriesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [WebhookDelivery]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [WebhookDelivery], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetWebhookEndpointsIdDeliveriesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [WebhookDelivery]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [WebhookDelivery], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public typealias GetWebhookDeliveriesIdResponse = JSONValue

public struct PostSandboxSimulateResponse: Codable, Sendable, Equatable {
    public var customerRef: String
    public var events: Int
    public var conversions: Int
    public var linesCreated: Int
    public var reversals: Int

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case events = "events"
        case conversions = "conversions"
        case linesCreated = "linesCreated"
        case reversals = "reversals"
    }

    public init(customerRef: String, events: Int, conversions: Int, linesCreated: Int, reversals: Int) {
        self.customerRef = customerRef
        self.events = events
        self.conversions = conversions
        self.linesCreated = linesCreated
        self.reversals = reversals
    }
}

public struct PostImportProviderResponse: Codable, Sendable, Equatable {
    public var partnersCreated: Int
    public var partnersSkipped: Int
    public var linksCreated: Int
    public var couponsCreated: Int
    /// Codes another partner in this org already uses.
    public var codesSkipped: [String]
    /// The old tool's link parameter, now read by aff.js.
    public var referralParams: [String]
    /// Integer minor units (cents).
    public var unpaidImportedMinor: Int
    /// Integer minor units (cents).
    public var paidImportedMinor: Int

    enum CodingKeys: String, CodingKey {
        case partnersCreated = "partnersCreated"
        case partnersSkipped = "partnersSkipped"
        case linksCreated = "linksCreated"
        case couponsCreated = "couponsCreated"
        case codesSkipped = "codesSkipped"
        case referralParams = "referralParams"
        case unpaidImportedMinor = "unpaidImportedMinor"
        case paidImportedMinor = "paidImportedMinor"
    }

    public init(partnersCreated: Int, partnersSkipped: Int, linksCreated: Int, couponsCreated: Int, codesSkipped: [String], referralParams: [String], unpaidImportedMinor: Int, paidImportedMinor: Int) {
        self.partnersCreated = partnersCreated
        self.partnersSkipped = partnersSkipped
        self.linksCreated = linksCreated
        self.couponsCreated = couponsCreated
        self.codesSkipped = codesSkipped
        self.referralParams = referralParams
        self.unpaidImportedMinor = unpaidImportedMinor
        self.paidImportedMinor = paidImportedMinor
    }
}

public typealias GetOpenapiJsonResponse = [String: JSONValue]

public struct GetBrandingResponse: Codable, Sendable, Equatable {
    public var logoUrl: String?
    public var theme: GetOpenapiJsonResponse?
    public var portalDomain: String?
    public var portalDomainVerified: Bool
    /// none; pending (waiting for DNS); provisioning (routed here, certificate being issued); active (links/portal served on it).
    public var portalDomainStatus: String
    public var linkDomain: String?
    public var linkDomainVerified: Bool
    /// none; pending (waiting for DNS); provisioning (routed here, certificate being issued); active (links/portal served on it).
    public var linkDomainStatus: String
    public var emailFrom: String?

    enum CodingKeys: String, CodingKey {
        case logoUrl = "logoUrl"
        case theme = "theme"
        case portalDomain = "portalDomain"
        case portalDomainVerified = "portalDomainVerified"
        case portalDomainStatus = "portalDomainStatus"
        case linkDomain = "linkDomain"
        case linkDomainVerified = "linkDomainVerified"
        case linkDomainStatus = "linkDomainStatus"
        case emailFrom = "emailFrom"
    }

    public init(logoUrl: String? = nil, theme: GetOpenapiJsonResponse? = nil, portalDomain: String? = nil, portalDomainVerified: Bool, portalDomainStatus: String, linkDomain: String? = nil, linkDomainVerified: Bool, linkDomainStatus: String, emailFrom: String? = nil) {
        self.logoUrl = logoUrl
        self.theme = theme
        self.portalDomain = portalDomain
        self.portalDomainVerified = portalDomainVerified
        self.portalDomainStatus = portalDomainStatus
        self.linkDomain = linkDomain
        self.linkDomainVerified = linkDomainVerified
        self.linkDomainStatus = linkDomainStatus
        self.emailFrom = emailFrom
    }
}

public struct PostBrandingLinkDomainResponse: Codable, Sendable, Equatable {
    public var domain: String
    public var cnameTarget: String
    public var txtRecord: String
    public var txtName: String
    public var verified: Bool

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
        case cnameTarget = "cnameTarget"
        case txtRecord = "txtRecord"
        case txtName = "txtName"
        case verified = "verified"
    }

    public init(domain: String, cnameTarget: String, txtRecord: String, txtName: String, verified: Bool) {
        self.domain = domain
        self.cnameTarget = cnameTarget
        self.txtRecord = txtRecord
        self.txtName = txtName
        self.verified = verified
    }
}

public struct PostBrandingLinkDomainVerifyResponse: Codable, Sendable, Equatable {
    public var domain: String
    public var verified: Bool
    public var status: String
    public var message: String?

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
        case verified = "verified"
        case status = "status"
        case message = "message"
    }

    public init(domain: String, verified: Bool, status: String, message: String? = nil) {
        self.domain = domain
        self.verified = verified
        self.status = status
        self.message = message
    }
}

public struct PostBrandingDomainResponse: Codable, Sendable, Equatable {
    public var domain: String
    public var cnameTarget: String
    public var txtRecord: String
    public var txtName: String
    public var verified: Bool
    public var instructions: String

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
        case cnameTarget = "cnameTarget"
        case txtRecord = "txtRecord"
        case txtName = "txtName"
        case verified = "verified"
        case instructions = "instructions"
    }

    public init(domain: String, cnameTarget: String, txtRecord: String, txtName: String, verified: Bool, instructions: String) {
        self.domain = domain
        self.cnameTarget = cnameTarget
        self.txtRecord = txtRecord
        self.txtName = txtName
        self.verified = verified
        self.instructions = instructions
    }
}

public struct PostEmbedTokensResponse: Codable, Sendable, Equatable {
    public var token: String
    public var expiresAt: String

    enum CodingKeys: String, CodingKey {
        case token = "token"
        case expiresAt = "expiresAt"
    }

    public init(token: String, expiresAt: String) {
        self.token = token
        self.expiresAt = expiresAt
    }
}

public struct GetEmbedSummaryResponsePartner: Codable, Sendable, Equatable {
    public var name: String
    public var email: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
    }

    public init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

public struct GetEmbedSummaryResponseBalancesItem: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var pending: Int
    /// Integer minor units (cents).
    public var approved: Int
    /// Integer minor units (cents).
    public var paid: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case pending = "pending"
        case approved = "approved"
        case paid = "paid"
    }

    public init(currency: String, pending: Int, approved: Int, paid: Int) {
        self.currency = currency
        self.pending = pending
        self.approved = approved
        self.paid = paid
    }
}

public struct GetEmbedSummaryResponseLinksItem: Codable, Sendable, Equatable {
    public var code: String
    public var destinationUrl: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case destinationUrl = "destinationUrl"
    }

    public init(code: String, destinationUrl: String) {
        self.code = code
        self.destinationUrl = destinationUrl
    }
}

public struct GetEmbedSummaryResponse: Codable, Sendable, Equatable {
    public var partner: GetEmbedSummaryResponsePartner
    public var clicks: Int
    public var referrals: Int
    public var balances: [GetEmbedSummaryResponseBalancesItem]
    public var links: [GetEmbedSummaryResponseLinksItem]

    enum CodingKeys: String, CodingKey {
        case partner = "partner"
        case clicks = "clicks"
        case referrals = "referrals"
        case balances = "balances"
        case links = "links"
    }

    public init(partner: GetEmbedSummaryResponsePartner, clicks: Int, referrals: Int, balances: [GetEmbedSummaryResponseBalancesItem], links: [GetEmbedSummaryResponseLinksItem]) {
        self.partner = partner
        self.clicks = clicks
        self.referrals = referrals
        self.balances = balances
        self.links = links
    }
}

public struct PostDiscoverySearchResponse: Codable, Sendable, Equatable {
    public var found: Int
    public var added: Int

    enum CodingKeys: String, CodingKey {
        case found = "found"
        case added = "added"
    }

    public init(found: Int, added: Int) {
        self.found = found
        self.added = added
    }
}

public struct PostDiscoveryCorpusResponse: Codable, Sendable, Equatable {
    public var received: Int
    public var added: Int

    enum CodingKeys: String, CodingKey {
        case received = "received"
        case added = "added"
    }

    public init(received: Int, added: Int) {
        self.received = received
        self.added = added
    }
}

public struct GetProspectsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var url: String
    public var channel: String
    public var audienceSize: Int
    public var evidence: GetOpenapiJsonResponse?
    public var fitScore: Double
    public var contactEmail: String?
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
        case channel = "channel"
        case audienceSize = "audienceSize"
        case evidence = "evidence"
        case fitScore = "fitScore"
        case contactEmail = "contactEmail"
        case status = "status"
    }

    public init(id: String, name: String, url: String, channel: String, audienceSize: Int, evidence: GetOpenapiJsonResponse? = nil, fitScore: Double, contactEmail: String? = nil, status: String) {
        self.id = id
        self.name = name
        self.url = url
        self.channel = channel
        self.audienceSize = audienceSize
        self.evidence = evidence
        self.fitScore = fitScore
        self.contactEmail = contactEmail
        self.status = status
    }
}

public struct GetProspectsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetProspectsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetProspectsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostOutreachDraftResponse: Codable, Sendable, Equatable {
    public var messageIds: [String]

    enum CodingKeys: String, CodingKey {
        case messageIds = "messageIds"
    }

    public init(messageIds: [String]) {
        self.messageIds = messageIds
    }
}

public struct GetOutreachResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var prospectId: String
    public var step: Int
    public var subject: String
    public var status: String
    public var createdAt: String
    public var sentAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case prospectId = "prospectId"
        case step = "step"
        case subject = "subject"
        case status = "status"
        case createdAt = "createdAt"
        case sentAt = "sentAt"
    }

    public init(id: String, prospectId: String, step: Int, subject: String, status: String, createdAt: String, sentAt: String? = nil) {
        self.id = id
        self.prospectId = prospectId
        self.step = step
        self.subject = subject
        self.status = status
        self.createdAt = createdAt
        self.sentAt = sentAt
    }
}

public struct GetOutreachResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetOutreachResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetOutreachResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostOutreachSendDueResponse: Codable, Sendable, Equatable {
    public var sent: Int
    public var suppressed: Int
    public var capped: Bool
    public var failed: Int

    enum CodingKeys: String, CodingKey {
        case sent = "sent"
        case suppressed = "suppressed"
        case capped = "capped"
        case failed = "failed"
    }

    public init(sent: Int, suppressed: Int, capped: Bool, failed: Int) {
        self.sent = sent
        self.suppressed = suppressed
        self.capped = capped
        self.failed = failed
    }
}

public struct PostUnsubscribeTokenResponse: Codable, Sendable, Equatable {
    public var ok: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
    }

    public init(ok: Bool) {
        self.ok = ok
    }
}

public struct GetAssistantSuggestionsResponseDataItem: Codable, Sendable, Equatable {
    public var kind: String
    public var message: String
    public var suggestedAction: String
    public var data: [String: JSONValue]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case message = "message"
        case suggestedAction = "suggestedAction"
        case data = "data"
    }

    public init(kind: String, message: String, suggestedAction: String, data: [String: JSONValue]) {
        self.kind = kind
        self.message = message
        self.suggestedAction = suggestedAction
        self.data = data
    }
}

public struct GetAssistantSuggestionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAssistantSuggestionsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAssistantSuggestionsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetMarketplaceListingResponseDataItemStats: Codable, Sendable, Equatable {
    public var clicks: Int
    public var referrals: Int
    /// Integer minor units (cents).
    public var epcMinor: Int
    public var conversionRate: Double
    public var payoutReliability: Double?
    public var approvalLatencyHours: Double?

    enum CodingKeys: String, CodingKey {
        case clicks = "clicks"
        case referrals = "referrals"
        case epcMinor = "epcMinor"
        case conversionRate = "conversionRate"
        case payoutReliability = "payoutReliability"
        case approvalLatencyHours = "approvalLatencyHours"
    }

    public init(clicks: Int, referrals: Int, epcMinor: Int, conversionRate: Double, payoutReliability: Double? = nil, approvalLatencyHours: Double? = nil) {
        self.clicks = clicks
        self.referrals = referrals
        self.epcMinor = epcMinor
        self.conversionRate = conversionRate
        self.payoutReliability = payoutReliability
        self.approvalLatencyHours = approvalLatencyHours
    }
}

public struct GetMarketplaceListingResponseDataItem: Codable, Sendable, Equatable {
    public var programId: String
    public var visibility: String
    public var category: String
    public var headline: String
    public var stats: GetMarketplaceListingResponseDataItemStats

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case visibility = "visibility"
        case category = "category"
        case headline = "headline"
        case stats = "stats"
    }

    public init(programId: String, visibility: String, category: String, headline: String, stats: GetMarketplaceListingResponseDataItemStats) {
        self.programId = programId
        self.visibility = visibility
        self.category = category
        self.headline = headline
        self.stats = stats
    }
}

public struct GetMarketplaceListingResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetMarketplaceListingResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetMarketplaceListingResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerMarketplaceResponseDataItemStats: Codable, Sendable, Equatable {
    public var clicks: Int
    public var referrals: Int
    /// Integer minor units (cents).
    public var epcMinor: Int
    public var conversionRate: Double
    public var payoutReliability: Double?
    public var approvalLatencyHours: Double?

    enum CodingKeys: String, CodingKey {
        case clicks = "clicks"
        case referrals = "referrals"
        case epcMinor = "epcMinor"
        case conversionRate = "conversionRate"
        case payoutReliability = "payoutReliability"
        case approvalLatencyHours = "approvalLatencyHours"
    }

    public init(clicks: Int, referrals: Int, epcMinor: Int, conversionRate: Double, payoutReliability: Double? = nil, approvalLatencyHours: Double? = nil) {
        self.clicks = clicks
        self.referrals = referrals
        self.epcMinor = epcMinor
        self.conversionRate = conversionRate
        self.payoutReliability = payoutReliability
        self.approvalLatencyHours = approvalLatencyHours
    }
}

public struct GetPartnerMarketplaceResponseDataItem: Codable, Sendable, Equatable {
    public var programId: String
    public var programName: String
    public var merchant: String
    public var category: String
    public var headline: String
    public var sponsored: Bool
    public var cookieWindowDays: Int
    public var commissionSummary: GetOpenapiJsonResponse?
    public var stats: GetPartnerMarketplaceResponseDataItemStats

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case programName = "programName"
        case merchant = "merchant"
        case category = "category"
        case headline = "headline"
        case sponsored = "sponsored"
        case cookieWindowDays = "cookieWindowDays"
        case commissionSummary = "commissionSummary"
        case stats = "stats"
    }

    public init(programId: String, programName: String, merchant: String, category: String, headline: String, sponsored: Bool, cookieWindowDays: Int, commissionSummary: GetOpenapiJsonResponse? = nil, stats: GetPartnerMarketplaceResponseDataItemStats) {
        self.programId = programId
        self.programName = programName
        self.merchant = merchant
        self.category = category
        self.headline = headline
        self.sponsored = sponsored
        self.cookieWindowDays = cookieWindowDays
        self.commissionSummary = commissionSummary
        self.stats = stats
    }
}

public struct GetPartnerMarketplaceResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerMarketplaceResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerMarketplaceResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerProfileVerifiedResponse: Codable, Sendable, Equatable {
    public var programs: Int
    public var clicks: Int
    public var referrals: Int
    public var repeatPayerRate: Double?
    public var verified: Bool

    enum CodingKeys: String, CodingKey {
        case programs = "programs"
        case clicks = "clicks"
        case referrals = "referrals"
        case repeatPayerRate = "repeatPayerRate"
        case verified = "verified"
    }

    public init(programs: Int, clicks: Int, referrals: Int, repeatPayerRate: Double? = nil, verified: Bool) {
        self.programs = programs
        self.clicks = clicks
        self.referrals = referrals
        self.repeatPayerRate = repeatPayerRate
        self.verified = verified
    }
}

public struct PostPartnerDisputesResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetDisputesResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String
    public var partnerEmail: String
    public var referralId: String?
    public var kind: String
    public var status: String
    public var detail: String
    public var resolution: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case partnerEmail = "partnerEmail"
        case referralId = "referralId"
        case kind = "kind"
        case status = "status"
        case detail = "detail"
        case resolution = "resolution"
        case createdAt = "createdAt"
    }

    public init(id: String, partnerId: String, partnerEmail: String, referralId: String? = nil, kind: String, status: String, detail: String, resolution: String? = nil, createdAt: String) {
        self.id = id
        self.partnerId = partnerId
        self.partnerEmail = partnerEmail
        self.referralId = referralId
        self.kind = kind
        self.status = status
        self.detail = detail
        self.resolution = resolution
        self.createdAt = createdAt
    }
}

public struct GetDisputesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetDisputesResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetDisputesResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetCreatorsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [CreatorProfile]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [CreatorProfile], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostCreatorsAccountIdInviteResponse: Codable, Sendable, Equatable {
    public var id: String
    public var program: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case program = "program"
    }

    public init(id: String, program: String) {
        self.id = id
        self.program = program
    }
}

public struct GetInvitationsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var creatorName: String?
    public var accountId: String
    public var programId: String
    public var programName: String
    public var status: String
    public var message: String
    public var createdAt: String
    public var respondedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case creatorName = "creatorName"
        case accountId = "accountId"
        case programId = "programId"
        case programName = "programName"
        case status = "status"
        case message = "message"
        case createdAt = "createdAt"
        case respondedAt = "respondedAt"
    }

    public init(id: String, creatorName: String? = nil, accountId: String, programId: String, programName: String, status: String, message: String, createdAt: String, respondedAt: String? = nil) {
        self.id = id
        self.creatorName = creatorName
        self.accountId = accountId
        self.programId = programId
        self.programName = programName
        self.status = status
        self.message = message
        self.createdAt = createdAt
        self.respondedAt = respondedAt
    }
}

public struct GetInvitationsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetInvitationsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetInvitationsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerInvitationsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var merchant: String
    public var orgId: String
    public var programId: String
    public var programName: String
    public var status: String
    public var message: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case merchant = "merchant"
        case orgId = "orgId"
        case programId = "programId"
        case programName = "programName"
        case status = "status"
        case message = "message"
        case createdAt = "createdAt"
    }

    public init(id: String, merchant: String, orgId: String, programId: String, programName: String, status: String, message: String, createdAt: String) {
        self.id = id
        self.merchant = merchant
        self.orgId = orgId
        self.programId = programId
        self.programName = programName
        self.status = status
        self.message = message
        self.createdAt = createdAt
    }
}

public struct GetPartnerInvitationsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerInvitationsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerInvitationsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetBillingPlanResponseUsage: Codable, Sendable, Equatable {
    public var programs: Int
    public var partners: Int

    enum CodingKeys: String, CodingKey {
        case programs = "programs"
        case partners = "partners"
    }

    public init(programs: Int, partners: Int) {
        self.programs = programs
        self.partners = partners
    }
}

public struct GetBillingPlanResponse: Codable, Sendable, Equatable {
    public var plan: String
    public var planStatus: String
    public var periodEnd: String?
    public var limits: GetOpenapiJsonResponse
    public var usage: GetBillingPlanResponseUsage
    public var catalog: [String: GetOpenapiJsonResponse]
    public var subscribed: Bool
    public var canActivate: Bool

    enum CodingKeys: String, CodingKey {
        case plan = "plan"
        case planStatus = "planStatus"
        case periodEnd = "periodEnd"
        case limits = "limits"
        case usage = "usage"
        case catalog = "catalog"
        case subscribed = "subscribed"
        case canActivate = "canActivate"
    }

    public init(plan: String, planStatus: String, periodEnd: String? = nil, limits: GetOpenapiJsonResponse, usage: GetBillingPlanResponseUsage, catalog: [String: GetOpenapiJsonResponse], subscribed: Bool, canActivate: Bool) {
        self.plan = plan
        self.planStatus = planStatus
        self.periodEnd = periodEnd
        self.limits = limits
        self.usage = usage
        self.catalog = catalog
        self.subscribed = subscribed
        self.canActivate = canActivate
    }
}

public struct PostBillingCheckoutResponse: Codable, Sendable, Equatable {
    public var url: String?
    public var sessionId: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case sessionId = "sessionId"
    }

    public init(url: String? = nil, sessionId: String? = nil) {
        self.url = url
        self.sessionId = sessionId
    }
}

public struct PostBillingPortalResponse: Codable, Sendable, Equatable {
    public var url: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }

    public init(url: String) {
        self.url = url
    }
}

public struct PostBillingActivateResponse: Codable, Sendable, Equatable {
    public var plan: String
    public var planStatus: String

    enum CodingKeys: String, CodingKey {
        case plan = "plan"
        case planStatus = "planStatus"
    }

    public init(plan: String, planStatus: String) {
        self.plan = plan
        self.planStatus = planStatus
    }
}

public struct GetProgramsIdRefereeRewardResponse: Codable, Sendable, Equatable {
    public var refereeReward: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case refereeReward = "refereeReward"
    }

    public init(refereeReward: GetOpenapiJsonResponse? = nil) {
        self.refereeReward = refereeReward
    }
}

public struct PutProgramsIdRefereeRewardResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var refereeReward: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case refereeReward = "refereeReward"
    }

    public init(ok: Bool, refereeReward: GetOpenapiJsonResponse? = nil) {
        self.ok = ok
        self.refereeReward = refereeReward
    }
}

public struct GetRewardsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var referralId: String
    public var customerRef: String
    public var kind: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String
    public var code: String?
    public var status: String
    public var createdAt: String
    public var redeemedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case referralId = "referralId"
        case customerRef = "customerRef"
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case code = "code"
        case status = "status"
        case createdAt = "createdAt"
        case redeemedAt = "redeemedAt"
    }

    public init(id: String, programId: String, referralId: String, customerRef: String, kind: String, amountMinor: Int, currency: String, code: String? = nil, status: String, createdAt: String, redeemedAt: String? = nil) {
        self.id = id
        self.programId = programId
        self.referralId = referralId
        self.customerRef = customerRef
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
        self.code = code
        self.status = status
        self.createdAt = createdAt
        self.redeemedAt = redeemedAt
    }
}

public struct GetRewardsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetRewardsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetRewardsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetRewardsLookupCodeResponse: Codable, Sendable, Equatable {
    public var valid: Bool
    public var rewardId: String?
    public var kind: String?
    /// Integer minor units (cents).
    public var amountMinor: Int?
    public var currency: String?
    public var status: String?

    enum CodingKeys: String, CodingKey {
        case valid = "valid"
        case rewardId = "rewardId"
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case status = "status"
    }

    public init(valid: Bool, rewardId: String? = nil, kind: String? = nil, amountMinor: Int? = nil, currency: String? = nil, status: String? = nil) {
        self.valid = valid
        self.rewardId = rewardId
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
        self.status = status
    }
}

public struct PostRewardsRedeemByCodeResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var rewardId: String
    public var grantId: String
    public var status: String
    public var currency: String
    /// Integer minor units (cents).
    public var requestedMinor: Int
    /// Amount recorded, capped at the remaining balance.
    public var redeemedMinor: Int
    /// Integer minor units (cents).
    public var remainingMinor: Int
    /// True when the request exceeded the remaining balance.
    public var capped: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case rewardId = "rewardId"
        case grantId = "grantId"
        case status = "status"
        case currency = "currency"
        case requestedMinor = "requestedMinor"
        case redeemedMinor = "redeemedMinor"
        case remainingMinor = "remainingMinor"
        case capped = "capped"
    }

    public init(ok: Bool, rewardId: String, grantId: String, status: String, currency: String, requestedMinor: Int, redeemedMinor: Int, remainingMinor: Int, capped: Bool) {
        self.ok = ok
        self.rewardId = rewardId
        self.grantId = grantId
        self.status = status
        self.currency = currency
        self.requestedMinor = requestedMinor
        self.redeemedMinor = redeemedMinor
        self.remainingMinor = remainingMinor
        self.capped = capped
    }
}

public struct GetProgramsIdGroupsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [PartnerGroup]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [PartnerGroup], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutProgramsIdPartnersPartnerIdGroupResponse: Codable, Sendable, Equatable {
    public var partnerId: String
    public var programId: String
    public var groupId: String?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case programId = "programId"
        case groupId = "groupId"
    }

    public init(partnerId: String, programId: String, groupId: String? = nil) {
        self.partnerId = partnerId
        self.programId = programId
        self.groupId = groupId
    }
}

public struct GetProgramsIdPromotionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Promotion]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Promotion], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerGroupsResponseDataItem: Codable, Sendable, Equatable {
    public var groupId: String
    public var groupName: String
    public var orgName: String
    public var programId: String
    public var programName: String
    public var onboardingMessage: String?
    public var onboardingChecklist: [String]
    public var holdDays: Int?
    public var minThresholdMinor: Int?
    public var payoutCurrency: String?

    enum CodingKeys: String, CodingKey {
        case groupId = "groupId"
        case groupName = "groupName"
        case orgName = "orgName"
        case programId = "programId"
        case programName = "programName"
        case onboardingMessage = "onboardingMessage"
        case onboardingChecklist = "onboardingChecklist"
        case holdDays = "holdDays"
        case minThresholdMinor = "minThresholdMinor"
        case payoutCurrency = "payoutCurrency"
    }

    public init(groupId: String, groupName: String, orgName: String, programId: String, programName: String, onboardingMessage: String? = nil, onboardingChecklist: [String], holdDays: Int? = nil, minThresholdMinor: Int? = nil, payoutCurrency: String? = nil) {
        self.groupId = groupId
        self.groupName = groupName
        self.orgName = orgName
        self.programId = programId
        self.programName = programName
        self.onboardingMessage = onboardingMessage
        self.onboardingChecklist = onboardingChecklist
        self.holdDays = holdDays
        self.minThresholdMinor = minThresholdMinor
        self.payoutCurrency = payoutCurrency
    }
}

public struct GetPartnerGroupsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerGroupsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerGroupsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostContractsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetContractsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var title: String
    public var compensation: GetOpenapiJsonResponse
    public var status: String
    public var createdAt: String
    public var respondedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case title = "title"
        case compensation = "compensation"
        case status = "status"
        case createdAt = "createdAt"
        case respondedAt = "respondedAt"
    }

    public init(id: String, programId: String, partnerId: String, title: String, compensation: GetOpenapiJsonResponse, status: String, createdAt: String, respondedAt: String? = nil) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.title = title
        self.compensation = compensation
        self.status = status
        self.createdAt = createdAt
        self.respondedAt = respondedAt
    }
}

public struct GetContractsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetContractsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetContractsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerContractsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var merchant: String
    public var program: String
    public var title: String
    public var termsMd: String
    public var compensation: GetOpenapiJsonResponse
    public var status: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case merchant = "merchant"
        case program = "program"
        case title = "title"
        case termsMd = "termsMd"
        case compensation = "compensation"
        case status = "status"
        case createdAt = "createdAt"
    }

    public init(id: String, merchant: String, program: String, title: String, termsMd: String, compensation: GetOpenapiJsonResponse, status: String, createdAt: String) {
        self.id = id
        self.merchant = merchant
        self.program = program
        self.title = title
        self.termsMd = termsMd
        self.compensation = compensation
        self.status = status
        self.createdAt = createdAt
    }
}

public struct GetPartnerContractsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerContractsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerContractsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutProgramsIdIncrementalityResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var holdoutBps: Int

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case holdoutBps = "holdoutBps"
    }

    public init(ok: Bool, holdoutBps: Int) {
        self.ok = ok
        self.holdoutBps = holdoutBps
    }
}

public struct GetIncrementalityResponseTreatment: Codable, Sendable, Equatable {
    public var referrals: Int
    public var converted: Int
    public var rate: Double

    enum CodingKeys: String, CodingKey {
        case referrals = "referrals"
        case converted = "converted"
        case rate = "rate"
    }

    public init(referrals: Int, converted: Int, rate: Double) {
        self.referrals = referrals
        self.converted = converted
        self.rate = rate
    }
}

public struct GetIncrementalityResponseControl: Codable, Sendable, Equatable {
    public var referrals: Int
    public var converted: Int
    public var rate: Double

    enum CodingKeys: String, CodingKey {
        case referrals = "referrals"
        case converted = "converted"
        case rate = "rate"
    }

    public init(referrals: Int, converted: Int, rate: Double) {
        self.referrals = referrals
        self.converted = converted
        self.rate = rate
    }
}

public struct GetIncrementalityResponseByPartnerItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var treatmentReferrals: Int
    public var controlReferrals: Int
    public var lift: Double

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case treatmentReferrals = "treatmentReferrals"
        case controlReferrals = "controlReferrals"
        case lift = "lift"
    }

    public init(partnerId: String, treatmentReferrals: Int, controlReferrals: Int, lift: Double) {
        self.partnerId = partnerId
        self.treatmentReferrals = treatmentReferrals
        self.controlReferrals = controlReferrals
        self.lift = lift
    }
}

public struct GetIncrementalityResponse: Codable, Sendable, Equatable {
    public var programId: String
    public var holdoutBps: Int
    public var treatment: GetIncrementalityResponseTreatment
    public var control: GetIncrementalityResponseControl
    public var lift: Double
    public var byPartner: [GetIncrementalityResponseByPartnerItem]

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case holdoutBps = "holdoutBps"
        case treatment = "treatment"
        case control = "control"
        case lift = "lift"
        case byPartner = "byPartner"
    }

    public init(programId: String, holdoutBps: Int, treatment: GetIncrementalityResponseTreatment, control: GetIncrementalityResponseControl, lift: Double, byPartner: [GetIncrementalityResponseByPartnerItem]) {
        self.programId = programId
        self.holdoutBps = holdoutBps
        self.treatment = treatment
        self.control = control
        self.lift = lift
        self.byPartner = byPartner
    }
}

public struct PutProgramsIdAutopricingResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var autopricing: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case autopricing = "autopricing"
    }

    public init(ok: Bool, autopricing: GetOpenapiJsonResponse? = nil) {
        self.ok = ok
        self.autopricing = autopricing
    }
}

public struct GetProgramsIdAutopricingResponseAutopricingOption1: Codable, Sendable, Equatable {
    public var enabled: Bool
    public var targetRoas: Double
    public var minBps: Int
    public var maxBps: Int
    public var objective: String
    public var targetRoi: Double

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case targetRoas = "targetRoas"
        case minBps = "minBps"
        case maxBps = "maxBps"
        case objective = "objective"
        case targetRoi = "targetRoi"
    }

    public init(enabled: Bool, targetRoas: Double, minBps: Int, maxBps: Int, objective: String, targetRoi: Double) {
        self.enabled = enabled
        self.targetRoas = targetRoas
        self.minBps = minBps
        self.maxBps = maxBps
        self.objective = objective
        self.targetRoi = targetRoi
    }
}

public struct GetProgramsIdAutopricingResponse: Codable, Sendable, Equatable {
    /// Null when self-pricing is off. Configs stored before objectives existed read as roas / targetRoi 2.
    public var autopricing: GetProgramsIdAutopricingResponseAutopricingOption1?

    enum CodingKeys: String, CodingKey {
        case autopricing = "autopricing"
    }

    public init(autopricing: GetProgramsIdAutopricingResponseAutopricingOption1? = nil) {
        self.autopricing = autopricing
    }
}

public struct PostProgramsIdAutopriceRunResponseChangesItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var fromBps: Int
    public var toBps: Int
    /// Revenue ÷ commission; null under objective roi.
    public var realizedRoas: Double?
    /// Objective roi only: referral ROI over matured referrals, both sides: profit after ÷ (referee credit cost + cash commissions + referrer credit cost).
    public var realizedRoi: Double?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case fromBps = "fromBps"
        case toBps = "toBps"
        case realizedRoas = "realizedRoas"
        case realizedRoi = "realizedRoi"
    }

    public init(partnerId: String, fromBps: Int, toBps: Int, realizedRoas: Double? = nil, realizedRoi: Double? = nil) {
        self.partnerId = partnerId
        self.fromBps = fromBps
        self.toBps = toBps
        self.realizedRoas = realizedRoas
        self.realizedRoi = realizedRoi
    }
}

public struct PostProgramsIdAutopriceRunResponseHeldItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var reason: String
    /// The partner's matured referrals in the program (the name predates referral-based ROI).
    public var maturedGrants: Int

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case reason = "reason"
        case maturedGrants = "maturedGrants"
    }

    public init(partnerId: String, reason: String, maturedGrants: Int) {
        self.partnerId = partnerId
        self.reason = reason
        self.maturedGrants = maturedGrants
    }
}

public struct PostProgramsIdAutopriceRunResponse: Codable, Sendable, Equatable {
    public var objective: String
    public var targetRoas: Double
    /// Objective roi only.
    public var targetRoi: Double?
    public var changes: [PostProgramsIdAutopriceRunResponseChangesItem]
    /// Objective roi only: partners whose rate was kept, and why.
    public var held: [PostProgramsIdAutopriceRunResponseHeldItem]?

    enum CodingKeys: String, CodingKey {
        case objective = "objective"
        case targetRoas = "targetRoas"
        case targetRoi = "targetRoi"
        case changes = "changes"
        case held = "held"
    }

    public init(objective: String, targetRoas: Double, targetRoi: Double? = nil, changes: [PostProgramsIdAutopriceRunResponseChangesItem], held: [PostProgramsIdAutopriceRunResponseHeldItem]? = nil) {
        self.objective = objective
        self.targetRoas = targetRoas
        self.targetRoi = targetRoi
        self.changes = changes
        self.held = held
    }
}

public struct GetPassportPublicKeyResponse: Codable, Sendable, Equatable {
    public var algorithm: String
    public var publicKey: String

    enum CodingKeys: String, CodingKey {
        case algorithm = "algorithm"
        case publicKey = "publicKey"
    }

    public init(algorithm: String, publicKey: String) {
        self.algorithm = algorithm
        self.publicKey = publicKey
    }
}

public struct PostPassportVerifyResponse: Codable, Sendable, Equatable {
    public var valid: Bool
    public var claims: GetOpenapiJsonResponse?
    public var reason: String?

    enum CodingKeys: String, CodingKey {
        case valid = "valid"
        case claims = "claims"
        case reason = "reason"
    }

    public init(valid: Bool, claims: GetOpenapiJsonResponse? = nil, reason: String? = nil) {
        self.valid = valid
        self.claims = claims
        self.reason = reason
    }
}

public struct GetPartnerAdvanceOfferResponse: Codable, Sendable, Equatable {
    public var currency: String
    /// Integer minor units (cents).
    public var monthlyRunRateMinor: Int
    /// Integer minor units (cents).
    public var projectedMinor: Int
    /// Integer minor units (cents).
    public var maxAdvanceMinor: Int
    public var feeBps: Int
    public var qualityScore: Double

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case monthlyRunRateMinor = "monthlyRunRateMinor"
        case projectedMinor = "projectedMinor"
        case maxAdvanceMinor = "maxAdvanceMinor"
        case feeBps = "feeBps"
        case qualityScore = "qualityScore"
    }

    public init(currency: String, monthlyRunRateMinor: Int, projectedMinor: Int, maxAdvanceMinor: Int, feeBps: Int, qualityScore: Double) {
        self.currency = currency
        self.monthlyRunRateMinor = monthlyRunRateMinor
        self.projectedMinor = projectedMinor
        self.maxAdvanceMinor = maxAdvanceMinor
        self.feeBps = feeBps
        self.qualityScore = qualityScore
    }
}

public struct PostPartnerAdvanceAcceptResponse: Codable, Sendable, Equatable {
    public var id: String
    /// Integer minor units (cents).
    public var principalMinor: Int
    /// Integer minor units (cents).
    public var feeMinor: Int
    /// Integer minor units (cents).
    public var outstandingMinor: Int
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case principalMinor = "principalMinor"
        case feeMinor = "feeMinor"
        case outstandingMinor = "outstandingMinor"
        case status = "status"
    }

    public init(id: String, principalMinor: Int, feeMinor: Int, outstandingMinor: Int, status: String) {
        self.id = id
        self.principalMinor = principalMinor
        self.feeMinor = feeMinor
        self.outstandingMinor = outstandingMinor
        self.status = status
    }
}

public struct GetPartnerAdvanceResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var currency: String
    /// Integer minor units (cents).
    public var principalMinor: Int
    /// Integer minor units (cents).
    public var feeMinor: Int
    /// Integer minor units (cents).
    public var outstandingMinor: Int
    public var status: String
    public var createdAt: String
    public var repaidAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case currency = "currency"
        case principalMinor = "principalMinor"
        case feeMinor = "feeMinor"
        case outstandingMinor = "outstandingMinor"
        case status = "status"
        case createdAt = "createdAt"
        case repaidAt = "repaidAt"
    }

    public init(id: String, currency: String, principalMinor: Int, feeMinor: Int, outstandingMinor: Int, status: String, createdAt: String, repaidAt: String? = nil) {
        self.id = id
        self.currency = currency
        self.principalMinor = principalMinor
        self.feeMinor = feeMinor
        self.outstandingMinor = outstandingMinor
        self.status = status
        self.createdAt = createdAt
        self.repaidAt = repaidAt
    }
}

public struct GetPartnerAdvanceResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerAdvanceResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerAdvanceResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutNetworkSettingsResponse: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct GetNetworkSettingsResponse: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct GetNetworkJourneyResponseTouchpointsItem: Codable, Sendable, Equatable {
    public var partnerAccountId: String
    public var ts: String
    public var credit: Double

    enum CodingKeys: String, CodingKey {
        case partnerAccountId = "partnerAccountId"
        case ts = "ts"
        case credit = "credit"
    }

    public init(partnerAccountId: String, ts: String, credit: Double) {
        self.partnerAccountId = partnerAccountId
        self.ts = ts
        self.credit = credit
    }
}

public struct GetNetworkJourneyResponse: Codable, Sendable, Equatable {
    public var emailHash: String
    public var model: String
    public var touchpoints: [GetNetworkJourneyResponseTouchpointsItem]
    public var partners: Int

    enum CodingKeys: String, CodingKey {
        case emailHash = "emailHash"
        case model = "model"
        case touchpoints = "touchpoints"
        case partners = "partners"
    }

    public init(emailHash: String, model: String, touchpoints: [GetNetworkJourneyResponseTouchpointsItem], partners: Int) {
        self.emailHash = emailHash
        self.model = model
        self.touchpoints = touchpoints
        self.partners = partners
    }
}

public struct PutProgramsIdNegotiationPolicyResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var negotiationPolicy: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case negotiationPolicy = "negotiationPolicy"
    }

    public init(ok: Bool, negotiationPolicy: GetOpenapiJsonResponse? = nil) {
        self.ok = ok
        self.negotiationPolicy = negotiationPolicy
    }
}

public struct GetProgramsIdNegotiationPolicyResponse: Codable, Sendable, Equatable {
    public var negotiationPolicy: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case negotiationPolicy = "negotiationPolicy"
    }

    public init(negotiationPolicy: GetOpenapiJsonResponse? = nil) {
        self.negotiationPolicy = negotiationPolicy
    }
}

public struct GetNegotiationsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var agentAccountId: String
    public var proposedBps: Int
    public var decision: String
    public var rateBps: Int?
    public var round: Int
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case agentAccountId = "agentAccountId"
        case proposedBps = "proposedBps"
        case decision = "decision"
        case rateBps = "rateBps"
        case round = "round"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, agentAccountId: String, proposedBps: Int, decision: String, rateBps: Int? = nil, round: Int, createdAt: String) {
        self.id = id
        self.programId = programId
        self.agentAccountId = agentAccountId
        self.proposedBps = proposedBps
        self.decision = decision
        self.rateBps = rateBps
        self.round = round
        self.createdAt = createdAt
    }
}

public struct GetNegotiationsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetNegotiationsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetNegotiationsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetCleanroomConsentResponseConsentOption1: Codable, Sendable, Equatable {
    public var granted: Bool
    public var purposes: [String]
    public var declared: GetOpenapiJsonResponse
    public var emailHash: String?
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case granted = "granted"
        case purposes = "purposes"
        case declared = "declared"
        case emailHash = "emailHash"
        case updatedAt = "updatedAt"
    }

    public init(granted: Bool, purposes: [String], declared: GetOpenapiJsonResponse, emailHash: String? = nil, updatedAt: String) {
        self.granted = granted
        self.purposes = purposes
        self.declared = declared
        self.emailHash = emailHash
        self.updatedAt = updatedAt
    }
}

public struct GetCleanroomConsentResponse: Codable, Sendable, Equatable {
    public var customerRef: String
    public var consent: GetCleanroomConsentResponseConsentOption1?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case consent = "consent"
    }

    public init(customerRef: String, consent: GetCleanroomConsentResponseConsentOption1? = nil) {
        self.customerRef = customerRef
        self.consent = consent
    }
}

public struct GetCleanroomQueryResponseCohortsItem: Codable, Sendable, Equatable {
    public var key: String
    public var count: Int

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case count = "count"
    }

    public init(key: String, count: Int) {
        self.key = key
        self.count = count
    }
}

public struct GetCleanroomQueryResponse: Codable, Sendable, Equatable {
    public var dimension: String
    public var k: Int
    public var cohorts: [GetCleanroomQueryResponseCohortsItem]
    public var suppressedCohorts: Int
    public var suppressedRows: Int

    enum CodingKeys: String, CodingKey {
        case dimension = "dimension"
        case k = "k"
        case cohorts = "cohorts"
        case suppressedCohorts = "suppressedCohorts"
        case suppressedRows = "suppressedRows"
    }

    public init(dimension: String, k: Int, cohorts: [GetCleanroomQueryResponseCohortsItem], suppressedCohorts: Int, suppressedRows: Int) {
        self.dimension = dimension
        self.k = k
        self.cohorts = cohorts
        self.suppressedCohorts = suppressedCohorts
        self.suppressedRows = suppressedRows
    }
}

public struct GetAgentsResponseDataItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var accountId: String
    public var name: String
    public var wallet: String?
    public var metadata: GetOpenapiJsonResponse?
    public var instantPayout: Bool
    public var status: String
    public var recommendations: Int

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case accountId = "accountId"
        case name = "name"
        case wallet = "wallet"
        case metadata = "metadata"
        case instantPayout = "instantPayout"
        case status = "status"
        case recommendations = "recommendations"
    }

    public init(partnerId: String, accountId: String, name: String, wallet: String? = nil, metadata: GetOpenapiJsonResponse? = nil, instantPayout: Bool, status: String, recommendations: Int) {
        self.partnerId = partnerId
        self.accountId = accountId
        self.name = name
        self.wallet = wallet
        self.metadata = metadata
        self.instantPayout = instantPayout
        self.status = status
        self.recommendations = recommendations
    }
}

public struct GetAgentsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAgentsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAgentsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAgentsRecommendationsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var customerRef: String
    public var agent: String
    public var wallet: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case customerRef = "customerRef"
        case agent = "agent"
        case wallet = "wallet"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, customerRef: String, agent: String, wallet: String? = nil, createdAt: String) {
        self.id = id
        self.programId = programId
        self.customerRef = customerRef
        self.agent = agent
        self.wallet = wallet
        self.createdAt = createdAt
    }
}

public struct GetAgentsRecommendationsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAgentsRecommendationsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAgentsRecommendationsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetAdminMetricsResponse: Codable, Sendable, Equatable {
    public var orgs: Int
    public var suspendedOrgs: Int
    public var partnerAccounts: Int
    public var bannedPartners: Int
    public var programs: Int
    /// Integer minor units (cents).
    public var commissionEarnedMinor: Int
    public var payoutsSent: Int
    public var openFraudCases: Int

    enum CodingKeys: String, CodingKey {
        case orgs = "orgs"
        case suspendedOrgs = "suspendedOrgs"
        case partnerAccounts = "partnerAccounts"
        case bannedPartners = "bannedPartners"
        case programs = "programs"
        case commissionEarnedMinor = "commissionEarnedMinor"
        case payoutsSent = "payoutsSent"
        case openFraudCases = "openFraudCases"
    }

    public init(orgs: Int, suspendedOrgs: Int, partnerAccounts: Int, bannedPartners: Int, programs: Int, commissionEarnedMinor: Int, payoutsSent: Int, openFraudCases: Int) {
        self.orgs = orgs
        self.suspendedOrgs = suspendedOrgs
        self.partnerAccounts = partnerAccounts
        self.bannedPartners = bannedPartners
        self.programs = programs
        self.commissionEarnedMinor = commissionEarnedMinor
        self.payoutsSent = payoutsSent
        self.openFraudCases = openFraudCases
    }
}

public struct GetAdminOrgsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var name: String
    public var plan: String
    public var planStatus: String?
    public var suspended: Bool
    public var createdAt: String
    public var programs: Int
    public var partners: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case plan = "plan"
        case planStatus = "planStatus"
        case suspended = "suspended"
        case createdAt = "createdAt"
        case programs = "programs"
        case partners = "partners"
    }

    public init(id: String, name: String, plan: String, planStatus: String? = nil, suspended: Bool, createdAt: String, programs: Int, partners: Int) {
        self.id = id
        self.name = name
        self.plan = plan
        self.planStatus = planStatus
        self.suspended = suspended
        self.createdAt = createdAt
        self.programs = programs
        self.partners = partners
    }
}

public struct GetAdminOrgsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAdminOrgsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAdminOrgsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostAdminOrgsIdSuspendResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var suspended: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case suspended = "suspended"
    }

    public init(ok: Bool, suspended: Bool) {
        self.ok = ok
        self.suspended = suspended
    }
}

public struct PostAdminOrgsIdPlanResponse: Codable, Sendable, Equatable {
    public var plan: String
    public var planStatus: String

    enum CodingKeys: String, CodingKey {
        case plan = "plan"
        case planStatus = "planStatus"
    }

    public init(plan: String, planStatus: String) {
        self.plan = plan
        self.planStatus = planStatus
    }
}

public struct PostAdminOrgsIdUnsuspendResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var suspended: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case suspended = "suspended"
    }

    public init(ok: Bool, suspended: Bool) {
        self.ok = ok
        self.suspended = suspended
    }
}

public struct GetAdminPartnerAccountsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var email: String
    public var name: String?
    public var banned: Bool
    public var kycStatus: String?
    public var sanctionsStatus: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case name = "name"
        case banned = "banned"
        case kycStatus = "kycStatus"
        case sanctionsStatus = "sanctionsStatus"
        case createdAt = "createdAt"
    }

    public init(id: String, email: String, name: String? = nil, banned: Bool, kycStatus: String? = nil, sanctionsStatus: String? = nil, createdAt: String) {
        self.id = id
        self.email = email
        self.name = name
        self.banned = banned
        self.kycStatus = kycStatus
        self.sanctionsStatus = sanctionsStatus
        self.createdAt = createdAt
    }
}

public struct GetAdminPartnerAccountsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAdminPartnerAccountsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAdminPartnerAccountsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostAdminPartnerAccountsIdBanResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var banned: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case banned = "banned"
    }

    public init(ok: Bool, banned: Bool) {
        self.ok = ok
        self.banned = banned
    }
}

public struct PostAdminPartnerAccountsIdUnbanResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var banned: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case banned = "banned"
    }

    public init(ok: Bool, banned: Bool) {
        self.ok = ok
        self.banned = banned
    }
}

public struct GetNotificationsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Notification]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Notification], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerNotificationsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [Notification]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [Notification], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostAssetsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var kind: String
    public var title: String
    public var content: String
    public var dimensions: String
    public var groupId: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case kind = "kind"
        case title = "title"
        case content = "content"
        case dimensions = "dimensions"
        case groupId = "groupId"
    }

    public init(id: String, programId: String, kind: String, title: String, content: String, dimensions: String, groupId: String? = nil) {
        self.id = id
        self.programId = programId
        self.kind = kind
        self.title = title
        self.content = content
        self.dimensions = dimensions
        self.groupId = groupId
    }
}

public struct GetAssetsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var kind: String
    public var title: String
    public var content: String
    public var dimensions: String
    public var groupId: String?
    public var clicks: Int
    public var referrals: Int
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case kind = "kind"
        case title = "title"
        case content = "content"
        case dimensions = "dimensions"
        case groupId = "groupId"
        case clicks = "clicks"
        case referrals = "referrals"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, kind: String, title: String, content: String, dimensions: String, groupId: String? = nil, clicks: Int, referrals: Int, createdAt: String) {
        self.id = id
        self.programId = programId
        self.kind = kind
        self.title = title
        self.content = content
        self.dimensions = dimensions
        self.groupId = groupId
        self.clicks = clicks
        self.referrals = referrals
        self.createdAt = createdAt
    }
}

public struct GetAssetsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetAssetsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetAssetsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostPartnerDealsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetPartnerDealsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var orgId: String
    public var company: String
    /// Integer minor units (cents).
    public var valueMinor: Int
    public var currency: String
    public var status: String
    public var protectionExpiresAt: String?
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case orgId = "orgId"
        case company = "company"
        case valueMinor = "valueMinor"
        case currency = "currency"
        case status = "status"
        case protectionExpiresAt = "protectionExpiresAt"
        case createdAt = "createdAt"
    }

    public init(id: String, orgId: String, company: String, valueMinor: Int, currency: String, status: String, protectionExpiresAt: String? = nil, createdAt: String) {
        self.id = id
        self.orgId = orgId
        self.company = company
        self.valueMinor = valueMinor
        self.currency = currency
        self.status = status
        self.protectionExpiresAt = protectionExpiresAt
        self.createdAt = createdAt
    }
}

public struct GetPartnerDealsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerDealsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerDealsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetDealsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var partnerId: String
    public var partnerEmail: String
    public var company: String
    public var contactEmail: String
    /// Integer minor units (cents).
    public var valueMinor: Int
    public var currency: String
    public var status: String
    public var protectionExpiresAt: String?
    public var referralId: String?
    public var notes: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case partnerId = "partnerId"
        case partnerEmail = "partnerEmail"
        case company = "company"
        case contactEmail = "contactEmail"
        case valueMinor = "valueMinor"
        case currency = "currency"
        case status = "status"
        case protectionExpiresAt = "protectionExpiresAt"
        case referralId = "referralId"
        case notes = "notes"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, partnerId: String, partnerEmail: String, company: String, contactEmail: String, valueMinor: Int, currency: String, status: String, protectionExpiresAt: String? = nil, referralId: String? = nil, notes: String, createdAt: String) {
        self.id = id
        self.programId = programId
        self.partnerId = partnerId
        self.partnerEmail = partnerEmail
        self.company = company
        self.contactEmail = contactEmail
        self.valueMinor = valueMinor
        self.currency = currency
        self.status = status
        self.protectionExpiresAt = protectionExpiresAt
        self.referralId = referralId
        self.notes = notes
        self.createdAt = createdAt
    }
}

public struct GetDealsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetDealsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetDealsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostDealsIdApproveResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String
    public var protectionExpiresAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case protectionExpiresAt = "protectionExpiresAt"
    }

    public init(id: String, status: String, protectionExpiresAt: String) {
        self.id = id
        self.status = status
        self.protectionExpiresAt = protectionExpiresAt
    }
}

public struct PostDealsIdRejectResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct PostDealsIdWonResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String
    public var referralId: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case referralId = "referralId"
    }

    public init(id: String, status: String, referralId: String) {
        self.id = id
        self.status = status
        self.referralId = referralId
    }
}

public struct PostProgramsIdApplyLevelingResponse: Codable, Sendable, Equatable {
    public var evaluated: Int
    public var promoted: Int

    enum CodingKeys: String, CodingKey {
        case evaluated = "evaluated"
        case promoted = "promoted"
    }

    public init(evaluated: Int, promoted: Int) {
        self.evaluated = evaluated
        self.promoted = promoted
    }
}

public struct PostPayoutRunsRunScheduledResponseValueItem: Codable, Sendable, Equatable {
    public var orgId: String
    public var runId: String
    public var payouts: Int
    public var sent: Int
    public var failed: Int

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case runId = "runId"
        case payouts = "payouts"
        case sent = "sent"
        case failed = "failed"
    }

    public init(orgId: String, runId: String, payouts: Int, sent: Int, failed: Int) {
        self.orgId = orgId
        self.runId = runId
        self.payouts = payouts
        self.sent = sent
        self.failed = failed
    }
}

public typealias PostPayoutRunsRunScheduledResponse = [PostPayoutRunsRunScheduledResponseValueItem]

public struct PutPartnerOrgsOrgIdPostbackResponse: Codable, Sendable, Equatable {
    public var url: String
    public var secret: String
    public var macros: [String]

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case secret = "secret"
        case macros = "macros"
    }

    public init(url: String, secret: String, macros: [String]) {
        self.url = url
        self.secret = secret
        self.macros = macros
    }
}

public struct GetPartnerPostbackLogsResponseDataItem: Codable, Sendable, Equatable {
    public var topic: String
    public var url: String
    public var statusCode: Int?
    public var ts: String

    enum CodingKeys: String, CodingKey {
        case topic = "topic"
        case url = "url"
        case statusCode = "statusCode"
        case ts = "ts"
    }

    public init(topic: String, url: String, statusCode: Int? = nil, ts: String) {
        self.topic = topic
        self.url = url
        self.statusCode = statusCode
        self.ts = ts
    }
}

public struct GetPartnerPostbackLogsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerPostbackLogsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerPostbackLogsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerRecruitResponse: Codable, Sendable, Equatable {
    public var code: String
    public var url: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case url = "url"
    }

    public init(code: String, url: String) {
        self.code = code
        self.url = url
    }
}

public struct GetPartnerAchievementsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var title: String
    public var unlocked: Bool
    public var progress: Int
    public var target: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case unlocked = "unlocked"
        case progress = "progress"
        case target = "target"
    }

    public init(id: String, title: String, unlocked: Bool, progress: Int, target: Int) {
        self.id = id
        self.title = title
        self.unlocked = unlocked
        self.progress = progress
        self.target = target
    }
}

public struct GetPartnerAchievementsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerAchievementsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerAchievementsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPartnerTermsResponseDataItem: Codable, Sendable, Equatable {
    public var versionId: String
    public var programId: String
    public var programName: String
    public var version: Int
    public var termsMd: String
    public var accepted: Bool

    enum CodingKeys: String, CodingKey {
        case versionId = "versionId"
        case programId = "programId"
        case programName = "programName"
        case version = "version"
        case termsMd = "termsMd"
        case accepted = "accepted"
    }

    public init(versionId: String, programId: String, programName: String, version: Int, termsMd: String, accepted: Bool) {
        self.versionId = versionId
        self.programId = programId
        self.programName = programName
        self.version = version
        self.termsMd = termsMd
        self.accepted = accepted
    }
}

public struct GetPartnerTermsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetPartnerTermsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetPartnerTermsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetProgramsIdTermsAcceptancesResponseDataItem: Codable, Sendable, Equatable {
    public var version: Int
    public var partnerEmail: String
    public var acceptedAt: String

    enum CodingKeys: String, CodingKey {
        case version = "version"
        case partnerEmail = "partnerEmail"
        case acceptedAt = "acceptedAt"
    }

    public init(version: Int, partnerEmail: String, acceptedAt: String) {
        self.version = version
        self.partnerEmail = partnerEmail
        self.acceptedAt = acceptedAt
    }
}

public struct GetProgramsIdTermsAcceptancesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetProgramsIdTermsAcceptancesResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetProgramsIdTermsAcceptancesResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetSetupStatusResponse: Codable, Sendable, Equatable {
    public var checks: [String: Bool]
    public var hints: [String]
    /// Stable keys for each hint, in the same order, for localized clients.
    public var hintKeys: [String]
    public var progress: String

    enum CodingKeys: String, CodingKey {
        case checks = "checks"
        case hints = "hints"
        case hintKeys = "hintKeys"
        case progress = "progress"
    }

    public init(checks: [String: Bool], hints: [String], hintKeys: [String], progress: String) {
        self.checks = checks
        self.hints = hints
        self.hintKeys = hintKeys
        self.progress = progress
    }
}

public struct PostAnomaliesScanResponseValueItem: Codable, Sendable, Equatable {
    public var orgId: String
    public var metric: String
    public var kind: String
    public var last24h: Double
    public var daily7dAvg: Double

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case metric = "metric"
        case kind = "kind"
        case last24h = "last24h"
        case daily7dAvg = "daily7dAvg"
    }

    public init(orgId: String, metric: String, kind: String, last24h: Double, daily7dAvg: Double) {
        self.orgId = orgId
        self.metric = metric
        self.kind = kind
        self.last24h = last24h
        self.daily7dAvg = daily7dAvg
    }
}

public typealias PostAnomaliesScanResponse = [PostAnomaliesScanResponseValueItem]

public struct PostPrivacyForgetResponsePartnersItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var alreadyForgotten: Bool

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case alreadyForgotten = "alreadyForgotten"
    }

    public init(partnerId: String, alreadyForgotten: Bool) {
        self.partnerId = partnerId
        self.alreadyForgotten = alreadyForgotten
    }
}

public struct PostPrivacyForgetResponseCustomersItem: Codable, Sendable, Equatable {
    public var customerRef: String
    public var pseudonym: String

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case pseudonym = "pseudonym"
    }

    public init(customerRef: String, pseudonym: String) {
        self.customerRef = customerRef
        self.pseudonym = pseudonym
    }
}

public struct PostPrivacyForgetResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    /// Erasure by customerRef.
    public var pseudonym: String?
    public var partners: [PostPrivacyForgetResponsePartnersItem]?
    public var customers: [PostPrivacyForgetResponseCustomersItem]?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case pseudonym = "pseudonym"
        case partners = "partners"
        case customers = "customers"
    }

    public init(ok: Bool, pseudonym: String? = nil, partners: [PostPrivacyForgetResponsePartnersItem]? = nil, customers: [PostPrivacyForgetResponseCustomersItem]? = nil) {
        self.ok = ok
        self.pseudonym = pseudonym
        self.partners = partners
        self.customers = customers
    }
}

public struct PostPrivacyLookupResponse: Codable, Sendable, Equatable {
    public var found: Bool
    public var customerRefs: [String]
    public var partnerId: String?

    enum CodingKeys: String, CodingKey {
        case found = "found"
        case customerRefs = "customerRefs"
        case partnerId = "partnerId"
    }

    public init(found: Bool, customerRefs: [String], partnerId: String? = nil) {
        self.found = found
        self.customerRefs = customerRefs
        self.partnerId = partnerId
    }
}

public struct PostPrivacyRequestsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetPrivacyRequestsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [PrivacyRequest]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [PrivacyRequest], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPrivacyRequestsIdResultResponseCustomersItemOption2: Codable, Sendable, Equatable {
    public var customerRef: String
    public var pseudonym: String

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case pseudonym = "pseudonym"
    }

    public init(customerRef: String, pseudonym: String) {
        self.customerRef = customerRef
        self.pseudonym = pseudonym
    }
}

public struct GetPrivacyRequestsIdResultResponsePartnersItem: Codable, Sendable, Equatable {
    public var partnerId: String
    public var alreadyForgotten: Bool

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case alreadyForgotten = "alreadyForgotten"
    }

    public init(partnerId: String, alreadyForgotten: Bool) {
        self.partnerId = partnerId
        self.alreadyForgotten = alreadyForgotten
    }
}

public struct GetPrivacyRequestsIdResultResponse: Codable, Sendable, Equatable {
    public var found: Bool
    public var customers: [JSONValue]
    public var partner: PartnerExport?
    public var partners: [GetPrivacyRequestsIdResultResponsePartnersItem]?

    enum CodingKeys: String, CodingKey {
        case found = "found"
        case customers = "customers"
        case partner = "partner"
        case partners = "partners"
    }

    public init(found: Bool, customers: [JSONValue], partner: PartnerExport? = nil, partners: [GetPrivacyRequestsIdResultResponsePartnersItem]? = nil) {
        self.found = found
        self.customers = customers
        self.partner = partner
        self.partners = partners
    }
}

public typealias PostEmailSettingsVerifyDomainResponse = JSONValue

public struct GetEmailTemplatesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [EmailTemplateEvent]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [EmailTemplateEvent], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PutEmailTemplatesEventLocaleResponse: Codable, Sendable, Equatable {
    public var event: String
    public var locale: String
    public var subject: String
    public var text: String
    public var html: String?
    public var updatedAt: String

    enum CodingKeys: String, CodingKey {
        case event = "event"
        case locale = "locale"
        case subject = "subject"
        case text = "text"
        case html = "html"
        case updatedAt = "updatedAt"
    }

    public init(event: String, locale: String, subject: String, text: String, html: String? = nil, updatedAt: String) {
        self.event = event
        self.locale = locale
        self.subject = subject
        self.text = text
        self.html = html
        self.updatedAt = updatedAt
    }
}

public struct DeleteEmailTemplatesEventLocaleResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var reset: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case reset = "reset"
    }

    public init(ok: Bool, reset: Bool) {
        self.ok = ok
        self.reset = reset
    }
}

public struct PostEmailTestResponse: Codable, Sendable, Equatable {
    public var sent: Bool
    public var id: String
    public var provider: String

    enum CodingKeys: String, CodingKey {
        case sent = "sent"
        case id = "id"
        case provider = "provider"
    }

    public init(sent: Bool, id: String, provider: String) {
        self.sent = sent
        self.id = id
        self.provider = provider
    }
}

public struct PutMeLocaleResponse: Codable, Sendable, Equatable {
    public var locale: String

    enum CodingKeys: String, CodingKey {
        case locale = "locale"
    }

    public init(locale: String) {
        self.locale = locale
    }
}

public struct PutMeRoiDigestResponse: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct PutPartnerLocaleResponse: Codable, Sendable, Equatable {
    public var locale: String

    enum CodingKeys: String, CodingKey {
        case locale = "locale"
    }

    public init(locale: String) {
        self.locale = locale
    }
}

public struct GetIntegrationsResponseZapier: Codable, Sendable, Equatable {
    public var hooks: Int
    public var events: [String]

    enum CodingKeys: String, CodingKey {
        case hooks = "hooks"
        case events = "events"
    }

    public init(hooks: Int, events: [String]) {
        self.hooks = hooks
        self.events = events
    }
}

public struct GetIntegrationsResponse: Codable, Sendable, Equatable {
    public var zapier: GetIntegrationsResponseZapier
    public var hubspot: IntegrationConnection?
    public var segment: IntegrationConnection?

    enum CodingKeys: String, CodingKey {
        case zapier = "zapier"
        case hubspot = "hubspot"
        case segment = "segment"
    }

    public init(zapier: GetIntegrationsResponseZapier, hubspot: IntegrationConnection? = nil, segment: IntegrationConnection? = nil) {
        self.zapier = zapier
        self.hubspot = hubspot
        self.segment = segment
    }
}

public struct PostIntegrationsHubspotTestResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var portalId: Int?
    public var createdProperties: [String]
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case portalId = "portalId"
        case createdProperties = "createdProperties"
        case error = "error"
    }

    public init(ok: Bool, portalId: Int? = nil, createdProperties: [String], error: String? = nil) {
        self.ok = ok
        self.portalId = portalId
        self.createdProperties = createdProperties
        self.error = error
    }
}

public struct PostIntegrationsSegmentTestResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case error = "error"
    }

    public init(ok: Bool, error: String? = nil) {
        self.ok = ok
        self.error = error
    }
}

public struct GetIntegrationsDeliveriesResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [IntegrationDelivery]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [IntegrationDelivery], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetZapierEventsResponseValueItem: Codable, Sendable, Equatable {
    public var key: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
    }

    public init(key: String) {
        self.key = key
    }
}

public typealias GetZapierEventsResponse = [GetZapierEventsResponseValueItem]

public struct GetZapierHooksResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [ZapierHook]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [ZapierHook], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

/// The event's payload fields, flattened, plus id (the event id), event and createdAt.
public struct GetZapierTriggersEventResponseValueItem: Codable, Sendable, Equatable {
    public var id: String
    public var event: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case event = "event"
        case createdAt = "createdAt"
    }

    public init(id: String, event: String, createdAt: String) {
        self.id = id
        self.event = event
        self.createdAt = createdAt
    }
}

public typealias GetZapierTriggersEventResponse = [GetZapierTriggersEventResponseValueItem]

public struct PostZapierConversionsResponse: Codable, Sendable, Equatable {
    public var connectionId: String

    enum CodingKeys: String, CodingKey {
        case connectionId = "connectionId"
    }

    public init(connectionId: String) {
        self.connectionId = connectionId
    }
}

public struct PostPartnerSecurityTotpSetupResponse: Codable, Sendable, Equatable {
    public var secret: String
    public var otpauthUrl: String

    enum CodingKeys: String, CodingKey {
        case secret = "secret"
        case otpauthUrl = "otpauthUrl"
    }

    public init(secret: String, otpauthUrl: String) {
        self.secret = secret
        self.otpauthUrl = otpauthUrl
    }
}

public struct PostPartnerSecurityTotpEnableResponse: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct PostPartnerSecurityTotpDisableResponse: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct GetPartnerSecurityResponse: Codable, Sendable, Equatable {
    public var totpEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case totpEnabled = "totpEnabled"
    }

    public init(totpEnabled: Bool) {
        self.totpEnabled = totpEnabled
    }
}

public struct GetAuthConnectionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [AuthConnection]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [AuthConnection], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct PostAuthConnectionsIdRotateSecretResponse: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    /// The new secret, shown once. The previous one keeps working until previousSecretExpiresAt.
    public var secret: String
    public var previousSecretExpiresAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case secret = "secret"
        case previousSecretExpiresAt = "previousSecretExpiresAt"
    }

    public init(id: String, provider: String, secret: String, previousSecretExpiresAt: String) {
        self.id = id
        self.provider = provider
        self.secret = secret
        self.previousSecretExpiresAt = previousSecretExpiresAt
    }
}

public struct PatchAuthConnectionsIdResponse: Codable, Sendable, Equatable {
    public var id: String
    public var provider: String
    public var name: String
    public var status: String
    public var autoEnrollUsers: Bool?
    public var destinationUrl: String?
    public var signatureVersion: String?
    public var requiresV2: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case provider = "provider"
        case name = "name"
        case status = "status"
        case autoEnrollUsers = "autoEnrollUsers"
        case destinationUrl = "destinationUrl"
        case signatureVersion = "signatureVersion"
        case requiresV2 = "requiresV2"
    }

    public init(id: String, provider: String, name: String, status: String, autoEnrollUsers: Bool? = nil, destinationUrl: String? = nil, signatureVersion: String? = nil, requiresV2: Bool? = nil) {
        self.id = id
        self.provider = provider
        self.name = name
        self.status = status
        self.autoEnrollUsers = autoEnrollUsers
        self.destinationUrl = destinationUrl
        self.signatureVersion = signatureVersion
        self.requiresV2 = requiresV2
    }
}

public struct PostAuthConnectionsIdRevokePreviousSecretResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var revoked: Bool

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case revoked = "revoked"
    }

    public init(ok: Bool, revoked: Bool) {
        self.ok = ok
        self.revoked = revoked
    }
}

public struct PostAuthConnectionsIdSignupsResponseReferralOption1: Codable, Sendable, Equatable {
    public var id: String
    public var partnerId: String
    public var partnerExternalRef: String?
    public var matchedVia: String
    public var status: String
    /// Test signups only: true when this referral already existed; false when it exists only in this answer.
    public var persisted: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case partnerId = "partnerId"
        case partnerExternalRef = "partnerExternalRef"
        case matchedVia = "matchedVia"
        case status = "status"
        case persisted = "persisted"
    }

    public init(id: String, partnerId: String, partnerExternalRef: String? = nil, matchedVia: String, status: String, persisted: Bool? = nil) {
        self.id = id
        self.partnerId = partnerId
        self.partnerExternalRef = partnerExternalRef
        self.matchedVia = matchedVia
        self.status = status
        self.persisted = persisted
    }
}

public struct PostAuthConnectionsIdSignupsResponseReasoning: Codable, Sendable, Equatable {
    /// English, for people; wording may change.
    public var notes: [String]
    /// One stable code per distinct reason behind notes, in order.
    public var codes: [SignupReasonCode]

    enum CodingKeys: String, CodingKey {
        case notes = "notes"
        case codes = "codes"
    }

    public init(notes: [String], codes: [SignupReasonCode]) {
        self.notes = notes
        self.codes = codes
    }
}

public struct PostAuthConnectionsIdSignupsResponsePartner: Codable, Sendable, Equatable {
    public var id: String
    public var code: String
    /// The partner's absolute tracked link (/go/{trackingToken}/{code}), on the org's verified link domain when it has one; null when they have only a coupon.
    public var link: String?
    /// Test signups only: true when this partner already existed; false when it exists only in this answer.
    public var persisted: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
        case link = "link"
        case persisted = "persisted"
    }

    public init(id: String, code: String, link: String? = nil, persisted: Bool? = nil) {
        self.id = id
        self.code = code
        self.link = link
        self.persisted = persisted
    }
}

public struct PostAuthConnectionsIdSignupsResponse: Codable, Sendable, Equatable {
    /// Present on a test signup ("test": true or atlas-test: 1): answered as a real call, nothing stored.
    public var test: Bool?
    public var referral: PostAuthConnectionsIdSignupsResponseReferralOption1?
    public var reasoning: PostAuthConnectionsIdSignupsResponseReasoning?
    public var partner: PostAuthConnectionsIdSignupsResponsePartner?

    enum CodingKeys: String, CodingKey {
        case test = "test"
        case referral = "referral"
        case reasoning = "reasoning"
        case partner = "partner"
    }

    public init(test: Bool? = nil, referral: PostAuthConnectionsIdSignupsResponseReferralOption1? = nil, reasoning: PostAuthConnectionsIdSignupsResponseReasoning? = nil, partner: PostAuthConnectionsIdSignupsResponsePartner? = nil) {
        self.test = test
        self.referral = referral
        self.reasoning = reasoning
        self.partner = partner
    }
}

public struct PostAuthConnectionsIdEraseResponseCustomerOption1: Codable, Sendable, Equatable {
    public var customerRef: String
    public var pseudonym: String

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case pseudonym = "pseudonym"
    }

    public init(customerRef: String, pseudonym: String) {
        self.customerRef = customerRef
        self.pseudonym = pseudonym
    }
}

public struct PostAuthConnectionsIdEraseResponsePartnerOption1: Codable, Sendable, Equatable {
    public var partnerId: String
    public var alreadyForgotten: Bool

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case alreadyForgotten = "alreadyForgotten"
    }

    public init(partnerId: String, alreadyForgotten: Bool) {
        self.partnerId = partnerId
        self.alreadyForgotten = alreadyForgotten
    }
}

public struct PostAuthConnectionsIdEraseResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    /// False when nothing was filed under the customer (a retry settles cleanly).
    public var erased: Bool
    public var customer: PostAuthConnectionsIdEraseResponseCustomerOption1?
    public var partner: PostAuthConnectionsIdEraseResponsePartnerOption1?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case erased = "erased"
        case customer = "customer"
        case partner = "partner"
    }

    public init(ok: Bool, erased: Bool, customer: PostAuthConnectionsIdEraseResponseCustomerOption1? = nil, partner: PostAuthConnectionsIdEraseResponsePartnerOption1? = nil) {
        self.ok = ok
        self.erased = erased
        self.customer = customer
        self.partner = partner
    }
}

public struct GetAuthConnectionsIdExportResponse: Codable, Sendable, Equatable {
    public var customer: CustomerExport
    public var partner: PartnerExport?

    enum CodingKeys: String, CodingKey {
        case customer = "customer"
        case partner = "partner"
    }

    public init(customer: CustomerExport, partner: PartnerExport? = nil) {
        self.customer = customer
        self.partner = partner
    }
}

public struct PostAuthConnectionsIdPingResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var connectionId: String
    public var programId: String
    public var orgName: String
    public var autoEnrollUsers: Bool
    public var serverTime: String

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case connectionId = "connectionId"
        case programId = "programId"
        case orgName = "orgName"
        case autoEnrollUsers = "autoEnrollUsers"
        case serverTime = "serverTime"
    }

    public init(ok: Bool, connectionId: String, programId: String, orgName: String, autoEnrollUsers: Bool, serverTime: String) {
        self.ok = ok
        self.connectionId = connectionId
        self.programId = programId
        self.orgName = orgName
        self.autoEnrollUsers = autoEnrollUsers
        self.serverTime = serverTime
    }
}

public struct PostAuthConnectionsIdAliasesResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var customerRef: String
    public var referralIds: [String]
    public var partnerId: String?
    public var alreadyAliased: Bool
    public var reprocessedPayments: Int

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case customerRef = "customerRef"
        case referralIds = "referralIds"
        case partnerId = "partnerId"
        case alreadyAliased = "alreadyAliased"
        case reprocessedPayments = "reprocessedPayments"
    }

    public init(ok: Bool, customerRef: String, referralIds: [String], partnerId: String? = nil, alreadyAliased: Bool, reprocessedPayments: Int) {
        self.ok = ok
        self.customerRef = customerRef
        self.referralIds = referralIds
        self.partnerId = partnerId
        self.alreadyAliased = alreadyAliased
        self.reprocessedPayments = reprocessedPayments
    }
}

public struct PostAuthConnectionsIdUsersResponseCustomerOption1: Codable, Sendable, Equatable {
    public var customerRef: String
    public var pseudonym: String

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case pseudonym = "pseudonym"
    }

    public init(customerRef: String, pseudonym: String) {
        self.customerRef = customerRef
        self.pseudonym = pseudonym
    }
}

public struct PostAuthConnectionsIdUsersResponsePartnerOption1Option1: Codable, Sendable, Equatable {
    public var partnerId: String
    public var alreadyForgotten: Bool

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case alreadyForgotten = "alreadyForgotten"
    }

    public init(partnerId: String, alreadyForgotten: Bool) {
        self.partnerId = partnerId
        self.alreadyForgotten = alreadyForgotten
    }
}

public struct PostAuthConnectionsIdUsersResponsePartnerOption1Option2: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct PostAuthConnectionsIdUsersResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var deleted: Bool?
    public var erased: Bool?
    public var customer: PostAuthConnectionsIdUsersResponseCustomerOption1?
    public var partner: JSONValue?
    public var updated: [String]?
    public var notes: [String]?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case deleted = "deleted"
        case erased = "erased"
        case customer = "customer"
        case partner = "partner"
        case updated = "updated"
        case notes = "notes"
    }

    public init(ok: Bool, deleted: Bool? = nil, erased: Bool? = nil, customer: PostAuthConnectionsIdUsersResponseCustomerOption1? = nil, partner: JSONValue? = nil, updated: [String]? = nil, notes: [String]? = nil) {
        self.ok = ok
        self.deleted = deleted
        self.erased = erased
        self.customer = customer
        self.partner = partner
        self.updated = updated
        self.notes = notes
    }
}

public struct PostAuthConnectionsIdSignalsResponseReferralsItem: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct PostAuthConnectionsIdSignalsResponseReversedItem: Codable, Sendable, Equatable {
    public var lineId: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case lineId = "lineId"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(lineId: String, amountMinor: Int, currency: String) {
        self.lineId = lineId
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostAuthConnectionsIdSignalsResponsePartnerOption1: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct PostAuthConnectionsIdSignalsResponse: Codable, Sendable, Equatable {
    public var ok: Bool
    public var signal: String
    public var referrals: [PostAuthConnectionsIdSignalsResponseReferralsItem]
    public var reversed: [PostAuthConnectionsIdSignalsResponseReversedItem]
    public var partner: PostAuthConnectionsIdSignalsResponsePartnerOption1?
    public var notes: [String]?

    enum CodingKeys: String, CodingKey {
        case ok = "ok"
        case signal = "signal"
        case referrals = "referrals"
        case reversed = "reversed"
        case partner = "partner"
        case notes = "notes"
    }

    public init(ok: Bool, signal: String, referrals: [PostAuthConnectionsIdSignalsResponseReferralsItem], reversed: [PostAuthConnectionsIdSignalsResponseReversedItem], partner: PostAuthConnectionsIdSignalsResponsePartnerOption1? = nil, notes: [String]? = nil) {
        self.ok = ok
        self.signal = signal
        self.referrals = referrals
        self.reversed = reversed
        self.partner = partner
        self.notes = notes
    }
}

public struct GetOrgSsoResponseProviderOption1: Codable, Sendable, Equatable {
    public var name: String
    public var label: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case label = "label"
    }

    public init(name: String, label: String) {
        self.name = name
        self.label = label
    }
}

public struct GetOrgSsoResponseConnectionsItem: Codable, Sendable, Equatable {
    public var id: String
    public var type: String
    public var status: String
    public var allowedDomains: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case status = "status"
        case allowedDomains = "allowedDomains"
    }

    public init(id: String, type: String, status: String, allowedDomains: [String]) {
        self.id = id
        self.type = type
        self.status = status
        self.allowedDomains = allowedDomains
    }
}

public struct GetOrgSsoResponseTicketsItem: Codable, Sendable, Equatable {
    public var id: String
    public var status: String
    public var expiresAt: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case expiresAt = "expiresAt"
        case createdAt = "createdAt"
    }

    public init(id: String, status: String, expiresAt: String, createdAt: String) {
        self.id = id
        self.status = status
        self.expiresAt = expiresAt
        self.createdAt = createdAt
    }
}

public struct GetOrgSsoResponse: Codable, Sendable, Equatable {
    public var configured: Bool
    /// The deployment's SSO provider; null when SSO isn't configured.
    public var provider: GetOrgSsoResponseProviderOption1?
    /// The provider's role keys → Referalli roles, before the org's own mapping.
    public var defaultRoleMapping: [String: String]
    public var linked: Bool
    /// The org's directory tenant at the provider.
    public var tenantId: String?
    /// Deprecated: tenantId, when the provider is Atlas.
    public var atlasOrgId: String?
    public var connections: [GetOrgSsoResponseConnectionsItem]
    public var domains: [String]
    public var requireSso: Bool
    public var roleMapping: [String: String]
    public var tickets: [GetOrgSsoResponseTicketsItem]
    /// Why the provider couldn't be read just now, if it couldn't.
    public var providerError: String?
    /// Deprecated: providerError.
    public var atlasError: String?

    enum CodingKeys: String, CodingKey {
        case configured = "configured"
        case provider = "provider"
        case defaultRoleMapping = "defaultRoleMapping"
        case linked = "linked"
        case tenantId = "tenantId"
        case atlasOrgId = "atlasOrgId"
        case connections = "connections"
        case domains = "domains"
        case requireSso = "requireSso"
        case roleMapping = "roleMapping"
        case tickets = "tickets"
        case providerError = "providerError"
        case atlasError = "atlasError"
    }

    public init(configured: Bool, provider: GetOrgSsoResponseProviderOption1? = nil, defaultRoleMapping: [String: String], linked: Bool, tenantId: String? = nil, atlasOrgId: String? = nil, connections: [GetOrgSsoResponseConnectionsItem], domains: [String], requireSso: Bool, roleMapping: [String: String], tickets: [GetOrgSsoResponseTicketsItem], providerError: String? = nil, atlasError: String? = nil) {
        self.configured = configured
        self.provider = provider
        self.defaultRoleMapping = defaultRoleMapping
        self.linked = linked
        self.tenantId = tenantId
        self.atlasOrgId = atlasOrgId
        self.connections = connections
        self.domains = domains
        self.requireSso = requireSso
        self.roleMapping = roleMapping
        self.tickets = tickets
        self.providerError = providerError
        self.atlasError = atlasError
    }
}

public struct PostOrgSsoLinkResponse: Codable, Sendable, Equatable {
    public var linked: Bool
    public var provider: String
    public var tenantId: String
    public var atlasOrgId: String?

    enum CodingKeys: String, CodingKey {
        case linked = "linked"
        case provider = "provider"
        case tenantId = "tenantId"
        case atlasOrgId = "atlasOrgId"
    }

    public init(linked: Bool, provider: String, tenantId: String, atlasOrgId: String? = nil) {
        self.linked = linked
        self.provider = provider
        self.tenantId = tenantId
        self.atlasOrgId = atlasOrgId
    }
}

public struct PostOrgSsoTicketsResponse: Codable, Sendable, Equatable {
    public var id: String
    /// The SSO provider's hosted setup page for the IT admin. Shown once; not stored.
    public var url: String
    public var expiresAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case expiresAt = "expiresAt"
    }

    public init(id: String, url: String, expiresAt: String) {
        self.id = id
        self.url = url
        self.expiresAt = expiresAt
    }
}

public struct PostOrgSsoTicketsIdRevokeResponse: Codable, Sendable, Equatable {
    public var id: String
    public var status: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
    }

    public init(id: String, status: String) {
        self.id = id
        self.status = status
    }
}

public struct GetOrgSsoConnectionsIdSamlMetadataResponse: Codable, Sendable, Equatable {
    public var spEntityId: String
    public var acsUrl: String
    public var metadataXml: String

    enum CodingKeys: String, CodingKey {
        case spEntityId = "spEntityId"
        case acsUrl = "acsUrl"
        case metadataXml = "metadataXml"
    }

    public init(spEntityId: String, acsUrl: String, metadataXml: String) {
        self.spEntityId = spEntityId
        self.acsUrl = acsUrl
        self.metadataXml = metadataXml
    }
}

public struct PatchOrgSsoResponse: Codable, Sendable, Equatable {
    public var requireSso: Bool
    public var roleMapping: [String: String]

    enum CodingKeys: String, CodingKey {
        case requireSso = "requireSso"
        case roleMapping = "roleMapping"
    }

    public init(requireSso: Bool, roleMapping: [String: String]) {
        self.requireSso = requireSso
        self.roleMapping = roleMapping
    }
}

public struct PostPartnerAuthWalletNonceResponse: Codable, Sendable, Equatable {
    public var nonce: String
    public var message: String

    enum CodingKeys: String, CodingKey {
        case nonce = "nonce"
        case message = "message"
    }

    public init(nonce: String, message: String) {
        self.nonce = nonce
        self.message = message
    }
}

public struct PostPartnerAuthWalletVerifyResponse: Codable, Sendable, Equatable {
    public var accountId: String
    public var wallet: String

    enum CodingKeys: String, CodingKey {
        case accountId = "accountId"
        case wallet = "wallet"
    }

    public init(accountId: String, wallet: String) {
        self.accountId = accountId
        self.wallet = wallet
    }
}

public struct PostOnchainConnectionsResponse: Codable, Sendable, Equatable {
    public var id: String
    public var secret: String
    public var webhookUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case secret = "secret"
        case webhookUrl = "webhookUrl"
    }

    public init(id: String, secret: String, webhookUrl: String) {
        self.id = id
        self.secret = secret
        self.webhookUrl = webhookUrl
    }
}

public struct GetOnchainConnectionsResponseDataItem: Codable, Sendable, Equatable {
    public var id: String
    public var programId: String
    public var name: String
    public var status: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programId = "programId"
        case name = "name"
        case status = "status"
        case createdAt = "createdAt"
    }

    public init(id: String, programId: String, name: String, status: String, createdAt: String) {
        self.id = id
        self.programId = programId
        self.name = name
        self.status = status
        self.createdAt = createdAt
    }
}

public struct GetOnchainConnectionsResponse: Codable, Sendable, Equatable {
    public var object: String
    public var data: [GetOnchainConnectionsResponseDataItem]
    /// Whether another page follows; pass next_cursor as starting_after to get it.
    public var hasMore: Bool
    public var nextCursor: String?

    enum CodingKeys: String, CodingKey {
        case object = "object"
        case data = "data"
        case hasMore = "has_more"
        case nextCursor = "next_cursor"
    }

    public init(object: String, data: [GetOnchainConnectionsResponseDataItem], hasMore: Bool, nextCursor: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.nextCursor = nextCursor
    }
}

public struct GetPublicProgramsHandleResponseBranding: Codable, Sendable, Equatable {
    public var logoUrl: String?
    public var theme: GetOpenapiJsonResponse?

    enum CodingKeys: String, CodingKey {
        case logoUrl = "logoUrl"
        case theme = "theme"
    }

    public init(logoUrl: String? = nil, theme: GetOpenapiJsonResponse? = nil) {
        self.logoUrl = logoUrl
        self.theme = theme
    }
}

public struct GetPublicProgramsHandleResponse: Codable, Sendable, Equatable {
    public var handle: String
    public var programId: String
    public var programName: String
    public var merchant: String
    public var trackingToken: String
    public var cookieWindowDays: Int
    public var termsMd: String
    public var pitch: String
    public var autoApprove: Bool
    public var commission: GetOpenapiJsonResponse?
    public var branding: GetPublicProgramsHandleResponseBranding

    enum CodingKeys: String, CodingKey {
        case handle = "handle"
        case programId = "programId"
        case programName = "programName"
        case merchant = "merchant"
        case trackingToken = "trackingToken"
        case cookieWindowDays = "cookieWindowDays"
        case termsMd = "termsMd"
        case pitch = "pitch"
        case autoApprove = "autoApprove"
        case commission = "commission"
        case branding = "branding"
    }

    public init(handle: String, programId: String, programName: String, merchant: String, trackingToken: String, cookieWindowDays: Int, termsMd: String, pitch: String, autoApprove: Bool, commission: GetOpenapiJsonResponse? = nil, branding: GetPublicProgramsHandleResponseBranding) {
        self.handle = handle
        self.programId = programId
        self.programName = programName
        self.merchant = merchant
        self.trackingToken = trackingToken
        self.cookieWindowDays = cookieWindowDays
        self.termsMd = termsMd
        self.pitch = pitch
        self.autoApprove = autoApprove
        self.commission = commission
        self.branding = branding
    }
}

public struct PostPublicProgramsHandleJoinResponse: Codable, Sendable, Equatable {
    public var accountId: String
    public var status: String
    public var link: String?
    public var linkUrl: String?
    public var code: String?
    public var portalUrl: String

    enum CodingKeys: String, CodingKey {
        case accountId = "accountId"
        case status = "status"
        case link = "link"
        case linkUrl = "linkUrl"
        case code = "code"
        case portalUrl = "portalUrl"
    }

    public init(accountId: String, status: String, link: String? = nil, linkUrl: String? = nil, code: String? = nil, portalUrl: String) {
        self.accountId = accountId
        self.status = status
        self.link = link
        self.linkUrl = linkUrl
        self.code = code
        self.portalUrl = portalUrl
    }
}

public struct PostWebhooksBillingConnectionIdResponseResultsItem: Codable, Sendable, Equatable {
    public var duplicate: Bool
    public var billingEventId: String?
    public var conversions: Int
    public var linesCreated: Int
    public var reversals: Int

    enum CodingKeys: String, CodingKey {
        case duplicate = "duplicate"
        case billingEventId = "billingEventId"
        case conversions = "conversions"
        case linesCreated = "linesCreated"
        case reversals = "reversals"
    }

    public init(duplicate: Bool, billingEventId: String? = nil, conversions: Int, linesCreated: Int, reversals: Int) {
        self.duplicate = duplicate
        self.billingEventId = billingEventId
        self.conversions = conversions
        self.linesCreated = linesCreated
        self.reversals = reversals
    }
}

public struct PostWebhooksBillingConnectionIdResponse: Codable, Sendable, Equatable {
    public var received: Int
    public var results: [PostWebhooksBillingConnectionIdResponseResultsItem]

    enum CodingKeys: String, CodingKey {
        case received = "received"
        case results = "results"
    }

    public init(received: Int, results: [PostWebhooksBillingConnectionIdResponseResultsItem]) {
        self.received = received
        self.results = results
    }
}

public struct PostWebhooksAuthConnectionIdResponseResultsItem: Codable, Sendable, Equatable {
    public var customerRef: String
    public var attributed: Bool
    public var reason: String?
    public var partnerId: String?
    public var matchedVia: String?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case attributed = "attributed"
        case reason = "reason"
        case partnerId = "partnerId"
        case matchedVia = "matchedVia"
    }

    public init(customerRef: String, attributed: Bool, reason: String? = nil, partnerId: String? = nil, matchedVia: String? = nil) {
        self.customerRef = customerRef
        self.attributed = attributed
        self.reason = reason
        self.partnerId = partnerId
        self.matchedVia = matchedVia
    }
}

public struct PostWebhooksAuthConnectionIdResponse: Codable, Sendable, Equatable {
    public var received: Int
    public var results: [PostWebhooksAuthConnectionIdResponseResultsItem]

    enum CodingKeys: String, CodingKey {
        case received = "received"
        case results = "results"
    }

    public init(received: Int, results: [PostWebhooksAuthConnectionIdResponseResultsItem]) {
        self.received = received
        self.results = results
    }
}

public struct PostWebhooksSsoProviderResponse: Codable, Sendable, Equatable {
    public var received: Bool
    public var duplicate: Bool
    public var handled: Bool?
    public var effects: [String]?

    enum CodingKeys: String, CodingKey {
        case received = "received"
        case duplicate = "duplicate"
        case handled = "handled"
        case effects = "effects"
    }

    public init(received: Bool, duplicate: Bool, handled: Bool? = nil, effects: [String]? = nil) {
        self.received = received
        self.duplicate = duplicate
        self.handled = handled
        self.effects = effects
    }
}

public struct PostWebhooksOnchainConnectionIdResponseResultsItem: Codable, Sendable, Equatable {
    public var txHash: String
    public var wallet: String
    /// Integer minor units (cents).
    public var amountMinor: Int
    public var attributed: Bool
    public var linesCreated: Int
    public var duplicate: Bool

    enum CodingKeys: String, CodingKey {
        case txHash = "txHash"
        case wallet = "wallet"
        case amountMinor = "amountMinor"
        case attributed = "attributed"
        case linesCreated = "linesCreated"
        case duplicate = "duplicate"
    }

    public init(txHash: String, wallet: String, amountMinor: Int, attributed: Bool, linesCreated: Int, duplicate: Bool) {
        self.txHash = txHash
        self.wallet = wallet
        self.amountMinor = amountMinor
        self.attributed = attributed
        self.linesCreated = linesCreated
        self.duplicate = duplicate
    }
}

public struct PostWebhooksOnchainConnectionIdResponse: Codable, Sendable, Equatable {
    public var received: Int
    public var results: [PostWebhooksOnchainConnectionIdResponseResultsItem]

    enum CodingKeys: String, CodingKey {
        case received = "received"
        case results = "results"
    }

    public init(received: Int, results: [PostWebhooksOnchainConnectionIdResponseResultsItem]) {
        self.received = received
        self.results = results
    }
}

public struct PostWebhooksPayoutsProviderResponse: Codable, Sendable, Equatable {
    public var ignored: Bool?
    public var reason: String?
    public var finalized: Bool?
    public var status: String?

    enum CodingKeys: String, CodingKey {
        case ignored = "ignored"
        case reason = "reason"
        case finalized = "finalized"
        case status = "status"
    }

    public init(ignored: Bool? = nil, reason: String? = nil, finalized: Bool? = nil, status: String? = nil) {
        self.ignored = ignored
        self.reason = reason
        self.finalized = finalized
        self.status = status
    }
}

public struct PostWebhooksStripeBillingResponse: Codable, Sendable, Equatable {
    public var received: Bool
    public var duplicate: Bool?
    public var ignored: Bool?
    public var reason: String?
    public var orgId: String?
    public var plan: String?
    public var planStatus: String?

    enum CodingKeys: String, CodingKey {
        case received = "received"
        case duplicate = "duplicate"
        case ignored = "ignored"
        case reason = "reason"
        case orgId = "orgId"
        case plan = "plan"
        case planStatus = "planStatus"
    }

    public init(received: Bool, duplicate: Bool? = nil, ignored: Bool? = nil, reason: String? = nil, orgId: String? = nil, plan: String? = nil, planStatus: String? = nil) {
        self.received = received
        self.duplicate = duplicate
        self.ignored = ignored
        self.reason = reason
        self.orgId = orgId
        self.plan = plan
        self.planStatus = planStatus
    }
}

public struct GetGraphqlResponse: Codable, Sendable, Equatable {
    public var data: GetOpenapiJsonResponse?
    public var errors: [GetOpenapiJsonResponse]?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case errors = "errors"
    }

    public init(data: GetOpenapiJsonResponse? = nil, errors: [GetOpenapiJsonResponse]? = nil) {
        self.data = data
        self.errors = errors
    }
}

public struct PostGraphqlResponse: Codable, Sendable, Equatable {
    public var data: GetOpenapiJsonResponse?
    public var errors: [GetOpenapiJsonResponse]?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case errors = "errors"
    }

    public init(data: GetOpenapiJsonResponse? = nil, errors: [GetOpenapiJsonResponse]? = nil) {
        self.data = data
        self.errors = errors
    }
}

public struct PostAgentsRegisterBody: Codable, Sendable, Equatable {
    public var walletAddress: String
    public var nonce: String
    public var signature: String
    public var name: String?
    public var model: String?
    public var `operator`: String?
    public var instantPayout: Bool?

    enum CodingKeys: String, CodingKey {
        case walletAddress = "walletAddress"
        case nonce = "nonce"
        case signature = "signature"
        case name = "name"
        case model = "model"
        case `operator` = "operator"
        case instantPayout = "instantPayout"
    }

    public init(walletAddress: String, nonce: String, signature: String, name: String? = nil, model: String? = nil, `operator`: String? = nil, instantPayout: Bool? = nil) {
        self.walletAddress = walletAddress
        self.nonce = nonce
        self.signature = signature
        self.name = name
        self.model = model
        self.`operator` = `operator`
        self.instantPayout = instantPayout
    }
}

public struct PostOrgsBody: Codable, Sendable, Equatable {
    public var name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }

    public init(name: String) {
        self.name = name
    }
}

public struct PostMobilePurchasesBody: Codable, Sendable, Equatable {
    public var eventId: String
    public var customerRef: String
    public var type: String?
    public var amountMinor: Int
    public var currency: String?
    public var productRef: String?

    enum CodingKeys: String, CodingKey {
        case eventId = "eventId"
        case customerRef = "customerRef"
        case type = "type"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case productRef = "productRef"
    }

    public init(eventId: String, customerRef: String, type: String? = nil, amountMinor: Int, currency: String? = nil, productRef: String? = nil) {
        self.eventId = eventId
        self.customerRef = customerRef
        self.type = type
        self.amountMinor = amountMinor
        self.currency = currency
        self.productRef = productRef
    }
}

public struct PatchOrgBody: Codable, Sendable, Equatable {
    public var name: String?
    public var settings: [String: JSONValue]?
    public var payoutKycRequired: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case settings = "settings"
        case payoutKycRequired = "payoutKycRequired"
    }

    public init(name: String? = nil, settings: [String: JSONValue]? = nil, payoutKycRequired: Bool? = nil) {
        self.name = name
        self.settings = settings
        self.payoutKycRequired = payoutKycRequired
    }
}

public struct PostOrgMembersBody: Codable, Sendable, Equatable {
    public var email: String
    public var role: String

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case role = "role"
    }

    public init(email: String, role: String) {
        self.email = email
        self.role = role
    }
}

public struct PatchOrgMembersUserIdBody: Codable, Sendable, Equatable {
    public var role: String

    enum CodingKeys: String, CodingKey {
        case role = "role"
    }

    public init(role: String) {
        self.role = role
    }
}

public struct PutOrgPayoutScheduleBodyScheduleOption1Option1: Codable, Sendable, Equatable {
    public var kind: String
    public var dayOfMonth: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dayOfMonth = "dayOfMonth"
    }

    public init(kind: String, dayOfMonth: Int) {
        self.kind = kind
        self.dayOfMonth = dayOfMonth
    }
}

public struct PutOrgPayoutScheduleBodyScheduleOption1Option2: Codable, Sendable, Equatable {
    public var kind: String
    public var dayOfWeek: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dayOfWeek = "dayOfWeek"
    }

    public init(kind: String, dayOfWeek: Int) {
        self.kind = kind
        self.dayOfWeek = dayOfWeek
    }
}

public struct PutOrgPayoutScheduleBodyScheduleOption1Option3: Codable, Sendable, Equatable {
    public var kind: String
    public var days: [Int]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case days = "days"
    }

    public init(kind: String, days: [Int]) {
        self.kind = kind
        self.days = days
    }
}

public struct PutOrgPayoutScheduleBodyScheduleOption1Option4: Codable, Sendable, Equatable {
    public var kind: String
    public var dates: [String]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dates = "dates"
    }

    public init(kind: String, dates: [String]) {
        self.kind = kind
        self.dates = dates
    }
}

public struct PutOrgPayoutScheduleBody: Codable, Sendable, Equatable {
    public var dayOfMonth: Int?
    public var schedule: JSONValue?

    enum CodingKeys: String, CodingKey {
        case dayOfMonth = "dayOfMonth"
        case schedule = "schedule"
    }

    public init(dayOfMonth: Int? = nil, schedule: JSONValue? = nil) {
        self.dayOfMonth = dayOfMonth
        self.schedule = schedule
    }
}

public struct PutProgramsIdPayoutScheduleBodyScheduleOption1Option1Option1: Codable, Sendable, Equatable {
    public var kind: String
    public var dayOfMonth: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dayOfMonth = "dayOfMonth"
    }

    public init(kind: String, dayOfMonth: Int) {
        self.kind = kind
        self.dayOfMonth = dayOfMonth
    }
}

public struct PutProgramsIdPayoutScheduleBodyScheduleOption1Option1Option2: Codable, Sendable, Equatable {
    public var kind: String
    public var dayOfWeek: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dayOfWeek = "dayOfWeek"
    }

    public init(kind: String, dayOfWeek: Int) {
        self.kind = kind
        self.dayOfWeek = dayOfWeek
    }
}

public struct PutProgramsIdPayoutScheduleBodyScheduleOption1Option1Option3: Codable, Sendable, Equatable {
    public var kind: String
    public var days: [Int]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case days = "days"
    }

    public init(kind: String, days: [Int]) {
        self.kind = kind
        self.days = days
    }
}

public struct PutProgramsIdPayoutScheduleBodyScheduleOption1Option1Option4: Codable, Sendable, Equatable {
    public var kind: String
    public var dates: [String]

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case dates = "dates"
    }

    public init(kind: String, dates: [String]) {
        self.kind = kind
        self.dates = dates
    }
}

public struct PutProgramsIdPayoutScheduleBodyScheduleOption1Option2: Codable, Sendable, Equatable {
    public var kind: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
    }

    public init(kind: String) {
        self.kind = kind
    }
}

public struct PutProgramsIdPayoutScheduleBody: Codable, Sendable, Equatable {
    public var schedule: JSONValue?

    enum CodingKeys: String, CodingKey {
        case schedule = "schedule"
    }

    public init(schedule: JSONValue? = nil) {
        self.schedule = schedule
    }
}

public struct PutOrgTaxProfileBody: Codable, Sendable, Equatable {
    public var legalName: String?
    public var address: String?
    public var country: String?
    public var vatId: String?
    public var ein: String?
    public var domesticVatBps: Int?
    public var viesCheck: Bool?

    enum CodingKeys: String, CodingKey {
        case legalName = "legalName"
        case address = "address"
        case country = "country"
        case vatId = "vatId"
        case ein = "ein"
        case domesticVatBps = "domesticVatBps"
        case viesCheck = "viesCheck"
    }

    public init(legalName: String? = nil, address: String? = nil, country: String? = nil, vatId: String? = nil, ein: String? = nil, domesticVatBps: Int? = nil, viesCheck: Bool? = nil) {
        self.legalName = legalName
        self.address = address
        self.country = country
        self.vatId = vatId
        self.ein = ein
        self.domesticVatBps = domesticVatBps
        self.viesCheck = viesCheck
    }
}

public struct PutPartnersIdVatBody: Codable, Sendable, Equatable {
    public var vatId: String?

    enum CodingKeys: String, CodingKey {
        case vatId = "vatId"
    }

    public init(vatId: String? = nil) {
        self.vatId = vatId
    }
}

public struct PostPartnerOrgsOrgIdSelfBillingBody: Codable, Sendable, Equatable {
    public var accept: Bool

    enum CodingKeys: String, CodingKey {
        case accept = "accept"
    }

    public init(accept: Bool) {
        self.accept = accept
    }
}

public struct PutPartnerOrgsOrgIdVatBody: Codable, Sendable, Equatable {
    public var vatId: String?

    enum CodingKeys: String, CodingKey {
        case vatId = "vatId"
    }

    public init(vatId: String? = nil) {
        self.vatId = vatId
    }
}

public struct PutOrgTaxFilingBodyCredentials: Codable, Sendable, Equatable {
    public var apiKey: String
    public var baseUrl: String?

    enum CodingKeys: String, CodingKey {
        case apiKey = "apiKey"
        case baseUrl = "baseUrl"
    }

    public init(apiKey: String, baseUrl: String? = nil) {
        self.apiKey = apiKey
        self.baseUrl = baseUrl
    }
}

public struct PutOrgTaxFilingBody: Codable, Sendable, Equatable {
    public var provider: String
    public var credentials: PutOrgTaxFilingBodyCredentials?

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case credentials = "credentials"
    }

    public init(provider: String, credentials: PutOrgTaxFilingBodyCredentials? = nil) {
        self.provider = provider
        self.credentials = credentials
    }
}

public struct PostTax1099FilingsBody: Codable, Sendable, Equatable {
    public var year: Int

    enum CodingKeys: String, CodingKey {
        case year = "year"
    }

    public init(year: Int) {
        self.year = year
    }
}

public struct PostAdminStatusIncidentsBody: Codable, Sendable, Equatable {
    public var title: String
    public var severity: String?
    public var state: String?
    public var body: String?
    public var components: [String]?
    public var startedAt: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case severity = "severity"
        case state = "state"
        case body = "body"
        case components = "components"
        case startedAt = "startedAt"
    }

    public init(title: String, severity: String? = nil, state: String? = nil, body: String? = nil, components: [String]? = nil, startedAt: String? = nil) {
        self.title = title
        self.severity = severity
        self.state = state
        self.body = body
        self.components = components
        self.startedAt = startedAt
    }
}

public struct PatchAdminStatusIncidentsIdBody: Codable, Sendable, Equatable {
    public var title: String?
    public var severity: String?
    public var state: String?
    public var body: String?
    public var components: [String]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case severity = "severity"
        case state = "state"
        case body = "body"
        case components = "components"
    }

    public init(title: String? = nil, severity: String? = nil, state: String? = nil, body: String? = nil, components: [String]? = nil) {
        self.title = title
        self.severity = severity
        self.state = state
        self.body = body
        self.components = components
    }
}

public struct PostAdminStatusIncidentsIdUpdatesBody: Codable, Sendable, Equatable {
    public var body: String
    public var state: String

    enum CodingKeys: String, CodingKey {
        case body = "body"
        case state = "state"
    }

    public init(body: String, state: String) {
        self.body = body
        self.state = state
    }
}

public struct PutOrgRetentionBody: Codable, Sendable, Equatable {
    public var clicks: Int?
    public var visits: Int?
    public var billingPayloads: Int?
    public var webhookDeliveries: Int?
    public var notifications: Int?
    public var auditLog: Int?

    enum CodingKeys: String, CodingKey {
        case clicks = "clicks"
        case visits = "visits"
        case billingPayloads = "billingPayloads"
        case webhookDeliveries = "webhookDeliveries"
        case notifications = "notifications"
        case auditLog = "auditLog"
    }

    public init(clicks: Int? = nil, visits: Int? = nil, billingPayloads: Int? = nil, webhookDeliveries: Int? = nil, notifications: Int? = nil, auditLog: Int? = nil) {
        self.clicks = clicks
        self.visits = visits
        self.billingPayloads = billingPayloads
        self.webhookDeliveries = webhookDeliveries
        self.notifications = notifications
        self.auditLog = auditLog
    }
}

public struct PutOrgReferralParamsBody: Codable, Sendable, Equatable {
    public var params: [String]

    enum CodingKeys: String, CodingKey {
        case params = "params"
    }

    public init(params: [String]) {
        self.params = params
    }
}

public struct PostProgramsBodyPublicPage: Codable, Sendable, Equatable {
    public var pitch: String?
    public var autoApprove: Bool?

    enum CodingKeys: String, CodingKey {
        case pitch = "pitch"
        case autoApprove = "autoApprove"
    }

    public init(pitch: String? = nil, autoApprove: Bool? = nil) {
        self.pitch = pitch
        self.autoApprove = autoApprove
    }
}

public struct PostProgramsBodyRiskPolicy: Codable, Sendable, Equatable {
    public var holdBotScore: Double?
    public var holdRiskScore: Double?
    public var holdHighRiskLevel: Bool?
    public var holdDisposableEmail: Bool?
    public var holdVelocity: Int?
    public var holdUnverifiedEmail: Bool?
    public var holdSelfReferral: Bool?

    enum CodingKeys: String, CodingKey {
        case holdBotScore = "holdBotScore"
        case holdRiskScore = "holdRiskScore"
        case holdHighRiskLevel = "holdHighRiskLevel"
        case holdDisposableEmail = "holdDisposableEmail"
        case holdVelocity = "holdVelocity"
        case holdUnverifiedEmail = "holdUnverifiedEmail"
        case holdSelfReferral = "holdSelfReferral"
    }

    public init(holdBotScore: Double? = nil, holdRiskScore: Double? = nil, holdHighRiskLevel: Bool? = nil, holdDisposableEmail: Bool? = nil, holdVelocity: Int? = nil, holdUnverifiedEmail: Bool? = nil, holdSelfReferral: Bool? = nil) {
        self.holdBotScore = holdBotScore
        self.holdRiskScore = holdRiskScore
        self.holdHighRiskLevel = holdHighRiskLevel
        self.holdDisposableEmail = holdDisposableEmail
        self.holdVelocity = holdVelocity
        self.holdUnverifiedEmail = holdUnverifiedEmail
        self.holdSelfReferral = holdSelfReferral
    }
}

public struct PostProgramsBodyWidget: Codable, Sendable, Equatable {
    public var autoEnroll: Bool?
    public var destinationUrl: String?

    enum CodingKeys: String, CodingKey {
        case autoEnroll = "autoEnroll"
        case destinationUrl = "destinationUrl"
    }

    public init(autoEnroll: Bool? = nil, destinationUrl: String? = nil) {
        self.autoEnroll = autoEnroll
        self.destinationUrl = destinationUrl
    }
}

public struct PostProgramsBodyMobileAppOption1IosOption1: Codable, Sendable, Equatable {
    public var teamId: String
    public var bundleId: String

    enum CodingKeys: String, CodingKey {
        case teamId = "teamId"
        case bundleId = "bundleId"
    }

    public init(teamId: String, bundleId: String) {
        self.teamId = teamId
        self.bundleId = bundleId
    }
}

public struct PostProgramsBodyMobileAppOption1AndroidOption1: Codable, Sendable, Equatable {
    public var packageName: String
    public var sha256CertFingerprints: [String]

    enum CodingKeys: String, CodingKey {
        case packageName = "packageName"
        case sha256CertFingerprints = "sha256CertFingerprints"
    }

    public init(packageName: String, sha256CertFingerprints: [String]) {
        self.packageName = packageName
        self.sha256CertFingerprints = sha256CertFingerprints
    }
}

public struct PostProgramsBodyMobileAppOption1: Codable, Sendable, Equatable {
    public var ios: PostProgramsBodyMobileAppOption1IosOption1?
    public var android: PostProgramsBodyMobileAppOption1AndroidOption1?

    enum CodingKeys: String, CodingKey {
        case ios = "ios"
        case android = "android"
    }

    public init(ios: PostProgramsBodyMobileAppOption1IosOption1? = nil, android: PostProgramsBodyMobileAppOption1AndroidOption1? = nil) {
        self.ios = ios
        self.android = android
    }
}

public struct PostProgramsBody: Codable, Sendable, Equatable {
    public var name: String
    public var slug: String
    public var attributionModel: String?
    public var cookieWindowDays: Int?
    public var signupToConversionDays: Int?
    public var termsMd: String?
    public var status: String?
    public var publicHandle: String?
    public var publicPage: PostProgramsBodyPublicPage?
    public var probabilisticPolicy: String?
    public var selfReferralPolicy: String?
    public var splitCommissions: Bool?
    public var utmTemplate: [String: String]?
    public var allowPaidSearch: Bool?
    public var challengeLinks: Bool?
    public var settlement: String?
    public var riskPolicy: PostProgramsBodyRiskPolicy?
    public var widget: PostProgramsBodyWidget?
    public var mobileApp: PostProgramsBodyMobileAppOption1?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case slug = "slug"
        case attributionModel = "attributionModel"
        case cookieWindowDays = "cookieWindowDays"
        case signupToConversionDays = "signupToConversionDays"
        case termsMd = "termsMd"
        case status = "status"
        case publicHandle = "publicHandle"
        case publicPage = "publicPage"
        case probabilisticPolicy = "probabilisticPolicy"
        case selfReferralPolicy = "selfReferralPolicy"
        case splitCommissions = "splitCommissions"
        case utmTemplate = "utmTemplate"
        case allowPaidSearch = "allowPaidSearch"
        case challengeLinks = "challengeLinks"
        case settlement = "settlement"
        case riskPolicy = "riskPolicy"
        case widget = "widget"
        case mobileApp = "mobileApp"
    }

    public init(name: String, slug: String, attributionModel: String? = nil, cookieWindowDays: Int? = nil, signupToConversionDays: Int? = nil, termsMd: String? = nil, status: String? = nil, publicHandle: String? = nil, publicPage: PostProgramsBodyPublicPage? = nil, probabilisticPolicy: String? = nil, selfReferralPolicy: String? = nil, splitCommissions: Bool? = nil, utmTemplate: [String: String]? = nil, allowPaidSearch: Bool? = nil, challengeLinks: Bool? = nil, settlement: String? = nil, riskPolicy: PostProgramsBodyRiskPolicy? = nil, widget: PostProgramsBodyWidget? = nil, mobileApp: PostProgramsBodyMobileAppOption1? = nil) {
        self.name = name
        self.slug = slug
        self.attributionModel = attributionModel
        self.cookieWindowDays = cookieWindowDays
        self.signupToConversionDays = signupToConversionDays
        self.termsMd = termsMd
        self.status = status
        self.publicHandle = publicHandle
        self.publicPage = publicPage
        self.probabilisticPolicy = probabilisticPolicy
        self.selfReferralPolicy = selfReferralPolicy
        self.splitCommissions = splitCommissions
        self.utmTemplate = utmTemplate
        self.allowPaidSearch = allowPaidSearch
        self.challengeLinks = challengeLinks
        self.settlement = settlement
        self.riskPolicy = riskPolicy
        self.widget = widget
        self.mobileApp = mobileApp
    }
}

public struct PatchProgramsIdBodyPublicPage: Codable, Sendable, Equatable {
    public var pitch: String?
    public var autoApprove: Bool?

    enum CodingKeys: String, CodingKey {
        case pitch = "pitch"
        case autoApprove = "autoApprove"
    }

    public init(pitch: String? = nil, autoApprove: Bool? = nil) {
        self.pitch = pitch
        self.autoApprove = autoApprove
    }
}

public struct PatchProgramsIdBodyRiskPolicy: Codable, Sendable, Equatable {
    public var holdBotScore: Double?
    public var holdRiskScore: Double?
    public var holdHighRiskLevel: Bool?
    public var holdDisposableEmail: Bool?
    public var holdVelocity: Int?
    public var holdUnverifiedEmail: Bool?
    public var holdSelfReferral: Bool?

    enum CodingKeys: String, CodingKey {
        case holdBotScore = "holdBotScore"
        case holdRiskScore = "holdRiskScore"
        case holdHighRiskLevel = "holdHighRiskLevel"
        case holdDisposableEmail = "holdDisposableEmail"
        case holdVelocity = "holdVelocity"
        case holdUnverifiedEmail = "holdUnverifiedEmail"
        case holdSelfReferral = "holdSelfReferral"
    }

    public init(holdBotScore: Double? = nil, holdRiskScore: Double? = nil, holdHighRiskLevel: Bool? = nil, holdDisposableEmail: Bool? = nil, holdVelocity: Int? = nil, holdUnverifiedEmail: Bool? = nil, holdSelfReferral: Bool? = nil) {
        self.holdBotScore = holdBotScore
        self.holdRiskScore = holdRiskScore
        self.holdHighRiskLevel = holdHighRiskLevel
        self.holdDisposableEmail = holdDisposableEmail
        self.holdVelocity = holdVelocity
        self.holdUnverifiedEmail = holdUnverifiedEmail
        self.holdSelfReferral = holdSelfReferral
    }
}

public struct PatchProgramsIdBodyWidget: Codable, Sendable, Equatable {
    public var autoEnroll: Bool?
    public var destinationUrl: String?

    enum CodingKeys: String, CodingKey {
        case autoEnroll = "autoEnroll"
        case destinationUrl = "destinationUrl"
    }

    public init(autoEnroll: Bool? = nil, destinationUrl: String? = nil) {
        self.autoEnroll = autoEnroll
        self.destinationUrl = destinationUrl
    }
}

public struct PatchProgramsIdBodyMobileAppOption1IosOption1: Codable, Sendable, Equatable {
    public var teamId: String
    public var bundleId: String

    enum CodingKeys: String, CodingKey {
        case teamId = "teamId"
        case bundleId = "bundleId"
    }

    public init(teamId: String, bundleId: String) {
        self.teamId = teamId
        self.bundleId = bundleId
    }
}

public struct PatchProgramsIdBodyMobileAppOption1AndroidOption1: Codable, Sendable, Equatable {
    public var packageName: String
    public var sha256CertFingerprints: [String]

    enum CodingKeys: String, CodingKey {
        case packageName = "packageName"
        case sha256CertFingerprints = "sha256CertFingerprints"
    }

    public init(packageName: String, sha256CertFingerprints: [String]) {
        self.packageName = packageName
        self.sha256CertFingerprints = sha256CertFingerprints
    }
}

public struct PatchProgramsIdBodyMobileAppOption1: Codable, Sendable, Equatable {
    public var ios: PatchProgramsIdBodyMobileAppOption1IosOption1?
    public var android: PatchProgramsIdBodyMobileAppOption1AndroidOption1?

    enum CodingKeys: String, CodingKey {
        case ios = "ios"
        case android = "android"
    }

    public init(ios: PatchProgramsIdBodyMobileAppOption1IosOption1? = nil, android: PatchProgramsIdBodyMobileAppOption1AndroidOption1? = nil) {
        self.ios = ios
        self.android = android
    }
}

public struct PatchProgramsIdBody: Codable, Sendable, Equatable {
    public var name: String?
    public var slug: String?
    public var attributionModel: String?
    public var cookieWindowDays: Int?
    public var signupToConversionDays: Int?
    public var termsMd: String?
    public var status: String?
    public var publicHandle: String?
    public var publicPage: PatchProgramsIdBodyPublicPage?
    public var probabilisticPolicy: String?
    public var selfReferralPolicy: String?
    public var splitCommissions: Bool?
    public var utmTemplate: [String: String]?
    public var allowPaidSearch: Bool?
    public var challengeLinks: Bool?
    public var settlement: String?
    public var riskPolicy: PatchProgramsIdBodyRiskPolicy?
    public var widget: PatchProgramsIdBodyWidget?
    public var mobileApp: PatchProgramsIdBodyMobileAppOption1?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case slug = "slug"
        case attributionModel = "attributionModel"
        case cookieWindowDays = "cookieWindowDays"
        case signupToConversionDays = "signupToConversionDays"
        case termsMd = "termsMd"
        case status = "status"
        case publicHandle = "publicHandle"
        case publicPage = "publicPage"
        case probabilisticPolicy = "probabilisticPolicy"
        case selfReferralPolicy = "selfReferralPolicy"
        case splitCommissions = "splitCommissions"
        case utmTemplate = "utmTemplate"
        case allowPaidSearch = "allowPaidSearch"
        case challengeLinks = "challengeLinks"
        case settlement = "settlement"
        case riskPolicy = "riskPolicy"
        case widget = "widget"
        case mobileApp = "mobileApp"
    }

    public init(name: String? = nil, slug: String? = nil, attributionModel: String? = nil, cookieWindowDays: Int? = nil, signupToConversionDays: Int? = nil, termsMd: String? = nil, status: String? = nil, publicHandle: String? = nil, publicPage: PatchProgramsIdBodyPublicPage? = nil, probabilisticPolicy: String? = nil, selfReferralPolicy: String? = nil, splitCommissions: Bool? = nil, utmTemplate: [String: String]? = nil, allowPaidSearch: Bool? = nil, challengeLinks: Bool? = nil, settlement: String? = nil, riskPolicy: PatchProgramsIdBodyRiskPolicy? = nil, widget: PatchProgramsIdBodyWidget? = nil, mobileApp: PatchProgramsIdBodyMobileAppOption1? = nil) {
        self.name = name
        self.slug = slug
        self.attributionModel = attributionModel
        self.cookieWindowDays = cookieWindowDays
        self.signupToConversionDays = signupToConversionDays
        self.termsMd = termsMd
        self.status = status
        self.publicHandle = publicHandle
        self.publicPage = publicPage
        self.probabilisticPolicy = probabilisticPolicy
        self.selfReferralPolicy = selfReferralPolicy
        self.splitCommissions = splitCommissions
        self.utmTemplate = utmTemplate
        self.allowPaidSearch = allowPaidSearch
        self.challengeLinks = challengeLinks
        self.settlement = settlement
        self.riskPolicy = riskPolicy
        self.widget = widget
        self.mobileApp = mobileApp
    }
}

public struct PostProgramsIdEnrollmentsBody: Codable, Sendable, Equatable {
    public var partnerId: String

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
    }

    public init(partnerId: String) {
        self.partnerId = partnerId
    }
}

public struct PostPartnersBody: Codable, Sendable, Equatable {
    public var email: String
    public var displayName: String?
    public var tags: [String]?
    public var notes: String?
    public var externalRef: String?
    public var upsert: Bool?

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case displayName = "displayName"
        case tags = "tags"
        case notes = "notes"
        case externalRef = "externalRef"
        case upsert = "upsert"
    }

    public init(email: String, displayName: String? = nil, tags: [String]? = nil, notes: String? = nil, externalRef: String? = nil, upsert: Bool? = nil) {
        self.email = email
        self.displayName = displayName
        self.tags = tags
        self.notes = notes
        self.externalRef = externalRef
        self.upsert = upsert
    }
}

public struct PatchPartnersIdBody: Codable, Sendable, Equatable {
    public var displayName: String?
    public var status: String?
    public var tags: [String]?
    public var notes: String?
    public var externalRef: String?

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case status = "status"
        case tags = "tags"
        case notes = "notes"
        case externalRef = "externalRef"
    }

    public init(displayName: String? = nil, status: String? = nil, tags: [String]? = nil, notes: String? = nil, externalRef: String? = nil) {
        self.displayName = displayName
        self.status = status
        self.tags = tags
        self.notes = notes
        self.externalRef = externalRef
    }
}

public struct PostApiKeysBody: Codable, Sendable, Equatable {
    public var name: String
    public var scopes: [String]?
    public var publishable: Bool?
    public var allowedOrigins: [String]?
    public var apiVersion: String?
    public var mode: String?
    public var owner: String?
    public var expiresInDays: Int?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case scopes = "scopes"
        case publishable = "publishable"
        case allowedOrigins = "allowedOrigins"
        case apiVersion = "apiVersion"
        case mode = "mode"
        case owner = "owner"
        case expiresInDays = "expiresInDays"
    }

    public init(name: String, scopes: [String]? = nil, publishable: Bool? = nil, allowedOrigins: [String]? = nil, apiVersion: String? = nil, mode: String? = nil, owner: String? = nil, expiresInDays: Int? = nil) {
        self.name = name
        self.scopes = scopes
        self.publishable = publishable
        self.allowedOrigins = allowedOrigins
        self.apiVersion = apiVersion
        self.mode = mode
        self.owner = owner
        self.expiresInDays = expiresInDays
    }
}

public struct PatchApiKeysIdBody: Codable, Sendable, Equatable {
    public var apiVersion: String?
    public var owner: String?
    public var expiresInDays: Int?

    enum CodingKeys: String, CodingKey {
        case apiVersion = "apiVersion"
        case owner = "owner"
        case expiresInDays = "expiresInDays"
    }

    public init(apiVersion: String? = nil, owner: String? = nil, expiresInDays: Int? = nil) {
        self.apiVersion = apiVersion
        self.owner = owner
        self.expiresInDays = expiresInDays
    }
}

public struct PostTestClockAdvanceBody: Codable, Sendable, Equatable {
    public var seconds: Int

    enum CodingKeys: String, CodingKey {
        case seconds = "seconds"
    }

    public init(seconds: Int) {
        self.seconds = seconds
    }
}

public struct PostCliDeviceCodesBody: Codable, Sendable, Equatable {
    public var clientName: String?

    enum CodingKeys: String, CodingKey {
        case clientName = "clientName"
    }

    public init(clientName: String? = nil) {
        self.clientName = clientName
    }
}

public struct PostCliDeviceCodesTokenBody: Codable, Sendable, Equatable {
    public var deviceCode: String

    enum CodingKeys: String, CodingKey {
        case deviceCode = "deviceCode"
    }

    public init(deviceCode: String) {
        self.deviceCode = deviceCode
    }
}

public struct PostCliDeviceCodesUserCodeApproveBody: Codable, Sendable, Equatable {
    public var access: String?
    public var name: String?

    enum CodingKeys: String, CodingKey {
        case access = "access"
        case name = "name"
    }

    public init(access: String? = nil, name: String? = nil) {
        self.access = access
        self.name = name
    }
}

public struct PostCliListenersBody: Codable, Sendable, Equatable {
    public var topics: [String]?
    public var forwardTo: String?

    enum CodingKeys: String, CodingKey {
        case topics = "topics"
        case forwardTo = "forwardTo"
    }

    public init(topics: [String]? = nil, forwardTo: String? = nil) {
        self.topics = topics
        self.forwardTo = forwardTo
    }
}

public struct PostCliTriggerBody: Codable, Sendable, Equatable {
    public var topic: String
    public var data: [String: JSONValue]?

    enum CodingKeys: String, CodingKey {
        case topic = "topic"
        case data = "data"
    }

    public init(topic: String, data: [String: JSONValue]? = nil) {
        self.topic = topic
        self.data = data
    }
}

public struct PostLinksBody: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var code: String?
    public var destinationUrl: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case code = "code"
        case destinationUrl = "destinationUrl"
    }

    public init(programId: String, partnerId: String, code: String? = nil, destinationUrl: String) {
        self.programId = programId
        self.partnerId = partnerId
        self.code = code
        self.destinationUrl = destinationUrl
    }
}

public struct PostCouponsBody: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var code: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case code = "code"
    }

    public init(programId: String, partnerId: String, code: String) {
        self.programId = programId
        self.partnerId = partnerId
        self.code = code
    }
}

public struct PostWidgetTokensBody: Codable, Sendable, Equatable {
    public var programId: String
    public var customerRef: String?
    public var partnerExternalRef: String?
    public var email: String?
    public var displayName: String?
    public var ttlSeconds: Int?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case customerRef = "customerRef"
        case partnerExternalRef = "partnerExternalRef"
        case email = "email"
        case displayName = "displayName"
        case ttlSeconds = "ttlSeconds"
    }

    public init(programId: String, customerRef: String? = nil, partnerExternalRef: String? = nil, email: String? = nil, displayName: String? = nil, ttlSeconds: Int? = nil) {
        self.programId = programId
        self.customerRef = customerRef
        self.partnerExternalRef = partnerExternalRef
        self.email = email
        self.displayName = displayName
        self.ttlSeconds = ttlSeconds
    }
}

public struct PostReferralsAssociateBody: Codable, Sendable, Equatable {
    public var programId: String
    public var customerRef: String
    public var anonId: String?
    public var referralToken: String?
    public var couponCode: String?
    public var emailHash: String?
    public var ip: String?
    public var ua: String?
    public var idempotencyKey: String?
    public var occurredAt: String?
    public var emailDomain: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case customerRef = "customerRef"
        case anonId = "anonId"
        case referralToken = "referralToken"
        case couponCode = "couponCode"
        case emailHash = "emailHash"
        case ip = "ip"
        case ua = "ua"
        case idempotencyKey = "idempotencyKey"
        case occurredAt = "occurredAt"
        case emailDomain = "emailDomain"
    }

    public init(programId: String, customerRef: String, anonId: String? = nil, referralToken: String? = nil, couponCode: String? = nil, emailHash: String? = nil, ip: String? = nil, ua: String? = nil, idempotencyKey: String? = nil, occurredAt: String? = nil, emailDomain: String? = nil) {
        self.programId = programId
        self.customerRef = customerRef
        self.anonId = anonId
        self.referralToken = referralToken
        self.couponCode = couponCode
        self.emailHash = emailHash
        self.ip = ip
        self.ua = ua
        self.idempotencyKey = idempotencyKey
        self.occurredAt = occurredAt
        self.emailDomain = emailDomain
    }
}

public struct PatchReferralsIdBody: Codable, Sendable, Equatable {
    public var status: String

    enum CodingKeys: String, CodingKey {
        case status = "status"
    }

    public init(status: String) {
        self.status = status
    }
}

public struct PostReferralsIdReassignBody: Codable, Sendable, Equatable {
    public var partnerId: String

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
    }

    public init(partnerId: String) {
        self.partnerId = partnerId
    }
}

public struct PostAttributionReplayBody: Codable, Sendable, Equatable {
    public var programId: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
    }

    public init(programId: String) {
        self.programId = programId
    }
}

public struct PostTrackEventsBodyOption1: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var linkId: String?
    public var url: String?
    public var anonId: String?
    public var ip: String?
    public var ua: String?
    public var type: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case linkId = "linkId"
        case url = "url"
        case anonId = "anonId"
        case ip = "ip"
        case ua = "ua"
        case type = "type"
    }

    public init(programId: String, partnerId: String, linkId: String? = nil, url: String? = nil, anonId: String? = nil, ip: String? = nil, ua: String? = nil, type: String) {
        self.programId = programId
        self.partnerId = partnerId
        self.linkId = linkId
        self.url = url
        self.anonId = anonId
        self.ip = ip
        self.ua = ua
        self.type = type
    }
}

public struct PostTrackEventsBodyOption2: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var linkId: String?
    public var url: String?
    public var anonId: String?
    public var ip: String?
    public var ua: String?
    public var type: String

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case linkId = "linkId"
        case url = "url"
        case anonId = "anonId"
        case ip = "ip"
        case ua = "ua"
        case type = "type"
    }

    public init(programId: String, partnerId: String, linkId: String? = nil, url: String? = nil, anonId: String? = nil, ip: String? = nil, ua: String? = nil, type: String) {
        self.programId = programId
        self.partnerId = partnerId
        self.linkId = linkId
        self.url = url
        self.anonId = anonId
        self.ip = ip
        self.ua = ua
        self.type = type
    }
}

public struct PostTrackEventsBodyOption3: Codable, Sendable, Equatable {
    public var type: String
    public var programId: String
    public var customerRef: String
    public var event: String
    public var occurredAt: String?
    public var idempotencyKey: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case programId = "programId"
        case customerRef = "customerRef"
        case event = "event"
        case occurredAt = "occurredAt"
        case idempotencyKey = "idempotencyKey"
    }

    public init(type: String, programId: String, customerRef: String, event: String, occurredAt: String? = nil, idempotencyKey: String? = nil) {
        self.type = type
        self.programId = programId
        self.customerRef = customerRef
        self.event = event
        self.occurredAt = occurredAt
        self.idempotencyKey = idempotencyKey
    }
}

public struct PostCommissionRulesBodyConfigBaseOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PostCommissionRulesBodyConfigBaseOption2: Codable, Sendable, Equatable {
    public var kind: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostCommissionRulesBodyConfigRecurringOption1: Codable, Sendable, Equatable {
    public var type: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(type: String) {
        self.type = type
    }
}

public struct PostCommissionRulesBodyConfigRecurringOption2: Codable, Sendable, Equatable {
    public var type: String

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(type: String) {
        self.type = type
    }
}

public struct PostCommissionRulesBodyConfigRecurringOption3: Codable, Sendable, Equatable {
    public var type: String
    public var months: Int

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case months = "months"
    }

    public init(type: String, months: Int) {
        self.type = type
        self.months = months
    }
}

public struct PostCommissionRulesBodyConfigConditionsMetadataItem: Codable, Sendable, Equatable {
    public var key: String
    public var equals: JSONValue?
    public var `in`: [JSONValue]?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case equals = "equals"
        case `in` = "in"
    }

    public init(key: String, equals: JSONValue? = nil, `in`: [JSONValue]? = nil) {
        self.key = key
        self.equals = equals
        self.`in` = `in`
    }
}

public struct PostCommissionRulesBodyConfigConditions: Codable, Sendable, Equatable {
    public var countries: [String]?
    public var excludeCountries: [String]?
    public var metadata: [PostCommissionRulesBodyConfigConditionsMetadataItem]?

    enum CodingKeys: String, CodingKey {
        case countries = "countries"
        case excludeCountries = "excludeCountries"
        case metadata = "metadata"
    }

    public init(countries: [String]? = nil, excludeCountries: [String]? = nil, metadata: [PostCommissionRulesBodyConfigConditionsMetadataItem]? = nil) {
        self.countries = countries
        self.excludeCountries = excludeCountries
        self.metadata = metadata
    }
}

public struct PostCommissionRulesBodyConfigOverridesItemMatchMetadataItem: Codable, Sendable, Equatable {
    public var key: String
    public var equals: JSONValue?
    public var `in`: [JSONValue]?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case equals = "equals"
        case `in` = "in"
    }

    public init(key: String, equals: JSONValue? = nil, `in`: [JSONValue]? = nil) {
        self.key = key
        self.equals = equals
        self.`in` = `in`
    }
}

public struct PostCommissionRulesBodyConfigOverridesItemMatch: Codable, Sendable, Equatable {
    public var partnerId: String?
    public var linkId: String?
    public var productRef: String?
    public var countries: [String]?
    public var metadata: [PostCommissionRulesBodyConfigOverridesItemMatchMetadataItem]?

    enum CodingKeys: String, CodingKey {
        case partnerId = "partnerId"
        case linkId = "linkId"
        case productRef = "productRef"
        case countries = "countries"
        case metadata = "metadata"
    }

    public init(partnerId: String? = nil, linkId: String? = nil, productRef: String? = nil, countries: [String]? = nil, metadata: [PostCommissionRulesBodyConfigOverridesItemMatchMetadataItem]? = nil) {
        self.partnerId = partnerId
        self.linkId = linkId
        self.productRef = productRef
        self.countries = countries
        self.metadata = metadata
    }
}

public struct PostCommissionRulesBodyConfigOverridesItemBaseOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PostCommissionRulesBodyConfigOverridesItemBaseOption2: Codable, Sendable, Equatable {
    public var kind: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostCommissionRulesBodyConfigOverridesItem: Codable, Sendable, Equatable {
    public var match: PostCommissionRulesBodyConfigOverridesItemMatch
    public var base: JSONValue

    enum CodingKeys: String, CodingKey {
        case match = "match"
        case base = "base"
    }

    public init(match: PostCommissionRulesBodyConfigOverridesItemMatch, base: JSONValue) {
        self.match = match
        self.base = base
    }
}

public struct PostCommissionRulesBodyConfigTiersItem: Codable, Sendable, Equatable {
    public var minCustomers: Int
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case minCustomers = "minCustomers"
        case bps = "bps"
    }

    public init(minCustomers: Int, bps: Int) {
        self.minCustomers = minCustomers
        self.bps = bps
    }
}

public struct PostCommissionRulesBodyConfigBountiesItem: Codable, Sendable, Equatable {
    public var event: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case event = "event"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(event: String, amountMinor: Int, currency: String) {
        self.event = event
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostCommissionRulesBodyConfigSubAffiliate: Codable, Sendable, Equatable {
    public var levels: Int
    public var ratesBps: [Int]

    enum CodingKeys: String, CodingKey {
        case levels = "levels"
        case ratesBps = "ratesBps"
    }

    public init(levels: Int, ratesBps: [Int]) {
        self.levels = levels
        self.ratesBps = ratesBps
    }
}

public struct PostCommissionRulesBodyConfigNewVsExpansion: Codable, Sendable, Equatable {
    public var newBps: Int
    public var expansionBps: Int

    enum CodingKeys: String, CodingKey {
        case newBps = "newBps"
        case expansionBps = "expansionBps"
    }

    public init(newBps: Int, expansionBps: Int) {
        self.newBps = newBps
        self.expansionBps = expansionBps
    }
}

public struct PostCommissionRulesBodyConfig: Codable, Sendable, Equatable {
    public var base: JSONValue
    public var appliesTo: String?
    public var recurring: JSONValue?
    public var holdDays: Int?
    public var rounding: String?
    public var conditions: PostCommissionRulesBodyConfigConditions?
    public var overrides: [PostCommissionRulesBodyConfigOverridesItem]?
    public var tiers: [PostCommissionRulesBodyConfigTiersItem]?
    public var bounties: [PostCommissionRulesBodyConfigBountiesItem]?
    public var subAffiliate: PostCommissionRulesBodyConfigSubAffiliate?
    public var newVsExpansion: PostCommissionRulesBodyConfigNewVsExpansion?

    enum CodingKeys: String, CodingKey {
        case base = "base"
        case appliesTo = "appliesTo"
        case recurring = "recurring"
        case holdDays = "holdDays"
        case rounding = "rounding"
        case conditions = "conditions"
        case overrides = "overrides"
        case tiers = "tiers"
        case bounties = "bounties"
        case subAffiliate = "subAffiliate"
        case newVsExpansion = "newVsExpansion"
    }

    public init(base: JSONValue, appliesTo: String? = nil, recurring: JSONValue? = nil, holdDays: Int? = nil, rounding: String? = nil, conditions: PostCommissionRulesBodyConfigConditions? = nil, overrides: [PostCommissionRulesBodyConfigOverridesItem]? = nil, tiers: [PostCommissionRulesBodyConfigTiersItem]? = nil, bounties: [PostCommissionRulesBodyConfigBountiesItem]? = nil, subAffiliate: PostCommissionRulesBodyConfigSubAffiliate? = nil, newVsExpansion: PostCommissionRulesBodyConfigNewVsExpansion? = nil) {
        self.base = base
        self.appliesTo = appliesTo
        self.recurring = recurring
        self.holdDays = holdDays
        self.rounding = rounding
        self.conditions = conditions
        self.overrides = overrides
        self.tiers = tiers
        self.bounties = bounties
        self.subAffiliate = subAffiliate
        self.newVsExpansion = newVsExpansion
    }
}

public struct PostCommissionRulesBody: Codable, Sendable, Equatable {
    public var programId: String
    public var config: PostCommissionRulesBodyConfig

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case config = "config"
    }

    public init(programId: String, config: PostCommissionRulesBodyConfig) {
        self.programId = programId
        self.config = config
    }
}

public struct PostCommissionsIdAdjustBody: Codable, Sendable, Equatable {
    public var amountMinor: Int
    public var memo: String
    public var allowNegative: Bool?

    enum CodingKeys: String, CodingKey {
        case amountMinor = "amountMinor"
        case memo = "memo"
        case allowNegative = "allowNegative"
    }

    public init(amountMinor: Int, memo: String, allowNegative: Bool? = nil) {
        self.amountMinor = amountMinor
        self.memo = memo
        self.allowNegative = allowNegative
    }
}

public struct PostCommissionsIdSettleBody: Codable, Sendable, Equatable {
    public var method: String?
    public var reference: String
    public var memo: String?

    enum CodingKeys: String, CodingKey {
        case method = "method"
        case reference = "reference"
        case memo = "memo"
    }

    public init(method: String? = nil, reference: String, memo: String? = nil) {
        self.method = method
        self.reference = reference
        self.memo = memo
    }
}

public struct PostBillingConnectionsBody: Codable, Sendable, Equatable {
    public var provider: String
    public var name: String?
    public var webhookSecret: String?

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case name = "name"
        case webhookSecret = "webhookSecret"
    }

    public init(provider: String, name: String? = nil, webhookSecret: String? = nil) {
        self.provider = provider
        self.name = name
        self.webhookSecret = webhookSecret
    }
}

public struct PutBillingConnectionsIdSecretBody: Codable, Sendable, Equatable {
    public var webhookSecret: String

    enum CodingKeys: String, CodingKey {
        case webhookSecret = "webhookSecret"
    }

    public init(webhookSecret: String) {
        self.webhookSecret = webhookSecret
    }
}

public struct PutBillingConnectionsIdCredentialsBody: Codable, Sendable, Equatable {
    public var apiKey: String?
    public var apiToken: String?
    public var storeHash: String?
    public var region: String?

    enum CodingKeys: String, CodingKey {
        case apiKey = "apiKey"
        case apiToken = "apiToken"
        case storeHash = "storeHash"
        case region = "region"
    }

    public init(apiKey: String? = nil, apiToken: String? = nil, storeHash: String? = nil, region: String? = nil) {
        self.apiKey = apiKey
        self.apiToken = apiToken
        self.storeHash = storeHash
        self.region = region
    }
}

public struct PatchBillingConnectionsIdBody: Codable, Sendable, Equatable {
    public var status: String?
    public var name: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case name = "name"
    }

    public init(status: String? = nil, name: String? = nil) {
        self.status = status
        self.name = name
    }
}

public struct PutBillingConnectionsIdValueMappingBody: Codable, Sendable, Equatable {
    public var cash: String?
    public var creditApplied: String?
    public var discount: String?
    public var cost: String?
    public var productRef: String?
    public var unit: String

    enum CodingKeys: String, CodingKey {
        case cash = "cash"
        case creditApplied = "creditApplied"
        case discount = "discount"
        case cost = "cost"
        case productRef = "productRef"
        case unit = "unit"
    }

    public init(cash: String? = nil, creditApplied: String? = nil, discount: String? = nil, cost: String? = nil, productRef: String? = nil, unit: String) {
        self.cash = cash
        self.creditApplied = creditApplied
        self.discount = discount
        self.cost = cost
        self.productRef = productRef
        self.unit = unit
    }
}

public struct PostBillingConnectionsIdValueMappingPreviewBodyMapping: Codable, Sendable, Equatable {
    public var cash: String?
    public var creditApplied: String?
    public var discount: String?
    public var cost: String?
    public var productRef: String?
    public var unit: String

    enum CodingKeys: String, CodingKey {
        case cash = "cash"
        case creditApplied = "creditApplied"
        case discount = "discount"
        case cost = "cost"
        case productRef = "productRef"
        case unit = "unit"
    }

    public init(cash: String? = nil, creditApplied: String? = nil, discount: String? = nil, cost: String? = nil, productRef: String? = nil, unit: String) {
        self.cash = cash
        self.creditApplied = creditApplied
        self.discount = discount
        self.cost = cost
        self.productRef = productRef
        self.unit = unit
    }
}

public struct PostBillingConnectionsIdValueMappingPreviewBody: Codable, Sendable, Equatable {
    public var payload: JSONValue
    public var currency: String?
    public var mapping: PostBillingConnectionsIdValueMappingPreviewBodyMapping?

    enum CodingKeys: String, CodingKey {
        case payload = "payload"
        case currency = "currency"
        case mapping = "mapping"
    }

    public init(payload: JSONValue, currency: String? = nil, mapping: PostBillingConnectionsIdValueMappingPreviewBodyMapping? = nil) {
        self.payload = payload
        self.currency = currency
        self.mapping = mapping
    }
}

public struct PutPartnersIdPayoutProfileBody: Codable, Sendable, Equatable {
    public var method: String
    public var details: [String: JSONValue]?
    public var payoutCurrency: String?
    public var minThresholdMinor: Int?

    enum CodingKeys: String, CodingKey {
        case method = "method"
        case details = "details"
        case payoutCurrency = "payoutCurrency"
        case minThresholdMinor = "minThresholdMinor"
    }

    public init(method: String, details: [String: JSONValue]? = nil, payoutCurrency: String? = nil, minThresholdMinor: Int? = nil) {
        self.method = method
        self.details = details
        self.payoutCurrency = payoutCurrency
        self.minThresholdMinor = minThresholdMinor
    }
}

public struct PatchPartnersIdPayoutProfileBody: Codable, Sendable, Equatable {
    public var minThresholdMinor: Int

    enum CodingKeys: String, CodingKey {
        case minThresholdMinor = "minThresholdMinor"
    }

    public init(minThresholdMinor: Int) {
        self.minThresholdMinor = minThresholdMinor
    }
}

public struct PostPartnersIdTaxFormBody: Codable, Sendable, Equatable {
    public var type: String
    public var data: JSONValue

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case data = "data"
    }

    public init(type: String, data: JSONValue) {
        self.type = type
        self.data = data
    }
}

public struct PostFxRatesBody: Codable, Sendable, Equatable {
    public var base: String
    public var quote: String
    public var rate: JSONValue
    public var effectiveAt: String?

    enum CodingKeys: String, CodingKey {
        case base = "base"
        case quote = "quote"
        case rate = "rate"
        case effectiveAt = "effectiveAt"
    }

    public init(base: String, quote: String, rate: JSONValue, effectiveAt: String? = nil) {
        self.base = base
        self.quote = quote
        self.rate = rate
        self.effectiveAt = effectiveAt
    }
}

public struct PutOrgFxFeedBody: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct PostFxRatesClearOverrideBody: Codable, Sendable, Equatable {
    public var base: String
    public var quote: String

    enum CodingKeys: String, CodingKey {
        case base = "base"
        case quote = "quote"
    }

    public init(base: String, quote: String) {
        self.base = base
        self.quote = quote
    }
}

public struct PutPayoutConnectionsProviderBodyOption1: Codable, Sendable, Equatable {
    public var clientId: String
    public var secret: String
    public var env: String?

    enum CodingKeys: String, CodingKey {
        case clientId = "clientId"
        case secret = "secret"
        case env = "env"
    }

    public init(clientId: String, secret: String, env: String? = nil) {
        self.clientId = clientId
        self.secret = secret
        self.env = env
    }
}

public struct PutPayoutConnectionsProviderBodyOption2: Codable, Sendable, Equatable {
    public var secretKey: String
    public var env: String?

    enum CodingKeys: String, CodingKey {
        case secretKey = "secretKey"
        case env = "env"
    }

    public init(secretKey: String, env: String? = nil) {
        self.secretKey = secretKey
        self.env = env
    }
}

public struct PutPayoutConnectionsProviderBodyOption3: Codable, Sendable, Equatable {
    public var apiKey: String
    public var walletId: String
    public var defaultChain: String?
    public var env: String?

    enum CodingKeys: String, CodingKey {
        case apiKey = "apiKey"
        case walletId = "walletId"
        case defaultChain = "defaultChain"
        case env = "env"
    }

    public init(apiKey: String, walletId: String, defaultChain: String? = nil, env: String? = nil) {
        self.apiKey = apiKey
        self.walletId = walletId
        self.defaultChain = defaultChain
        self.env = env
    }
}

public struct PutPayoutConnectionsProviderBodyOption4: Codable, Sendable, Equatable {
    public var apiToken: String
    public var profileId: String
    public var env: String?

    enum CodingKeys: String, CodingKey {
        case apiToken = "apiToken"
        case profileId = "profileId"
        case env = "env"
    }

    public init(apiToken: String, profileId: String, env: String? = nil) {
        self.apiToken = apiToken
        self.profileId = profileId
        self.env = env
    }
}

public struct PutPayoutConnectionsProviderBodyOption5: Codable, Sendable, Equatable {
    public var clientId: String
    public var secret: String
    public var programId: String
    public var env: String?

    enum CodingKeys: String, CodingKey {
        case clientId = "clientId"
        case secret = "secret"
        case programId = "programId"
        case env = "env"
    }

    public init(clientId: String, secret: String, programId: String, env: String? = nil) {
        self.clientId = clientId
        self.secret = secret
        self.programId = programId
        self.env = env
    }
}

public struct PutPayoutConnectionsProviderBodyOption6: Codable, Sendable, Equatable {
    public var apiKey: String
    public var fundingSourceId: String
    public var campaignId: String?
    public var env: String?

    enum CodingKeys: String, CodingKey {
        case apiKey = "apiKey"
        case fundingSourceId = "fundingSourceId"
        case campaignId = "campaignId"
        case env = "env"
    }

    public init(apiKey: String, fundingSourceId: String, campaignId: String? = nil, env: String? = nil) {
        self.apiKey = apiKey
        self.fundingSourceId = fundingSourceId
        self.campaignId = campaignId
        self.env = env
    }
}

public struct PostFraudInvalidTrafficScanBody: Codable, Sendable, Equatable {
    public var windowHours: Int?

    enum CodingKeys: String, CodingKey {
        case windowHours = "windowHours"
    }

    public init(windowHours: Int? = nil) {
        self.windowHours = windowHours
    }
}

public struct PostFraudCasesIdResolveBody: Codable, Sendable, Equatable {
    public var action: String

    enum CodingKeys: String, CodingKey {
        case action = "action"
    }

    public init(action: String) {
        self.action = action
    }
}

public struct PutProfitabilitySettingsBody: Codable, Sendable, Equatable {
    public var reportingCurrency: String?
    public var defaultMarginBps: Int?
    public var creditCostModel: String?
    public var creditCostRatioBps: Int?
    public var inference: String?
    public var creditDraw: String?
    public var windowDays: Int?
    public var churnWindowDays: Int?
    public var countReferrerSpend: Bool?
    public var costToServeMinorPerMonth: Int?
    public var taxFeesReduceProfit: Bool?
    public var valuePatternWeight: Double?
    public var targetRoiBps: Int?
    public var programId: String?

    enum CodingKeys: String, CodingKey {
        case reportingCurrency = "reportingCurrency"
        case defaultMarginBps = "defaultMarginBps"
        case creditCostModel = "creditCostModel"
        case creditCostRatioBps = "creditCostRatioBps"
        case inference = "inference"
        case creditDraw = "creditDraw"
        case windowDays = "windowDays"
        case churnWindowDays = "churnWindowDays"
        case countReferrerSpend = "countReferrerSpend"
        case costToServeMinorPerMonth = "costToServeMinorPerMonth"
        case taxFeesReduceProfit = "taxFeesReduceProfit"
        case valuePatternWeight = "valuePatternWeight"
        case targetRoiBps = "targetRoiBps"
        case programId = "programId"
    }

    public init(reportingCurrency: String? = nil, defaultMarginBps: Int? = nil, creditCostModel: String? = nil, creditCostRatioBps: Int? = nil, inference: String? = nil, creditDraw: String? = nil, windowDays: Int? = nil, churnWindowDays: Int? = nil, countReferrerSpend: Bool? = nil, costToServeMinorPerMonth: Int? = nil, taxFeesReduceProfit: Bool? = nil, valuePatternWeight: Double? = nil, targetRoiBps: Int? = nil, programId: String? = nil) {
        self.reportingCurrency = reportingCurrency
        self.defaultMarginBps = defaultMarginBps
        self.creditCostModel = creditCostModel
        self.creditCostRatioBps = creditCostRatioBps
        self.inference = inference
        self.creditDraw = creditDraw
        self.windowDays = windowDays
        self.churnWindowDays = churnWindowDays
        self.countReferrerSpend = countReferrerSpend
        self.costToServeMinorPerMonth = costToServeMinorPerMonth
        self.taxFeesReduceProfit = taxFeesReduceProfit
        self.valuePatternWeight = valuePatternWeight
        self.targetRoiBps = targetRoiBps
        self.programId = programId
    }
}

public struct PutProfitabilityProductsProductRefBody: Codable, Sendable, Equatable {
    public var marginBps: Int?
    public var unitCostMinor: Int?
    public var currency: String?

    enum CodingKeys: String, CodingKey {
        case marginBps = "marginBps"
        case unitCostMinor = "unitCostMinor"
        case currency = "currency"
    }

    public init(marginBps: Int? = nil, unitCostMinor: Int? = nil, currency: String? = nil) {
        self.marginBps = marginBps
        self.unitCostMinor = unitCostMinor
        self.currency = currency
    }
}

public struct PostRoiPatternsPatternReviewBody: Codable, Sendable, Equatable {
    public var customerRef: String?
    public var partnerId: String?
    public var programId: String?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case partnerId = "partnerId"
        case programId = "programId"
    }

    public init(customerRef: String? = nil, partnerId: String? = nil, programId: String? = nil) {
        self.customerRef = customerRef
        self.partnerId = partnerId
        self.programId = programId
    }
}

/// Up to 500 value events; each is validated and recorded on its own.
public struct PostValueEventsBody: Codable, Sendable, Equatable {
    public var events: [JSONValue]

    enum CodingKeys: String, CodingKey {
        case events = "events"
    }

    public init(events: [JSONValue]) {
        self.events = events
    }
}

/// CSV text (up to 10000 rows / 5 MB) plus a column-to-field mapping. "kind" applies to every row unless a column maps to kind. Up to 500 rows are recorded before the response; a larger file answers 202 with a jobId to poll at GET /v1/value/import/{jobId}. A dry run is always immediate.
public struct PostValueImportBody: Codable, Sendable, Equatable {
    public var csv: String
    public var mapping: [String: String]
    public var kind: String?
    public var dryRun: Bool?
    public var defaultCurrency: String?

    enum CodingKeys: String, CodingKey {
        case csv = "csv"
        case mapping = "mapping"
        case kind = "kind"
        case dryRun = "dryRun"
        case defaultCurrency = "defaultCurrency"
    }

    public init(csv: String, mapping: [String: String], kind: String? = nil, dryRun: Bool? = nil, defaultCurrency: String? = nil) {
        self.csv = csv
        self.mapping = mapping
        self.kind = kind
        self.dryRun = dryRun
        self.defaultCurrency = defaultCurrency
    }
}

public struct PostPartnerKycSubmitBody: Codable, Sendable, Equatable {
    public var legalName: String
    public var country: String
    public var dateOfBirth: String?
    public var documentRef: String?

    enum CodingKeys: String, CodingKey {
        case legalName = "legalName"
        case country = "country"
        case dateOfBirth = "dateOfBirth"
        case documentRef = "documentRef"
    }

    public init(legalName: String, country: String, dateOfBirth: String? = nil, documentRef: String? = nil) {
        self.legalName = legalName
        self.country = country
        self.dateOfBirth = dateOfBirth
        self.documentRef = documentRef
    }
}

public struct PostPartnerLinksBody: Codable, Sendable, Equatable {
    public var orgId: String
    public var programId: String
    public var destinationUrl: String
    public var assetId: String?
    public var code: String?

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case programId = "programId"
        case destinationUrl = "destinationUrl"
        case assetId = "assetId"
        case code = "code"
    }

    public init(orgId: String, programId: String, destinationUrl: String, assetId: String? = nil, code: String? = nil) {
        self.orgId = orgId
        self.programId = programId
        self.destinationUrl = destinationUrl
        self.assetId = assetId
        self.code = code
    }
}

public struct PostPartnerDisputesBody: Codable, Sendable, Equatable {
    public var orgId: String
    public var referralId: String?
    public var kind: String
    public var detail: String

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case referralId = "referralId"
        case kind = "kind"
        case detail = "detail"
    }

    public init(orgId: String, referralId: String? = nil, kind: String, detail: String) {
        self.orgId = orgId
        self.referralId = referralId
        self.kind = kind
        self.detail = detail
    }
}

public struct PutPartnerOrgsOrgIdPayoutProfileBody: Codable, Sendable, Equatable {
    public var method: String
    public var details: [String: JSONValue]?
    public var payoutCurrency: String?

    enum CodingKeys: String, CodingKey {
        case method = "method"
        case details = "details"
        case payoutCurrency = "payoutCurrency"
    }

    public init(method: String, details: [String: JSONValue]? = nil, payoutCurrency: String? = nil) {
        self.method = method
        self.details = details
        self.payoutCurrency = payoutCurrency
    }
}

public struct PostPartnerOrgsOrgIdTaxFormBody: Codable, Sendable, Equatable {
    public var type: String
    public var data: JSONValue

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case data = "data"
    }

    public init(type: String, data: JSONValue) {
        self.type = type
        self.data = data
    }
}

public struct PostWebhookEndpointsBody: Codable, Sendable, Equatable {
    public var url: String
    public var topics: [String]?
    public var legacySignature: Bool?
    public var programIds: [String]?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case topics = "topics"
        case legacySignature = "legacySignature"
        case programIds = "programIds"
    }

    public init(url: String, topics: [String]? = nil, legacySignature: Bool? = nil, programIds: [String]? = nil) {
        self.url = url
        self.topics = topics
        self.legacySignature = legacySignature
        self.programIds = programIds
    }
}

public struct PatchWebhookEndpointsIdBody: Codable, Sendable, Equatable {
    public var status: String?
    public var url: String?
    public var topics: [String]?
    public var legacySignature: Bool?
    public var programIds: [String]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case url = "url"
        case topics = "topics"
        case legacySignature = "legacySignature"
        case programIds = "programIds"
    }

    public init(status: String? = nil, url: String? = nil, topics: [String]? = nil, legacySignature: Bool? = nil, programIds: [String]? = nil) {
        self.status = status
        self.url = url
        self.topics = topics
        self.legacySignature = legacySignature
        self.programIds = programIds
    }
}

public struct PostSandboxSimulateBody: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var scenario: String?
    public var priceMinor: Int?
    public var months: Int?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case scenario = "scenario"
        case priceMinor = "priceMinor"
        case months = "months"
    }

    public init(programId: String, partnerId: String, scenario: String? = nil, priceMinor: Int? = nil, months: Int? = nil) {
        self.programId = programId
        self.partnerId = partnerId
        self.scenario = scenario
        self.priceMinor = priceMinor
        self.months = months
    }
}

public struct PostImportProviderBody: Codable, Sendable, Equatable {
    /// The tool's partner export, as CSV text.
    public var csv: String

    enum CodingKeys: String, CodingKey {
        case csv = "csv"
    }

    public init(csv: String) {
        self.csv = csv
    }
}

public struct PutBrandingBody: Codable, Sendable, Equatable {
    public var logoUrl: String?
    public var theme: [String: String]?
    public var emailFrom: String?

    enum CodingKeys: String, CodingKey {
        case logoUrl = "logoUrl"
        case theme = "theme"
        case emailFrom = "emailFrom"
    }

    public init(logoUrl: String? = nil, theme: [String: String]? = nil, emailFrom: String? = nil) {
        self.logoUrl = logoUrl
        self.theme = theme
        self.emailFrom = emailFrom
    }
}

public struct PostBrandingLinkDomainBody: Codable, Sendable, Equatable {
    public var domain: String

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
    }

    public init(domain: String) {
        self.domain = domain
    }
}

public struct PostBrandingDomainBody: Codable, Sendable, Equatable {
    public var domain: String

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
    }

    public init(domain: String) {
        self.domain = domain
    }
}

public struct PostEmbedTokensBody: Codable, Sendable, Equatable {
    public var partnerEmail: String

    enum CodingKeys: String, CodingKey {
        case partnerEmail = "partnerEmail"
    }

    public init(partnerEmail: String) {
        self.partnerEmail = partnerEmail
    }
}

public struct PostDiscoverySearchBody: Codable, Sendable, Equatable {
    public var keywords: [String]
    public var category: String?

    enum CodingKeys: String, CodingKey {
        case keywords = "keywords"
        case category = "category"
    }

    public init(keywords: [String], category: String? = nil) {
        self.keywords = keywords
        self.category = category
    }
}

public struct PostDiscoveryCorpusBodyEntriesItem: Codable, Sendable, Equatable {
    public var name: String
    public var url: String
    public var channel: String?
    public var audienceSize: Int?
    public var language: String?
    public var categories: [String]?
    public var keywords: [String]?
    public var contactEmail: String?
    public var html: String?
    public var evidenceSnippet: String?
    public var evidenceSource: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case channel = "channel"
        case audienceSize = "audienceSize"
        case language = "language"
        case categories = "categories"
        case keywords = "keywords"
        case contactEmail = "contactEmail"
        case html = "html"
        case evidenceSnippet = "evidenceSnippet"
        case evidenceSource = "evidenceSource"
    }

    public init(name: String, url: String, channel: String? = nil, audienceSize: Int? = nil, language: String? = nil, categories: [String]? = nil, keywords: [String]? = nil, contactEmail: String? = nil, html: String? = nil, evidenceSnippet: String? = nil, evidenceSource: String? = nil) {
        self.name = name
        self.url = url
        self.channel = channel
        self.audienceSize = audienceSize
        self.language = language
        self.categories = categories
        self.keywords = keywords
        self.contactEmail = contactEmail
        self.html = html
        self.evidenceSnippet = evidenceSnippet
        self.evidenceSource = evidenceSource
    }
}

public struct PostDiscoveryCorpusBody: Codable, Sendable, Equatable {
    public var keywords: [String]?
    public var entries: [PostDiscoveryCorpusBodyEntriesItem]

    enum CodingKeys: String, CodingKey {
        case keywords = "keywords"
        case entries = "entries"
    }

    public init(keywords: [String]? = nil, entries: [PostDiscoveryCorpusBodyEntriesItem]) {
        self.keywords = keywords
        self.entries = entries
    }
}

public struct PostOutreachDraftBody: Codable, Sendable, Equatable {
    public var prospectId: String
    public var programName: String?

    enum CodingKeys: String, CodingKey {
        case prospectId = "prospectId"
        case programName = "programName"
    }

    public init(prospectId: String, programName: String? = nil) {
        self.prospectId = prospectId
        self.programName = programName
    }
}

public struct PutMarketplaceListingBody: Codable, Sendable, Equatable {
    public var programId: String
    public var visibility: String?
    public var category: String?
    public var headline: String?
    public var description: String?
    public var sponsored: Bool?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case visibility = "visibility"
        case category = "category"
        case headline = "headline"
        case description = "description"
        case sponsored = "sponsored"
    }

    public init(programId: String, visibility: String? = nil, category: String? = nil, headline: String? = nil, description: String? = nil, sponsored: Bool? = nil) {
        self.programId = programId
        self.visibility = visibility
        self.category = category
        self.headline = headline
        self.description = description
        self.sponsored = sponsored
    }
}

public struct PostDisputesIdResolveBody: Codable, Sendable, Equatable {
    public var resolution: String

    enum CodingKeys: String, CodingKey {
        case resolution = "resolution"
    }

    public init(resolution: String) {
        self.resolution = resolution
    }
}

public struct PutPartnerProfileBodyChannelsItem: Codable, Sendable, Equatable {
    public var type: String
    public var handle: String?
    public var url: String?
    public var audience: Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case handle = "handle"
        case url = "url"
        case audience = "audience"
    }

    public init(type: String, handle: String? = nil, url: String? = nil, audience: Int? = nil) {
        self.type = type
        self.handle = handle
        self.url = url
        self.audience = audience
    }
}

public struct PutPartnerProfileBodyAudienceCountriesItem: Codable, Sendable, Equatable {
    public var code: String
    public var pct: Double

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case pct = "pct"
    }

    public init(code: String, pct: Double) {
        self.code = code
        self.pct = pct
    }
}

public struct PutPartnerProfileBodyAudience: Codable, Sendable, Equatable {
    public var countries: [PutPartnerProfileBodyAudienceCountriesItem]?
    public var age: [String: Double]?
    public var gender: [String: Double]?

    enum CodingKeys: String, CodingKey {
        case countries = "countries"
        case age = "age"
        case gender = "gender"
    }

    public init(countries: [PutPartnerProfileBodyAudienceCountriesItem]? = nil, age: [String: Double]? = nil, gender: [String: Double]? = nil) {
        self.countries = countries
        self.age = age
        self.gender = gender
    }
}

public struct PutPartnerProfileBody: Codable, Sendable, Equatable {
    public var published: Bool?
    public var headline: String?
    public var bio: String?
    public var categories: [String]?
    public var languages: [String]?
    public var country: String?
    public var channels: [PutPartnerProfileBodyChannelsItem]?
    public var website: String?
    public var acceptsInvites: Bool?
    public var audience: PutPartnerProfileBodyAudience?
    public var engagementBps: Int?

    enum CodingKeys: String, CodingKey {
        case published = "published"
        case headline = "headline"
        case bio = "bio"
        case categories = "categories"
        case languages = "languages"
        case country = "country"
        case channels = "channels"
        case website = "website"
        case acceptsInvites = "acceptsInvites"
        case audience = "audience"
        case engagementBps = "engagementBps"
    }

    public init(published: Bool? = nil, headline: String? = nil, bio: String? = nil, categories: [String]? = nil, languages: [String]? = nil, country: String? = nil, channels: [PutPartnerProfileBodyChannelsItem]? = nil, website: String? = nil, acceptsInvites: Bool? = nil, audience: PutPartnerProfileBodyAudience? = nil, engagementBps: Int? = nil) {
        self.published = published
        self.headline = headline
        self.bio = bio
        self.categories = categories
        self.languages = languages
        self.country = country
        self.channels = channels
        self.website = website
        self.acceptsInvites = acceptsInvites
        self.audience = audience
        self.engagementBps = engagementBps
    }
}

public struct PostCreatorsAccountIdInviteBody: Codable, Sendable, Equatable {
    public var programId: String
    public var message: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case message = "message"
    }

    public init(programId: String, message: String? = nil) {
        self.programId = programId
        self.message = message
    }
}

public struct PostBillingCheckoutBody: Codable, Sendable, Equatable {
    public var plan: String

    enum CodingKeys: String, CodingKey {
        case plan = "plan"
    }

    public init(plan: String) {
        self.plan = plan
    }
}

public struct PostBillingActivateBody: Codable, Sendable, Equatable {
    public var plan: String

    enum CodingKeys: String, CodingKey {
        case plan = "plan"
    }

    public init(plan: String) {
        self.plan = plan
    }
}

public struct PutProgramsIdRefereeRewardBody: Codable, Sendable, Equatable {
    public var enabled: Bool?
    public var kind: String?
    public var amountMinor: Int?
    public var bps: Int?
    public var capMinor: Int?
    public var on: String?
    public var rounding: String?
    public var currency: String?

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case kind = "kind"
        case amountMinor = "amountMinor"
        case bps = "bps"
        case capMinor = "capMinor"
        case on = "on"
        case rounding = "rounding"
        case currency = "currency"
    }

    public init(enabled: Bool? = nil, kind: String? = nil, amountMinor: Int? = nil, bps: Int? = nil, capMinor: Int? = nil, on: String? = nil, rounding: String? = nil, currency: String? = nil) {
        self.enabled = enabled
        self.kind = kind
        self.amountMinor = amountMinor
        self.bps = bps
        self.capMinor = capMinor
        self.on = on
        self.rounding = rounding
        self.currency = currency
    }
}

public struct PostRewardsRedeemByCodeBody: Codable, Sendable, Equatable {
    public var amountMinor: Int?
    public var billingEventId: String?
    public var invoiceRef: String?
    public var externalId: String?
    public var occurredAt: JSONValue?
    public var code: String

    enum CodingKeys: String, CodingKey {
        case amountMinor = "amountMinor"
        case billingEventId = "billingEventId"
        case invoiceRef = "invoiceRef"
        case externalId = "externalId"
        case occurredAt = "occurredAt"
        case code = "code"
    }

    public init(amountMinor: Int? = nil, billingEventId: String? = nil, invoiceRef: String? = nil, externalId: String? = nil, occurredAt: JSONValue? = nil, code: String) {
        self.amountMinor = amountMinor
        self.billingEventId = billingEventId
        self.invoiceRef = invoiceRef
        self.externalId = externalId
        self.occurredAt = occurredAt
        self.code = code
    }
}

public struct PostRewardsIdRedeemBody: Codable, Sendable, Equatable {
    public var amountMinor: Int?
    public var billingEventId: String?
    public var invoiceRef: String?
    public var externalId: String?
    public var occurredAt: JSONValue?

    enum CodingKeys: String, CodingKey {
        case amountMinor = "amountMinor"
        case billingEventId = "billingEventId"
        case invoiceRef = "invoiceRef"
        case externalId = "externalId"
        case occurredAt = "occurredAt"
    }

    public init(amountMinor: Int? = nil, billingEventId: String? = nil, invoiceRef: String? = nil, externalId: String? = nil, occurredAt: JSONValue? = nil) {
        self.amountMinor = amountMinor
        self.billingEventId = billingEventId
        self.invoiceRef = invoiceRef
        self.externalId = externalId
        self.occurredAt = occurredAt
    }
}

public struct PostProgramsIdGroupsBodyBaseOption1Option1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PostProgramsIdGroupsBodyBaseOption1Option2: Codable, Sendable, Equatable {
    public var kind: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostProgramsIdGroupsBody: Codable, Sendable, Equatable {
    public var name: String
    public var base: JSONValue?
    public var holdDays: Int?
    public var minThresholdMinor: Int?
    public var payoutCurrency: String?
    public var onboardingMessage: String?
    public var onboardingChecklist: [String]?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case base = "base"
        case holdDays = "holdDays"
        case minThresholdMinor = "minThresholdMinor"
        case payoutCurrency = "payoutCurrency"
        case onboardingMessage = "onboardingMessage"
        case onboardingChecklist = "onboardingChecklist"
    }

    public init(name: String, base: JSONValue? = nil, holdDays: Int? = nil, minThresholdMinor: Int? = nil, payoutCurrency: String? = nil, onboardingMessage: String? = nil, onboardingChecklist: [String]? = nil) {
        self.name = name
        self.base = base
        self.holdDays = holdDays
        self.minThresholdMinor = minThresholdMinor
        self.payoutCurrency = payoutCurrency
        self.onboardingMessage = onboardingMessage
        self.onboardingChecklist = onboardingChecklist
    }
}

public struct PatchPartnerGroupsIdBodyBaseOption1Option1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PatchPartnerGroupsIdBodyBaseOption1Option2: Codable, Sendable, Equatable {
    public var kind: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PatchPartnerGroupsIdBody: Codable, Sendable, Equatable {
    public var name: String?
    public var base: JSONValue?
    public var holdDays: Int?
    public var minThresholdMinor: Int?
    public var payoutCurrency: String?
    public var onboardingMessage: String?
    public var onboardingChecklist: [String]?
    public var archived: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case base = "base"
        case holdDays = "holdDays"
        case minThresholdMinor = "minThresholdMinor"
        case payoutCurrency = "payoutCurrency"
        case onboardingMessage = "onboardingMessage"
        case onboardingChecklist = "onboardingChecklist"
        case archived = "archived"
    }

    public init(name: String? = nil, base: JSONValue? = nil, holdDays: Int? = nil, minThresholdMinor: Int? = nil, payoutCurrency: String? = nil, onboardingMessage: String? = nil, onboardingChecklist: [String]? = nil, archived: Bool? = nil) {
        self.name = name
        self.base = base
        self.holdDays = holdDays
        self.minThresholdMinor = minThresholdMinor
        self.payoutCurrency = payoutCurrency
        self.onboardingMessage = onboardingMessage
        self.onboardingChecklist = onboardingChecklist
        self.archived = archived
    }
}

public struct PutProgramsIdPartnersPartnerIdGroupBody: Codable, Sendable, Equatable {
    public var groupId: String?

    enum CodingKeys: String, CodingKey {
        case groupId = "groupId"
    }

    public init(groupId: String? = nil) {
        self.groupId = groupId
    }
}

public struct PostProgramsIdPromotionsBodyEffectOption1BaseOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PostProgramsIdPromotionsBodyEffectOption1BaseOption2: Codable, Sendable, Equatable {
    public var kind: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostProgramsIdPromotionsBodyEffectOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var base: JSONValue

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case base = "base"
    }

    public init(kind: String, base: JSONValue) {
        self.kind = kind
        self.base = base
    }
}

public struct PostProgramsIdPromotionsBodyEffectOption2: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PostProgramsIdPromotionsBody: Codable, Sendable, Equatable {
    public var name: String
    public var groupId: String?
    public var effect: JSONValue
    public var startsAt: String
    public var endsAt: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case groupId = "groupId"
        case effect = "effect"
        case startsAt = "startsAt"
        case endsAt = "endsAt"
    }

    public init(name: String, groupId: String? = nil, effect: JSONValue, startsAt: String, endsAt: String) {
        self.name = name
        self.groupId = groupId
        self.effect = effect
        self.startsAt = startsAt
        self.endsAt = endsAt
    }
}

public struct PostContractsBodyCompensationOption1: Codable, Sendable, Equatable {
    public var kind: String
    public var bps: Int

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case bps = "bps"
    }

    public init(kind: String, bps: Int) {
        self.kind = kind
        self.bps = bps
    }
}

public struct PostContractsBodyCompensationOption2: Codable, Sendable, Equatable {
    public var kind: String
    public var amountMinor: Int
    public var currency: String

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case amountMinor = "amountMinor"
        case currency = "currency"
    }

    public init(kind: String, amountMinor: Int, currency: String) {
        self.kind = kind
        self.amountMinor = amountMinor
        self.currency = currency
    }
}

public struct PostContractsBody: Codable, Sendable, Equatable {
    public var programId: String
    public var partnerId: String
    public var title: String?
    public var termsMd: String?
    public var compensation: JSONValue
    public var send: Bool?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case partnerId = "partnerId"
        case title = "title"
        case termsMd = "termsMd"
        case compensation = "compensation"
        case send = "send"
    }

    public init(programId: String, partnerId: String, title: String? = nil, termsMd: String? = nil, compensation: JSONValue, send: Bool? = nil) {
        self.programId = programId
        self.partnerId = partnerId
        self.title = title
        self.termsMd = termsMd
        self.compensation = compensation
        self.send = send
    }
}

public struct PutProgramsIdIncrementalityBody: Codable, Sendable, Equatable {
    public var holdoutBps: Int

    enum CodingKeys: String, CodingKey {
        case holdoutBps = "holdoutBps"
    }

    public init(holdoutBps: Int) {
        self.holdoutBps = holdoutBps
    }
}

public struct PutProgramsIdAutopricingBody: Codable, Sendable, Equatable {
    public var enabled: Bool?
    public var targetRoas: Double?
    public var minBps: Int?
    public var maxBps: Int?
    public var objective: String?
    public var targetRoi: Double?

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case targetRoas = "targetRoas"
        case minBps = "minBps"
        case maxBps = "maxBps"
        case objective = "objective"
        case targetRoi = "targetRoi"
    }

    public init(enabled: Bool? = nil, targetRoas: Double? = nil, minBps: Int? = nil, maxBps: Int? = nil, objective: String? = nil, targetRoi: Double? = nil) {
        self.enabled = enabled
        self.targetRoas = targetRoas
        self.minBps = minBps
        self.maxBps = maxBps
        self.objective = objective
        self.targetRoi = targetRoi
    }
}

public struct PostProgramsIdAutopriceRunBody: Codable, Sendable, Equatable {
    public var objective: String?

    enum CodingKeys: String, CodingKey {
        case objective = "objective"
    }

    public init(objective: String? = nil) {
        self.objective = objective
    }
}

public struct PostPassportVerifyBody: Codable, Sendable, Equatable {
    public var passport: JSONValue

    enum CodingKeys: String, CodingKey {
        case passport = "passport"
    }

    public init(passport: JSONValue) {
        self.passport = passport
    }
}

public struct PostPartnerAdvanceAcceptBody: Codable, Sendable, Equatable {
    public var amountMinor: Int

    enum CodingKeys: String, CodingKey {
        case amountMinor = "amountMinor"
    }

    public init(amountMinor: Int) {
        self.amountMinor = amountMinor
    }
}

public struct PutNetworkSettingsBody: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct PutProgramsIdNegotiationPolicyBody: Codable, Sendable, Equatable {
    public var enabled: Bool?
    public var minBps: Int
    public var maxBps: Int
    public var autoAcceptMaxBps: Int

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case minBps = "minBps"
        case maxBps = "maxBps"
        case autoAcceptMaxBps = "autoAcceptMaxBps"
    }

    public init(enabled: Bool? = nil, minBps: Int, maxBps: Int, autoAcceptMaxBps: Int) {
        self.enabled = enabled
        self.minBps = minBps
        self.maxBps = maxBps
        self.autoAcceptMaxBps = autoAcceptMaxBps
    }
}

public struct PostAdminOrgsIdSuspendBody: Codable, Sendable, Equatable {
    public var reason: String?

    enum CodingKeys: String, CodingKey {
        case reason = "reason"
    }

    public init(reason: String? = nil) {
        self.reason = reason
    }
}

public struct PostAdminOrgsIdPlanBody: Codable, Sendable, Equatable {
    public var plan: String

    enum CodingKeys: String, CodingKey {
        case plan = "plan"
    }

    public init(plan: String) {
        self.plan = plan
    }
}

public struct PostAssetsBody: Codable, Sendable, Equatable {
    public var programId: String
    public var kind: String
    public var title: String
    public var content: String?
    public var dimensions: String?
    public var groupId: String?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case kind = "kind"
        case title = "title"
        case content = "content"
        case dimensions = "dimensions"
        case groupId = "groupId"
    }

    public init(programId: String, kind: String, title: String, content: String? = nil, dimensions: String? = nil, groupId: String? = nil) {
        self.programId = programId
        self.kind = kind
        self.title = title
        self.content = content
        self.dimensions = dimensions
        self.groupId = groupId
    }
}

public struct PostPartnerDealsBody: Codable, Sendable, Equatable {
    public var orgId: String
    public var programId: String
    public var company: String
    public var contactEmail: String
    public var valueMinor: Int?
    public var currency: String?
    public var notes: String?

    enum CodingKeys: String, CodingKey {
        case orgId = "orgId"
        case programId = "programId"
        case company = "company"
        case contactEmail = "contactEmail"
        case valueMinor = "valueMinor"
        case currency = "currency"
        case notes = "notes"
    }

    public init(orgId: String, programId: String, company: String, contactEmail: String, valueMinor: Int? = nil, currency: String? = nil, notes: String? = nil) {
        self.orgId = orgId
        self.programId = programId
        self.company = company
        self.contactEmail = contactEmail
        self.valueMinor = valueMinor
        self.currency = currency
        self.notes = notes
    }
}

public struct PostDealsIdApproveBody: Codable, Sendable, Equatable {
    public var protectionDays: Int?

    enum CodingKeys: String, CodingKey {
        case protectionDays = "protectionDays"
    }

    public init(protectionDays: Int? = nil) {
        self.protectionDays = protectionDays
    }
}

public struct PostDealsIdWonBody: Codable, Sendable, Equatable {
    public var customerRef: String

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
    }

    public init(customerRef: String) {
        self.customerRef = customerRef
    }
}

public struct PutPartnerOrgsOrgIdPostbackBody: Codable, Sendable, Equatable {
    public var url: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }

    public init(url: String) {
        self.url = url
    }
}

public struct PostPrivacyForgetBody: Codable, Sendable, Equatable {
    public var email: String?
    public var customerRef: String?
    public var partnerId: String?

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case customerRef = "customerRef"
        case partnerId = "partnerId"
    }

    public init(email: String? = nil, customerRef: String? = nil, partnerId: String? = nil) {
        self.email = email
        self.customerRef = customerRef
        self.partnerId = partnerId
    }
}

public struct PostPrivacyLookupBody: Codable, Sendable, Equatable {
    public var email: String

    enum CodingKeys: String, CodingKey {
        case email = "email"
    }

    public init(email: String) {
        self.email = email
    }
}

public struct PostPrivacyRequestsBodySubject: Codable, Sendable, Equatable {
    public var email: String?
    public var customerRef: String?
    public var partnerId: String?

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case customerRef = "customerRef"
        case partnerId = "partnerId"
    }

    public init(email: String? = nil, customerRef: String? = nil, partnerId: String? = nil) {
        self.email = email
        self.customerRef = customerRef
        self.partnerId = partnerId
    }
}

public struct PostPrivacyRequestsBody: Codable, Sendable, Equatable {
    public var subject: PostPrivacyRequestsBodySubject
    public var type: String

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case type = "type"
    }

    public init(subject: PostPrivacyRequestsBodySubject, type: String) {
        self.subject = subject
        self.type = type
    }
}

public struct PutEmailSettingsBody: Codable, Sendable, Equatable {
    public var provider: String?
    public var apiKey: String?
    public var fromAddress: String?
    public var fromName: String?
    public var replyTo: String?
    public var defaultLocale: String?
    public var logoUrl: String?
    public var primaryColor: String?

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case apiKey = "apiKey"
        case fromAddress = "fromAddress"
        case fromName = "fromName"
        case replyTo = "replyTo"
        case defaultLocale = "defaultLocale"
        case logoUrl = "logoUrl"
        case primaryColor = "primaryColor"
    }

    public init(provider: String? = nil, apiKey: String? = nil, fromAddress: String? = nil, fromName: String? = nil, replyTo: String? = nil, defaultLocale: String? = nil, logoUrl: String? = nil, primaryColor: String? = nil) {
        self.provider = provider
        self.apiKey = apiKey
        self.fromAddress = fromAddress
        self.fromName = fromName
        self.replyTo = replyTo
        self.defaultLocale = defaultLocale
        self.logoUrl = logoUrl
        self.primaryColor = primaryColor
    }
}

public struct PutEmailTemplatesEventLocaleBody: Codable, Sendable, Equatable {
    public var subject: String
    public var text: String
    public var html: String?

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case text = "text"
        case html = "html"
    }

    public init(subject: String, text: String, html: String? = nil) {
        self.subject = subject
        self.text = text
        self.html = html
    }
}

public struct PostEmailPreviewBodyDraft: Codable, Sendable, Equatable {
    public var subject: String
    public var text: String
    public var html: String?

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case text = "text"
        case html = "html"
    }

    public init(subject: String, text: String, html: String? = nil) {
        self.subject = subject
        self.text = text
        self.html = html
    }
}

public struct PostEmailPreviewBody: Codable, Sendable, Equatable {
    public var event: String
    public var locale: String
    public var draft: PostEmailPreviewBodyDraft?

    enum CodingKeys: String, CodingKey {
        case event = "event"
        case locale = "locale"
        case draft = "draft"
    }

    public init(event: String, locale: String, draft: PostEmailPreviewBodyDraft? = nil) {
        self.event = event
        self.locale = locale
        self.draft = draft
    }
}

public struct PostEmailTestBody: Codable, Sendable, Equatable {
    public var event: String
    public var locale: String
    public var to: String

    enum CodingKeys: String, CodingKey {
        case event = "event"
        case locale = "locale"
        case to = "to"
    }

    public init(event: String, locale: String, to: String) {
        self.event = event
        self.locale = locale
        self.to = to
    }
}

public struct PutMeLocaleBody: Codable, Sendable, Equatable {
    public var locale: String

    enum CodingKeys: String, CodingKey {
        case locale = "locale"
    }

    public init(locale: String) {
        self.locale = locale
    }
}

public struct PutMeRoiDigestBody: Codable, Sendable, Equatable {
    public var enabled: Bool

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
    }

    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct PutPartnerLocaleBody: Codable, Sendable, Equatable {
    public var locale: String

    enum CodingKeys: String, CodingKey {
        case locale = "locale"
    }

    public init(locale: String) {
        self.locale = locale
    }
}

public struct PutIntegrationsHubspotBody: Codable, Sendable, Equatable {
    public var token: String?
    public var pipeline: String?
    public var newDealStage: String?
    public var paidDealStage: String?
    public var status: String?

    enum CodingKeys: String, CodingKey {
        case token = "token"
        case pipeline = "pipeline"
        case newDealStage = "newDealStage"
        case paidDealStage = "paidDealStage"
        case status = "status"
    }

    public init(token: String? = nil, pipeline: String? = nil, newDealStage: String? = nil, paidDealStage: String? = nil, status: String? = nil) {
        self.token = token
        self.pipeline = pipeline
        self.newDealStage = newDealStage
        self.paidDealStage = paidDealStage
        self.status = status
    }
}

public struct PutIntegrationsSegmentBody: Codable, Sendable, Equatable {
    public var writeKey: String?
    public var events: [String]?
    public var status: String?

    enum CodingKeys: String, CodingKey {
        case writeKey = "writeKey"
        case events = "events"
        case status = "status"
    }

    public init(writeKey: String? = nil, events: [String]? = nil, status: String? = nil) {
        self.writeKey = writeKey
        self.events = events
        self.status = status
    }
}

public struct PostIntegrationsHubspotTestBody: Codable, Sendable, Equatable {
    public var setupProperties: Bool?

    enum CodingKeys: String, CodingKey {
        case setupProperties = "setupProperties"
    }

    public init(setupProperties: Bool? = nil) {
        self.setupProperties = setupProperties
    }
}

public struct PostZapierHooksBody: Codable, Sendable, Equatable {
    public var targetUrl: String
    public var event: String

    enum CodingKeys: String, CodingKey {
        case targetUrl = "target_url"
        case event = "event"
    }

    public init(targetUrl: String, event: String) {
        self.targetUrl = targetUrl
        self.event = event
    }
}

public struct PostZapierConversionsBody: Codable, Sendable, Equatable {
    public var providerEventId: String
    public var type: String?
    public var customerRef: String
    public var amountMinor: Int
    public var currency: String?
    public var invoiceRef: String?
    public var occurredAt: String?
    public var connectionId: String?

    enum CodingKeys: String, CodingKey {
        case providerEventId = "providerEventId"
        case type = "type"
        case customerRef = "customerRef"
        case amountMinor = "amountMinor"
        case currency = "currency"
        case invoiceRef = "invoiceRef"
        case occurredAt = "occurredAt"
        case connectionId = "connectionId"
    }

    public init(providerEventId: String, type: String? = nil, customerRef: String, amountMinor: Int, currency: String? = nil, invoiceRef: String? = nil, occurredAt: String? = nil, connectionId: String? = nil) {
        self.providerEventId = providerEventId
        self.type = type
        self.customerRef = customerRef
        self.amountMinor = amountMinor
        self.currency = currency
        self.invoiceRef = invoiceRef
        self.occurredAt = occurredAt
        self.connectionId = connectionId
    }
}

public struct PostPartnerSecurityTotpEnableBody: Codable, Sendable, Equatable {
    public var code: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
    }

    public init(code: String) {
        self.code = code
    }
}

public struct PostPartnerSecurityTotpDisableBody: Codable, Sendable, Equatable {
    public var code: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
    }

    public init(code: String) {
        self.code = code
    }
}

public struct PostAuthConnectionsBodyKeys: Codable, Sendable, Equatable {
    public var referralToken: String?
    public var anonId: String?
    public var couponCode: String?
    public var programId: String?
    public var autoEnroll: String?

    enum CodingKeys: String, CodingKey {
        case referralToken = "referralToken"
        case anonId = "anonId"
        case couponCode = "couponCode"
        case programId = "programId"
        case autoEnroll = "autoEnroll"
    }

    public init(referralToken: String? = nil, anonId: String? = nil, couponCode: String? = nil, programId: String? = nil, autoEnroll: String? = nil) {
        self.referralToken = referralToken
        self.anonId = anonId
        self.couponCode = couponCode
        self.programId = programId
        self.autoEnroll = autoEnroll
    }
}

public struct PostAuthConnectionsBody: Codable, Sendable, Equatable {
    public var provider: String
    public var programId: String
    public var instanceId: String?
    public var autoEnrollUsers: Bool?
    public var destinationUrl: String?
    public var name: String?
    public var secret: String?
    public var keys: PostAuthConnectionsBodyKeys?

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case programId = "programId"
        case instanceId = "instanceId"
        case autoEnrollUsers = "autoEnrollUsers"
        case destinationUrl = "destinationUrl"
        case name = "name"
        case secret = "secret"
        case keys = "keys"
    }

    public init(provider: String, programId: String, instanceId: String? = nil, autoEnrollUsers: Bool? = nil, destinationUrl: String? = nil, name: String? = nil, secret: String? = nil, keys: PostAuthConnectionsBodyKeys? = nil) {
        self.provider = provider
        self.programId = programId
        self.instanceId = instanceId
        self.autoEnrollUsers = autoEnrollUsers
        self.destinationUrl = destinationUrl
        self.name = name
        self.secret = secret
        self.keys = keys
    }
}

public struct PatchAuthConnectionsIdBody: Codable, Sendable, Equatable {
    public var status: String?
    public var name: String?
    public var autoEnrollUsers: Bool?
    public var destinationUrl: String?
    public var signatureVersion: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case name = "name"
        case autoEnrollUsers = "autoEnrollUsers"
        case destinationUrl = "destinationUrl"
        case signatureVersion = "signatureVersion"
    }

    public init(status: String? = nil, name: String? = nil, autoEnrollUsers: Bool? = nil, destinationUrl: String? = nil, signatureVersion: String? = nil) {
        self.status = status
        self.name = name
        self.autoEnrollUsers = autoEnrollUsers
        self.destinationUrl = destinationUrl
        self.signatureVersion = signatureVersion
    }
}

public struct PostAuthConnectionsIdSignupsBodyReferral: Codable, Sendable, Equatable {
    public var code: String?
    public var clickId: String?
    public var anonId: String?
    public var capturedAt: String?
    public var consent: String?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case clickId = "clickId"
        case anonId = "anonId"
        case capturedAt = "capturedAt"
        case consent = "consent"
    }

    public init(code: String? = nil, clickId: String? = nil, anonId: String? = nil, capturedAt: String? = nil, consent: String? = nil) {
        self.code = code
        self.clickId = clickId
        self.anonId = anonId
        self.capturedAt = capturedAt
        self.consent = consent
    }
}

public struct PostAuthConnectionsIdSignupsBodyRisk: Codable, Sendable, Equatable {
    public var botScore: Double?
    public var disposableEmail: Bool?
    public var emailVerified: Bool?
    public var selfReferral: Bool?
    public var velocity: Int?
    public var reasons: [String]?
    public var score: Double?
    public var level: String?
    public var dropped: Bool?

    enum CodingKeys: String, CodingKey {
        case botScore = "botScore"
        case disposableEmail = "disposableEmail"
        case emailVerified = "emailVerified"
        case selfReferral = "selfReferral"
        case velocity = "velocity"
        case reasons = "reasons"
        case score = "score"
        case level = "level"
        case dropped = "dropped"
    }

    public init(botScore: Double? = nil, disposableEmail: Bool? = nil, emailVerified: Bool? = nil, selfReferral: Bool? = nil, velocity: Int? = nil, reasons: [String]? = nil, score: Double? = nil, level: String? = nil, dropped: Bool? = nil) {
        self.botScore = botScore
        self.disposableEmail = disposableEmail
        self.emailVerified = emailVerified
        self.selfReferral = selfReferral
        self.velocity = velocity
        self.reasons = reasons
        self.score = score
        self.level = level
        self.dropped = dropped
    }
}

public struct PostAuthConnectionsIdSignupsBody: Codable, Sendable, Equatable {
    public var customerRef: String
    public var email: String?
    public var emailHash: String?
    public var name: String?
    public var ip: String?
    public var ua: String?
    public var signedUpAt: String
    public var referral: PostAuthConnectionsIdSignupsBodyReferral?
    public var risk: PostAuthConnectionsIdSignupsBodyRisk?
    public var emailDomain: String?
    public var referralCode: String?
    public var autoEnroll: Bool?
    public var test: Bool?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case email = "email"
        case emailHash = "emailHash"
        case name = "name"
        case ip = "ip"
        case ua = "ua"
        case signedUpAt = "signedUpAt"
        case referral = "referral"
        case risk = "risk"
        case emailDomain = "emailDomain"
        case referralCode = "referralCode"
        case autoEnroll = "autoEnroll"
        case test = "test"
    }

    public init(customerRef: String, email: String? = nil, emailHash: String? = nil, name: String? = nil, ip: String? = nil, ua: String? = nil, signedUpAt: String, referral: PostAuthConnectionsIdSignupsBodyReferral? = nil, risk: PostAuthConnectionsIdSignupsBodyRisk? = nil, emailDomain: String? = nil, referralCode: String? = nil, autoEnroll: Bool? = nil, test: Bool? = nil) {
        self.customerRef = customerRef
        self.email = email
        self.emailHash = emailHash
        self.name = name
        self.ip = ip
        self.ua = ua
        self.signedUpAt = signedUpAt
        self.referral = referral
        self.risk = risk
        self.emailDomain = emailDomain
        self.referralCode = referralCode
        self.autoEnroll = autoEnroll
        self.test = test
    }
}

public struct PostAuthConnectionsIdEraseBody: Codable, Sendable, Equatable {
    public var customerRef: String

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
    }

    public init(customerRef: String) {
        self.customerRef = customerRef
    }
}

public struct PostAuthConnectionsIdAliasesBody: Codable, Sendable, Equatable {
    public var fromCustomerRef: String
    public var toCustomerRef: String

    enum CodingKeys: String, CodingKey {
        case fromCustomerRef = "fromCustomerRef"
        case toCustomerRef = "toCustomerRef"
    }

    public init(fromCustomerRef: String, toCustomerRef: String) {
        self.fromCustomerRef = fromCustomerRef
        self.toCustomerRef = toCustomerRef
    }
}

public struct PostAuthConnectionsIdUsersBody: Codable, Sendable, Equatable {
    public var customerRef: String
    public var email: String?
    public var name: String?
    public var status: String?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case email = "email"
        case name = "name"
        case status = "status"
    }

    public init(customerRef: String, email: String? = nil, name: String? = nil, status: String? = nil) {
        self.customerRef = customerRef
        self.email = email
        self.name = name
        self.status = status
    }
}

public struct PostAuthConnectionsIdSignalsBody: Codable, Sendable, Equatable {
    public var customerRef: String
    public var signal: String
    public var at: String?
    public var details: [String: JSONValue]?

    enum CodingKeys: String, CodingKey {
        case customerRef = "customerRef"
        case signal = "signal"
        case at = "at"
        case details = "details"
    }

    public init(customerRef: String, signal: String, at: String? = nil, details: [String: JSONValue]? = nil) {
        self.customerRef = customerRef
        self.signal = signal
        self.at = at
        self.details = details
    }
}

public struct PatchOrgSsoBody: Codable, Sendable, Equatable {
    public var requireSso: Bool?
    public var roleMapping: [String: String]?

    enum CodingKeys: String, CodingKey {
        case requireSso = "requireSso"
        case roleMapping = "roleMapping"
    }

    public init(requireSso: Bool? = nil, roleMapping: [String: String]? = nil) {
        self.requireSso = requireSso
        self.roleMapping = roleMapping
    }
}

public struct PostOrgSsoTicketsBody: Codable, Sendable, Equatable {
    public var expiresInDays: Int?

    enum CodingKeys: String, CodingKey {
        case expiresInDays = "expiresInDays"
    }

    public init(expiresInDays: Int? = nil) {
        self.expiresInDays = expiresInDays
    }
}

public struct PostPartnerAuthWalletNonceBody: Codable, Sendable, Equatable {
    public var address: String

    enum CodingKeys: String, CodingKey {
        case address = "address"
    }

    public init(address: String) {
        self.address = address
    }
}

public struct PostPartnerAuthWalletVerifyBody: Codable, Sendable, Equatable {
    public var address: String
    public var nonce: String
    public var signature: String
    public var name: String?

    enum CodingKeys: String, CodingKey {
        case address = "address"
        case nonce = "nonce"
        case signature = "signature"
        case name = "name"
    }

    public init(address: String, nonce: String, signature: String, name: String? = nil) {
        self.address = address
        self.nonce = nonce
        self.signature = signature
        self.name = name
    }
}

public struct PostOnchainConnectionsBody: Codable, Sendable, Equatable {
    public var programId: String
    public var name: String?
    public var secret: String?
    public var decimals: [String: Int]?

    enum CodingKeys: String, CodingKey {
        case programId = "programId"
        case name = "name"
        case secret = "secret"
        case decimals = "decimals"
    }

    public init(programId: String, name: String? = nil, secret: String? = nil, decimals: [String: Int]? = nil) {
        self.programId = programId
        self.name = name
        self.secret = secret
        self.decimals = decimals
    }
}

public struct PostPublicProgramsHandleJoinBody: Codable, Sendable, Equatable {
    public var destinationUrl: String?

    enum CodingKeys: String, CodingKey {
        case destinationUrl = "destinationUrl"
    }

    public init(destinationUrl: String? = nil) {
        self.destinationUrl = destinationUrl
    }
}

public struct PostGraphqlBody: Codable, Sendable, Equatable {
    public var query: String
    public var variables: [String: JSONValue]?
    public var operationName: String?

    enum CodingKeys: String, CodingKey {
        case query = "query"
        case variables = "variables"
        case operationName = "operationName"
    }

    public init(query: String, variables: [String: JSONValue]? = nil, operationName: String? = nil) {
        self.query = query
        self.variables = variables
        self.operationName = operationName
    }
}
