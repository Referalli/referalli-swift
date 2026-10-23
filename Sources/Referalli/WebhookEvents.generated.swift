// Code generated from the Referalli OpenAPI document. DO NOT EDIT.
// Changes belong in the generator, which overwrites this file.

import Foundation

/// Every webhook topic the API publishes.
public enum WebhookTopic {
    /// `billing_event.recorded`: A billing event was recorded
    public static let billingEventRecorded = "billing_event.recorded"
    /// `click.recorded`: A tracked click was recorded
    public static let clickRecorded = "click.recorded"
    /// `commission.earned`: A commission line was earned
    public static let commissionEarned = "commission.earned"
    /// `commission.reversed`: A commission line was reversed
    public static let commissionReversed = "commission.reversed"
    /// `commission.settled`: A commission line was settled by the merchant
    public static let commissionSettled = "commission.settled"
    /// `credit.redeemed`: A referee reward was redeemed
    public static let creditRedeemed = "credit.redeemed"
    /// `customer.aliased`: A customer's id changed
    public static let customerAliased = "customer.aliased"
    /// `deal.submitted`: A partner registered a deal
    public static let dealSubmitted = "deal.submitted"
    /// `dispute.resolved`: A partner dispute was resolved
    public static let disputeResolved = "dispute.resolved"
    /// `fraud.case_opened`: A fraud case was opened
    public static let fraudCaseOpened = "fraud.case_opened"
    /// `partner.applied`: A partner applied to a program
    public static let partnerApplied = "partner.applied"
    /// `partner.approved`: A partner was approved
    public static let partnerApproved = "partner.approved"
    /// `partner.enrolled`: A partner was enrolled
    public static let partnerEnrolled = "partner.enrolled"
    /// `partner.level_up`: A partner reached a new level
    public static let partnerLevelUp = "partner.level_up"
    /// `payout.cancelled`: A payout was cancelled
    public static let payoutCancelled = "payout.cancelled"
    /// `payout.failed`: A payout failed
    public static let payoutFailed = "payout.failed"
    /// `payout.scheduled`: A payout was created in a run
    public static let payoutScheduled = "payout.scheduled"
    /// `payout.sent`: A payout was paid
    public static let payoutSent = "payout.sent"
    /// `payout.submitted`: A payout was submitted to the provider
    public static let payoutSubmitted = "payout.submitted"
    /// `privacy.request_completed`: A data-subject request finished
    public static let privacyRequestCompleted = "privacy.request_completed"
    /// `referee_reward.earned`: A referred customer earned their reward
    public static let refereeRewardEarned = "referee_reward.earned"
    /// `referral.approved`: A held referral was approved
    public static let referralApproved = "referral.approved"
    /// `referral.created`: A customer was attributed to a partner
    public static let referralCreated = "referral.created"
    /// `referral.held`: A referral was held for review
    public static let referralHeld = "referral.held"
    /// `referral.paused`: A referral was paused
    public static let referralPaused = "referral.paused"
    /// `referral.reassigned`: A referral moved to another partner
    public static let referralReassigned = "referral.reassigned"
    /// `referral.rejected`: A self-referral was refused
    public static let referralRejected = "referral.rejected"
    /// `referral.resumed`: A paused referral was resumed
    public static let referralResumed = "referral.resumed"
    /// `referral.voided`: A referral was voided
    public static let referralVoided = "referral.voided"
    /// `roi.pattern_detected`: A value pattern changed
    public static let roiPatternDetected = "roi.pattern_detected"
    /// `roi.payback_reached`: A credit grant paid back
    public static let roiPaybackReached = "roi.payback_reached"
    /// `tax.form_delivered`: A tax form was delivered to a partner
    public static let taxFormDelivered = "tax.form_delivered"
    /// `webhook_endpoint.disabled`: A failing webhook endpoint was disabled
    public static let webhookEndpointDisabled = "webhook_endpoint.disabled"

    /// Every topic.
    public static let all: [String] = ["billing_event.recorded", "click.recorded", "commission.earned", "commission.reversed", "commission.settled", "credit.redeemed", "customer.aliased", "deal.submitted", "dispute.resolved", "fraud.case_opened", "partner.applied", "partner.approved", "partner.enrolled", "partner.level_up", "payout.cancelled", "payout.failed", "payout.scheduled", "payout.sent", "payout.submitted", "privacy.request_completed", "referee_reward.earned", "referral.approved", "referral.created", "referral.held", "referral.paused", "referral.reassigned", "referral.rejected", "referral.resumed", "referral.voided", "roi.pattern_detected", "roi.payback_reached", "tax.form_delivered", "webhook_endpoint.disabled"]
}

/// A webhook event's payload, typed by topic. `.unknown` is a topic this SDK predates.
public enum WebhookPayload: Sendable {
    /// `billing_event.recorded`
    case billingEventRecorded(BillingEventRecordedEventData)
    /// `click.recorded`
    case clickRecorded(ClickRecordedEventData)
    /// `commission.earned`
    case commissionEarned(CommissionEarnedEventData)
    /// `commission.reversed`
    case commissionReversed(CommissionReversedEventData)
    /// `commission.settled`
    case commissionSettled(CommissionSettledEventData)
    /// `credit.redeemed`
    case creditRedeemed(CreditRedeemedEventData)
    /// `customer.aliased`
    case customerAliased(CustomerAliasedEventData)
    /// `deal.submitted`
    case dealSubmitted(DealSubmittedEventData)
    /// `dispute.resolved`
    case disputeResolved(DisputeResolvedEventData)
    /// `fraud.case_opened`
    case fraudCaseOpened(FraudCaseOpenedEventData)
    /// `partner.applied`
    case partnerApplied(PartnerAppliedEventData)
    /// `partner.approved`
    case partnerApproved(PartnerApprovedEventData)
    /// `partner.enrolled`
    case partnerEnrolled(PartnerEnrolledEventData)
    /// `partner.level_up`
    case partnerLevelUp(PartnerLevelUpEventData)
    /// `payout.cancelled`
    case payoutCancelled(PayoutCancelledEventData)
    /// `payout.failed`
    case payoutFailed(PayoutFailedEventData)
    /// `payout.scheduled`
    case payoutScheduled(PayoutScheduledEventData)
    /// `payout.sent`
    case payoutSent(PayoutSentEventData)
    /// `payout.submitted`
    case payoutSubmitted(PayoutSubmittedEventData)
    /// `privacy.request_completed`
    case privacyRequestCompleted(PrivacyRequestCompletedEventData)
    /// `referee_reward.earned`
    case refereeRewardEarned(RefereeRewardEarnedEventData)
    /// `referral.approved`
    case referralApproved(ReferralApprovedEventData)
    /// `referral.created`
    case referralCreated(ReferralCreatedEventData)
    /// `referral.held`
    case referralHeld(ReferralHeldEventData)
    /// `referral.paused`
    case referralPaused(ReferralPausedEventData)
    /// `referral.reassigned`
    case referralReassigned(ReferralReassignedEventData)
    /// `referral.rejected`
    case referralRejected(ReferralRejectedEventData)
    /// `referral.resumed`
    case referralResumed(ReferralResumedEventData)
    /// `referral.voided`
    case referralVoided(ReferralVoidedEventData)
    /// `roi.pattern_detected`
    case roiPatternDetected(RoiPatternDetectedEventData)
    /// `roi.payback_reached`
    case roiPaybackReached(RoiPaybackReachedEventData)
    /// `tax.form_delivered`
    case taxFormDelivered(TaxFormDeliveredEventData)
    /// `webhook_endpoint.disabled`
    case webhookEndpointDisabled(WebhookEndpointDisabledEventData)
    case unknown(topic: String, data: JSONValue)

    static func decode(topic: String, data: JSONValue) throws -> WebhookPayload {
        switch topic {
        case "billing_event.recorded":
            return .billingEventRecorded(try ReferalliClient.decode(BillingEventRecordedEventData.self, from: data))
        case "click.recorded":
            return .clickRecorded(try ReferalliClient.decode(ClickRecordedEventData.self, from: data))
        case "commission.earned":
            return .commissionEarned(try ReferalliClient.decode(CommissionEarnedEventData.self, from: data))
        case "commission.reversed":
            return .commissionReversed(try ReferalliClient.decode(CommissionReversedEventData.self, from: data))
        case "commission.settled":
            return .commissionSettled(try ReferalliClient.decode(CommissionSettledEventData.self, from: data))
        case "credit.redeemed":
            return .creditRedeemed(try ReferalliClient.decode(CreditRedeemedEventData.self, from: data))
        case "customer.aliased":
            return .customerAliased(try ReferalliClient.decode(CustomerAliasedEventData.self, from: data))
        case "deal.submitted":
            return .dealSubmitted(try ReferalliClient.decode(DealSubmittedEventData.self, from: data))
        case "dispute.resolved":
            return .disputeResolved(try ReferalliClient.decode(DisputeResolvedEventData.self, from: data))
        case "fraud.case_opened":
            return .fraudCaseOpened(try ReferalliClient.decode(FraudCaseOpenedEventData.self, from: data))
        case "partner.applied":
            return .partnerApplied(try ReferalliClient.decode(PartnerAppliedEventData.self, from: data))
        case "partner.approved":
            return .partnerApproved(try ReferalliClient.decode(PartnerApprovedEventData.self, from: data))
        case "partner.enrolled":
            return .partnerEnrolled(try ReferalliClient.decode(PartnerEnrolledEventData.self, from: data))
        case "partner.level_up":
            return .partnerLevelUp(try ReferalliClient.decode(PartnerLevelUpEventData.self, from: data))
        case "payout.cancelled":
            return .payoutCancelled(try ReferalliClient.decode(PayoutCancelledEventData.self, from: data))
        case "payout.failed":
            return .payoutFailed(try ReferalliClient.decode(PayoutFailedEventData.self, from: data))
        case "payout.scheduled":
            return .payoutScheduled(try ReferalliClient.decode(PayoutScheduledEventData.self, from: data))
        case "payout.sent":
            return .payoutSent(try ReferalliClient.decode(PayoutSentEventData.self, from: data))
        case "payout.submitted":
            return .payoutSubmitted(try ReferalliClient.decode(PayoutSubmittedEventData.self, from: data))
        case "privacy.request_completed":
            return .privacyRequestCompleted(try ReferalliClient.decode(PrivacyRequestCompletedEventData.self, from: data))
        case "referee_reward.earned":
            return .refereeRewardEarned(try ReferalliClient.decode(RefereeRewardEarnedEventData.self, from: data))
        case "referral.approved":
            return .referralApproved(try ReferalliClient.decode(ReferralApprovedEventData.self, from: data))
        case "referral.created":
            return .referralCreated(try ReferalliClient.decode(ReferralCreatedEventData.self, from: data))
        case "referral.held":
            return .referralHeld(try ReferalliClient.decode(ReferralHeldEventData.self, from: data))
        case "referral.paused":
            return .referralPaused(try ReferalliClient.decode(ReferralPausedEventData.self, from: data))
        case "referral.reassigned":
            return .referralReassigned(try ReferalliClient.decode(ReferralReassignedEventData.self, from: data))
        case "referral.rejected":
            return .referralRejected(try ReferalliClient.decode(ReferralRejectedEventData.self, from: data))
        case "referral.resumed":
            return .referralResumed(try ReferalliClient.decode(ReferralResumedEventData.self, from: data))
        case "referral.voided":
            return .referralVoided(try ReferalliClient.decode(ReferralVoidedEventData.self, from: data))
        case "roi.pattern_detected":
            return .roiPatternDetected(try ReferalliClient.decode(RoiPatternDetectedEventData.self, from: data))
        case "roi.payback_reached":
            return .roiPaybackReached(try ReferalliClient.decode(RoiPaybackReachedEventData.self, from: data))
        case "tax.form_delivered":
            return .taxFormDelivered(try ReferalliClient.decode(TaxFormDeliveredEventData.self, from: data))
        case "webhook_endpoint.disabled":
            return .webhookEndpointDisabled(try ReferalliClient.decode(WebhookEndpointDisabledEventData.self, from: data))
        default:
            return .unknown(topic: topic, data: data)
        }
    }
}
