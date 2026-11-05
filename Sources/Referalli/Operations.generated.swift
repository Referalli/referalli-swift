// Code generated from the Referalli OpenAPI document. DO NOT EDIT.
// Changes belong in the generator, which overwrites this file.

import Foundation

/// One method per Referalli API operation, generated from the OpenAPI document.
extension ReferalliClient {
    /// Revoke an API key. DELETE /v1/api-keys/{id}
    ///
    /// Revokes a key at once. `cascade=true` also revokes every key it minted (and theirs); `pair=true` also revokes its live/test twin. Returns the revoked ids. Needs an owner or admin session, or an API key with the `admin` scope. A key holding `api_keys:mint` may also do this for keys it minted itself (403 for any other). Audited.
    ///
    /// **Auth:** an API key with `api_keys:mint`, or a session of any role.
    ///
    /// **Scopes:** `api_keys:mint`, `admin`.
    ///
    /// cascade: true: also revoke every key this key minted, and theirs.
    /// pair: true: also revoke its live/test twin.
    public func deleteApiKeysId(id: String, cascade: String? = nil, pair: String? = nil, idempotencyKey: String? = nil) async throws -> DeleteApiKeysIdResponse {
        return try await send("DELETE", "/v1/api-keys/\(Self.segment(id))", query: [("cascade", Self.queryString(cascade)), ("pair", Self.queryString(pair))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a marketing asset. DELETE /v1/assets/{id}
    ///
    /// Removes a marketing asset.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func deleteAssetsId(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/assets/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete an auth connection. DELETE /v1/auth/connections/{id}
    ///
    /// Removes the connection; its webhook URL and signed endpoints stop accepting calls. Referrals it filed stay.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func deleteAuthConnectionsId(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/auth/connections/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a billing account. DELETE /v1/billing/accounts/{accountRef}
    ///
    /// The organization was deleted: it has no owner from now on, and its provider customers stop resolving to the old owner, so later payments under it earn nothing. Commissions already earned stay, and refunds still reverse them. Setting an owner again restores it for later payments (payments made while it was deleted are not replayed). Returns the same shape as `PUT …/owner` with `deleted: true` and `ownerCustomerRef: null`; deleting an account with nothing recorded (or already deleted) answers `changed: false`. Publishes `billing_account.owner_changed`. Needs `billing:write`. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func deleteBillingAccountsAccountRef(accountRef: String, idempotencyKey: String? = nil) async throws -> PutBillingAccountsAccountRefOwnerResponse {
        return try await send("DELETE", "/v1/billing/accounts/\(Self.segment(accountRef))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a billing connection. DELETE /v1/billing/connections/{id}
    ///
    /// Deletes the connection: its secrets and credentials are wiped and its webhook URL stops accepting events. Recorded billing events stay. Webhooks registered with `autoRegister` are removed from the provider, best effort, only where the connection kept credentials (BigCommerce): `providerWebhookRemoved` says whether they were. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func deleteBillingConnectionsId(id: String, idempotencyKey: String? = nil) async throws -> DeleteBillingConnectionsIdResponse {
        return try await send("DELETE", "/v1/billing/connections/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Remove an internal customer. DELETE /v1/billing/internal-customers/{customerRef}
    ///
    /// Their payments earn again from now on (events already ignored stay ignored). Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func deleteBillingInternalCustomersCustomerRef(customerRef: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/billing/internal-customers/\(Self.segment(customerRef))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Remove the portal domain. DELETE /v1/branding/domain
    ///
    /// Stops serving the partner portal on the custom domain.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func deleteBrandingDomain(idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/branding/domain", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Remove the link domain. DELETE /v1/branding/link-domain
    ///
    /// Stops using the custom link domain; links go back to the default host.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func deleteBrandingLinkDomain(idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/branding/link-domain", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Close a CLI listener. DELETE /v1/cli/listeners/{id}
    ///
    /// Closes the listener; queued events are dropped.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func deleteCliListenersId(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/cli/listeners/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Reset an email template. DELETE /v1/email/templates/{event}/{locale}
    ///
    /// Removes the override; the default template is used again.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func deleteEmailTemplatesEventLocale(event: String, locale: String, idempotencyKey: String? = nil) async throws -> DeleteEmailTemplatesEventLocaleResponse {
        return try await send("DELETE", "/v1/email/templates/\(Self.segment(event))/\(Self.segment(locale))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Disconnect an integration. DELETE /v1/integrations/{kind}
    ///
    /// Removes the HubSpot or Segment connection and its stored credential.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func deleteIntegrationsKind(kind: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/integrations/\(Self.segment(kind))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Remove a team member. DELETE /v1/org/members/{userId}
    ///
    /// Removes a member. Members can remove themselves; otherwise owner or admin. The last owner stays (409). Audited. Live mode only.
    ///
    /// **Auth:** an API key with `team:write`, or a session of any role.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func deleteOrgMembersUserId(userId: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/org/members/\(Self.segment(userId))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Remove your identity provider. DELETE /v1/org/sso/direct
    ///
    /// Removes the org's own IdP configuration; team SSO and "require SSO" turn off, so nobody is locked out. Owner only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func deleteOrgSsoDirect(idempotencyKey: String? = nil) async throws -> DeleteOrgSsoDirectResponse {
        return try await send("DELETE", "/v1/org/sso/direct", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Revoke a partner API token. DELETE /v1/partner/api-tokens/{id}
    ///
    /// Stops the token at once. Portal session only.
    ///
    /// **Auth:** a partner session.
    public func deletePartnerApiTokensId(id: String, idempotencyKey: String? = nil) async throws -> DeletePartnerApiTokensIdResponse {
        return try await send("DELETE", "/v1/partner/api-tokens/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a partner. DELETE /v1/partners/{id}
    ///
    /// Deletes a partner that never did anything, with its enrollments, links, coupons and payout profile. A partner with any clicks, referrals, commissions, payouts or other history is `409`: archive it instead (`status: "archived"`). Audited.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func deletePartnersId(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/partners/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Disconnect a payout provider. DELETE /v1/payout-connections/{provider}
    ///
    /// Removes the stored credentials for a provider. Payouts by that method are then simulated until you reconnect. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func deletePayoutConnectionsProvider(provider: String, idempotencyKey: String? = nil) async throws -> DeletePayoutConnectionsProviderResponse {
        return try await send("DELETE", "/v1/payout-connections/\(Self.segment(provider))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Discard the portal design draft. DELETE /v1/portal/theme/draft
    ///
    /// Drops the draft and its preview link. What partners see is unchanged. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func deletePortalThemeDraft(idempotencyKey: String? = nil) async throws -> GetPortalThemeResponse {
        return try await send("DELETE", "/v1/portal/theme/draft", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Disconnect a DSAR tool. DELETE /v1/privacy/executors/{adapter}
    ///
    /// Removes the tool, its key and settings; its URL answers 404 from now on. The request log stays.
    ///
    /// **Auth:** an API key with `privacy:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:write`, `full`, `admin`.
    public func deletePrivacyExecutorsAdapter(adapter: String, idempotencyKey: String? = nil) async throws -> DeletePrivacyExecutorsAdapterResponse {
        return try await send("DELETE", "/v1/privacy/executors/\(Self.segment(adapter))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Revoke a partner link. DELETE /v1/product-links/{id}
    ///
    /// The link and every token issued from it stop at once. A root action (see create).
    ///
    /// **Auth:** an API key with `team:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func deleteProductLinksId(id: String, idempotencyKey: String? = nil) async throws -> DeleteProductLinksIdResponse {
        return try await send("DELETE", "/v1/product-links/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a product margin. DELETE /v1/profitability/products/{productRef}
    ///
    /// Removes a product from the margin catalog; its payments fall back to the program or org margin. Audited.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func deleteProfitabilityProductsProductRef(productRef: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("DELETE", "/v1/profitability/products/\(Self.segment(productRef))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a reward rule. DELETE /v1/rewards/rules/{key}
    ///
    /// Deletes the rule. Rewards already granted through it stay.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func deleteRewardsRulesKey(key: String, idempotencyKey: String? = nil) async throws -> DeleteRewardsRulesKeyResponse {
        return try await send("DELETE", "/v1/rewards/rules/\(Self.segment(key))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Remove the Stripe balance credit key. DELETE /v1/stripe-credits/connection
    ///
    /// Deletes the rail's own key. A Stripe payout connection, if any, is then used instead; with neither, queued credits fail until a key is connected. Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func deleteStripeCreditsConnection(idempotencyKey: String? = nil) async throws -> GetStripeCreditsConnectionResponse {
        return try await send("DELETE", "/v1/stripe-credits/connection", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Disconnect a support tool. DELETE /v1/support/apps/{adapter}
    ///
    /// Removes the tool and its secret; its card URL answers 404 from now on.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func deleteSupportAppsAdapter(adapter: String, idempotencyKey: String? = nil) async throws -> DeleteSupportAppsAdapterResponse {
        return try await send("DELETE", "/v1/support/apps/\(Self.segment(adapter))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Delete a webhook endpoint. DELETE /v1/webhook-endpoints/{id}
    ///
    /// Removes the endpoint and its delivery history. Audited.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func deleteWebhookEndpointsId(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/webhook-endpoints/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Unsubscribe a Zapier hook. DELETE /v1/zapier/hooks/{id}
    ///
    /// REST hook unsubscribe, called by Zapier when a Zap turns off.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func deleteZapierHooksId(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("DELETE", "/v1/zapier/hooks/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get platform metrics. GET /v1/admin/metrics
    ///
    /// Platform admins only. Live orgs (and suspended ones), partner accounts (and banned ones), programs, commission earned, payouts sent and open fraud cases across the platform.
    ///
    /// **Auth:** a platform admin session.
    public func getAdminMetrics(idempotencyKey: String? = nil) async throws -> GetAdminMetricsResponse {
        return try await send("GET", "/v1/admin/metrics", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List organizations. GET /v1/admin/orgs
    ///
    /// Platform admins only. Organizations, searchable by name with `q`.
    ///
    /// **Auth:** a platform admin session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAdminOrgs(q: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAdminOrgsResponseDataItem> {
        return try await send("GET", "/v1/admin/orgs", query: [("q", Self.queryString(q)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAdminOrgs`, following the pages.
    public func getAdminOrgsEach(q: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAdminOrgsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAdminOrgs(q: q, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List partner accounts. GET /v1/admin/partner-accounts
    ///
    /// Platform admins only. Partner accounts with KYC and sanctions status, filtered by `flagged` (banned) and text `q`.
    ///
    /// **Auth:** a platform admin session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAdminPartnerAccounts(flagged: Bool? = nil, q: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAdminPartnerAccountsResponseDataItem> {
        return try await send("GET", "/v1/admin/partner-accounts", query: [("flagged", Self.queryString(flagged)), ("q", Self.queryString(q)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAdminPartnerAccounts`, following the pages.
    public func getAdminPartnerAccountsEach(flagged: Bool? = nil, q: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAdminPartnerAccountsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAdminPartnerAccounts(flagged: flagged, q: q, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List partnered AI agents. GET /v1/agents
    ///
    /// The AI agents partnered with this org, with their wallet, metadata and how many recommendations each has attributed, most active first.
    ///
    /// **Auth:** an API key with `growth:read`, or a session with role `owner`, `admin`, `analyst`.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAgents(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAgentsResponseDataItem> {
        return try await send("GET", "/v1/agents", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAgents`, following the pages.
    public func getAgentsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAgentsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAgents(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List agent recommendations. GET /v1/agents/recommendations
    ///
    /// Signed recommendations AI agents have attributed in this org, newest first.
    ///
    /// **Auth:** an API key with `growth:read`, or a session with role `owner`, `admin`, `analyst`.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAgentsRecommendations(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAgentsRecommendationsResponseDataItem> {
        return try await send("GET", "/v1/agents/recommendations", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAgentsRecommendations`, following the pages.
    public func getAgentsRecommendationsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAgentsRecommendationsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAgentsRecommendations(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get revenue by channel. GET /v1/analytics/by-channel
    ///
    /// Referrals and referred revenue by how they were matched (`coupon`, `deterministic` click, `email_hash`, `probabilistic`, `manual`…).
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAnalyticsByChannel(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAnalyticsByChannelResponseDataItem> {
        return try await send("GET", "/v1/analytics/by-channel", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAnalyticsByChannel`, following the pages.
    public func getAnalyticsByChannelEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAnalyticsByChannelResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAnalyticsByChannel(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get revenue by country. GET /v1/analytics/by-geo
    ///
    /// Referrals and referred revenue by the country of the winning click, highest revenue first.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAnalyticsByGeo(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAnalyticsByGeoResponseDataItem> {
        return try await send("GET", "/v1/analytics/by-geo", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAnalyticsByGeo`, following the pages.
    public func getAnalyticsByGeoEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAnalyticsByGeoResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAnalyticsByGeo(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get cohort LTV. GET /v1/analytics/cohort-ltv
    ///
    /// Referred customers grouped by sign-up month over the last `months` (default 6), with net revenue (payments minus refunds) and revenue per customer.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAnalyticsCohortLtv(months: Int? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAnalyticsCohortLtvResponseDataItem> {
        return try await send("GET", "/v1/analytics/cohort-ltv", query: [("months", Self.queryString(months)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAnalyticsCohortLtv`, following the pages.
    public func getAnalyticsCohortLtvEach(months: Int? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAnalyticsCohortLtvResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAnalyticsCohortLtv(months: months, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get coupon performance. GET /v1/analytics/coupon-performance
    ///
    /// Referrals and revenue per coupon code, highest revenue first.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAnalyticsCouponPerformance(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAnalyticsCouponPerformanceResponseDataItem> {
        return try await send("GET", "/v1/analytics/coupon-performance", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAnalyticsCouponPerformance`, following the pages.
    public func getAnalyticsCouponPerformanceEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAnalyticsCouponPerformanceResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAnalyticsCouponPerformance(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the funnel overview. GET /v1/analytics/overview
    ///
    /// Over the last `days` (default 30), optionally for one program: clicks (and how many were filtered), visitors, sign-ups, payments, referred revenue, commission earned and reversed, active partners and the click-to-sign-up and sign-up-to-paid rates.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getAnalyticsOverview(programId: String? = nil, days: Int? = nil, idempotencyKey: String? = nil) async throws -> GetAnalyticsOverviewResponse {
        return try await send("GET", "/v1/analytics/overview", query: [("programId", Self.queryString(programId)), ("days", Self.queryString(days))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a daily time series. GET /v1/analytics/timeseries
    ///
    /// One `metric` (`clicks`, `signups` or `revenue` in minor units) per day over the last `days`, optionally for one program.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAnalyticsTimeseries(metric: String, days: Int? = nil, programId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAnalyticsTimeseriesResponseDataItem> {
        return try await send("GET", "/v1/analytics/timeseries", query: [("metric", Self.queryString(metric)), ("days", Self.queryString(days)), ("programId", Self.queryString(programId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAnalyticsTimeseries`, following the pages.
    public func getAnalyticsTimeseriesEach(metric: String, days: Int? = nil, programId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAnalyticsTimeseriesResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAnalyticsTimeseries(metric: metric, days: days, programId: programId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List API keys. GET /v1/api-keys
    ///
    /// Every key of the org, live and test (a test-mode caller sees test keys only), oldest first, with scopes, pinned version, owner, expiry and last use. Never returns the secret. Filter by `mode` (`live`, `test`, or `both`, the default) or `owner`.
    ///
    /// **Auth:** an API key with `team:read`, or a session of any role.
    ///
    /// **Scopes:** `team:read`, `team:write`, `read`, `full`, `admin`.
    ///
    /// mode: Only live or only test keys; `both` (the default) lists both.
    /// owner: Only keys with this owner.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getApiKeys(mode: String? = nil, owner: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<ApiKey> {
        return try await send("GET", "/v1/api-keys", query: [("mode", Self.queryString(mode)), ("owner", Self.queryString(owner)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getApiKeys`, following the pages.
    public func getApiKeysEach(mode: String? = nil, owner: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<ApiKey, Swift.Error> {
        paginate { cursor in try await self.getApiKeys(mode: mode, owner: owner, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get an API key. GET /v1/api-keys/{id}
    ///
    /// One key of the org, without its secret.
    ///
    /// **Auth:** an API key with `team:read`, or a session of any role.
    ///
    /// **Scopes:** `team:read`, `team:write`, `read`, `full`, `admin`.
    public func getApiKeysId(id: String, idempotencyKey: String? = nil) async throws -> ApiKey {
        return try await send("GET", "/v1/api-keys/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List marketing assets. GET /v1/assets
    ///
    /// Marketing assets, filtered by `programId`.
    ///
    /// **Auth:** an API key with `partners:read`, or a session of any role.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAssets(programId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAssetsResponseDataItem> {
        return try await send("GET", "/v1/assets", query: [("programId", Self.queryString(programId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAssets`, following the pages.
    public func getAssetsEach(programId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAssetsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAssets(programId: programId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get program suggestions. GET /v1/assistant/suggestions
    ///
    /// Draft-only suggestions for running the program, each with a suggested action for a person to take: partners who never drove a click, links with clicks but no referrals, programs without a commission rule, the review queue, and credit ROI findings. It never changes anything.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAssistantSuggestions(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetAssistantSuggestionsResponseDataItem> {
        return try await send("GET", "/v1/assistant/suggestions", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAssistantSuggestions`, following the pages.
    public func getAssistantSuggestionsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetAssistantSuggestionsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getAssistantSuggestions(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List audit log entries. GET /v1/audit-logs
    ///
    /// Every change recorded in the org, newest first: who did it (`actor`, `actorType`), what (`action`; a trailing `*` matches a prefix such as `payout.*`) and to what (`subjectType`, `subjectId`). Filter by any of those and by `created[gte]`/`created[lte]`.
    ///
    /// **Auth:** an API key with `audit:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `audit:read`, `audit:write`, `read`, `full`, `admin`.
    ///
    /// actor: Actor id: a user, API key or connection id.
    /// action: Exact action, or a prefix ending in * (e.g. payout.*).
    /// starting_after: An entry id: return the entries after it.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAuditLogs(actor: String? = nil, actorType: String? = nil, action: String? = nil, subjectType: String? = nil, subjectId: String? = nil, createdGte: String? = nil, createdLte: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, idempotencyKey: String? = nil) async throws -> Page<AuditLogEntry> {
        return try await send("GET", "/v1/audit-logs", query: [("actor", Self.queryString(actor)), ("actorType", Self.queryString(actorType)), ("action", Self.queryString(action)), ("subjectType", Self.queryString(subjectType)), ("subjectId", Self.queryString(subjectId)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAuditLogs`, following the pages.
    public func getAuditLogsEach(actor: String? = nil, actorType: String? = nil, action: String? = nil, subjectType: String? = nil, subjectId: String? = nil, createdGte: String? = nil, createdLte: String? = nil, limit: Int? = nil, endingBefore: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<AuditLogEntry, Swift.Error> {
        paginate { cursor in try await self.getAuditLogs(actor: actor, actorType: actorType, action: action, subjectType: subjectType, subjectId: subjectId, createdGte: createdGte, createdLte: createdLte, limit: limit, startingAfter: cursor, endingBefore: endingBefore, idempotencyKey: idempotencyKey) }
    }

    /// List auth connections. GET /v1/auth/connections
    ///
    /// Auth-platform connections with provider, program, status, signature version, rotation state and `lastSignupAt` (when it last filed a new sign-up; null when never). Secrets are never returned.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session of any role.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `connections:read`, `connections:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getAuthConnections(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<AuthConnection> {
        return try await send("GET", "/v1/auth/connections", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getAuthConnections`, following the pages.
    public func getAuthConnectionsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<AuthConnection, Swift.Error> {
        paginate { cursor in try await self.getAuthConnections(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get an auth connection. GET /v1/auth/connections/{id}
    ///
    /// One auth-platform connection, as in the list: provider, program, status, `allowedOrigins`, `tokenVerification` (without its secret), signature version and rotation state. Secrets are never returned. Unknown or deleted connections are 404.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session of any role.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `connections:read`, `connections:write`, `read`, `full`, `admin`.
    public func getAuthConnectionsId(id: String, idempotencyKey: String? = nil) async throws -> AuthConnection {
        return try await send("GET", "/v1/auth/connections/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Export a user (signed protocol). GET /v1/auth/connections/{id}/export
    ///
    /// An access request the platform forwards: everything filed under the customer and their partner record. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func getAuthConnectionsIdExport(id: String, customerRef: String, idempotencyKey: String? = nil) async throws -> GetAuthConnectionsIdExportResponse {
        return try await send("GET", "/v1/auth/connections/\(Self.segment(id))/export", query: [("customerRef", Self.queryString(customerRef))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a user's referral link (signed protocol). GET /v1/auth/connections/{id}/users/{customerRef}/referral
    ///
    /// The user's partner identity in the connection's program, so the platform can keep the link on its own user object: `{ partnerId, code, linkUrl, enrolledAt }`, or `404 not_enrolled`. Sign the query string (empty) as the payload, or use a v2 signature. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** none.
    public func getAuthConnectionsIdUsersCustomerRefReferral(id: String, customerRef: String, idempotencyKey: String? = nil) async throws -> GetAuthConnectionsIdUsersCustomerRefReferralResponse {
        return try await send("GET", "/v1/auth/connections/\(Self.segment(id))/users/\(Self.segment(customerRef))/referral", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List identity connectors. GET /v1/auth/connections/providers
    ///
    /// Every auth provider you can connect (Atlas, Clerk, Auth0, Supabase, Firebase, Cognito, Stytch, Kinde, WorkOS, generic, your own auth), with how it connects, who issues the secret, the setup steps, a copyable template where the vendor has no native webhook, and where the referral metadata lands.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session of any role.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `connections:read`, `connections:write`, `read`, `full`, `admin`.
    public func getAuthConnectionsProviders(idempotencyKey: String? = nil) async throws -> GetAuthConnectionsProvidersResponse {
        return try await send("GET", "/v1/auth/connections/providers", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List sign-in providers. GET /v1/auth/providers
    ///
    /// The identity providers configured on this deployment, for rendering sign-in buttons.
    ///
    /// **Auth:** none.
    public func getAuthProviders(idempotencyKey: String? = nil) async throws -> GetAuthProvidersResponse {
        return try await send("GET", "/v1/auth/providers", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a billing account's owner. GET /v1/billing/accounts/{accountRef}
    ///
    /// What is recorded for a billing account: `{ accountRef, ownerCustomerRef, since, renamedTo, deleted }`. A renamed id answers with `renamedTo` (and `ownerCustomerRef: null`); it follows that account. `404` when nothing is recorded.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    public func getBillingAccountsAccountRef(accountRef: String, idempotencyKey: String? = nil) async throws -> GetBillingAccountsAccountRefResponse {
        return try await send("GET", "/v1/billing/accounts/\(Self.segment(accountRef))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List billing connections. GET /v1/billing/connections
    ///
    /// Billing connections (deleted ones excluded), with status (`active`, `paused`, or `awaiting_secret` until a provider-issued secret is set), `programIds`, whether credentials are needed and set, the value mapping and secret-rotation state. A program-scoped API key sees only connections whose `programIds` are all within its own.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getBillingConnections(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<BillingConnection> {
        return try await send("GET", "/v1/billing/connections", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getBillingConnections`, following the pages.
    public func getBillingConnectionsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<BillingConnection, Swift.Error> {
        paginate { cursor in try await self.getBillingConnections(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a billing connection. GET /v1/billing/connections/{id}
    ///
    /// One billing connection, without its secrets.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    public func getBillingConnectionsId(id: String, idempotencyKey: String? = nil) async throws -> BillingConnection {
        return try await send("GET", "/v1/billing/connections/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List billing events. GET /v1/billing/events
    ///
    /// Payments, refunds and other billing events received from every connection, newest first. Filter with `customerRef`, or `status=ignored_by_filter` for the events a product filter or the internal-customer list set aside (recorded, never processed), or `status=parked` for the refunds and disputes waiting for their payment: applied when it arrives, or dropped after 7 days with a `billing_event.expired` webhook event. `ignoredReason: "no_referral_in_scope"` (with `status: "processed"`) marks a payment on a connection limited to some programs from a customer referred only in other programs: it earned nothing.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getBillingEvents(customerRef: String? = nil, status: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<BillingEvent> {
        return try await send("GET", "/v1/billing/events", query: [("customerRef", Self.queryString(customerRef)), ("status", Self.queryString(status)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getBillingEvents`, following the pages.
    public func getBillingEventsEach(customerRef: String? = nil, status: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<BillingEvent, Swift.Error> {
        paginate { cursor in try await self.getBillingEvents(customerRef: customerRef, status: status, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List internal customers. GET /v1/billing/internal-customers
    ///
    /// The org's own customers (staff, test accounts, your own plans) whose payments never earn on any connection. Metadata `planSource: "internal"` on the provider's customer does the same without a list.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    public func getBillingInternalCustomers(idempotencyKey: String? = nil) async throws -> [InternalCustomer] {
        return try await send("GET", "/v1/billing/internal-customers", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the plan. GET /v1/billing/plan
    ///
    /// The org's Referalli plan and status, its limits and current usage (programs, partners), the plan catalog, whether there is a subscription to manage and whether this caller may activate a plan without checkout.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    public func getBillingPlan(idempotencyKey: String? = nil) async throws -> GetBillingPlanResponse {
        return try await send("GET", "/v1/billing/plan", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get branding. GET /v1/branding
    ///
    /// The org's logo, theme tokens, sender address, and its custom portal and link domains with their status (`none`, `pending` DNS, `provisioning` a certificate, `active`), and `warnings` for theme colour pairs below WCAG AA contrast.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getBranding(idempotencyKey: String? = nil) async throws -> GetBrandingResponse {
        return try await send("GET", "/v1/branding", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the support-chat identity. GET /v1/chatly/identity
    ///
    /// The signed-in merchant user or partner as a Chatly widget identity: `userToken`, an Atlas token minted for the Atlas session behind this one (audience `chatly:<channel>`, at most 120 s), which the page passes to the widget, and `externalId` (`merchant:<id>` or `partner:<id>`), which stays on the page to notice an account switch. `identity` is null when signed out, when the session has no Atlas session behind it, or when Atlas isn't configured. Never cached.
    ///
    /// **Auth:** none.
    public func getChatlyIdentity(idempotencyKey: String? = nil) async throws -> GetChatlyIdentityResponse {
        return try await send("GET", "/v1/chatly/identity", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a customer's consent. GET /v1/cleanroom/consent
    ///
    /// A customer's recorded consent: whether granted, its purposes, the attributes they declared and when it changed. `consent: null` when none is recorded.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    public func getCleanroomConsent(customerRef: String, idempotencyKey: String? = nil) async throws -> GetCleanroomConsentResponse {
        return try await send("GET", "/v1/cleanroom/consent", query: [("customerRef", Self.queryString(customerRef))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Query the clean room. GET /v1/cleanroom/query
    ///
    /// Aggregates over consenting customers only, grouped by a zero-party attribute they declared (`dimension`): customers, converted customers and referred revenue per value. Cohorts smaller than 5 are suppressed (k-anonymity); individual rows never leave.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    public func getCleanroomQuery(dimension: String, idempotencyKey: String? = nil) async throws -> GetCleanroomQueryResponse {
        return try await send("GET", "/v1/cleanroom/query", query: [("dimension", Self.queryString(dimension))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get consent coverage. GET /v1/clicks/consent-coverage
    ///
    /// The share of attributed sign-ups in the last `days` (default 30) whose referral carries consent evidence, on its click or on the `associate` call. Low coverage means sign-ups are attributed from tags without a consent setting (`none`) or from server-side calls that don't pass `consent`.
    ///
    /// **Auth:** an API key with `links:read`, or a session of any role.
    ///
    /// **Scopes:** `links:read`, `links:write`, `read`, `full`, `admin`.
    ///
    /// days: Look-back window in days.
    public func getClicksConsentCoverage(days: Int? = nil, idempotencyKey: String? = nil) async throws -> GetClicksConsentCoverageResponse {
        return try await send("GET", "/v1/clicks/consent-coverage", query: [("days", Self.queryString(days))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a click. GET /v1/clicks/{id}
    ///
    /// One click with its consent evidence: what the visitor's CMP said when the tracker stored the referral (`consent.provider`, `state`, `stamp`, `tcString`…). A redirect click (`/go`) is recorded before the landing page reads the CMP, so its evidence comes from the first consented visit beacon naming it. `consent` is null when none arrived.
    ///
    /// **Auth:** an API key with `links:read`, or a session of any role.
    ///
    /// **Scopes:** `links:read`, `links:write`, `read`, `full`, `admin`.
    public func getClicksId(id: String, idempotencyKey: String? = nil) async throws -> GetClicksIdResponse {
        return try await send("GET", "/v1/clicks/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a pending CLI sign-in. GET /v1/cli/device-codes/{userCode}
    ///
    /// For the approval page: the pending code, which CLI asked and when it expires. Needs a signed-in person (owner or admin). 404 when expired or used.
    ///
    /// **Auth:** an API key with `team:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:read`, `team:write`, `read`, `full`, `admin`.
    public func getCliDeviceCodesUserCode(userCode: String, idempotencyKey: String? = nil) async throws -> GetCliDeviceCodesUserCodeResponse {
        return try await send("GET", "/v1/cli/device-codes/\(Self.segment(userCode))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Receive listener events. GET /v1/cli/listeners/{id}/events
    ///
    /// Up to 50 queued events for the listener, oldest first, each with its body and signed headers. `wait` long-polls up to 25 seconds for the first event. Polling keeps the listener alive.
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    public func getCliListenersIdEvents(id: String, wait: Int? = nil, idempotencyKey: String? = nil) async throws -> GetCliListenersIdEventsResponse {
        return try await send("GET", "/v1/cli/listeners/\(Self.segment(id))/events", query: [("wait", Self.queryString(wait))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Tail the request log. GET /v1/cli/logs
    ///
    /// The CLI's `logs tail` command: the org's recent API requests (method, path without query string, status, latency, actor). The first call returns the latest 20 and a `cursor`; pass it as `after` (with `wait` to long-poll up to 25 seconds) for newer entries. Kept for a day.
    ///
    /// **Auth:** an API key with `audit:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `audit:read`, `audit:write`, `read`, `full`, `admin`.
    ///
    /// after: Return entries after this cursor.
    public func getCliLogs(after: Int? = nil, wait: Int? = nil, limit: Int? = nil, idempotencyKey: String? = nil) async throws -> GetCliLogsResponse {
        return try await send("GET", "/v1/cli/logs", query: [("after", Self.queryString(after)), ("wait", Self.queryString(wait)), ("limit", Self.queryString(limit))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List triggerable topics. GET /v1/cli/topics
    ///
    /// The event topics `POST /v1/cli/trigger` can send.
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    public func getCliTopics(idempotencyKey: String? = nil) async throws -> GetCliTopicsResponse {
        return try await send("GET", "/v1/cli/topics", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List commission rules. GET /v1/commission-rules
    ///
    /// Every rule version, by program and newest version first. Filter with `programId`.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getCommissionRules(programId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<CommissionRule> {
        return try await send("GET", "/v1/commission-rules", query: [("programId", Self.queryString(programId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getCommissionRules`, following the pages.
    public func getCommissionRulesEach(programId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<CommissionRule, Swift.Error> {
        paginate { cursor in try await self.getCommissionRules(programId: programId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List commission ledger events. GET /v1/commissions
    ///
    /// The append-only commission ledger, newest first: `earned` lines and the `approved`, `paid`, `reversed` and `adjusted` events recorded against them (`relatedCommissionId`). Filter by `partnerId`, `programId`, `type` or `referralId`.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getCommissions(partnerId: String? = nil, programId: String? = nil, type: String? = nil, referralId: String? = nil, customerRef: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<CommissionEvent> {
        return try await send("GET", "/v1/commissions", query: [("partnerId", Self.queryString(partnerId)), ("programId", Self.queryString(programId)), ("type", Self.queryString(type)), ("referralId", Self.queryString(referralId)), ("customerRef", Self.queryString(customerRef)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getCommissions`, following the pages.
    public func getCommissionsEach(partnerId: String? = nil, programId: String? = nil, type: String? = nil, referralId: String? = nil, customerRef: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<CommissionEvent, Swift.Error> {
        paginate { cursor in try await self.getCommissions(partnerId: partnerId, programId: programId, type: type, referralId: referralId, customerRef: customerRef, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a commission. GET /v1/commissions/{id}
    ///
    /// One ledger event. An `earned` line also carries its billing event, its net after reversals and adjustments, its state (`pending`, `approved` or `paid`) and every event recorded against it.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    public func getCommissionsId(id: String, idempotencyKey: String? = nil) async throws -> CommissionLine {
        return try await send("GET", "/v1/commissions/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List partner contracts. GET /v1/contracts
    ///
    /// The org's contracts and their status (`draft`, `sent`, `accepted`, `declined`, `void`).
    ///
    /// **Auth:** an API key with `partners:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getContracts(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetContractsResponseDataItem> {
        return try await send("GET", "/v1/contracts", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getContracts`, following the pages.
    public func getContractsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetContractsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getContracts(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List coupon codes. GET /v1/coupons
    ///
    /// Coupon codes, filtered by `programId` and/or `partnerId`.
    ///
    /// **Auth:** an API key with `links:read`, or a session of any role.
    ///
    /// **Scopes:** `links:read`, `links:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getCoupons(programId: String? = nil, partnerId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Coupon> {
        return try await send("GET", "/v1/coupons", query: [("programId", Self.queryString(programId)), ("partnerId", Self.queryString(partnerId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getCoupons`, following the pages.
    public func getCouponsEach(programId: String? = nil, partnerId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Coupon, Swift.Error> {
        paginate { cursor in try await self.getCoupons(programId: programId, partnerId: partnerId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Search creators. GET /v1/creators
    ///
    /// Published creator profiles, most engaged first, filtered by text (`q`), `category`, `channel`, minimum audience, minimum engagement and audience country. Each carries verified stats and whether this org already invited them. Emails are never returned.
    ///
    /// **Auth:** an API key with `growth:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getCreators(q: String? = nil, category: String? = nil, channel: String? = nil, minAudience: Int? = nil, minEngagementBps: Int? = nil, audienceCountry: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<CreatorProfile> {
        return try await send("GET", "/v1/creators", query: [("q", Self.queryString(q)), ("category", Self.queryString(category)), ("channel", Self.queryString(channel)), ("minAudience", Self.queryString(minAudience)), ("minEngagementBps", Self.queryString(minEngagementBps)), ("audienceCountry", Self.queryString(audienceCountry)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getCreators`, following the pages.
    public func getCreatorsEach(q: String? = nil, category: String? = nil, channel: String? = nil, minAudience: Int? = nil, minEngagementBps: Int? = nil, audienceCountry: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<CreatorProfile, Swift.Error> {
        paginate { cursor in try await self.getCreators(q: q, category: category, channel: channel, minAudience: minAudience, minEngagementBps: minEngagementBps, audienceCountry: audienceCountry, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a creator. GET /v1/creators/{accountId}
    ///
    /// One published creator profile with verified stats. 404 when not listed.
    ///
    /// **Auth:** an API key with `growth:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    public func getCreatorsAccountId(accountId: String, idempotencyKey: String? = nil) async throws -> CreatorProfile {
        return try await send("GET", "/v1/creators/\(Self.segment(accountId))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List registered deals. GET /v1/deals
    ///
    /// Deals partners registered, newest first. Filter with `status` (`submitted`, `approved`, `rejected`, `won`, `lost`).
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getDeals(status: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetDealsResponseDataItem> {
        return try await send("GET", "/v1/deals", query: [("status", Self.queryString(status)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getDeals`, following the pages.
    public func getDealsEach(status: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetDealsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getDeals(status: status, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List partner disputes. GET /v1/disputes
    ///
    /// Disputes partners filed with this org, newest first.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getDisputes(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetDisputesResponseDataItem> {
        return try await send("GET", "/v1/disputes", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getDisputes`, following the pages.
    public func getDisputesEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetDisputesResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getDisputes(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get email settings. GET /v1/email/settings
    ///
    /// The org's own email provider (`resend`, `brevo` or `postmark`), sender identity, branding and sending-domain status. The API key is never returned.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getEmailSettings(idempotencyKey: String? = nil) async throws -> EmailSettings {
        return try await send("GET", "/v1/email/settings", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List email templates. GET /v1/email/templates
    ///
    /// Every email event with its placeholders and, per locale, the default template and the org's override if any.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getEmailTemplates(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<EmailTemplateEvent> {
        return try await send("GET", "/v1/email/templates", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getEmailTemplates`, following the pages.
    public func getEmailTemplatesEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<EmailTemplateEvent, Swift.Error> {
        paginate { cursor in try await self.getEmailTemplates(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Read embedded partner stats. GET /v1/embed/summary
    ///
    /// Called by the embed component with `Authorization: Bearer <embed token>`: the partner's name, eligible clicks, active referrals, balances and link codes. 401 for a missing, invalid or expired token.
    ///
    /// **Auth:** none.
    public func getEmbedSummary(idempotencyKey: String? = nil) async throws -> GetEmbedSummaryResponse {
        return try await send("GET", "/v1/embed/summary", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List past events. GET /v1/events
    ///
    /// The org's events, oldest first, in the shape webhook deliveries carry: filter with `since` and `topics`, page with `after` (the previous page's `nextCursor`). Every event is listed whether or not an endpoint subscribed to it. `referalli events tail --since 1h` uses it to backfill before tailing live.
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    ///
    /// since: Only events created at or after this time.
    /// topics: Comma-separated topics (default: every topic).
    /// after: The `nextCursor` of the previous page: events after this one.
    public func getEvents(since: String? = nil, topics: String? = nil, after: String? = nil, limit: Int? = nil, idempotencyKey: String? = nil) async throws -> GetEventsResponse {
        return try await send("GET", "/v1/events", query: [("since", Self.queryString(since)), ("topics", Self.queryString(topics)), ("after", Self.queryString(after)), ("limit", Self.queryString(limit))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Export payouts for accounting. GET /v1/export/accounting
    ///
    /// A year's sent payouts as a CSV that QuickBooks (`format=quickbooks`, the default) or Xero imports.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getExportAccounting(format: String? = nil, year: Int, idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/export/accounting", query: [("format", Self.queryString(format)), ("year", Self.queryString(year))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Export all org data. GET /v1/export/full
    ///
    /// Every tenant table of the org as NDJSON (one JSON object per line, tagged with its table), streamed so any size works. Owner or admin.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getExportFull(idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/export/full", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List fraud cases. GET /v1/fraud/cases
    ///
    /// The fraud case queue (self-referrals, quality, rings, value patterns, identity risk), newest first, with the evidence. Filter with `status`.
    ///
    /// **Auth:** an API key with `fraud:read`, or a session of any role.
    ///
    /// **Scopes:** `fraud:read`, `fraud:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getFraudCases(status: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<FraudCase> {
        return try await send("GET", "/v1/fraud/cases", query: [("status", Self.queryString(status)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getFraudCases`, following the pages.
    public func getFraudCasesEach(status: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<FraudCase, Swift.Error> {
        paginate { cursor in try await self.getFraudCases(status: status, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List FX rates. GET /v1/fx-rates
    ///
    /// The org's rates first, then the platform fallback, newest per pair first. A payout uses the org's latest rate at or before the run, else the platform's. Filter by `base`, `quote`, `effectiveAt[gte]` and `effectiveAt[lte]`. Live mode leaves out the `fixture` sample rows; test mode lists them.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// effectiveAt[gte]: Only rates effective at or after this time.
    /// effectiveAt[lte]: Only rates effective at or before this time.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getFxRates(base: String? = nil, quote: String? = nil, effectiveAtGte: String? = nil, effectiveAtLte: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<FxRate> {
        return try await send("GET", "/v1/fx-rates", query: [("base", Self.queryString(base)), ("quote", Self.queryString(quote)), ("effectiveAt[gte]", Self.queryString(effectiveAtGte)), ("effectiveAt[lte]", Self.queryString(effectiveAtLte)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getFxRates`, following the pages.
    public func getFxRatesEach(base: String? = nil, quote: String? = nil, effectiveAtGte: String? = nil, effectiveAtLte: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<FxRate, Swift.Error> {
        paginate { cursor in try await self.getFxRates(base: base, quote: quote, effectiveAtGte: effectiveAtGte, effectiveAtLte: effectiveAtLte, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Query the GraphQL read layer. GET /v1/graphql
    ///
    /// A read-only GraphQL endpoint over the same org-scoped data as REST (programs, partners, referrals, analytics), with the same authentication. Mutations stay in REST.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getGraphql(idempotencyKey: String? = nil) async throws -> GetGraphqlResponse {
        return try await send("GET", "/v1/graphql", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Check API health. GET /v1/health
    ///
    /// `200 { "ok": true }` when this instance can serve requests: both database pools answer and it is not shutting down. Otherwise `503` with `reason` (`shutting_down`, with `Retry-After`, or `database_unreachable`).
    ///
    /// **Auth:** none.
    public func getHealth(idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("GET", "/v1/health", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Describe the current host. GET /v1/hosts/current
    ///
    /// What the request's host is: a merchant's verified portal domain (with the org's name, branding and public programs), a merchant link domain, or Referalli's own app. Used by the web app before anyone signs in.
    ///
    /// **Auth:** none.
    public func getHostsCurrent(themePreview: String? = nil, idempotencyKey: String? = nil) async throws -> GetHostsCurrentResponse {
        return try await send("GET", "/v1/hosts/current", query: [("themePreview", Self.queryString(themePreview))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Identify the signed-in partner to the chat. GET /v1/hosts/current/chat-identity
    ///
    /// On a merchant's portal domain, for the signed-in partner of that merchant: the head tags that tell the merchant's chat who they are (partner id, email, name) and, when the merchant saved its chat vendor's identity-verification secret, the vendor's proof (Intercom `user_hash`, a Zendesk messaging JWT, a HubSpot visitor token…). The secret itself never leaves the API. Elsewhere, or for someone who isn't this merchant's partner, `tags` is empty. Partner session; `private, no-store`.
    ///
    /// **Auth:** an API key with `partners:read`, or a session of any role.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    public func getHostsCurrentChatIdentity(idempotencyKey: String? = nil) async throws -> GetHostsCurrentChatIdentityResponse {
        return try await send("GET", "/v1/hosts/current/chat-identity", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the current host's theme stylesheet. GET /v1/hosts/current/theme.css
    ///
    /// On a merchant's portal domain, the org's theme tokens as a `:root` stylesheet; empty elsewhere.
    ///
    /// **Auth:** none.
    public func getHostsCurrentThemeCss(themePreview: String? = nil, idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/hosts/current/theme.css", query: [("themePreview", Self.queryString(themePreview))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get incrementality results. GET /v1/incrementality
    ///
    /// For a program's active referrals: treatment and control counts, conversion rates and lift, overall and per partner.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getIncrementality(programId: String, idempotencyKey: String? = nil) async throws -> GetIncrementalityResponse {
        return try await send("GET", "/v1/incrementality", query: [("programId", Self.queryString(programId))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Check integration health. GET /v1/integration-health
    ///
    /// Every connection the org depends on, each with `ok`, a `detail`, and when it fails a `fix` and `docs` link: billing connections (and when each last received an event), sign-up connections, the tracking snippet (a visit in the last 30 days), payout connections, outbound webhook endpoints, and every adapter of a connected port. `hop` names the leg that failed on a path between systems. `ok` at the top is true only when every check is.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session of any role.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `read`, `full`, `admin`.
    public func getIntegrationHealth(idempotencyKey: String? = nil) async throws -> GetIntegrationHealthResponse {
        return try await send("GET", "/v1/integration-health", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List integrations. GET /v1/integrations
    ///
    /// The HubSpot and Segment connections with status, settings and the last test result. Credentials are never returned.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `read`, `full`, `admin`.
    public func getIntegrations(idempotencyKey: String? = nil) async throws -> GetIntegrationsResponse {
        return try await send("GET", "/v1/integrations", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List integration deliveries. GET /v1/integrations/deliveries
    ///
    /// What was sent to Zapier, HubSpot and Segment, newest first, filtered by `kind` and `status`.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getIntegrationsDeliveries(kind: String? = nil, status: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<IntegrationDelivery> {
        return try await send("GET", "/v1/integrations/deliveries", query: [("kind", Self.queryString(kind)), ("status", Self.queryString(status)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getIntegrationsDeliveries`, following the pages.
    public func getIntegrationsDeliveriesEach(kind: String? = nil, status: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<IntegrationDelivery, Swift.Error> {
        paginate { cursor in try await self.getIntegrationsDeliveries(kind: kind, status: status, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List creator invitations. GET /v1/invitations
    ///
    /// The org's creator invitations and their status (`pending`, `accepted`, `declined`, `withdrawn`).
    ///
    /// **Auth:** an API key with `partners:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getInvitations(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetInvitationsResponseDataItem> {
        return try await send("GET", "/v1/invitations", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getInvitations`, following the pages.
    public func getInvitationsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetInvitationsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getInvitations(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List links. GET /v1/links
    ///
    /// Tracked links with their short URL and click count, filtered by `programId` and/or `partnerId`.
    ///
    /// **Auth:** an API key with `links:read`, or a session of any role.
    ///
    /// **Scopes:** `links:read`, `links:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getLinks(programId: String? = nil, partnerId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Link> {
        return try await send("GET", "/v1/links", query: [("programId", Self.queryString(programId)), ("partnerId", Self.queryString(partnerId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getLinks`, following the pages.
    public func getLinksEach(programId: String? = nil, partnerId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Link, Swift.Error> {
        paginate { cursor in try await self.getLinks(programId: programId, partnerId: partnerId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a link's QR code. GET /v1/links/{id}/qr
    ///
    /// An SVG QR code for the link's short URL.
    ///
    /// **Auth:** an API key with `links:read`, or a session of any role.
    ///
    /// **Scopes:** `links:read`, `links:write`, `read`, `full`, `admin`.
    public func getLinksIdQr(id: String, idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/links/\(Self.segment(id))/qr", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List the org's marketplace listings. GET /v1/marketplace/listing
    ///
    /// The org's listings with their platform-computed stats: eligible clicks, active referrals, earnings per click, conversion rate, payout reliability and approval latency.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getMarketplaceListing(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetMarketplaceListingResponseDataItem> {
        return try await send("GET", "/v1/marketplace/listing", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getMarketplaceListing`, following the pages.
    public func getMarketplaceListingEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetMarketplaceListingResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getMarketplaceListing(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the current caller. GET /v1/me
    ///
    /// Who is calling. With a user session: the user and their org memberships (no `x-org-id` needed). With an API key: `{ user: null, memberships: [], apiKey, org: { id, name } }`, where `apiKey` holds the key (name, prefix, scopes, pinned `apiVersion`, `livemode`, owner, expiry, `programIds`). The mode is `apiKey.livemode`; there is no top-level `livemode`. Any key may call it, whatever its scopes.
    ///
    /// **Auth:** an API key with `null`, or a session of any role.
    ///
    /// **Scopes:** .
    public func getMe(idempotencyKey: String? = nil) async throws -> GetMeResponse {
        return try await send("GET", "/v1/me", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List negotiation rounds. GET /v1/negotiations
    ///
    /// Agent negotiation rounds and their decisions, newest first, optionally for one program.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getNegotiations(programId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetNegotiationsResponseDataItem> {
        return try await send("GET", "/v1/negotiations", query: [("programId", Self.queryString(programId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getNegotiations`, following the pages.
    public func getNegotiationsEach(programId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetNegotiationsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getNegotiations(programId: programId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a customer's network journey. GET /v1/network/journey
    ///
    /// For a hashed customer email, the partner accounts that touched them at any opted-in merchant (never which merchant) and each one's credit under `model`. 403 unless the org has joined the network.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    public func getNetworkJourney(emailHash: String, model: String? = nil, idempotencyKey: String? = nil) async throws -> GetNetworkJourneyResponse {
        return try await send("GET", "/v1/network/journey", query: [("emailHash", Self.queryString(emailHash)), ("model", Self.queryString(model))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get network membership. GET /v1/network/settings
    ///
    /// Whether the org contributes to (and can read) the attribution network.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    public func getNetworkSettings(idempotencyKey: String? = nil) async throws -> GetNetworkSettingsResponse {
        return try await send("GET", "/v1/network/settings", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List notifications. GET /v1/notifications
    ///
    /// The org's in-app notifications (failing webhooks, anomalies, answered invitations…), newest first. `unread=true` for unread only.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    ///
    /// unread: true: unread notifications only.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getNotifications(unread: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Notification> {
        return try await send("GET", "/v1/notifications", query: [("unread", Self.queryString(unread)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getNotifications`, following the pages.
    public func getNotificationsEach(unread: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Notification, Swift.Error> {
        paginate { cursor in try await self.getNotifications(unread: unread, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List on-chain connections. GET /v1/onchain/connections
    ///
    /// The org's on-chain conversion connections.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getOnchainConnections(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetOnchainConnectionsResponseDataItem> {
        return try await send("GET", "/v1/onchain/connections", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getOnchainConnections`, following the pages.
    public func getOnchainConnectionsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetOnchainConnectionsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getOnchainConnections(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the OpenAPI document. GET /v1/openapi.json
    ///
    /// This reference as an OpenAPI 3.1 document (JSON).
    ///
    /// **Auth:** none.
    public func getOpenapiJson(idempotencyKey: String? = nil) async throws -> GetOpenapiJsonResponse {
        return try await send("GET", "/v1/openapi.json", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the OpenAPI document as YAML. GET /v1/openapi.yaml
    ///
    /// The same OpenAPI 3.1 document as `GET /v1/openapi.json`, serialized as YAML.
    ///
    /// **Auth:** none.
    public func getOpenapiYaml(idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/openapi.yaml", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the organization. GET /v1/org
    ///
    /// The current org: `id`, name, plan, settings, public `trackingToken`, payout KYC requirement and mode (`livemode`; test orgs also carry `liveOrgId`).
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrg(idempotencyKey: String? = nil) async throws -> Org {
        return try await send("GET", "/v1/org", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the Cookie Munch consent-event link. GET /v1/org/consent-partners/cookiemunch
    ///
    /// What to enter in Cookie Munch to send your site's consent events to Referalli: link partner `referalli` with `externalId` (your org id); deliveries go to `receiverUrl`. `sites` are the Cookie Munch sites (cbids) whose events this org accepts, and `grants` says, per site, whether its owner granted Referalli that site in Cookie Munch (`granted`, `waiting_on_partner`, `revoked`, `expired`, `none`, or `unknown` when Cookie Munch couldn't be asked; `grantCheck` says why). `stampCheck.status` is `live` when Referalli checks visitors' consent stamps with Cookie Munch, else `not_configured`.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgConsentPartnersCookiemunch(idempotencyKey: String? = nil) async throws -> GetOrgConsentPartnersCookiemunchResponse {
        return try await send("GET", "/v1/org/consent-partners/cookiemunch", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List received Cookie Munch consent events. GET /v1/org/consent-partners/cookiemunch/events
    ///
    /// Consent evidence from Cookie Munch, newest first: each `consent.recorded` and `consent.withdrawn` event for your registered sites, with the visitor's consent `stamp`, the `choices` (and for a withdrawal, the `withdrawn` categories), and the id of the key that signed it. Filter by `stamp` to see one visitor's history; with `stamp`, `checks` lists what Cookie Munch said about it (newest first, `credited` only for `consented`). Append-only.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    ///
    /// stamp: Only this visitor's consent stamp.
    public func getOrgConsentPartnersCookiemunchEvents(stamp: String? = nil, limit: Int? = nil, idempotencyKey: String? = nil) async throws -> GetOrgConsentPartnersCookiemunchEventsResponse {
        return try await send("GET", "/v1/org/consent-partners/cookiemunch/events", query: [("stamp", Self.queryString(stamp)), ("limit", Self.queryString(limit))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the FX feed setting. GET /v1/org/fx-feed
    ///
    /// Whether the daily ECB reference-rate feed is on for this org, and the date of its latest rate.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgFxFeed(idempotencyKey: String? = nil) async throws -> GetOrgFxFeedResponse {
        return try await send("GET", "/v1/org/fx-feed", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the hosted-page consent and chat. GET /v1/org/hosted-pages
    ///
    /// What runs on the pages Referalli hosts for you on your own portal domain (the partner portal and `/join`): your consent banner (Cookie Munch, OneTrust, Cookiebot, Usercentrics, Didomi, Osano, Termly, iubenda, CookieYes, TrustArc, Ketch, Transcend, CookieFirst, consentmanager, Cookie Information, CookieScript, CookieHub, Google Privacy & messaging, Axeptio, Sourcepoint, InMobi Choice, Securiti, Enzuzo, CookiePro, TrustCommander, Klaro, Civic Cookie Control, a custom CMP, a built-in necessary-only notice, or none) and your support chat (Chatly, Intercom, Crisp, Zendesk Messaging, HubSpot, Drift, LiveChat, Tawk.to, Freshchat, Tidio, Help Scout Beacon, Front, Chatwoot, Olark, Smartsupp, JivoChat, Gorgias, Pylon, Plain, Userlike, Zoho SalesIQ, Re:amaze, Chatra, Kustomer, Gladly, Brevo, Trengo, Dixa, Gist, Freshdesk, LiveAgent, Chatbase, Voiceflow, Botpress, Salesforce, Dynamics 365 or custom). `adapters.consent[].fields` are the `config.params` a CMP's inline snippet needs. `adapters.chat[].fields` lists each chat's config keys; `chat.hasIdentitySecret` says whether an identity-verification secret is saved (never the secret). `served` is exactly what visitors get: the head tags, the "Cookie settings" link and the Content-Security-Policy built from these adapters. Referalli's own banner and chat never run on your domain.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgHostedPages(idempotencyKey: String? = nil) async throws -> GetOrgHostedPagesResponse {
        return try await send("GET", "/v1/org/hosted-pages", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List team members. GET /v1/org/members
    ///
    /// Members of the org with their role and email, oldest first.
    ///
    /// **Auth:** an API key with `team:read`, or a session of any role.
    ///
    /// **Scopes:** `team:read`, `team:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getOrgMembers(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Member> {
        return try await send("GET", "/v1/org/members", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getOrgMembers`, following the pages.
    public func getOrgMembersEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Member, Swift.Error> {
        paginate { cursor in try await self.getOrgMembers(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get payout schedules. GET /v1/org/payout-schedule
    ///
    /// The org schedule and its next run date, plus each program's override (`{ kind: 'off' }`, its own schedule, or `null` to follow the org) and next run date.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getOrgPayoutSchedule(idempotencyKey: String? = nil) async throws -> GetOrgPayoutScheduleResponse {
        return try await send("GET", "/v1/org/payout-schedule", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get partner sign-in settings. GET /v1/org/portal-auth
    ///
    /// How partners sign in to the org's portal: `referalli` (partner accounts, the default), `oidc` (the merchant's IdP) or `custom` (the merchant's own session, as a short-lived JWT). Includes the audience tokens must carry, the URL to send partners to, the redirect URI to register, and the last check. Never the secret.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgPortalAuth(idempotencyKey: String? = nil) async throws -> GetOrgPortalAuthResponse {
        return try await send("GET", "/v1/org/portal-auth", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get referral query parameters. GET /v1/org/referral-params
    ///
    /// The query parameters aff.js reads a referral code from: the built-in ones (`via`, `ref`, `aff`) and the org's extra ones.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgReferralParams(idempotencyKey: String? = nil) async throws -> GetOrgReferralParamsResponse {
        return try await send("GET", "/v1/org/referral-params", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the data retention policy. GET /v1/org/retention
    ///
    /// How many days each kind of raw data is kept before the nightly purge, the allowed minimum and default per kind, and the last purge run.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgRetention(idempotencyKey: String? = nil) async throws -> Retention {
        return try await send("GET", "/v1/org/retention", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get SSO settings. GET /v1/org/sso
    ///
    /// Single sign-on for the org: whether SSO is configured on this deployment and linked to a directory tenant, its connections and domains, whether SSO is required, the role mapping, recent setup tickets and any provider error.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgSso(idempotencyKey: String? = nil) async throws -> GetOrgSsoResponse {
        return try await send("GET", "/v1/org/sso", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get SAML metadata. GET /v1/org/sso/connections/{id}/saml-metadata
    ///
    /// The SAML service-provider metadata for one of the org's SSO connections, to give the identity provider.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgSsoConnectionsIdSamlMetadata(id: String, idempotencyKey: String? = nil) async throws -> GetOrgSsoConnectionsIdSamlMetadataResponse {
        return try await send("GET", "/v1/org/sso/connections/\(Self.segment(id))/saml-metadata", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the tax profile. GET /v1/org/tax-profile
    ///
    /// The org's legal name, address, country, VAT id, EIN, domestic VAT rate, whether partner VAT ids are checked against EU VIES, and the 1099 filing provider.
    ///
    /// **Auth:** an API key with `org:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgTaxProfile(idempotencyKey: String? = nil) async throws -> TaxProfile {
        return try await send("GET", "/v1/org/tax-profile", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the tracker's consent default. GET /v1/org/tracking-consent
    ///
    /// How `aff.js` reads visitor consent unless the tag says otherwise (`data-consent`): `auto` detects the site's CMP (Cookie Munch, OneTrust, Cookiebot, Usercentrics, Didomi, Osano, Termly, IAB TCF and GPP, Google Consent Mode, or `window.referalliConsent`), an adapter id pins one, `pending` waits for `aff.consent(true|false)`, and `none` always stores. Until consent is granted nothing is stored or sent; the referral stays in memory for the sign-up. `noCmp` is what `auto` does on a site without a CMP. `configured: false` is an org that never chose: it serves `none`, so existing tags behave as before. Lists the adapters with their default category.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgTrackingConsent(idempotencyKey: String? = nil) async throws -> GetOrgTrackingConsentResponse {
        return try await send("GET", "/v1/org/tracking-consent", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Both modes' tracking tokens. GET /v1/org/tracking-tokens
    ///
    /// The org's public tracking values for live and test mode, labelled: `{ mode, live, test }`, each with `orgId`, `trackingToken`, `scriptUrl` (aff.js), `linkBaseUrl` (the verified link domain, else Referalli's origin) and `linkTemplate` (`…/go/{token}/{code}`). `mode` is the caller's. Any key reads both, live or test; nothing else crosses modes. The test org is created on first use.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getOrgTrackingTokens(idempotencyKey: String? = nil) async throws -> TrackingTokens {
        return try await send("GET", "/v1/org/tracking-tokens", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List outreach messages. GET /v1/outreach
    ///
    /// Drafted, approved and sent outreach messages, newest first.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getOutreach(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetOutreachResponseDataItem> {
        return try await send("GET", "/v1/outreach", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getOutreach`, following the pages.
    public func getOutreachEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetOutreachResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getOutreach(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my achievements. GET /v1/partner/achievements
    ///
    /// Badges computed from the ledger (first click, referral milestones, first payout, $1,000 earned), each with progress toward its target.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerAchievements(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerAchievementsResponseDataItem> {
        return try await send("GET", "/v1/partner/achievements", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerAchievements`, following the pages.
    public func getPartnerAchievementsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerAchievementsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerAchievements(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my advances. GET /v1/partner/advance
    ///
    /// The partner's advances with what remains to repay.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerAdvance(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerAdvanceResponseDataItem> {
        return try await send("GET", "/v1/partner/advance", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerAdvance`, following the pages.
    public func getPartnerAdvanceEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerAdvanceResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerAdvance(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my advance offer. GET /v1/partner/advance/offer
    ///
    /// How much the partner could receive now against future commissions (`maxAdvanceMinor`), from their recent run rate and quality score, and the fee.
    ///
    /// **Auth:** a partner session.
    public func getPartnerAdvanceOffer(idempotencyKey: String? = nil) async throws -> GetPartnerAdvanceOfferResponse {
        return try await send("GET", "/v1/partner/advance/offer", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List your partner API tokens. GET /v1/partner/api-tokens
    ///
    /// Your active `rpt_` tokens (never the token itself). Portal session only: a token cannot list tokens.
    ///
    /// **Auth:** a partner session.
    public func getPartnerApiTokens(idempotencyKey: String? = nil) async throws -> GetPartnerApiTokensResponse {
        return try await send("GET", "/v1/partner/api-tokens", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List marketing assets. GET /v1/partner/assets
    ///
    /// Marketing assets (copy, images, banners) of the programs the partner is approved in; group-only assets show only to that group's members.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerAssets(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerAssetsResponseDataItem> {
        return try await send("GET", "/v1/partner/assets", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerAssets`, following the pages.
    public func getPartnerAssetsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerAssetsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerAssets(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my contracts. GET /v1/partner/contracts
    ///
    /// Contracts merchants sent the partner.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerContracts(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerContractsResponseDataItem> {
        return try await send("GET", "/v1/partner/contracts", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerContracts`, following the pages.
    public func getPartnerContractsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerContractsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerContracts(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my deals. GET /v1/partner/deals
    ///
    /// The partner's registered deals across merchants, newest first.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerDeals(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerDealsResponseDataItem> {
        return try await send("GET", "/v1/partner/deals", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerDeals`, following the pages.
    public func getPartnerDealsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerDealsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerDeals(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my disputes. GET /v1/partner/disputes
    ///
    /// Disputes the partner filed about missing or wrong credit, newest first, with the merchant's resolution.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerDisputes(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerDisputesResponseDataItem> {
        return try await send("GET", "/v1/partner/disputes", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerDisputes`, following the pages.
    public func getPartnerDisputesEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerDisputesResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerDisputes(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my groups. GET /v1/partner/groups
    ///
    /// The partner's groups across programs, with their onboarding and payout terms.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerGroups(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerGroupsResponseDataItem> {
        return try await send("GET", "/v1/partner/groups", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerGroups`, following the pages.
    public func getPartnerGroupsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerGroupsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerGroups(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my invitations. GET /v1/partner/invitations
    ///
    /// Program invitations merchants sent the partner.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerInvitations(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerInvitationsResponseDataItem> {
        return try await send("GET", "/v1/partner/invitations", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerInvitations`, following the pages.
    public func getPartnerInvitationsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerInvitationsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerInvitations(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my identity verification status. GET /v1/partner/kyc/status
    ///
    /// The partner account's KYC status (`unverified`, `pending`, `verified`, `rejected`), sanctions screening status and when it was verified.
    ///
    /// **Auth:** a partner session.
    public func getPartnerKycStatus(idempotencyKey: String? = nil) async throws -> GetPartnerKycStatusResponse {
        return try await send("GET", "/v1/partner/kyc/status", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List my links. GET /v1/partner/links
    ///
    /// The partner's tracked links across merchants, newest first, with the short URL, the `?via=` parameter for direct links and eligible clicks.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerLinks(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerLinksResponseDataItem> {
        return try await send("GET", "/v1/partner/links", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerLinks`, following the pages.
    public func getPartnerLinksEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerLinksResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerLinks(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my link's QR code. GET /v1/partner/links/{id}/qr
    ///
    /// An SVG QR code for one of the partner's links.
    ///
    /// **Auth:** a partner session.
    public func getPartnerLinksIdQr(id: String, idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/partner/links/\(Self.segment(id))/qr", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Browse the marketplace. GET /v1/partner/marketplace
    ///
    /// Public listings of active live programs across every merchant, sponsored first, with commission terms and platform-computed stats. Filter with `category`. Partner session only.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerMarketplace(category: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerMarketplaceResponseDataItem> {
        return try await send("GET", "/v1/partner/marketplace", query: [("category", Self.queryString(category)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerMarketplace`, following the pages.
    public func getPartnerMarketplaceEach(category: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerMarketplaceResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerMarketplace(category: category, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my account and memberships. GET /v1/partner/me
    ///
    /// The partner account and every merchant it partners with, each with its programs and enrollment status.
    ///
    /// **Auth:** a partner session.
    public func getPartnerMe(idempotencyKey: String? = nil) async throws -> GetPartnerMeResponse {
        return try await send("GET", "/v1/partner/me", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List my notifications. GET /v1/partner/notifications
    ///
    /// The partner account's notifications, newest first.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerNotifications(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Notification> {
        return try await send("GET", "/v1/partner/notifications", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerNotifications`, following the pages.
    public func getPartnerNotificationsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Notification, Swift.Error> {
        paginate { cursor in try await self.getPartnerNotifications(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get self-billing status. GET /v1/partner/orgs/{orgId}/self-billing
    ///
    /// The partner's VAT details with this merchant and whether they accepted the current self-billing agreement (`currentVersion`).
    ///
    /// **Auth:** a partner session.
    public func getPartnerOrgsOrgIdSelfBilling(orgId: String, idempotencyKey: String? = nil) async throws -> GetPartnerOrgsOrgIdSelfBillingResponse {
        return try await send("GET", "/v1/partner/orgs/\(Self.segment(orgId))/self-billing", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get my reputation passport. GET /v1/partner/passport
    ///
    /// A signed, portable passport of the partner's verified performance across every program (programs, eligible clicks, referrals, repeat-payer rate, average quality), valid for 90 days.
    ///
    /// **Auth:** a partner session.
    public func getPartnerPassport(idempotencyKey: String? = nil) async throws -> Passport {
        return try await send("GET", "/v1/partner/passport", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List my payouts. GET /v1/partner/payouts
    ///
    /// The partner's payouts across merchants, newest first.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerPayouts(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerPayoutsResponseDataItem> {
        return try await send("GET", "/v1/partner/payouts", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerPayouts`, following the pages.
    public func getPartnerPayoutsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerPayoutsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerPayouts(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my payout invoice. GET /v1/partner/payouts/{id}/invoice
    ///
    /// The invoice for one of the partner's payouts, as JSON or (`format=html`) a printable page.
    ///
    /// **Auth:** a partner session.
    public func getPartnerPayoutsIdInvoice(id: String, format: String? = nil, idempotencyKey: String? = nil) async throws -> Invoice {
        return try await send("GET", "/v1/partner/payouts/\(Self.segment(id))/invoice", query: [("format", Self.queryString(format))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List my postback calls. GET /v1/partner/postback-logs
    ///
    /// Recent postback calls with the topic, URL and the status code the partner's server answered.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerPostbackLogs(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerPostbackLogsResponseDataItem> {
        return try await send("GET", "/v1/partner/postback-logs", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerPostbackLogs`, following the pages.
    public func getPartnerPostbackLogsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerPostbackLogsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerPostbackLogs(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my creator profile. GET /v1/partner/profile
    ///
    /// The partner's creator profile (headline, bio, channels, audience, engagement) and verified stats.
    ///
    /// **Auth:** a partner session.
    public func getPartnerProfile(idempotencyKey: String? = nil) async throws -> CreatorProfile {
        return try await send("GET", "/v1/partner/profile", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get my verified performance. GET /v1/partner/profile/verified
    ///
    /// The partner's performance across all programs, computed by the platform from the ledger rather than self-reported: programs, eligible clicks, active referrals and repeat-payer rate.
    ///
    /// **Auth:** a partner session.
    public func getPartnerProfileVerified(idempotencyKey: String? = nil) async throws -> GetPartnerProfileVerifiedResponse {
        return try await send("GET", "/v1/partner/profile/verified", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a program leaderboard. GET /v1/partner/programs/{programId}/leaderboard
    ///
    /// Top 25 partners by approved commission in the program (during the active contest, if any). Other partners' names are masked; the partner's own row is marked `you`. 403 when the program has no leaderboard.
    ///
    /// **Auth:** a partner session.
    public func getPartnerProgramsProgramIdLeaderboard(programId: String, idempotencyKey: String? = nil) async throws -> GetPartnerProgramsProgramIdLeaderboardResponse {
        return try await send("GET", "/v1/partner/programs/\(Self.segment(programId))/leaderboard", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get my recruiting link. GET /v1/partner/recruit
    ///
    /// The partner's recruit code and sign-up URL. Partners who sign up through it become their sub-affiliates where both partner the same merchant.
    ///
    /// **Auth:** a partner session.
    public func getPartnerRecruit(idempotencyKey: String? = nil) async throws -> GetPartnerRecruitResponse {
        return try await send("GET", "/v1/partner/recruit", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List my referrals. GET /v1/partner/referrals
    ///
    /// The partner's referrals across merchants, newest first. Customer ids are redacted to their last 4 characters.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerReferrals(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerReferralsResponseDataItem> {
        return try await send("GET", "/v1/partner/referrals", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerReferrals`, following the pages.
    public func getPartnerReferralsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerReferralsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerReferrals(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Explain a referral. GET /v1/partner/referrals/{id}/transparency
    ///
    /// Why a referral credited the partner (or did not fully): the model, window, touchpoints considered, the partner's share of the credit and the reasoning notes. No customer data.
    ///
    /// **Auth:** a partner session.
    public func getPartnerReferralsIdTransparency(id: String, idempotencyKey: String? = nil) async throws -> GetPartnerReferralsIdTransparencyResponse {
        return try await send("GET", "/v1/partner/referrals/\(Self.segment(id))/transparency", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List partners. GET /v1/partners
    ///
    /// Partners, newest first. Filter by `email`, `externalRef` (the partner's own or a program-scoped one on an enrollment) or `status`. `programId` returns only partners enrolled in that program, each with the program's own `externalRef` for them when it has one, and then `externalRef` matches that. Archived partners are hidden unless you ask for them with `status=archived` or `includeArchived=true`. Always a list, even for a filter that matches one partner: read `data[0]`. Partner reads carry no `code` or `link`; use `GET /v1/partners/{id}/summary?programId=` or `GET /v1/links?partnerId=` for those.
    ///
    /// **Auth:** an API key with `partners:read`, or a session of any role.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartners(email: String? = nil, externalRef: String? = nil, programId: String? = nil, status: String? = nil, includeArchived: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Partner> {
        return try await send("GET", "/v1/partners", query: [("email", Self.queryString(email)), ("externalRef", Self.queryString(externalRef)), ("programId", Self.queryString(programId)), ("status", Self.queryString(status)), ("includeArchived", Self.queryString(includeArchived)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartners`, following the pages.
    public func getPartnersEach(email: String? = nil, externalRef: String? = nil, programId: String? = nil, status: String? = nil, includeArchived: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Partner, Swift.Error> {
        paginate { cursor in try await self.getPartners(email: email, externalRef: externalRef, programId: programId, status: status, includeArchived: includeArchived, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my security settings. GET /v1/partner/security
    ///
    /// Whether two-factor sign-in is on for the partner account.
    ///
    /// **Auth:** a partner session.
    public func getPartnerSecurity(idempotencyKey: String? = nil) async throws -> GetPartnerSecurityResponse {
        return try await send("GET", "/v1/partner/security", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a partner. GET /v1/partners/{id}
    ///
    /// One partner, with a cross-network warning when the same account is flagged or banned by other merchants (it never says which). With `programId`, `externalRef` is the one that program knows them by: its own externalRef for them when it has one, else the partner's.
    ///
    /// **Auth:** an API key with `partners:read`, or a session of any role.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    public func getPartnersId(id: String, programId: String? = nil, idempotencyKey: String? = nil) async throws -> GetPartnersIdResponse {
        return try await send("GET", "/v1/partners/\(Self.segment(id))", query: [("programId", Self.queryString(programId))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a partner's balances. GET /v1/partners/{id}/balances
    ///
    /// The partner's commission balances per currency: pending (in hold), approved (payable), paid and reversed.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnersIdBalances(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Balance> {
        return try await send("GET", "/v1/partners/\(Self.segment(id))/balances", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnersIdBalances`, following the pages.
    public func getPartnersIdBalancesEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Balance, Swift.Error> {
        paginate { cursor in try await self.getPartnersIdBalances(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List a partner's enrollments. GET /v1/partners/{id}/enrollments
    ///
    /// The programs a partner is enrolled in or applied to, with status, group and `externalRef` (that program's own id for the partner, or null when the partner's own applies).
    ///
    /// **Auth:** an API key with `partners:read`, or a session of any role.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnersIdEnrollments(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnersIdEnrollmentsResponseDataItem> {
        return try await send("GET", "/v1/partners/\(Self.segment(id))/enrollments", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnersIdEnrollments`, following the pages.
    public func getPartnersIdEnrollmentsEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnersIdEnrollmentsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnersIdEnrollments(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a partner's payout profile. GET /v1/partners/{id}/payout-profile
    ///
    /// The partner's payout method, currency, threshold and tax form status. Method details are not returned. 404 when none is set.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getPartnersIdPayoutProfile(id: String, idempotencyKey: String? = nil) async throws -> PayoutProfile {
        return try await send("GET", "/v1/partners/\(Self.segment(id))/payout-profile", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a partner's quality score. GET /v1/partners/{id}/quality
    ///
    /// The partner's quality score computed now (with its metrics) and the last stored snapshot.
    ///
    /// **Auth:** an API key with `partners:read`, or a session of any role.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    public func getPartnersIdQuality(id: String, idempotencyKey: String? = nil) async throws -> GetPartnersIdQualityResponse {
        return try await send("GET", "/v1/partners/\(Self.segment(id))/quality", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a partner's stats. GET /v1/partners/{id}/stats
    ///
    /// What the partner brought in, in one call: eligible clicks, referrals by status, converted customers (referred, not void, with at least one payment) and balances per currency. Pass `programId` to count one program only (an org shared by several products).
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    public func getPartnersIdStats(id: String, programId: String? = nil, idempotencyKey: String? = nil) async throws -> GetPartnersIdStatsResponse {
        return try await send("GET", "/v1/partners/\(Self.segment(id))/stats", query: [("programId", Self.queryString(programId))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a partner's referrer summary. GET /v1/partners/{id}/summary
    ///
    /// Everything a referrer panel shows, in one call: the stats for one program (`programId` is required) plus the partner's current `code` there (the newest coupon, else the newest link's code), `linkUrl` (null when they have only a coupon) and the program's `terms` (as `GET /v1/programs/{id}/terms`; null when it has no rule yet).
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    public func getPartnersIdSummary(id: String, programId: String, idempotencyKey: String? = nil) async throws -> GetPartnersIdSummaryResponse {
        return try await send("GET", "/v1/partners/\(Self.segment(id))/summary", query: [("programId", Self.queryString(programId))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get my stats. GET /v1/partner/stats
    ///
    /// Per merchant: eligible clicks, active referrals, payments and commission balances.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerStats(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerStatsResponseDataItem> {
        return try await send("GET", "/v1/partner/stats", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerStats`, following the pages.
    public func getPartnerStatsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerStatsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerStats(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List my tax documents. GET /v1/partner/tax-documents
    ///
    /// Tax forms delivered to the partner by every merchant they work with, newest year first.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerTaxDocuments(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerTaxDocumentsResponseDataItem> {
        return try await send("GET", "/v1/partner/tax-documents", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerTaxDocuments`, following the pages.
    public func getPartnerTaxDocumentsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerTaxDocumentsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerTaxDocuments(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get my tax document. GET /v1/partner/tax-documents/{id}
    ///
    /// The recipient copy of a delivered tax form, as an HTML page.
    ///
    /// **Auth:** a partner session.
    public func getPartnerTaxDocumentsId(id: String, idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/partner/tax-documents/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List program terms. GET /v1/partner/terms
    ///
    /// The latest terms version of each program the partner is approved in, and whether they accepted it.
    ///
    /// **Auth:** a partner session.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPartnerTerms(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPartnerTermsResponseDataItem> {
        return try await send("GET", "/v1/partner/terms", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPartnerTerms`, following the pages.
    public func getPartnerTermsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPartnerTermsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPartnerTerms(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the passport signing key. GET /v1/passport/public-key
    ///
    /// The ed25519 public key partner passports are signed with, so anyone can verify one offline.
    ///
    /// **Auth:** none.
    public func getPassportPublicKey(idempotencyKey: String? = nil) async throws -> GetPassportPublicKeyResponse {
        return try await send("GET", "/v1/passport/public-key", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List payout provider connections. GET /v1/payout-connections
    ///
    /// The payout providers the org connected with its own credentials (PayPal, Stripe, Circle, Wise, Payoneer, Tremendous), with environment and status. Secrets are never returned.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPayoutConnections(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetPayoutConnectionsResponseDataItem> {
        return try await send("GET", "/v1/payout-connections", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPayoutConnections`, following the pages.
    public func getPayoutConnectionsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetPayoutConnectionsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getPayoutConnections(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List payout runs. GET /v1/payout-runs
    ///
    /// Payout runs, newest first, with their status and summary.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPayoutRuns(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<PayoutRun> {
        return try await send("GET", "/v1/payout-runs", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPayoutRuns`, following the pages.
    public func getPayoutRunsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<PayoutRun, Swift.Error> {
        paginate { cursor in try await self.getPayoutRuns(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List payouts. GET /v1/payouts
    ///
    /// Individual payouts, newest first, with rail, provider reference and failure reason. Filter with `partnerId`.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPayouts(partnerId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Payout> {
        return try await send("GET", "/v1/payouts", query: [("partnerId", Self.queryString(partnerId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPayouts`, following the pages.
    public func getPayoutsEach(partnerId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Payout, Swift.Error> {
        paginate { cursor in try await self.getPayouts(partnerId: partnerId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a payout's invoice. GET /v1/payouts/{id}/invoice
    ///
    /// The self-billing invoice issued for a payout, as JSON or (`format=html`) a printable page. 404 when the payout has no invoice.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getPayoutsIdInvoice(id: String, format: String? = nil, idempotencyKey: String? = nil) async throws -> Invoice {
        return try await send("GET", "/v1/payouts/\(Self.segment(id))/invoice", query: [("format", Self.queryString(format))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List public plans. GET /v1/plans
    ///
    /// The public plan catalog in display order: monthly price in minor units (USD, billed monthly in advance), limits and features. No authentication; cacheable for an hour. No plan charges a transaction or payout fee.
    ///
    /// **Auth:** none.
    public func getPlans(idempotencyKey: String? = nil) async throws -> GetPlansResponse {
        return try await send("GET", "/v1/plans", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// What a merchant's portal sign-in offers. GET /v1/portal-auth/current
    ///
    /// For the portal's sign-in page: the org (from `org`, or the merchant's portal domain this is called on) and its partner sign-in adapter, with the button label and where it starts. `referalli` with no start URL when the org uses Referalli partner accounts.
    ///
    /// **Auth:** none.
    public func getPortalAuthCurrent(org: String? = nil, idempotencyKey: String? = nil) async throws -> GetPortalAuthCurrentResponse {
        return try await send("GET", "/v1/portal-auth/current", query: [("org", Self.queryString(org))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the portal design. GET /v1/portal/theme
    ///
    /// The partner portal's look and layout on your portal domain: `published` (what partners see) and `draft` (what you are editing, or null). Colours with a separate dark palette, the colour scheme, widths and density, fonts (a stylesheet URL, `@font-face` files, a family per role, the type scale), the logo set and favicon, component shape (radius, shadow, buttons, inputs, focus ring, links), an announcement, the header and footer, the home sections and navigation, the sign-in page, interface string overrides, typed theme settings, CSS snippets, custom CSS, phone tuning and embedding. Every key is optional; an unset key keeps the built-in look.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getPortalTheme(idempotencyKey: String? = nil) async throws -> GetPortalThemeResponse {
        return try await send("GET", "/v1/portal/theme", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Preview the compiled portal design. GET /v1/portal/theme/compiled
    ///
    /// The draft (or `?which=published`) compiled: `css`, the stylesheet partners load, and `view`, the layout, brand and text the portal draws. For a live preview in your own editor.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getPortalThemeCompiled(which: String? = nil, idempotencyKey: String? = nil) async throws -> GetPortalThemeCompiledResponse {
        return try await send("GET", "/v1/portal/theme/compiled", query: [("which", Self.queryString(which))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the portal design schema. GET /v1/portal/theme/schema
    ///
    /// Every key the portal design takes, as JSON Schema (draft 2020-12): build an editor or validate a theme file before you send it.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getPortalThemeSchema(idempotencyKey: String? = nil) async throws -> GetPortalThemeSchemaResponse {
        return try await send("GET", "/v1/portal/theme/schema", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List published portal designs. GET /v1/portal/theme/versions
    ///
    /// The last 50 published versions, newest first.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getPortalThemeVersions(idempotencyKey: String? = nil) async throws -> GetPortalThemeVersionsResponse {
        return try await send("GET", "/v1/portal/theme/versions", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List DSAR tool requests. GET /v1/privacy/executor-requests
    ///
    /// The last 200 requests connected DSAR tools sent: operation, outcome and the vendor request id. Subjects are kept only as hashes.
    ///
    /// **Auth:** an API key with `privacy:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:read`, `privacy:write`, `read`, `full`, `admin`.
    public func getPrivacyExecutorRequests(idempotencyKey: String? = nil) async throws -> GetPrivacyExecutorRequestsResponse {
        return try await send("GET", "/v1/privacy/executor-requests", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List connected DSAR tools. GET /v1/privacy/executors
    ///
    /// Every DSAR tool that can reach Referalli as a connected system (Cookie Munch cm-standard-v1, OneTrust, Transcend, DataGrail, Ketch, Osano, `custom` for any tool speaking Standard Webhooks), with the per-org URL to register, install steps and a health check. Keys are never returned.
    ///
    /// **Auth:** an API key with `privacy:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:read`, `privacy:write`, `read`, `full`, `admin`.
    public func getPrivacyExecutors(idempotencyKey: String? = nil) async throws -> GetPrivacyExecutorsResponse {
        return try await send("GET", "/v1/privacy/executors", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Export a customer's data. GET /v1/privacy/export
    ///
    /// Every stored row that references the customer, for a data-subject access request.
    ///
    /// **Auth:** an API key with `privacy:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:read`, `privacy:write`, `read`, `full`, `admin`.
    public func getPrivacyExport(customerRef: String, idempotencyKey: String? = nil) async throws -> CustomerExport {
        return try await send("GET", "/v1/privacy/export", query: [("customerRef", Self.queryString(customerRef))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List data-subject requests. GET /v1/privacy/requests
    ///
    /// Access and erasure requests, newest first, with their status.
    ///
    /// **Auth:** an API key with `privacy:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:read`, `privacy:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPrivacyRequests(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<PrivacyRequest> {
        return try await send("GET", "/v1/privacy/requests", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPrivacyRequests`, following the pages.
    public func getPrivacyRequestsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<PrivacyRequest, Swift.Error> {
        paginate { cursor in try await self.getPrivacyRequests(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a data-subject request. GET /v1/privacy/requests/{id}
    ///
    /// Poll one request: `pending`, `completed` or `failed`, and whether data was found.
    ///
    /// **Auth:** an API key with `privacy:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:read`, `privacy:write`, `read`, `full`, `admin`.
    public func getPrivacyRequestsId(id: String, idempotencyKey: String? = nil) async throws -> PrivacyRequest {
        return try await send("GET", "/v1/privacy/requests/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a data-subject request result. GET /v1/privacy/requests/{id}/result
    ///
    /// The full result of a completed request; for access requests, the exported data. 400 until it is completed.
    ///
    /// **Auth:** an API key with `privacy:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:read`, `privacy:write`, `read`, `full`, `admin`.
    public func getPrivacyRequestsIdResult(id: String, idempotencyKey: String? = nil) async throws -> GetPrivacyRequestsIdResultResponse {
        return try await send("GET", "/v1/privacy/requests/\(Self.segment(id))/result", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List partner links. GET /v1/product-links
    ///
    /// Other products allowed to call this organization's API (REF-S28), newest first, with status, scopes and last use. Secrets are never shown again. Owners and admins, or a key with team:read.
    ///
    /// **Auth:** an API key with `team:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:read`, `team:write`, `read`, `full`, `admin`.
    public func getProductLinks(idempotencyKey: String? = nil) async throws -> GetProductLinksResponse {
        return try await send("GET", "/v1/product-links", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List product margins. GET /v1/profitability/products
    ///
    /// The margin catalog: per product, a margin (bps) or a unit cost, used to turn revenue into profit.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getProfitabilityProducts(idempotencyKey: String? = nil) async throws -> GetProfitabilityProductsResponse {
        return try await send("GET", "/v1/profitability/products", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a product margin. GET /v1/profitability/products/{productRef}
    ///
    /// One product of the margin catalog.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getProfitabilityProductsProductRef(productRef: String, idempotencyKey: String? = nil) async throws -> GetProfitabilityProductsProductRefResponse {
        return try await send("GET", "/v1/profitability/products/\(Self.segment(productRef))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a rebuild job. GET /v1/profitability/rebuild/{jobId}
    ///
    /// Progress of a rebuild: `queued`, `running`, `done` or `failed` (a job untouched for an hour reports `failed` with `error: "stale"`), with processed and total counts.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getProfitabilityRebuildJobId(jobId: String, idempotencyKey: String? = nil) async throws -> GetProfitabilityRebuildJobIdResponse {
        return try await send("GET", "/v1/profitability/rebuild/\(Self.segment(jobId))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get profitability settings. GET /v1/profitability/settings
    ///
    /// The economics credit ROI is computed with: reporting currency, default margin, how a credit's cost is modelled, how credit use is inferred, attribution and churn windows, target ROI and more. With `programId`, the program's overrides merged over the org's.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getProfitabilitySettings(programId: String? = nil, idempotencyKey: String? = nil) async throws -> GetProfitabilitySettingsResponse {
        return try await send("GET", "/v1/profitability/settings", query: [("programId", Self.queryString(programId))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List programs. GET /v1/programs
    ///
    /// The org's programs, oldest first, with their settings. `slug` returns just that program, still as a list (`data` holds one program, or none).
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getPrograms(slug: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Program> {
        return try await send("GET", "/v1/programs", query: [("slug", Self.queryString(slug)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getPrograms`, following the pages.
    public func getProgramsEach(slug: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Program, Swift.Error> {
        paginate { cursor in try await self.getPrograms(slug: slug, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Check a public handle. GET /v1/programs/handle-availability
    ///
    /// Whether `handle` can be set as a program's `publicHandle`, using the same rules as `POST`/`PATCH /v1/programs`: `available: false` with `reason: "invalid"` when it is not 3 to 48 characters of `a-z`, `0-9` and `-`, or `reason: "taken"` when any program (in any org, including your own) already has it. Handles are claimed only by setting them, so a free handle can still be taken before you do; the setter's `409` names `details.field: "publicHandle"`.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsHandleAvailability(handle: String, idempotencyKey: String? = nil) async throws -> GetProgramsHandleAvailabilityResponse {
        return try await send("GET", "/v1/programs/handle-availability", query: [("handle", Self.queryString(handle))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a program. GET /v1/programs/{id}
    ///
    /// One program with its settings (defaults filled in) and public page.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsId(id: String, idempotencyKey: String? = nil) async throws -> Program {
        return try await send("GET", "/v1/programs/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get autopricing settings. GET /v1/programs/{id}/autopricing
    ///
    /// The program's autopricing configuration, or `null` when it's off.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsIdAutopricing(id: String, idempotencyKey: String? = nil) async throws -> GetProgramsIdAutopricingResponse {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/autopricing", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a program's account-credit rail settings. GET /v1/programs/{id}/credit-rail
    ///
    /// The provider-neutral view of the account-credit rail: which billing provider credits go to (`provider`, from the billing connection `connectionId`, or `stripe` with no connection), the same matching and currency settings as the Stripe endpoints, whether credentials are available (`credentialsConnected`) and what the provider supports (`capabilities.customerCurrency`, `capabilities.createCustomer`). Credentials are never returned. A program set up with `PUT /v1/programs/{id}/stripe-credits` reads here as `provider: "stripe"`.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getProgramsIdCreditRail(id: String, idempotencyKey: String? = nil) async throws -> GetProgramsIdCreditRailResponse {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/credit-rail", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List a program's account credits. GET /v1/programs/{id}/credit-rail/log
    ///
    /// Every credit and debit the rail queued for this program, newest first, provider-neutral: `provider`, `connectionId`, `customerId` (the provider's customer) and `transactionId` (the provider's record once applied) instead of the Stripe-named fields of `GET /v1/programs/{id}/stripe-credits/log`. Statuses and retries as there.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProgramsIdCreditRailLog(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetProgramsIdCreditRailLogResponseDataItem> {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/credit-rail/log", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProgramsIdCreditRailLog`, following the pages.
    public func getProgramsIdCreditRailLogEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetProgramsIdCreditRailLogResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getProgramsIdCreditRailLog(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List program enrollments. GET /v1/programs/{id}/enrollments
    ///
    /// The program's enrollments and applications, newest first, each with the partner and a cross-network warning when other merchants banned the same account and `externalRef` (this program's own id for the partner, or null). Filter with `status` or `partnerId`.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProgramsIdEnrollments(id: String, status: String? = nil, partnerId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetProgramsIdEnrollmentsResponseDataItem> {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/enrollments", query: [("status", Self.queryString(status)), ("partnerId", Self.queryString(partnerId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProgramsIdEnrollments`, following the pages.
    public func getProgramsIdEnrollmentsEach(id: String, status: String? = nil, partnerId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetProgramsIdEnrollmentsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getProgramsIdEnrollments(id: id, status: status, partnerId: partnerId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the referral tree. GET /v1/programs/{id}/graph
    ///
    /// Who referred whom from one partner (`root`) down, with revenue and net commission per node. Where customers are partners too (customerRef equals a partner's externalRef), the tree continues up to `depth` partner levels. Stops at 5,000 referrals and says so.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsIdGraph(id: String, root: String, depth: Int? = nil, idempotencyKey: String? = nil) async throws -> GetProgramsIdGraphResponse {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/graph", query: [("root", Self.queryString(root)), ("depth", Self.queryString(depth))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List partner groups. GET /v1/programs/{id}/groups
    ///
    /// The program's partner groups with member counts. Archived groups are hidden unless `includeArchived=true`.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    ///
    /// includeArchived: true: include archived groups.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProgramsIdGroups(id: String, includeArchived: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<PartnerGroup> {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/groups", query: [("includeArchived", Self.queryString(includeArchived)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProgramsIdGroups`, following the pages.
    public func getProgramsIdGroupsEach(id: String, includeArchived: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<PartnerGroup, Swift.Error> {
        paginate { cursor in try await self.getProgramsIdGroups(id: id, includeArchived: includeArchived, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the agent negotiation policy. GET /v1/programs/{id}/negotiation-policy
    ///
    /// The program's negotiation policy, or `null` when it isn't open to negotiation.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsIdNegotiationPolicy(id: String, idempotencyKey: String? = nil) async throws -> GetProgramsIdNegotiationPolicyResponse {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/negotiation-policy", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List promotions. GET /v1/programs/{id}/promotions
    ///
    /// The program's promotions, latest start first.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProgramsIdPromotions(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Promotion> {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/promotions", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProgramsIdPromotions`, following the pages.
    public func getProgramsIdPromotionsEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Promotion, Swift.Error> {
        paginate { cursor in try await self.getProgramsIdPromotions(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the referee reward. GET /v1/programs/{id}/referee-reward
    ///
    /// The program's reward for referred customers (the friend's side of a double-sided program), or `null` when it has none.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsIdRefereeReward(id: String, idempotencyKey: String? = nil) async throws -> GetProgramsIdRefereeRewardResponse {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/referee-reward", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a program's Stripe balance credit settings. GET /v1/programs/{id}/stripe-credits
    ///
    /// Whether settled lines of this program are credited to the partner's Stripe customer balance, how that customer is found (`referrerMatch`), and whether store-credit referee rewards are credited too. `keyConnected` says whether a Stripe key is available to this program; `hasOwnKey` whether that is the program's own key rather than the org's. The key is never returned.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getProgramsIdStripeCredits(id: String, idempotencyKey: String? = nil) async throws -> GetProgramsIdStripeCreditsResponse {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/stripe-credits", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List a program's Stripe balance credits. GET /v1/programs/{id}/stripe-credits/log
    ///
    /// Every credit and debit the rail queued for this program, newest first: amount and currency (the commission's), `appliedAmountMinor`/`appliedCurrency` (what is sent to Stripe after any conversion; a debit uses its credit's currency and rate), Stripe customer, `status` (`pending`, `applied`, `no_customer`, `ambiguous_customer`, `fx_rate_missing`, `failed`, `canceled`), attempts, the Stripe balance transaction id once applied, and the last error. Unapplied rows are retried hourly, up to 24 tries (a row waiting under `waitForCustomer` has no cap).
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProgramsIdStripeCreditsLog(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetProgramsIdStripeCreditsLogResponseDataItem> {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/stripe-credits/log", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProgramsIdStripeCreditsLog`, following the pages.
    public func getProgramsIdStripeCreditsLogEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetProgramsIdStripeCreditsLogResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getProgramsIdStripeCreditsLog(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a program's terms. GET /v1/programs/{id}/terms
    ///
    /// The program's commission terms for product copy, from its latest commission rule version (`ruleVersion`): the `base` (`percentBps`, or `amountMinor` and `currency`), how long it recurs, the hold, and `summary`, the same sentence in each partner-portal locale (`en`, `es`, `de`, `fr`, `pt`, `it`, `nl`, `sv`, `ja`, `zh`), built deterministically from the rule, such as "20% of every payment for 12 months" or "$50.00 for the first payment only". Bounties are added (", plus $5.00 per signup"); rule conditions add "(conditions apply)"; overrides, tiers or new-vs-expansion rates set `ratesVary` and add "(rates vary)" rather than quote one rate. With `?locale=de` or an `Accept-Language` header the response also names the chosen `locale` and its sentence as `text` (an unsupported language gets `en`). Bounty event names are kept as written. Partner-group rates and promotions are not included. Publishing a new rule version changes the terms on the next read. `404` when the program has no rule yet. Program-scoped keys read their own programs.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    public func getProgramsIdTerms(id: String, locale: String? = nil, idempotencyKey: String? = nil) async throws -> ProgramTerms {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/terms", query: [("locale", Self.queryString(locale))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List terms acceptances. GET /v1/programs/{id}/terms-acceptances
    ///
    /// Which partner accepted which version of the program's terms, newest first.
    ///
    /// **Auth:** an API key with `programs:read`, or a session of any role.
    ///
    /// **Scopes:** `programs:read`, `programs:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProgramsIdTermsAcceptances(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetProgramsIdTermsAcceptancesResponseDataItem> {
        return try await send("GET", "/v1/programs/\(Self.segment(id))/terms-acceptances", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProgramsIdTermsAcceptances`, following the pages.
    public func getProgramsIdTermsAcceptancesEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetProgramsIdTermsAcceptancesResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getProgramsIdTermsAcceptances(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List prospects. GET /v1/prospects
    ///
    /// Prospects, best fit first, with channel, audience, evidence and outreach status. Filter with `status`.
    ///
    /// **Auth:** an API key with `growth:read`, or a session of any role.
    ///
    /// **Scopes:** `growth:read`, `growth:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getProspects(status: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetProspectsResponseDataItem> {
        return try await send("GET", "/v1/prospects", query: [("status", Self.queryString(status)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getProspects`, following the pages.
    public func getProspectsEach(status: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetProspectsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getProspects(status: status, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a program's public page. GET /v1/public/programs/{handle}
    ///
    /// What a program's public join page shows: the program and merchant names, pitch, cookie window, terms, base commission, branding and whether joining is approved at once. `terms` is the program's commission terms as `GET /v1/programs/{id}/terms` gives them (the rule's base, how long it recurs, hold and `summary` in each portal locale), or null when it has no rule yet; with `?locale=` or `Accept-Language` it also names the chosen `locale` and its sentence as `text`. No authentication; only active live programs with a `publicHandle` are found.
    ///
    /// **Auth:** none.
    public func getPublicProgramsHandle(handle: String, locale: String? = nil, idempotencyKey: String? = nil) async throws -> GetPublicProgramsHandleResponse {
        return try await send("GET", "/v1/public/programs/\(Self.segment(handle))", query: [("locale", Self.queryString(locale))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List referrals. GET /v1/referrals
    ///
    /// Referrals, newest first, filtered by `programId`, `partnerId`, `status` or `customerRef`.
    ///
    /// **Auth:** an API key with `referrals:read`, or a session of any role.
    ///
    /// **Scopes:** `referrals:read`, `referrals:write`, `read`, `full`, `admin`.
    ///
    /// customerRef: Your id for the referred customer.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getReferrals(programId: String? = nil, partnerId: String? = nil, status: String? = nil, customerRef: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Referral> {
        return try await send("GET", "/v1/referrals", query: [("programId", Self.queryString(programId)), ("partnerId", Self.queryString(partnerId)), ("status", Self.queryString(status)), ("customerRef", Self.queryString(customerRef)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getReferrals`, following the pages.
    public func getReferralsEach(programId: String? = nil, partnerId: String? = nil, status: String? = nil, customerRef: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Referral, Swift.Error> {
        paginate { cursor in try await self.getReferrals(programId: programId, partnerId: partnerId, status: status, customerRef: customerRef, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a referral. GET /v1/referrals/{id}
    ///
    /// One referral with its touch credits and attribution reasoning.
    ///
    /// **Auth:** an API key with `referrals:read`, or a session of any role.
    ///
    /// **Scopes:** `referrals:read`, `referrals:write`, `read`, `full`, `admin`.
    public func getReferralsId(id: String, idempotencyKey: String? = nil) async throws -> Referral {
        return try await send("GET", "/v1/referrals/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the attribution journey. GET /v1/referrals/{id}/journey
    ///
    /// The referral with every touchpoint considered: each click's time, URL, fraud score, eligibility, credit weight and which one won.
    ///
    /// **Auth:** an API key with `referrals:read`, or a session of any role.
    ///
    /// **Scopes:** `referrals:read`, `referrals:write`, `read`, `full`, `admin`.
    public func getReferralsIdJourney(id: String, idempotencyKey: String? = nil) async throws -> GetReferralsIdJourneyResponse {
        return try await send("GET", "/v1/referrals/\(Self.segment(id))/journey", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Report filtered clicks. GET /v1/reports/filtered-clicks
    ///
    /// Per day, newest first: total clicks, clicks excluded from attribution (bots, rate limits, invalid traffic) and the average fraud score.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getReportsFilteredClicks(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetReportsFilteredClicksResponseDataItem> {
        return try await send("GET", "/v1/reports/filtered-clicks", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getReportsFilteredClicks`, following the pages.
    public func getReportsFilteredClicksEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetReportsFilteredClicksResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getReportsFilteredClicks(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get partner performance. GET /v1/reports/partner-performance
    ///
    /// Per partner, highest revenue first: clicks, referrals, payments, referred revenue, commission earned and reversed. `format=csv` returns the same as a CSV file.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// format: csv: the same rows as a CSV file.
    public func getReportsPartnerPerformance(format: String? = nil, idempotencyKey: String? = nil) async throws -> GetReportsPartnerPerformanceResponse {
        return try await send("GET", "/v1/reports/partner-performance", query: [("format", Self.queryString(format))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List issued referee rewards. GET /v1/rewards
    ///
    /// Rewards issued to referred customers, newest first, with code and status (`issued`, `redeemed`, `void`). Filter with `status`.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getRewards(status: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetRewardsResponseDataItem> {
        return try await send("GET", "/v1/rewards", query: [("status", Self.queryString(status)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getRewards`, following the pages.
    public func getRewardsEach(status: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetRewardsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getRewards(status: status, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List partner rewards. GET /v1/rewards/granted
    ///
    /// The last 200 rewards granted through `POST /v1/rewards`, with the commission line each one posted.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    public func getRewardsGranted(idempotencyKey: String? = nil) async throws -> GetRewardsGrantedResponse {
        return try await send("GET", "/v1/rewards/granted", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Look up a reward code. GET /v1/rewards/lookup/{code}
    ///
    /// Whether a reward code is valid (issued and unredeemed), with its kind and amount, so your checkout can apply it. Unknown codes answer `{ "valid": false }`.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    public func getRewardsLookupCode(code: String, idempotencyKey: String? = nil) async throws -> GetRewardsLookupCodeResponse {
        return try await send("GET", "/v1/rewards/lookup/\(Self.segment(code))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List reward rules. GET /v1/rewards/rules
    ///
    /// Your rules that turn an inbound event (or a rule key) into a fixed partner reward.
    ///
    /// **Auth:** an API key with `commissions:read`, or a session of any role.
    ///
    /// **Scopes:** `commissions:read`, `commissions:write`, `read`, `full`, `admin`.
    public func getRewardsRules(idempotencyKey: String? = nil) async throws -> [PutRewardsRulesKeyResponse] {
        return try await send("GET", "/v1/rewards/rules", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the ROI breakdown. GET /v1/roi/breakdown
    ///
    /// The summary figures grouped `by` program, partner, cohort (grant month), source or role, best ROI first (cohorts in date order). Partner and program rows also carry their referrals' combined figures. `from`/`to` select grants by grant date (a date covers its whole UTC day), `programId` and `partnerId` narrow them, `windowDays` overrides each program's attribution window (30, 90, 180, 365, or 0 for lifetime), and `currency` views one native currency instead of the reporting currency. `format=csv` returns the same as a CSV file.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// from: Grants (or referrals) from this instant or date, inclusive.
    /// to: Up to this instant, or through the end of this date (UTC), inclusive.
    /// partnerId: The grant's partner: the referrer, or the partner of the referee's referral.
    /// windowDays: Attribution window; default each program's setting. 0 = lifetime.
    /// currency: Default the reporting currency (converted); another code gives that currency only.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getRoiBreakdown(from: String? = nil, to: String? = nil, programId: String? = nil, partnerId: String? = nil, windowDays: Int? = nil, currency: String? = nil, format: String? = nil, by: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetRoiBreakdownResponseDataItem> {
        return try await send("GET", "/v1/roi/breakdown", query: [("from", Self.queryString(from)), ("to", Self.queryString(to)), ("programId", Self.queryString(programId)), ("partnerId", Self.queryString(partnerId)), ("windowDays", Self.queryString(windowDays)), ("currency", Self.queryString(currency)), ("format", Self.queryString(format)), ("by", Self.queryString(by)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getRoiBreakdown`, following the pages.
    public func getRoiBreakdownEach(from: String? = nil, to: String? = nil, programId: String? = nil, partnerId: String? = nil, windowDays: Int? = nil, currency: String? = nil, format: String? = nil, by: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetRoiBreakdownResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getRoiBreakdown(from: from, to: to, programId: programId, partnerId: partnerId, windowDays: windowDays, currency: currency, format: format, by: by, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get ROI data quality. GET /v1/roi/data-quality
    ///
    /// How complete the inputs to ROI are over `from`/`to`: payments with credit-applied info, products with a margin, partners linked to their own customer id, events excluded for a missing FX rate, and a list of gaps with how to fix each.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// from: Grants (or referrals) from this instant or date, inclusive.
    /// to: Up to this instant, or through the end of this date (UTC), inclusive.
    public func getRoiDataQuality(from: String? = nil, to: String? = nil, format: String? = nil, idempotencyKey: String? = nil) async throws -> GetRoiDataQualityResponse {
        return try await send("GET", "/v1/roi/data-quality", query: [("from", Self.queryString(from)), ("to", Self.queryString(to)), ("format", Self.queryString(format))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List credit grants. GET /v1/roi/grants
    ///
    /// Each credit grant in view with its status (`open`, `used`, `expired`, `revoked`) and figures, newest first. Filter by `status`, `role` (`referee` or `referrer`) and `paidBack`. `from`/`to` select grants by grant date (a date covers its whole UTC day), `programId` and `partnerId` narrow them, `windowDays` overrides each program's attribution window (30, 90, 180, 365, or 0 for lifetime), and `currency` views one native currency instead of the reporting currency. `format=csv` returns the same as a CSV file. CSV returns every grant, unpaged.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// from: Grants (or referrals) from this instant or date, inclusive.
    /// to: Up to this instant, or through the end of this date (UTC), inclusive.
    /// partnerId: The grant's partner: the referrer, or the partner of the referee's referral.
    /// windowDays: Attribution window; default each program's setting. 0 = lifetime.
    /// currency: Default the reporting currency (converted); another code gives that currency only.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getRoiGrants(from: String? = nil, to: String? = nil, programId: String? = nil, partnerId: String? = nil, windowDays: Int? = nil, currency: String? = nil, format: String? = nil, status: String? = nil, role: String? = nil, paidBack: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<RoiGrant> {
        return try await send("GET", "/v1/roi/grants", query: [("from", Self.queryString(from)), ("to", Self.queryString(to)), ("programId", Self.queryString(programId)), ("partnerId", Self.queryString(partnerId)), ("windowDays", Self.queryString(windowDays)), ("currency", Self.queryString(currency)), ("format", Self.queryString(format)), ("status", Self.queryString(status)), ("role", Self.queryString(role)), ("paidBack", Self.queryString(paidBack)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getRoiGrants`, following the pages.
    public func getRoiGrantsEach(from: String? = nil, to: String? = nil, programId: String? = nil, partnerId: String? = nil, windowDays: Int? = nil, currency: String? = nil, format: String? = nil, status: String? = nil, role: String? = nil, paidBack: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<RoiGrant, Swift.Error> {
        paginate { cursor in try await self.getRoiGrants(from: from, to: to, programId: programId, partnerId: partnerId, windowDays: windowDays, currency: currency, format: format, status: status, role: role, paidBack: paidBack, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Trace a partner's value. GET /v1/roi/partners/{id}/trace
    ///
    /// The same trace for a partner's own customer identity (through their externalRef).
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// windowDays: Attribution window; default each program's setting. 0 = lifetime.
    public func getRoiPartnersIdTrace(id: String, windowDays: Int? = nil, format: String? = nil, idempotencyKey: String? = nil) async throws -> RoiTrace {
        return try await send("GET", "/v1/roi/partners/\(Self.segment(id))/trace", query: [("windowDays", Self.queryString(windowDays)), ("format", Self.queryString(format))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List value patterns. GET /v1/roi/patterns
    ///
    /// Every value pattern from one detection run, with the matching subjects: `credit_only` (a referee used their credit and paid no cash after within the window), `churn_at_exhaustion` (used it up, paid, then stopped), `bonus_collector` (a partner holding commission credit who never spends their own cash) and `negative_partner` (a partner whose referrals net below zero). Matches wait until the evidence is in, so young customers are never flagged.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getRoiPatterns(idempotencyKey: String? = nil) async throws -> GetRoiPatternsResponse {
        return try await send("GET", "/v1/roi/patterns", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a value pattern. GET /v1/roi/patterns/{pattern}
    ///
    /// The subjects currently matching one pattern, with the detail of each match.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getRoiPatternsPattern(pattern: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<RoiPatternEntry> {
        return try await send("GET", "/v1/roi/patterns/\(Self.segment(pattern))", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getRoiPatternsPattern`, following the pages.
    public func getRoiPatternsPatternEach(pattern: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<RoiPatternEntry, Swift.Error> {
        paginate { cursor in try await self.getRoiPatternsPattern(pattern: pattern, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the ROI summary. GET /v1/roi/summary
    ///
    /// Credit ROI for the grants in view: credit cost, cash and profit from the recipients after each grant, net, ROI, payback share and median days, outstanding credit and how much of it is measured rather than inferred. With `programId`, also status against the program's target ROI. `model=incremental` adds the lift against the program's holdout group; `includeProjection=true` adds the expected payback of open grants. `from`/`to` select grants by grant date (a date covers its whole UTC day), `programId` and `partnerId` narrow them, `windowDays` overrides each program's attribution window (30, 90, 180, 365, or 0 for lifetime), and `currency` views one native currency instead of the reporting currency. `format=csv` returns the same as a CSV file.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// from: Grants (or referrals) from this instant or date, inclusive.
    /// to: Up to this instant, or through the end of this date (UTC), inclusive.
    /// partnerId: The grant's partner: the referrer, or the partner of the referee's referral.
    /// windowDays: Attribution window; default each program's setting. 0 = lifetime.
    /// currency: Default the reporting currency (converted); another code gives that currency only.
    /// model: naive (default): ROI of every grant. incremental: also `incremental`, the program's credit-caused lift against its recorded holdout (requires programId; reporting currency; from/to select referrals by first qualifying payment).
    /// includeProjection: true: also `projection`, the expected payback of the open grants in view from their program-and-role cohort's median curve (labelled 'projection'; needs 50 closed grants per cohort).
    public func getRoiSummary(from: String? = nil, to: String? = nil, programId: String? = nil, partnerId: String? = nil, windowDays: Int? = nil, currency: String? = nil, format: String? = nil, model: String? = nil, includeProjection: String? = nil, idempotencyKey: String? = nil) async throws -> RoiSummary {
        return try await send("GET", "/v1/roi/summary", query: [("from", Self.queryString(from)), ("to", Self.queryString(to)), ("programId", Self.queryString(programId)), ("partnerId", Self.queryString(partnerId)), ("windowDays", Self.queryString(windowDays)), ("currency", Self.queryString(currency)), ("format", Self.queryString(format)), ("model", Self.queryString(model)), ("includeProjection", Self.queryString(includeProjection))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Trace a customer's value. GET /v1/roi/trace/{customerRef}
    ///
    /// Every value event of a customer (and the identities linked to them) in order, with the running net, to see exactly how their ROI was computed. `format=csv` for a file.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    ///
    /// windowDays: Attribution window; default each program's setting. 0 = lifetime.
    public func getRoiTraceCustomerRef(customerRef: String, windowDays: Int? = nil, format: String? = nil, idempotencyKey: String? = nil) async throws -> RoiTrace {
        return try await send("GET", "/v1/roi/trace/\(Self.segment(customerRef))", query: [("windowDays", Self.queryString(windowDays)), ("format", Self.queryString(format))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List billing event fixtures. GET /v1/sandbox/billing-fixtures
    ///
    /// Test mode only. The provider events `POST /v1/sandbox/billing-fixtures` can send, for every billing provider or the one named by `provider`: the provider-neutral `event` name (`payment.paid`, `payment.refunded`, `payment.disputed`, `subscription.created`, `subscription.canceled`, …), the provider's own `native` name, and the `overrides` fields each uses.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    public func getSandboxBillingFixtures(provider: String? = nil, idempotencyKey: String? = nil) async throws -> GetSandboxBillingFixturesResponse {
        return try await send("GET", "/v1/sandbox/billing-fixtures", query: [("provider", Self.queryString(provider))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List Stripe event fixtures. GET /v1/sandbox/stripe-fixtures
    ///
    /// Test mode only. The Stripe event types `POST /v1/sandbox/stripe-fixtures` can send, each with the `overrides` fields it uses. Kept for existing callers: `GET /v1/sandbox/billing-fixtures?provider=stripe` lists the same.
    ///
    /// **Auth:** an API key with `billing:read`, or a session of any role.
    ///
    /// **Scopes:** `billing:read`, `billing:write`, `read`, `full`, `admin`.
    public func getSandboxStripeFixtures(idempotencyKey: String? = nil) async throws -> GetSandboxStripeFixturesResponse {
        return try await send("GET", "/v1/sandbox/stripe-fixtures", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get setup progress. GET /v1/setup/status
    ///
    /// The install checker: which integration steps are done (auth or associate, program and rule, partner, snippet or click, billing, a payable partner, webhooks) and the next steps as hints.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getSetupStatus(idempotencyKey: String? = nil) async throws -> GetSetupStatusResponse {
        return try await send("GET", "/v1/setup/status", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get platform status. GET /v1/status
    ///
    /// Overall state (`operational`, `degraded` or `major_outage`), each component's health and the open incidents. Cached 30 seconds.
    ///
    /// **Auth:** none.
    public func getStatus(idempotencyKey: String? = nil) async throws -> GetStatusResponse {
        return try await send("GET", "/v1/status", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List status incidents. GET /v1/status/incidents
    ///
    /// Recent incidents, newest first, with their updates.
    ///
    /// **Auth:** none.
    ///
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getStatusIncidents(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<Incident> {
        return try await send("GET", "/v1/status/incidents", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getStatusIncidents`, following the pages.
    public func getStatusIncidentsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<Incident, Swift.Error> {
        paginate { cursor in try await self.getStatusIncidents(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get the incidents feed. GET /v1/status/incidents.atom
    ///
    /// The 50 most recent incidents as an Atom feed.
    ///
    /// **Auth:** none.
    public func getStatusIncidentsAtom(idempotencyKey: String? = nil) async throws -> String {
        return try await sendText("GET", "/v1/status/incidents.atom", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get a status incident. GET /v1/status/incidents/{id}
    ///
    /// One incident with its updates.
    ///
    /// **Auth:** none.
    public func getStatusIncidentsId(id: String, idempotencyKey: String? = nil) async throws -> Incident {
        return try await send("GET", "/v1/status/incidents/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the Stripe balance credit key status. GET /v1/stripe-credits/connection
    ///
    /// Whether the Stripe balance credit rail has a key: its own (`source: "stripe_credits"`) or your Stripe payout connection (`source: "payout_connection"`). The key is never returned.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session of any role.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getStripeCreditsConnection(idempotencyKey: String? = nil) async throws -> GetStripeCreditsConnectionResponse {
        return try await send("GET", "/v1/stripe-credits/connection", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List support tool connections. GET /v1/support/apps
    ///
    /// Every support tool Referalli can show referral context in (Chatly cards and AI tools, Intercom, Zendesk, HubSpot, Front, Help Scout, custom), with its card URL, install steps and whether it is set up. Secrets are never returned.
    ///
    /// **Auth:** an API key with `partners:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    public func getSupportApps(idempotencyKey: String? = nil) async throws -> GetSupportAppsResponse {
        return try await send("GET", "/v1/support/apps", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Render a support card for a tool (GET). GET /v1/support/cards/{orgId}/{adapter}
    ///
    /// The same card for tools that fetch with GET (HubSpot legacy CRM cards pass the contact as query parameters). Signed as for the POST form; 404 otherwise.
    ///
    /// **Auth:** none.
    public func getSupportCardsOrgIdAdapter(orgId: String, adapter: String, email: String? = nil, externalId: String? = nil, idempotencyKey: String? = nil) async throws -> GetSupportPlatformChatlyAnswersResponse {
        return try await send("GET", "/v1/support/cards/\(Self.segment(orgId))/\(Self.segment(adapter))", query: [("email", Self.queryString(email)), ("externalId", Self.queryString(externalId))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get referral context for a support contact. GET /v1/support/context
    ///
    /// What a support agent should know about a contact: the partner (status, tier, programs, referral link, pending/approved/paid balances, next payout, open flags) and/or the referred customer (who referred them, when, the referee reward and what is left of it). Name the contact by `partnerExternalRef`, `ext` (a tool's verified external id), `customerRef` or `email`; the email is used only when no stronger key is given. Your org's data only; `partner` and `customer` are null when nothing matches.
    ///
    /// **Auth:** an API key with `partners:read`, or a session with role `owner`, `admin`, `support`, `finance`, `analyst`.
    ///
    /// **Scopes:** `partners:read`, `partners:write`, `read`, `full`, `admin`.
    ///
    /// email: Used only when no stronger key is given.
    /// ext: A support tool's verified external id: matched as a partner externalRef, then as a customer ref.
    public func getSupportContext(email: String? = nil, customerRef: String? = nil, partnerExternalRef: String? = nil, ext: String? = nil, idempotencyKey: String? = nil) async throws -> GetSupportContextResponse {
        return try await send("GET", "/v1/support/context", query: [("email", Self.queryString(email)), ("customerRef", Self.queryString(customerRef)), ("partnerExternalRef", Self.queryString(partnerExternalRef)), ("ext", Self.queryString(ext))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Answer a partner's question for Referalli's own support desk. GET /v1/support/platform/chatly-answers
    ///
    /// Called by Chatly's `referral_answers` preset, never by you: a signed GET (`x-chatly-signature: t=…,v1=…`, HMAC-SHA256 with `CHATLY_TOOL_SECRET` over `<t>.GET.<path and query>.`, 300 s window) with `question` (`referral_link`, `commission_status`, `next_payout`; others get the full answer), `subject` (the verified Atlas `sub`) and `principal` (`partner`, or absent when the tool was created over the API). Read-only: the partner's link, pending, approved and paid commission and next payout in every programme they're in. `{found: false}` when no partner account is linked; 403 without a verified partner identity; 404 for a bad or stale signature.
    ///
    /// **Auth:** none.
    public func getSupportPlatformChatlyAnswers(subject: String? = nil, principal: String? = nil, question: String? = nil, idempotencyKey: String? = nil) async throws -> GetSupportPlatformChatlyAnswersResponse {
        return try await send("GET", "/v1/support/platform/chatly-answers", query: [("subject", Self.queryString(subject)), ("principal", Self.queryString(principal)), ("question", Self.queryString(question))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Export 1099-NEC data. GET /v1/tax/1099
    ///
    /// For each partner with a W-9 on file: the total actually paid in the tax year, in USD at recorded FX rates, and whether a form is required (US$600 or more, or a currency that couldn't be converted, listed in `fxMissingCurrencies` for review).
    ///
    /// **Auth:** an API key with `payouts:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getTax1099(year: Int, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetTax1099ResponseDataItem> {
        return try await send("GET", "/v1/tax/1099", query: [("year", Self.queryString(year)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getTax1099`, following the pages.
    public func getTax1099Each(year: Int, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetTax1099ResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getTax1099(year: year, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List 1099 filings. GET /v1/tax/1099/filings
    ///
    /// A tax year's filings with their provider status and the documents in each.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getTax1099Filings(year: Int, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetTax1099FilingsResponseDataItem> {
        return try await send("GET", "/v1/tax/1099/filings", query: [("year", Self.queryString(year)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getTax1099Filings`, following the pages.
    public func getTax1099FilingsEach(year: Int, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetTax1099FilingsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getTax1099Filings(year: year, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Preview 1099-NEC filings. GET /v1/tax/1099/preview
    ///
    /// Which partners would get a 1099-NEC for a tax year, with amounts and anything missing (W-9s, TINs), without filing.
    ///
    /// **Auth:** an API key with `payouts:read`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:read`, `payouts:write`, `read`, `full`, `admin`.
    public func getTax1099Preview(year: Int, idempotencyKey: String? = nil) async throws -> NecPreview {
        return try await send("GET", "/v1/tax/1099/preview", query: [("year", Self.queryString(year))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Get the test clock. GET /v1/test_clock
    ///
    /// Test mode only (`409 test_mode_only` otherwise). The test org's current time and how far it has been advanced.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    public func getTestClock(idempotencyKey: String? = nil) async throws -> GetTestClockResponse {
        return try await send("GET", "/v1/test_clock", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List captured test emails. GET /v1/test/emails
    ///
    /// Test mode only. Emails the test org would have sent, captured instead of delivered, newest first.
    ///
    /// **Auth:** an API key with `org:read`, or a session of any role.
    ///
    /// **Scopes:** `org:read`, `org:write`, `read`, `full`, `admin`.
    ///
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getTestEmails(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<GetTestEmailsResponseDataItem> {
        return try await send("GET", "/v1/test/emails", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getTestEmails`, following the pages.
    public func getTestEmailsEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<GetTestEmailsResponseDataItem, Swift.Error> {
        paginate { cursor in try await self.getTestEmails(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a value import job. GET /v1/value/import/{jobId}
    ///
    /// Progress and result of a background import: status, processed and total rows, recorded and duplicate counts and row errors.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func getValueImportJobId(jobId: String, idempotencyKey: String? = nil) async throws -> GetValueImportJobIdResponse {
        return try await send("GET", "/v1/value/import/\(Self.segment(jobId))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List API versions. GET /v1/versions
    ///
    /// Every API version, newest first, with what changed in it, the latest version and the deprecation policy. Pin a version with the `Referalli-Version` header or on the API key.
    ///
    /// **Auth:** none.
    public func getVersions(idempotencyKey: String? = nil) async throws -> GetVersionsResponse {
        return try await send("GET", "/v1/versions", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List webhook deliveries. GET /v1/webhook-deliveries
    ///
    /// Deliveries to every endpoint, newest first: topic, status (`pending`, `delivered`, `failed`), attempts, the last response code and, while pending, when the next attempt is. Filter with `endpointId`.
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    ///
    /// endpointId: Only deliveries to this endpoint.
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getWebhookDeliveries(endpointId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<WebhookDelivery> {
        return try await send("GET", "/v1/webhook-deliveries", query: [("endpointId", Self.queryString(endpointId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getWebhookDeliveries`, following the pages.
    public func getWebhookDeliveriesEach(endpointId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<WebhookDelivery, Swift.Error> {
        paginate { cursor in try await self.getWebhookDeliveries(endpointId: endpointId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a webhook delivery. GET /v1/webhook-deliveries/{id}
    ///
    /// One delivery in full: the exact `payload` sent, its `eventId`, and what the endpoint answered last (`lastStatusCode`, the first 2,000 characters of `lastResponseBody`, or `lastError` when there was no response).
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    public func getWebhookDeliveriesId(id: String, idempotencyKey: String? = nil) async throws -> GetWebhookDeliveriesIdResponse {
        return try await send("GET", "/v1/webhook-deliveries/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List webhook endpoints. GET /v1/webhook-endpoints
    ///
    /// Endpoints with their topics, programs, status (`active`, `paused`, `disabled`), secret-rotation state and failure state. Secrets are never returned. `programId` lists only the endpoints limited to that program (org-wide endpoints, which get every program's events, are left out).
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    ///
    /// programId: Only endpoints limited to this program (not the org-wide ones, which get every program's events).
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getWebhookEndpoints(programId: String? = nil, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<WebhookEndpoint> {
        return try await send("GET", "/v1/webhook-endpoints", query: [("programId", Self.queryString(programId)), ("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getWebhookEndpoints`, following the pages.
    public func getWebhookEndpointsEach(programId: String? = nil, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<WebhookEndpoint, Swift.Error> {
        paginate { cursor in try await self.getWebhookEndpoints(programId: programId, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Get a webhook endpoint. GET /v1/webhook-endpoints/{id}
    ///
    /// One endpoint with its status, rotation and failure state.
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    public func getWebhookEndpointsId(id: String, idempotencyKey: String? = nil) async throws -> WebhookEndpoint {
        return try await send("GET", "/v1/webhook-endpoints/\(Self.segment(id))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List an endpoint's deliveries. GET /v1/webhook-endpoints/{id}/deliveries
    ///
    /// What one endpoint was sent, newest first.
    ///
    /// **Auth:** an API key with `webhooks:read`, or a session of any role.
    ///
    /// **Scopes:** `webhooks:read`, `webhooks:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getWebhookEndpointsIdDeliveries(id: String, limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<WebhookDelivery> {
        return try await send("GET", "/v1/webhook-endpoints/\(Self.segment(id))/deliveries", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getWebhookEndpointsIdDeliveries`, following the pages.
    public func getWebhookEndpointsIdDeliveriesEach(id: String, limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<WebhookDelivery, Swift.Error> {
        paginate { cursor in try await self.getWebhookEndpointsIdDeliveries(id: id, limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// List Zapier trigger events. GET /v1/zapier/events
    ///
    /// The event keys Zapier triggers can subscribe to.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session of any role.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `read`, `full`, `admin`.
    public func getZapierEvents(idempotencyKey: String? = nil) async throws -> GetZapierEventsResponse {
        return try await send("GET", "/v1/zapier/events", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// List Zapier hooks. GET /v1/zapier/hooks
    ///
    /// Active Zapier REST hook subscriptions, newest first.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `read`, `full`, `admin`.
    ///
    /// limit: Items per page, 1 to 100 (default 50). From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// starting_after: A cursor: the id of an item (the previous page's `next_cursor`); returns the items after it. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// ending_before: A cursor: returns the items before this item id (the previous page). Not with `starting_after`. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[gte]: Only items created at or after this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    /// created[lte]: Only items created at or before this time (ISO 8601), on lists of timestamped records. From API version 2026-11-01; ignored under 2026-10-21, where lists are a capped plain array.
    public func getZapierHooks(limit: Int? = nil, startingAfter: String? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) async throws -> Page<ZapierHook> {
        return try await send("GET", "/v1/zapier/hooks", query: [("limit", Self.queryString(limit)), ("starting_after", Self.queryString(startingAfter)), ("ending_before", Self.queryString(endingBefore)), ("created[gte]", Self.queryString(createdGte)), ("created[lte]", Self.queryString(createdLte))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Every item of `getZapierHooks`, following the pages.
    public func getZapierHooksEach(limit: Int? = nil, endingBefore: String? = nil, createdGte: String? = nil, createdLte: String? = nil, idempotencyKey: String? = nil) -> AsyncThrowingStream<ZapierHook, Swift.Error> {
        paginate { cursor in try await self.getZapierHooks(limit: limit, startingAfter: cursor, endingBefore: endingBefore, createdGte: createdGte, createdLte: createdLte, idempotencyKey: idempotencyKey) }
    }

    /// Poll a Zapier trigger. GET /v1/zapier/triggers/{event}
    ///
    /// Zapier polling and sample data: the latest `limit` events of that kind, newest first, in the shape the hook delivers. Always a plain array (Zapier's contract), whatever the API version.
    ///
    /// **Auth:** an API key with `integrations:read`, or a session of any role.
    ///
    /// **Scopes:** `integrations:read`, `integrations:write`, `read`, `full`, `admin`.
    public func getZapierTriggersEvent(event: String, limit: Int? = nil, idempotencyKey: String? = nil) async throws -> GetZapierTriggersEventResponse {
        return try await send("GET", "/v1/zapier/triggers/\(Self.segment(event))", query: [("limit", Self.queryString(limit))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Edit a status incident. PATCH /v1/admin/status/incidents/{id}
    ///
    /// Platform admins only. Changes an incident's title, severity, state, body or affected components. Setting `state: "resolved"` stamps `resolvedAt`.
    ///
    /// **Auth:** a platform admin session.
    public func patchAdminStatusIncidentsId(id: String, _ body: PatchAdminStatusIncidentsIdBody, idempotencyKey: String? = nil) async throws -> Incident {
        return try await send("PATCH", "/v1/admin/status/incidents/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update an API key. PATCH /v1/api-keys/{id}
    ///
    /// Renames a key or changes its pinned `apiVersion`, `owner`, expiry (`expiresInDays` from now, or `expiresAt`, an ISO 8601 time at most 3650 days out, not both; `null` removes it) or `programIds` (`null` makes it org-wide); `apiVersion: "latest"` pins it to today's newest version. A new expiry re-arms the `api_key.expiring` notices. `name` renames it; `scopes` replaces its scopes. Revoked keys are 404. Needs an owner or admin session, or an API key with the `admin` scope. A key holding `api_keys:mint` may also do this for keys it minted itself (403 for any other), but only to narrow `scopes` and `programIds`, never widen them or make the key org-wide. Audited.
    ///
    /// **Auth:** an API key with `api_keys:mint`, or a session of any role.
    ///
    /// **Scopes:** `api_keys:mint`, `admin`.
    public func patchApiKeysId(id: String, _ body: PatchApiKeysIdBody, idempotencyKey: String? = nil) async throws -> PatchApiKeysIdResponse {
        return try await send("PATCH", "/v1/api-keys/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update an auth connection. PATCH /v1/auth/connections/{id}
    ///
    /// Pauses or resumes a connection, renames it, changes `autoEnrollUsers` or the destination of auto-created links, turns `resolveBillingCustomers` on or off, or (signed-protocol connections) sets `signatureVersion`: `v2` to require request-line signatures, `v1+v2` to accept both again. `resolveBillingCustomers` (any provider, default false): a billing customer that arrives with no customerRef (no `referalli_customer_ref` metadata, no `customerRefMetadataKey` hit) in a program this connection serves (within the billing connection's `programIds`) is resolved through this connection's users: `referalli_user_id` or `<provider>_user_id` metadata naming a user it reported, else exactly one user whose current email is the customer's and verified. The billing link is recorded as metadata would record it; none or several matches record `ignoredReason: "identity_unresolved"` / `"identity_ambiguous"` on the billing event. Explicit metadata always wins. Matching uses only the org's own data. `tokenVerification` replaces the widget-session verifier (an HS256 secret is kept when `sharedSecret` is left out; `null` removes it) and `allowedOrigins` replaces the origin list. The auth platform itself can also call this path, signed with the connection secret and with only `allowedOrigins` in the body (no session), to set its origins; see `PUT /v1/auth/connections/{id}/origins`.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func patchAuthConnectionsId(id: String, _ body: PatchAuthConnectionsIdBody, idempotencyKey: String? = nil) async throws -> PatchAuthConnectionsIdResponse {
        return try await send("PATCH", "/v1/auth/connections/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a connection's allowed origins (signed protocol, PATCH). PATCH /v1/auth/connections/{id}/origins
    ///
    /// The same as `PUT /v1/auth/connections/{id}/origins`. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** none.
    public func patchAuthConnectionsIdOrigins(id: String, _ body: PatchAuthConnectionsIdOriginsBody, idempotencyKey: String? = nil) async throws -> PatchAuthConnectionsIdOriginsResponse {
        return try await send("PATCH", "/v1/auth/connections/\(Self.segment(id))/origins", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update a billing connection. PATCH /v1/billing/connections/{id}
    ///
    /// Renames a connection, sets `status` (`paused` makes its webhook URL refuse events until set back to `active`), or sets its product `filter` (`null` removes it) or `programIds` (`null` = every program). Both apply to events received from then on. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func patchBillingConnectionsId(id: String, _ body: PatchBillingConnectionsIdBody, idempotencyKey: String? = nil) async throws -> BillingConnection {
        return try await send("PATCH", "/v1/billing/connections/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update the organization. PATCH /v1/org
    ///
    /// Changes the org name, merges keys into `settings` (a free-form map) and turns `payoutKycRequired` on or off. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func patchOrg(_ body: PatchOrgBody, idempotencyKey: String? = nil) async throws -> PatchOrgResponse {
        return try await send("PATCH", "/v1/org", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Change a member's role. PATCH /v1/org/members/{userId}
    ///
    /// Changes a member's role. Only owners change owner roles, and the last owner can't be demoted (409). Audited. Live mode only.
    ///
    /// **Auth:** an API key with `team:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func patchOrgMembersUserId(userId: String, _ body: PatchOrgMembersUserIdBody, idempotencyKey: String? = nil) async throws -> PatchOrgMembersUserIdResponse {
        return try await send("PATCH", "/v1/org/members/\(Self.segment(userId))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update SSO settings. PATCH /v1/org/sso
    ///
    /// Requires SSO for members on the org's SSO domains (`requireSso`; needs an active connection and the owner signed in through SSO, so nobody is locked out) and maps identity-provider roles to Referalli roles. Owner only. Live mode only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func patchOrgSso(_ body: PatchOrgSsoBody, idempotencyKey: String? = nil) async throws -> PatchOrgSsoResponse {
        return try await send("PATCH", "/v1/org/sso", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update a partner group. PATCH /v1/partner-groups/{id}
    ///
    /// Changes a group's terms, or archives it (`archived: true`); archived groups take no new members.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func patchPartnerGroupsId(id: String, _ body: PatchPartnerGroupsIdBody, idempotencyKey: String? = nil) async throws -> PartnerGroup {
        return try await send("PATCH", "/v1/partner-groups/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update a partner. PATCH /v1/partners/{id}
    ///
    /// Changes the display name, status (`active`, `suspended`, `banned`, `archived`), tags, notes or externalRef (`null` clears it). Suspended partners keep earning but are not paid; banned ones stop attributing. 409 when another partner has the externalRef. Audited.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func patchPartnersId(id: String, _ body: PatchPartnersIdBody, idempotencyKey: String? = nil) async throws -> Partner {
        return try await send("PATCH", "/v1/partners/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Change a partner's payout threshold. PATCH /v1/partners/{id}/payout-profile
    ///
    /// Changes only the minimum balance before a payout (`minThresholdMinor`). 404 when the partner has no profile. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func patchPartnersIdPayoutProfile(id: String, _ body: PatchPartnersIdPayoutProfileBody, idempotencyKey: String? = nil) async throws -> PatchPartnersIdPayoutProfileResponse {
        return try await send("PATCH", "/v1/partners/\(Self.segment(id))/payout-profile", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Change part of the portal design draft. PATCH /v1/portal/theme/draft
    ///
    /// Deep-merges into the draft (or, with no draft, into a copy of what is published): objects merge key by key, arrays and values replace, `null` deletes a key. The result is validated as a whole. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func patchPortalThemeDraft(_ body: [String: JSONValue], idempotencyKey: String? = nil) async throws -> GetPortalThemeResponse {
        return try await send("PATCH", "/v1/portal/theme/draft", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update a program. PATCH /v1/programs/{id}
    ///
    /// Changes any program field or setting; omitted fields keep their value, and `publicPage` is merged. Changing `termsMd` records a new terms version. Setting `status` to `paused` or `archived` stops new attribution. `signupPaymentGraceMinutes` (0 to 1440, default 5) is how long before the referral's sign-up time a payment still earns. `mobileApp` (iOS Team ID and bundle id, Android package and signing-certificate fingerprints) publishes the program's apps in the universal-links and App Links files on the org's link hosts. `destinationUrl` moves the program's default link destination: every link still on the old default (the widget's or a sign-in connection's) is repointed in the same call, custom destinations stay, and links already shared follow at click time; `{code}` in it becomes the link's code. A `publicHandle` another program has is `409 conflict` with `details: { field: 'publicHandle' }`. Audited.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func patchProgramsId(id: String, _ body: PatchProgramsIdBody, idempotencyKey: String? = nil) async throws -> Program {
        return try await send("PATCH", "/v1/programs/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Pause or resume a referral. PATCH /v1/referrals/{id}
    ///
    /// Sets `status` to `paused` (no new commissions) or back to `active`. Only active referrals can be paused and only paused ones resumed (409 otherwise); setting the current status is a no-op. Publishes `referral.paused` or `referral.resumed`. Audited.
    ///
    /// **Auth:** an API key with `referrals:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func patchReferralsId(id: String, _ body: PatchReferralsIdBody, idempotencyKey: String? = nil) async throws -> Referral {
        return try await send("PATCH", "/v1/referrals/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update a webhook endpoint. PATCH /v1/webhook-endpoints/{id}
    ///
    /// Changes the URL, topics, programs (`null` or `[]` for every program) or legacy signature, or pauses it (`status: "paused"`, deliveries held). Setting `active` re-enables a paused or auto-disabled endpoint: held deliveries resume and the failure clock starts over. `warnings` has `domain_changed` when the URL moves to another host. Audited.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func patchWebhookEndpointsId(id: String, _ body: PatchWebhookEndpointsIdBody, idempotencyKey: String? = nil) async throws -> PatchWebhookEndpointsIdResponse {
        return try await send("PATCH", "/v1/webhook-endpoints/\(Self.segment(id))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Close your own account. POST /v1/account/close
    ///
    /// Closes the signed-in merchant user or partner account: every session ends, identity is redacted and commission records stay under a pseudonym. Send `confirm` with the account's email. Refused (409) for an organization's only owner or a partner still owed money. Step-up: `x-totp-code` when two-factor is on, otherwise a sign-in less than 15 minutes old (else 401 `step_up_required`).
    ///
    /// **Auth:** a partner session.
    public func postAccountClose(_ body: PostAccountCloseBody, idempotencyKey: String? = nil) async throws -> PostAccountCloseResponse {
        return try await send("POST", "/v1/account/close", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set an organization's plan. POST /v1/admin/orgs/{id}/plan
    ///
    /// Platform admins only. Moves an org to a plan without checkout.
    ///
    /// **Auth:** a platform admin session.
    public func postAdminOrgsIdPlan(id: String, _ body: PostAdminOrgsIdPlanBody, idempotencyKey: String? = nil) async throws -> PostAdminOrgsIdPlanResponse {
        return try await send("POST", "/v1/admin/orgs/\(Self.segment(id))/plan", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Suspend an organization. POST /v1/admin/orgs/{id}/suspend
    ///
    /// Platform admins only. Suspends an org with a reason; its members and keys get 403 until it's unsuspended.
    ///
    /// **Auth:** a platform admin session.
    public func postAdminOrgsIdSuspend(id: String, _ body: PostAdminOrgsIdSuspendBody, idempotencyKey: String? = nil) async throws -> PostAdminOrgsIdSuspendResponse {
        return try await send("POST", "/v1/admin/orgs/\(Self.segment(id))/suspend", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Unsuspend an organization. POST /v1/admin/orgs/{id}/unsuspend
    ///
    /// Platform admins only. Lifts a suspension.
    ///
    /// **Auth:** a platform admin session.
    public func postAdminOrgsIdUnsuspend(id: String, idempotencyKey: String? = nil) async throws -> PostAdminOrgsIdUnsuspendResponse {
        return try await send("POST", "/v1/admin/orgs/\(Self.segment(id))/unsuspend", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Ban a partner account. POST /v1/admin/partner-accounts/{id}/ban
    ///
    /// Platform admins only. Bans a partner account across the platform and signs it out everywhere.
    ///
    /// **Auth:** a platform admin session.
    public func postAdminPartnerAccountsIdBan(id: String, idempotencyKey: String? = nil) async throws -> PostAdminPartnerAccountsIdBanResponse {
        return try await send("POST", "/v1/admin/partner-accounts/\(Self.segment(id))/ban", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Unban a partner account. POST /v1/admin/partner-accounts/{id}/unban
    ///
    /// Platform admins only. Lifts a platform ban.
    ///
    /// **Auth:** a platform admin session.
    public func postAdminPartnerAccountsIdUnban(id: String, idempotencyKey: String? = nil) async throws -> PostAdminPartnerAccountsIdUnbanResponse {
        return try await send("POST", "/v1/admin/partner-accounts/\(Self.segment(id))/unban", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Open a status incident. POST /v1/admin/status/incidents
    ///
    /// Platform admins only. Opens an incident on the status page (and mirrors it to the hosted status space when configured).
    ///
    /// **Auth:** a platform admin session.
    public func postAdminStatusIncidents(_ body: PostAdminStatusIncidentsBody, idempotencyKey: String? = nil) async throws -> Incident {
        return try await send("POST", "/v1/admin/status/incidents", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Post an incident update. POST /v1/admin/status/incidents/{id}/updates
    ///
    /// Platform admins only. Adds a timestamped update to an incident and moves it to the given state.
    ///
    /// **Auth:** a platform admin session.
    public func postAdminStatusIncidentsIdUpdates(id: String, _ body: PostAdminStatusIncidentsIdUpdatesBody, idempotencyKey: String? = nil) async throws -> Incident {
        return try await send("POST", "/v1/admin/status/incidents/\(Self.segment(id))/updates", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Register an AI agent. POST /v1/agents/register
    ///
    /// Registers (or updates) an AI agent identity, proven by a wallet signature over a nonce from `POST /v1/partner/auth/wallet/nonce`. The nonce is single use and valid for 10 minutes. `instantPayout` pays the agent per outcome on the crypto rail. No API key: the signature is the credential.
    ///
    /// **Auth:** none.
    public func postAgentsRegister(_ body: PostAgentsRegisterBody, idempotencyKey: String? = nil) async throws -> PostAgentsRegisterResponse {
        return try await send("POST", "/v1/agents/register", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Scan for anomalies. POST /v1/anomalies/scan
    ///
    /// Compares the last 24 hours of clicks, sign-ups and revenue with the trailing 7-day average and returns this org's spikes (3x or more) and drops (under 20%). Findings also become notifications; nothing is changed automatically. Also runs hourly.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func postAnomaliesScan(idempotencyKey: String? = nil) async throws -> PostAnomaliesScanResponse {
        return try await send("POST", "/v1/anomalies/scan", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create an API key. POST /v1/api-keys
    ///
    /// Expiry is `expiresInDays` or `expiresAt` (ISO 8601, at most 3650 days out), not both. Mints a secret key (`rk_live_…` / `rk_test_…`), shown only in this response (and in its `Idempotency-Key` replay: a retry with the same key and body within 24 hours returns this response again, secret included, without minting another). `scopes` defaults to `full`; a key can't grant scopes it doesn't hold. `mode` picks live, test or a matching pair of both (`both` returns `{ pairId, live, test }`); a test-mode caller can mint test keys only. `publishable: true` mints a browser-safe `rk_pub_` key limited to `programs:read` and `events:write` from `allowedOrigins`. `apiVersion` pins the key to a version, or `latest` (the default) to the newest version at the time of the call; the pin never moves on its own (a key keeps answering in that version after newer ones ship) until you `PATCH` it or send a `referalli-version` header. A key pinned to `2026-10-21` gets every list as a capped plain array instead of the paginated envelope. `programIds` limits the key to those programs (their partners, links, referrals, commissions, enrollments, webhook endpoints whose `programIds` are all within the key's, with their deliveries, billing connections likewise, auth connections of those programs, and privacy lookup, export, forget and requests for people in those programs); a program-scoped key gets 403 `program_scoped_key` on org-wide endpoints (keys, team, org settings, the rest of billing, payouts, the event feed, analytics, creating programs). An `api_keys:mint` key may also call this (and no other key endpoint): it can't mint `admin` or `api_keys:mint` keys or scopes it doesn't hold, and a program-scoped one must send `programIds` within its own (`403` otherwise). Needs an owner or admin session, or an API key with the `admin` scope. Audited.
    ///
    /// **Auth:** an API key with `api_keys:mint`, or a session of any role.
    ///
    /// **Scopes:** `api_keys:mint`, `admin`.
    public func postApiKeys(_ body: PostApiKeysBody, idempotencyKey: String? = nil) async throws -> PostApiKeysResponse {
        return try await send("POST", "/v1/api-keys", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Rotate an API key. POST /v1/api-keys/{id}/rotate
    ///
    /// Mints a replacement key with the same name, scopes, origins, version pin, owner, programs and lifetime (an expiring key's new expiry is the same length from now), returned once with `rotatedFrom: { id, expiresAt }`. The old key keeps working for `graceHours` (default 24, at most 168, 0 = stop now), then expires; it gets no `api_key.expiring` notice. An expired or revoked key can't be rotated (409 `api_key_expired` / 404). Needs an owner or admin session, or an API key with the `admin` scope. A key holding `api_keys:mint` may also do this for keys it minted itself (403 for any other). Audited.
    ///
    /// **Auth:** an API key with `api_keys:mint`, or a session of any role.
    ///
    /// **Scopes:** `api_keys:mint`, `admin`.
    public func postApiKeysIdRotate(id: String, _ body: PostApiKeysIdRotateBody, idempotencyKey: String? = nil) async throws -> PostApiKeysIdRotateResponse {
        return try await send("POST", "/v1/api-keys/\(Self.segment(id))/rotate", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a marketing asset. POST /v1/assets
    ///
    /// Adds a marketing asset (`banner`, `copy`, `video` or `logo`) to a program for its approved partners, or only for one group's members with `groupId`.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postAssets(_ body: PostAssetsBody, idempotencyKey: String? = nil) async throws -> PostAssetsResponse {
        return try await send("POST", "/v1/assets", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Replay attribution. POST /v1/attribution/replay
    ///
    /// Deterministically recomputes attribution for a program's referrals from the recorded clicks and identity links, under its current model. Returns what changed. Audited.
    ///
    /// **Auth:** an API key with `referrals:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func postAttributionReplay(_ body: PostAttributionReplayBody, idempotencyKey: String? = nil) async throws -> PostAttributionReplayResponse {
        return try await send("POST", "/v1/attribution/replay", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Receive an OpenID Connect back-channel logout. POST /v1/auth/backchannel-logout
    ///
    /// The `backchannel_logout_uri` of Referalli's own sign-in client. Takes a form-encoded `logout_token` (OpenID Connect Back-Channel Logout 1.0): verified against the issuer's keys, `aud`, `events`, a fresh `iat`, no `nonce`, and a single-use `jti`; then ends the Referalli sessions for its `sid` (or every session of its `sub`). Answers 503 until the deployment sets IDP_LOGOUT_SYNC=true.
    ///
    /// **Auth:** none.
    public func postAuthBackchannelLogout(_ body: PostAuthBackchannelLogoutBody, idempotencyKey: String? = nil) async throws -> PostAuthBackchannelLogoutResponse {
        return try await send("POST", "/v1/auth/backchannel-logout", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect an auth platform. POST /v1/auth/connections
    ///
    /// Connects your sign-up system so new users are attributed server-side without calling associate: `clerk`, `supabase`, `workos` or `generic` receive the platform's user webhooks at the returned URL; `atlas` and `custom` call the signed protocol endpoints under `/v1/auth/connections/{id}/`. `autoEnrollUsers` makes every new user a partner too. `tokenVerification` and `allowedOrigins` let the referral widget run with no server route (`POST /v1/widget/session`); an HS256 `sharedSecret` is sealed and never returned. Returns the signing secret once. 409 when an Atlas instance already has a connection.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func postAuthConnections(_ body: PostAuthConnectionsBody, idempotencyKey: String? = nil) async throws -> CreatedAuthConnection {
        return try await send("POST", "/v1/auth/connections", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set an organization's owner (signed protocol). POST /v1/auth/connections/{id}/accounts
    ///
    /// The `accounts` capability: an organization the app bills under (`accountRef`: its id in billing metadata, e.g. Atlas's `external_id`) is owned by `ownerCustomerRef` (a user the connection reports). Its payments earn for the owner's referral; send it again whenever ownership changes. When the organization's id changes, send the new id as `accountRef` with the old one as `previousAccountRef` (the owner carries over unless `ownerCustomerRef` is sent): the old id then follows the new one. When it is deleted, send `{ accountRef, deleted: true }`: it has no owner from then on, so its payments earn nothing (earned commissions stay; refunds still reverse them). Same as `PUT /v1/billing/accounts/{accountRef}/owner` and `DELETE /v1/billing/accounts/{accountRef}`; returns `{ ok, accountRef, ownerCustomerRef, previousOwnerCustomerRef, renamedFrom, deleted, changed, relinked, reprocessedPayments }`; a repeat answers `changed: false`. Publishes `billing_account.owner_changed`. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** none.
    public func postAuthConnectionsIdAccounts(id: String, _ body: PostAuthConnectionsIdAccountsBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdAccountsResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/accounts", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Change a user's id (signed protocol). POST /v1/auth/connections/{id}/aliases
    ///
    /// The app stamped or changed a user's id after the sign-up was filed: referrals and identity move from `fromCustomerRef` to `toCustomerRef`. Publishes `customer.aliased`. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func postAuthConnectionsIdAliases(id: String, _ body: PostAuthConnectionsIdAliasesBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdAliasesResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/aliases", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Erase a user (signed protocol). POST /v1/auth/connections/{id}/erase
    ///
    /// The platform deleted a user or fulfilled an erasure request: the customer's referral data and their partner record are erased. An unknown user succeeds with nothing erased. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func postAuthConnectionsIdErase(id: String, _ body: PostAuthConnectionsIdEraseBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdEraseResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/erase", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Enrol a user as a partner (signed protocol). POST /v1/auth/connections/{id}/partners
    ///
    /// A user asked to become a partner from the platform, with the code they chose: they are enrolled now (whatever `autoEnrollUsers` says), with a coupon and, when the connection has a destination, a link. 409 when the code is held by someone else. Signed like the other protocol calls (`x-referalli-signature`, `x-referalli-id`).
    ///
    /// **Auth:** none.
    public func postAuthConnectionsIdPartners(id: String, _ body: PostAuthConnectionsIdPartnersBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdPartnersResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/partners", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Test an auth connection (signed protocol). POST /v1/auth/connections/{id}/ping
    ///
    /// Proves the secret works: returns the connection, its program and org, the server time (to check clock skew) and `capabilities` (`{ partners: true, origins: true, accounts: true }`: user-chosen referral codes through `/partners`, setting `allowedOrigins` through `PUT …/origins` or a signed PATCH, and organization owners through `/accounts`). Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func postAuthConnectionsIdPing(id: String, _ body: [String: JSONValue], idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdPingResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/ping", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Revoke the previous auth secret. POST /v1/auth/connections/{id}/revoke-previous-secret
    ///
    /// Ends the rotation overlap at once: only the newest secret verifies from now on.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func postAuthConnectionsIdRevokePreviousSecret(id: String, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdRevokePreviousSecretResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/revoke-previous-secret", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Rotate an auth connection secret. POST /v1/auth/connections/{id}/rotate-secret
    ///
    /// Issues a new signing secret, returned once. The previous one keeps verifying for 24 hours, or until revoked.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func postAuthConnectionsIdRotateSecret(id: String, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdRotateSecretResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/rotate-secret", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Report a user signal (signed protocol). POST /v1/auth/connections/{id}/signals
    ///
    /// A later verdict about a user: `email_verified` releases a hold for an unverified email, `fraud_confirmed` or `self_referral` voids their referral, `banned`/`unbanned` follow on their partner record. `details` is kept as evidence. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func postAuthConnectionsIdSignals(id: String, _ body: PostAuthConnectionsIdSignalsBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdSignalsResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/signals", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Attribute a new user (signed protocol). POST /v1/auth/connections/{id}/signups
    ///
    /// The auth platform reports a new user with the referral context captured at sign-up (`referral.code`, or with cookie consent `clickId`/`anonId`) and optional risk signals. The user is attributed (risky sign-ups are held for review), optionally made a partner with their own link, and the answer says why with reason codes. `test: true` or `atlas-test: 1` simulates without storing. Repeating the same user is idempotent. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func postAuthConnectionsIdSignups(id: String, _ body: PostAuthConnectionsIdSignupsBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdSignupsResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/signups", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update a user (signed protocol). POST /v1/auth/connections/{id}/users
    ///
    /// The user changed: email and name follow to their partner record, `suspended` suspends it, `deleted` erases. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** a signature (see above); no API key.
    public func postAuthConnectionsIdUsers(id: String, _ body: PostAuthConnectionsIdUsersBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsIdUsersResponse {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/users", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mint a widget token for a user (signed protocol). POST /v1/auth/connections/{id}/widget-tokens
    ///
    /// For platforms that hold the connection secret (hosted account pages, sessions that aren't JWTs): a referral-widget token for `customerRef` in the connection's program, the same answer as `POST /v1/widget/session`. With the program's widget `autoEnroll`, a non-partner is enrolled only when `emailVerified` is true; otherwise `404 not_enrolled`. `ttlSeconds` 60 to 3600 (default 900). Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** none.
    public func postAuthConnectionsIdWidgetTokens(id: String, _ body: PostAuthConnectionsIdWidgetTokensBody, idempotencyKey: String? = nil) async throws -> WidgetSession {
        return try await send("POST", "/v1/auth/connections/\(Self.segment(id))/widget-tokens", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve a one-click install. POST /v1/auth/connections/install
    ///
    /// The dashboard's consent step for `GET /v1/oauth/authorize`: `allow` returns the redirect back to the platform with a single-use code (10 minutes) for the chosen program; `deny` returns it with `error=access_denied`. Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func postAuthConnectionsInstall(_ body: PostAuthConnectionsInstallBody, idempotencyKey: String? = nil) async throws -> PostAuthConnectionsInstallResponse {
        return try await send("POST", "/v1/auth/connections/install", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Sign out. POST /v1/auth/logout
    ///
    /// Ends the browser session (and any portal-domain sessions handed off from it) and clears the cookies. Returns the identity provider's `logoutUrl` to end the provider session too, or `null`.
    ///
    /// **Auth:** none.
    public func postAuthLogout(idempotencyKey: String? = nil) async throws -> PostAuthLogoutResponse {
        return try await send("POST", "/v1/auth/logout", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Activate a plan directly. POST /v1/billing/activate
    ///
    /// Moves the org to a plan without checkout: anyone may move to Free (after cancelling a subscription); paid plans only for platform admins or self-hosted deployments (403 otherwise). Owner only. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingActivate(_ body: PostBillingActivateBody, idempotencyKey: String? = nil) async throws -> PostBillingActivateResponse {
        return try await send("POST", "/v1/billing/activate", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Start a plan checkout. POST /v1/billing/checkout
    ///
    /// Creates a checkout session for a paid plan and returns its `url` to redirect to. 400 when billing is not configured on this deployment.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingCheckout(_ body: PostBillingCheckoutBody, idempotencyKey: String? = nil) async throws -> PostBillingCheckoutResponse {
        return try await send("POST", "/v1/billing/checkout", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a billing connection. POST /v1/billing/connections
    ///
    /// Connects a billing provider (`stripe`, `paddle`, `lemonsqueezy`, `polar`, `chargebee`, `shopify`, `recurly`, `braintree`, `woocommerce`, `bigcommerce` or `generic`) so its payment webhooks become commissions. Returns the `webhookUrl` path to register with the provider and its signing secret (generated unless you pass the provider's own `webhookSecret`); the secret is returned only here. For Stripe, pass `stripeKey` (a restricted key with Webhook Endpoints write and Customers write) instead of `webhookSecret`: Referalli registers a webhook endpoint at this connection's URL on your Stripe account with the events it reads and API version 2025-03-31.basil, stores the signing secret Stripe returns and answers with `stripeWebhookEndpointId`; nothing is saved unless Stripe registered it. If an endpoint on the account already points at one of your Stripe connections, it is updated and that connection returned with `reused: true` (one still `awaiting_secret` gets a fresh endpoint and its secret). `creditRail: { programId, ...settings }` also stores the key as that program's Stripe credit key and applies the `PUT /v1/programs/{id}/stripe-credits` settings (`enabled` defaults to true). The key is never returned and is stored only for `creditRail`. Deleting the connection leaves the Stripe endpoint in place. Errors: `422 stripe_key_wrong_mode`, `422 stripe_key_invalid`, `422 stripe_key_permission`, `502 stripe_unavailable`. `autoRegister: true` with the provider's API `credentials` does the same for Shopify (`shopDomain`, `accessToken`, `apiSecret`), Paddle (`apiKey`), Polar (`accessToken`), Lemon Squeezy (`apiKey`, `storeId`), BigCommerce (`storeHash`, `apiToken`) and WooCommerce (`siteUrl`, `consumerKey`, `consumerSecret`), and for Stripe with `credentials: { secretKey }` (the `stripeKey` path); Chargebee, Recurly and Braintree have no webhook API and are set up by hand. It registers webhooks at this connection's URL with exactly the events Referalli reads, stores the secret that signs them (the provider's, Shopify's app API secret, or one Referalli chooses) and answers `active` with `providerWebhookIds`; a re-run reuses them (`reused: true`), nothing is saved unless the provider registered them, and the credentials are never returned and are kept (sealed) only for BigCommerce, whose connector reads orders with them. Errors: `422 provider_credentials_invalid`, `422 provider_permission`, `502 provider_unavailable`. A `filter` (`productIds`, `priceIds`, `skus` and/or exact `metadata`) limits which payments and subscription events earn when one provider account sells several products; the rest are recorded as `ignored_by_filter`. `programIds` limits the connection to those programs when one org runs several products: its events earn only through referrals in them, and a payment from a customer referred only in another program earns nothing (the event records `ignoredReason: "no_referral_in_scope"`); null or omitted = every program. A program-scoped API key must send `programIds` within its own. `status` is `awaiting_secret` when a provider that issues its own signing secret (Stripe, Paddle, Polar, Shopify, Recurly, Braintree) is connected without `webhookSecret`: its webhooks fail `401` until `PUT …/secret` stores the provider's secret, then it reads `active`. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingConnections(_ body: PostBillingConnectionsBody, idempotencyKey: String? = nil) async throws -> CreatedBillingConnection {
        return try await send("POST", "/v1/billing/connections", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Send events to a generic connection. POST /v1/billing/connections/{id}/events
    ///
    /// The generic connection's webhook body (`{ "events": [...] }`, up to 500) sent with an API key instead of the connection's HMAC signature, so your server needs no second secret. Runs the same processing as `POST /webhooks/billing/{id}`: paid invoices become conversions and commissions, refunds and disputes reverse them, and each event is idempotent by `providerEventId` (a resend answers `duplicate: true`), whichever of the two routes sent it first. Needs `billing:write`; a program-scoped key reaches only connections limited to its own programs. `404` for an unknown, deleted or paused connection; `409 conflict` for a connection that isn't `generic` (those take their provider's webhooks).
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingConnectionsIdEvents(id: String, _ body: PostBillingConnectionsIdEventsBody, idempotencyKey: String? = nil) async throws -> PostBillingConnectionsIdEventsResponse {
        return try await send("POST", "/v1/billing/connections/\(Self.segment(id))/events", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Rotate the webhook signing secret. POST /v1/billing/connections/{id}/rotate-secret
    ///
    /// Generates a new signing secret, returned once. The previous one keeps verifying until `previousSecretExpiresAt` (24 hours). Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingConnectionsIdRotateSecret(id: String, idempotencyKey: String? = nil) async throws -> PostBillingConnectionsIdRotateSecretResponse {
        return try await send("POST", "/v1/billing/connections/\(Self.segment(id))/rotate-secret", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Preview the value mapping. POST /v1/billing/connections/{id}/value-mapping/preview
    ///
    /// Applies the saved mapping (or a draft `mapping`) to a sample `payload` and returns what would be recorded. Writes nothing. A generic-connector body with `events` gets one result per event.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingConnectionsIdValueMappingPreview(id: String, _ body: PostBillingConnectionsIdValueMappingPreviewBody, idempotencyKey: String? = nil) async throws -> ValueMappingPreview {
        return try await send("POST", "/v1/billing/connections/\(Self.segment(id))/value-mapping/preview", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Release a held payment. POST /v1/billing/events/{id}/release
    ///
    /// A payment over its connection's `maxAmountMinor` (default 1,000,000,000 minor units), or dated more than a day ahead, is recorded with `status: "held"` and earns nothing. Releasing it says it is real: it earns as it would have on arrival, and any refund that waited for it applies.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingEventsIdRelease(id: String, idempotencyKey: String? = nil) async throws -> PostBillingEventsIdReleaseResponse {
        return try await send("POST", "/v1/billing/events/\(Self.segment(id))/release", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Add an internal customer. POST /v1/billing/internal-customers
    ///
    /// Marks a customer ref (the provider customer id, or the `referalli_customer_ref` it is linked to) as internal: its payments are recorded as `ignored_by_filter` from now on. Idempotent; a repeat updates the note. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingInternalCustomers(_ body: PostBillingInternalCustomersBody, idempotencyKey: String? = nil) async throws -> PostBillingInternalCustomersResponse {
        return try await send("POST", "/v1/billing/internal-customers", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Open the subscription portal. POST /v1/billing/portal
    ///
    /// Returns the `url` of the billing portal where the owner manages or cancels the subscription. 400 before there is a subscription.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postBillingPortal(idempotencyKey: String? = nil) async throws -> PostBillingPortalResponse {
        return try await send("POST", "/v1/billing/portal", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Set a custom portal domain. POST /v1/branding/domain
    ///
    /// Starts serving the partner portal on your own domain (such as `partners.example.com`), in your branding: returns the CNAME and TXT records to add. Needs a plan with custom domains (402 otherwise).
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postBrandingDomain(_ body: PostBrandingDomainBody, idempotencyKey: String? = nil) async throws -> PostBrandingDomainResponse {
        return try await send("POST", "/v1/branding/domain", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Verify the portal domain. POST /v1/branding/domain/verify
    ///
    /// Checks the portal domain's TXT record and CNAME, routes it and reports `provisioning` or `active` as for the link domain.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postBrandingDomainVerify(idempotencyKey: String? = nil) async throws -> PostBrandingLinkDomainVerifyResponse {
        return try await send("POST", "/v1/branding/domain/verify", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Set a custom link domain. POST /v1/branding/link-domain
    ///
    /// Starts using your own domain (such as `go.example.com`) for partner links: returns the CNAME target and the TXT record that proves you control it. Links move onto it once verified. Needs a plan with custom domains (402 otherwise); 409 when the domain is in use.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postBrandingLinkDomain(_ body: PostBrandingLinkDomainBody, idempotencyKey: String? = nil) async throws -> PostBrandingLinkDomainResponse {
        return try await send("POST", "/v1/branding/link-domain", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Verify the link domain. POST /v1/branding/link-domain/verify
    ///
    /// Checks the TXT record and the CNAME. When both are right the domain is routed here; it is `active` once HTTPS answers on it (`provisioning` while the certificate is issued, which finishes on its own). 400 with what is missing otherwise.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postBrandingLinkDomainVerify(idempotencyKey: String? = nil) async throws -> PostBrandingLinkDomainVerifyResponse {
        return try await send("POST", "/v1/branding/link-domain/verify", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Start a CLI sign-in. POST /v1/cli/device-codes
    ///
    /// The CLI `login` command calls this to start a device sign-in: returns a `deviceCode` for polling and a `userCode` for the person to approve at `verificationUri`. Codes expire after 10 minutes. No authentication; limited per IP.
    ///
    /// **Auth:** none.
    public func postCliDeviceCodes(_ body: PostCliDeviceCodesBody, idempotencyKey: String? = nil) async throws -> PostCliDeviceCodesResponse {
        return try await send("POST", "/v1/cli/device-codes", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Poll a CLI sign-in. POST /v1/cli/device-codes/token
    ///
    /// Polled by the CLI every `interval` seconds with its `deviceCode`. Answers `pending`, `expired`, `denied` or `consumed`, or once approved, `approved` with the new API key (returned once). Polling faster than allowed is `429`.
    ///
    /// **Auth:** none.
    public func postCliDeviceCodesToken(_ body: PostCliDeviceCodesTokenBody, idempotencyKey: String? = nil) async throws -> PostCliDeviceCodesTokenResponse {
        return try await send("POST", "/v1/cli/device-codes/token", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve a CLI sign-in. POST /v1/cli/device-codes/{userCode}/approve
    ///
    /// Approves the sign-in and mints its API key in this org. `access` picks the scopes: `cli` (webhooks write and read access to the rest, the default), `read` or `full`. Needs a signed-in owner or admin. Audited.
    ///
    /// **Auth:** an API key with `team:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func postCliDeviceCodesUserCodeApprove(userCode: String, _ body: PostCliDeviceCodesUserCodeApproveBody, idempotencyKey: String? = nil) async throws -> PostCliDeviceCodesUserCodeApproveResponse {
        return try await send("POST", "/v1/cli/device-codes/\(Self.segment(userCode))/approve", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Deny a CLI sign-in. POST /v1/cli/device-codes/{userCode}/deny
    ///
    /// Refuses a pending sign-in; the CLI then sees `denied`.
    ///
    /// **Auth:** an API key with `team:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func postCliDeviceCodesUserCodeDeny(userCode: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/cli/device-codes/\(Self.segment(userCode))/deny", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Open a CLI event listener. POST /v1/cli/listeners
    ///
    /// The CLI `listen` command opens a listener for some `topics` (default every topic). Events are queued for it while it polls at least every 2 minutes, and each comes with Standard Webhooks headers signed with the returned `secret`, so the CLI can forward them to a local server.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func postCliListeners(_ body: PostCliListenersBody, idempotencyKey: String? = nil) async throws -> PostCliListenersResponse {
        return try await send("POST", "/v1/cli/listeners", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Send a test event. POST /v1/cli/trigger
    ///
    /// The CLI `trigger` command sends a realistic sample event (ids `*_test_…`, `test: true`) to the org's listeners and webhook endpoints. `data` overrides fields of the sample. 400 for a topic with no sample; `GET /v1/cli/topics` lists them.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func postCliTrigger(_ body: PostCliTriggerBody, idempotencyKey: String? = nil) async throws -> PostCliTriggerResponse {
        return try await send("POST", "/v1/cli/trigger", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Publish a commission rule. POST /v1/commission-rules
    ///
    /// Publishes a new version of a program's commission rule; the latest version applies to new payments, and past lines keep the version that earned them. A rule has a `base` (percent in basis points, or a fixed amount), what it applies to (gross or net of tax or fees), how long it recurs, a hold before lines can be paid (`holdDays`, default 30), and optional conditions, per-partner/link/product overrides, volume tiers, event bounties, sub-affiliate levels and new-vs-expansion rates. Unknown fields at any depth are rejected. Audited.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postCommissionRules(_ body: PostCommissionRulesBody, idempotencyKey: String? = nil) async throws -> PostCommissionRulesResponse {
        return try await send("POST", "/v1/commission-rules", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve due commissions. POST /v1/commissions/approve-due
    ///
    /// Approves every pending line whose hold has elapsed (this also runs on a schedule). Returns how many were approved. Audited.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postCommissionsApproveDue(idempotencyKey: String? = nil) async throws -> PostCommissionsApproveDueResponse {
        return try await send("POST", "/v1/commissions/approve-due", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Adjust a commission. POST /v1/commissions/{id}/adjust
    ///
    /// Records an `adjusted` event against an earned line (a correction; the ledger is append-only). `amountMinor` is signed. An adjustment that would take the line below zero is refused unless `allowNegative`. Audited.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postCommissionsIdAdjust(id: String, _ body: PostCommissionsIdAdjustBody, idempotencyKey: String? = nil) async throws -> PostCommissionsIdAdjustResponse {
        return try await send("POST", "/v1/commissions/\(Self.segment(id))/adjust", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Settle a commission yourself. POST /v1/commissions/{id}/settle
    ///
    /// Marks an earned line paid because you credited the partner yourself (for example as store credit), with your `reference`: records `approved` (if it isn't yet) and `paid`, and publishes `commission.settled`. The line never reaches a payout run or the 1099 export. Repeating the same reference returns the original settlement; a line already paid otherwise is 409. Audited.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postCommissionsIdSettle(id: String, _ body: PostCommissionsIdSettleBody, idempotencyKey: String? = nil) async throws -> Settlement {
        return try await send("POST", "/v1/commissions/\(Self.segment(id))/settle", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a partner contract. POST /v1/contracts
    ///
    /// A contract offering one partner custom terms (`termsMd`) and `compensation` (percent or fixed) in a program, as a draft or sent at once (`send: true`). When accepted, the compensation becomes a partner override on a new rule version. Audited.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postContracts(_ body: PostContractsBody, idempotencyKey: String? = nil) async throws -> PostContractsResponse {
        return try await send("POST", "/v1/contracts", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Send a contract. POST /v1/contracts/{id}/send
    ///
    /// Sends a draft contract to the partner. 400 when it is not a draft.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postContractsIdSend(id: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("POST", "/v1/contracts/\(Self.segment(id))/send", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a coupon code. POST /v1/coupons
    ///
    /// Registers a coupon code for a partner in a program, so checkouts that use it attribute to them (coupon codes win over clicks). Codes match case-insensitively and are unique per org (409).
    ///
    /// **Auth:** an API key with `links:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `links:write`, `full`, `admin`.
    public func postCoupons(_ body: PostCouponsBody, idempotencyKey: String? = nil) async throws -> PostCouponsResponse {
        return try await send("POST", "/v1/coupons", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Invite a creator. POST /v1/creators/{accountId}/invite
    ///
    /// Invites a listed creator to a program with an optional message. 400 when they do not accept invitations or were already invited to that program.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postCreatorsAccountIdInvite(accountId: String, _ body: PostCreatorsAccountIdInviteBody, idempotencyKey: String? = nil) async throws -> PostCreatorsAccountIdInviteResponse {
        return try await send("POST", "/v1/creators/\(Self.segment(accountId))/invite", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve a deal. POST /v1/deals/{id}/approve
    ///
    /// Approves a submitted deal and protects it for the partner for `protectionDays` (default 90). 404 when there's no submitted deal with that id.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postDealsIdApprove(id: String, _ body: PostDealsIdApproveBody, idempotencyKey: String? = nil) async throws -> PostDealsIdApproveResponse {
        return try await send("POST", "/v1/deals/\(Self.segment(id))/approve", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Reject a deal. POST /v1/deals/{id}/reject
    ///
    /// Rejects a submitted deal.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postDealsIdReject(id: String, idempotencyKey: String? = nil) async throws -> PostDealsIdRejectResponse {
        return try await send("POST", "/v1/deals/\(Self.segment(id))/reject", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Mark a deal won. POST /v1/deals/{id}/won
    ///
    /// Marks an approved deal won, within its protection window: creates the referral for `customerRef` so the customer's payments earn the partner commission. Publishes `referral.created`.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postDealsIdWon(id: String, _ body: PostDealsIdWonBody, idempotencyKey: String? = nil) async throws -> PostDealsIdWonResponse {
        return try await send("POST", "/v1/deals/\(Self.segment(id))/won", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Ingest prospects. POST /v1/discovery/corpus
    ///
    /// Adds up to 500 prospects from your own crawl or data source. Raw page `html` is scanned for affiliate footprints (the competitor programs it recognizes) to enrich the evidence; `keywords` scores fit. Duplicate URLs are skipped. Needs a plan with discovery (402 otherwise).
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postDiscoveryCorpus(_ body: PostDiscoveryCorpusBody, idempotencyKey: String? = nil) async throws -> PostDiscoveryCorpusResponse {
        return try await send("POST", "/v1/discovery/corpus", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Search for prospective partners. POST /v1/discovery/search
    ///
    /// Searches the configured corpus for creators and sites matching `keywords` (and `category`), scores their fit and saves them as prospects. Needs a plan with discovery (402 otherwise).
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postDiscoverySearch(_ body: PostDiscoverySearchBody, idempotencyKey: String? = nil) async throws -> PostDiscoverySearchResponse {
        return try await send("POST", "/v1/discovery/search", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Resolve a dispute. POST /v1/disputes/{id}/resolve
    ///
    /// Resolves an open dispute with a `resolution` note, which the partner sees. Publishes `dispute.resolved`. 404 when not open. Audited.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postDisputesIdResolve(id: String, _ body: PostDisputesIdResolveBody, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/disputes/\(Self.segment(id))/resolve", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Preview an email. POST /v1/email/preview
    ///
    /// Renders an event's email with sample values, from the stored template or an unsaved draft.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postEmailPreview(_ body: PostEmailPreviewBody, idempotencyKey: String? = nil) async throws -> EmailRendered {
        return try await send("POST", "/v1/email/preview", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Check the sending domain. POST /v1/email/settings/verify-domain
    ///
    /// Asks the email provider whether the from address's domain is verified for sending, and stores the result. 400 until a provider, key and from address are set.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postEmailSettingsVerifyDomain(idempotencyKey: String? = nil) async throws -> PostEmailSettingsVerifyDomainResponse {
        return try await send("POST", "/v1/email/settings/verify-domain", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Send a test email. POST /v1/email/test
    ///
    /// Sends one email with sample values to `to` through the org's provider. 400 without a provider or when the provider refuses it.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postEmailTest(_ body: PostEmailTestBody, idempotencyKey: String? = nil) async throws -> PostEmailTestResponse {
        return try await send("POST", "/v1/email/test", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mint a partner embed token. POST /v1/embed/tokens
    ///
    /// A 15-minute token for the partner with this email, for the partner stats web component (`/embed.js`) in your app.
    ///
    /// **Auth:** an API key with `links:write`, or a session of any role.
    ///
    /// **Scopes:** `links:write`, `full`, `admin`.
    public func postEmbedTokens(_ body: PostEmbedTokensBody, idempotencyKey: String? = nil) async throws -> PostEmbedTokensResponse {
        return try await send("POST", "/v1/embed/tokens", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Resolve a fraud case. POST /v1/fraud/cases/{id}/resolve
    ///
    /// Closes a case with an `action`: `dismiss` (a held referral is approved), `void_referral`, `suspend_partner` or `ban_partner`. The matching `referral.*` events are published. Audited.
    ///
    /// **Auth:** an API key with `fraud:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `fraud:write`, `full`, `admin`.
    public func postFraudCasesIdResolve(id: String, _ body: PostFraudCasesIdResolveBody, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/fraud/cases/\(Self.segment(id))/resolve", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Detect referral rings. POST /v1/fraud/detect-rings
    ///
    /// Looks for partners who are likely one operator with many accounts (a shared payout destination or a shared non-freemail sign-up domain) and opens a `ring` case for each group.
    ///
    /// **Auth:** an API key with `fraud:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `fraud:write`, `full`, `admin`.
    public func postFraudDetectRings(idempotencyKey: String? = nil) async throws -> PostFraudDetectRingsResponse {
        return try await send("POST", "/v1/fraud/detect-rings", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Scan for invalid traffic. POST /v1/fraud/invalid-traffic/scan
    ///
    /// Scores each partner's clicks over the last `windowHours` (1 to 168, default 24) for invalid traffic and returns the probability, label and contributing signals per partner, plus how many were flagged.
    ///
    /// **Auth:** an API key with `fraud:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `fraud:write`, `full`, `admin`.
    public func postFraudInvalidTrafficScan(_ body: PostFraudInvalidTrafficScanBody, idempotencyKey: String? = nil) async throws -> PostFraudInvalidTrafficScanResponse {
        return try await send("POST", "/v1/fraud/invalid-traffic/scan", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Record an FX rate. POST /v1/fx-rates
    ///
    /// Records the rate cross-currency payouts convert at, for a currency pair, as a decimal string (`"1.0825"`), effective now or at `effectiveAt`. A manual rate pins its pair over the daily feed until cleared. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postFxRates(_ body: PostFxRatesBody, idempotencyKey: String? = nil) async throws -> FxRate {
        return try await send("POST", "/v1/fx-rates", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Clear a manual FX rate. POST /v1/fx-rates/clear-override
    ///
    /// Retires the manual rates for a pair, handing it back to the feed. Returns how many were cleared. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postFxRatesClearOverride(_ body: PostFxRatesClearOverrideBody, idempotencyKey: String? = nil) async throws -> PostFxRatesClearOverrideResponse {
        return try await send("POST", "/v1/fx-rates/clear-override", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Sync the FX feed now. POST /v1/fx-rates/sync
    ///
    /// Fetches the latest ECB reference rates for this org now, instead of waiting for the daily sync.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postFxRatesSync(idempotencyKey: String? = nil) async throws -> PostFxRatesSyncResponse {
        return try await send("POST", "/v1/fx-rates/sync", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Query the GraphQL read layer (POST). POST /v1/graphql
    ///
    /// The GraphQL endpoint with the query in a JSON body. Read-only, so a read-scoped API key may call it.
    ///
    /// **Auth:** an API key with `analytics:read`, or a session of any role.
    ///
    /// **Scopes:** `analytics:read`, `analytics:write`, `read`, `full`, `admin`.
    public func postGraphql(_ body: PostGraphqlBody, idempotencyKey: String? = nil) async throws -> PostGraphqlResponse {
        return try await send("POST", "/v1/graphql", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Import partners from another tool. POST /v1/import/{provider}
    ///
    /// Imports partners, links and codes from a Rewardful, FirstPromoter, Tolt or PartnerStack CSV export (as a `text/csv` body or `{ "csv": "…" }`) into a program. `dryRun=true` reports what would happen; `destinationUrl` is used when the export has no link column. The tool's referral parameter is added to aff.js so shared links keep crediting. Audited.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func postImportProvider(provider: String, _ body: PostImportProviderBody, programId: String, dryRun: Bool? = nil, destinationUrl: String? = nil, idempotencyKey: String? = nil) async throws -> PostImportProviderResponse {
        return try await send("POST", "/v1/import/\(Self.segment(provider))", query: [("programId", Self.queryString(programId)), ("dryRun", Self.queryString(dryRun)), ("destinationUrl", Self.queryString(destinationUrl))], body: body, idempotencyKey: idempotencyKey)
    }

    /// Retry an integration delivery. POST /v1/integrations/deliveries/{id}/retry
    ///
    /// Queues a failed or skipped delivery again. 404 when there is no failed or skipped delivery with that id.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func postIntegrationsDeliveriesIdRetry(id: String, idempotencyKey: String? = nil) async throws -> IntegrationDelivery {
        return try await send("POST", "/v1/integrations/deliveries/\(Self.segment(id))/retry", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Test the HubSpot connection. POST /v1/integrations/hubspot/test
    ///
    /// Checks the token against HubSpot and (unless `setupProperties: false`) creates the custom properties the sync uses. Returns `ok` and the error, if any, rather than failing.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func postIntegrationsHubspotTest(_ body: PostIntegrationsHubspotTestBody, idempotencyKey: String? = nil) async throws -> PostIntegrationsHubspotTestResponse {
        return try await send("POST", "/v1/integrations/hubspot/test", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Test the Segment connection. POST /v1/integrations/segment/test
    ///
    /// Sends one test track event with the write key and reports whether Segment accepted it.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func postIntegrationsSegmentTest(idempotencyKey: String? = nil) async throws -> PostIntegrationsSegmentTestResponse {
        return try await send("POST", "/v1/integrations/segment/test", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Withdraw an invitation. POST /v1/invitations/{id}/withdraw
    ///
    /// Withdraws a pending creator invitation. 400 when it was already answered or withdrawn.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postInvitationsIdWithdraw(id: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("POST", "/v1/invitations/\(Self.segment(id))/withdraw", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a tracked link. POST /v1/links
    ///
    /// Creates a partner's tracked link in a program. `code` (letters, digits, `-`; stored lowercase) is unique per org and generated when omitted. Returns the `shortUrl` to share, on the org's verified link domain when it has one. 409 when the code is taken. Audited.
    ///
    /// **Auth:** an API key with `links:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `links:write`, `full`, `admin`.
    public func postLinks(_ body: PostLinksBody, idempotencyKey: String? = nil) async throws -> CreatedLink {
        return try await send("POST", "/v1/links", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Report an in-app purchase. POST /v1/mobile/purchases
    ///
    /// Your backend reports a validated App Store or Play purchase (or refund), after checking the receipt; it flows through the same commission engine as web billing. Idempotent per `eventId`. Never call this from the app itself.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postMobilePurchases(_ body: PostMobilePurchasesBody, idempotencyKey: String? = nil) async throws -> PostMobilePurchasesResponse {
        return try await send("POST", "/v1/mobile/purchases", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mark a notification read. POST /v1/notifications/{id}/read
    ///
    /// Marks one notification read. Unknown or already-read ids are a no-op.
    ///
    /// **Auth:** an API key with `org:write`, or a session of any role.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postNotificationsIdRead(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/notifications/\(Self.segment(id))/read", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Token endpoint: install codes, partner links, Atlas operator token exchange. POST /v1/oauth/token
    ///
    /// Form-encoded or JSON, three grants. `authorization_code`: the platform trades the single-use one-click-install code and its PKCE `code_verifier` for a new signed-protocol connection and its signing secret (returned only here), plus a one-hour `access_token` scoped `connections:write webhooks:write` so the platform can require v2 signatures and register its sync webhook; installing again keeps the connection and issues a new secret, the old one verifying for 24 hours; 401 for an unknown, used, expired or mismatched code. `client_credentials`: a partner link's `client_id` and `client_secret` (HTTP Basic or the body), optional `scope` within the link's, for a one-hour `rat_…` bearer token. `urn:ietf:params:oauth:grant-type:token-exchange` (RFC 8693): `subject_token` = an Atlas operator access token from `atlas login` (issuer https://atlasauth.net, verified with its discovery document and JWKS, scope `atlas:operator`), `subject_token_type` access_token, `resource` = the org id; the Atlas account must sign in to a Referalli member of that org, and the token gets that role (owner: admin, admin: full, others: read), narrowed by `scope`. Errors follow RFC 6749 §5.2 (`{error, error_description}`). No authentication.
    ///
    /// **Auth:** none.
    public func postOauthToken(_ body: JSONValue, idempotencyKey: String? = nil) async throws -> PostOauthTokenResponse {
        return try await send("POST", "/v1/oauth/token", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create an on-chain connection. POST /v1/onchain/connections
    ///
    /// Connects an on-chain indexer: on-chain conversions posted to its webhook URL become billing events. Returns the webhook URL and signing secret.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postOnchainConnections(_ body: PostOnchainConnectionsBody, idempotencyKey: String? = nil) async throws -> PostOnchainConnectionsResponse {
        return try await send("POST", "/v1/onchain/connections", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Check a visitor's consent stamp with Cookie Munch. POST /v1/org/consent-partners/cookiemunch/stamps/check
    ///
    /// Asks Cookie Munch (`GET /v1/partner/sites/{cbid}/stamps/{stamp}`) what the visitor's consent stamp says on your registered site (`cbid`, or each registered site in turn) and keeps the answer. `verdict`: `consented` (found, with the `referrals` category on: the only verdict that credits a referral's consent), `not_consented`, `withdrawn` (a later decision turned `referrals` off: `withdrawnAt`), `not_found` (the site never recorded the stamp), `no_grant` (Cookie Munch's 403: the site has no live link to Referalli) or `error`. Clicks and consent events that carry a Cookie Munch stamp are checked the same way in the background. 409 when the partner token isn't configured or no site is registered. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgConsentPartnersCookiemunchStampsCheck(_ body: PostOrgConsentPartnersCookiemunchStampsCheckBody, idempotencyKey: String? = nil) async throws -> PostOrgConsentPartnersCookiemunchStampsCheckResponse {
        return try await send("POST", "/v1/org/consent-partners/cookiemunch/stamps/check", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Check the hosted-page adapters. POST /v1/org/hosted-pages/check
    ///
    /// Read-only checks against the vendors: does the Cookie Munch site exist (and a reminder to add your portal domain as its alias), does each script URL answer. Updates `status` and `lastError`. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgHostedPagesCheck(idempotencyKey: String? = nil) async throws -> PostOrgHostedPagesCheckResponse {
        return try await send("POST", "/v1/org/hosted-pages/check", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Add a team member. POST /v1/org/members
    ///
    /// Adds an existing Referalli user (by email) with a role: `owner`, `admin`, `finance`, `analyst` or `support`. Only an owner can add an owner. 404 when no user has that email; 409 when already a member. Live mode only.
    ///
    /// **Auth:** an API key with `team:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func postOrgMembers(_ body: PostOrgMembersBody, idempotencyKey: String? = nil) async throws -> PostOrgMembersResponse {
        return try await send("POST", "/v1/org/members", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Test partner sign-in. POST /v1/org/portal-auth/test
    ///
    /// Checks the partner sign-in configuration (JWKS reachable, or OIDC discovery) and records the result.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgPortalAuthTest(idempotencyKey: String? = nil) async throws -> PostOrgPortalAuthTestResponse {
        return try await send("POST", "/v1/org/portal-auth/test", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create an organization. POST /v1/orgs
    ///
    /// Creates an organization with the signed-in user as its owner. Needs a user session (not an API key) but no `x-org-id`. Limited to 20 per hour per user. Live mode only.
    ///
    /// **Auth:** an API key with `team:write`, or a session of any role.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func postOrgs(_ body: PostOrgsBody, idempotencyKey: String? = nil) async throws -> PostOrgsResponse {
        return try await send("POST", "/v1/orgs", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mint an executor key under a Cookie Munch partner link. POST /v1/orgs/{orgId}/privacy/executor-key
    ///
    /// Called by Cookie Munch, not by you (CMU-X25): mints (or rotates) this org's cm-standard-v2 executor key, limited to `programIds` when sent so Cookie Munch's `referalli` executor preset can connect without a pasted key. The request must be signed by Cookie Munch's partner key exactly like its consent deliveries: `CookieMunch-Partner-Signature: t=<unix seconds>,kid=<key id>,ed25519=<base64url>` over `<t>.<raw body>`, with the key named in `https://api.cookiemunch.net/v1/partner/jwks.json` (300 s window; each signed request and each body `nonce` works once, a replay is 409; `partner` must be `referalli` and `externalId` the org in the path). Referalli then confirms the partner link with Cookie Munch over its own partner token (`GET /v1/partner/links`): it must be `active` or `waiting_on_partner`, name this org as `externalId`, sit on a site this org registered (`PUT /v1/org/consent-partners/cookiemunch`), and match `cbid`/`linkId` when sent; otherwise 403 `no_grant`. 201 `{secret, executorUrl, contract, orgId, linkId, cbid, rotated}`: `secret` is shown once and is the bearer key for `executorUrl` (`https://referalli.com/api`, the cm-standard-v2 baseUrl: calls go to `<executorUrl>/privacy/*`), where it reaches only this org's referred customers and partners. The old key stops working at once. Audited (`privacy.executor_key_minted`).
    ///
    /// **Auth:** none.
    public func postOrgsOrgIdPrivacyExecutorKey(orgId: String, _ body: PostOrgsOrgIdPrivacyExecutorKeyBody, idempotencyKey: String? = nil) async throws -> PostOrgsOrgIdPrivacyExecutorKeyResponse {
        return try await send("POST", "/v1/orgs/\(Self.segment(orgId))/privacy/executor-key", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Test your identity provider. POST /v1/org/sso/direct/test
    ///
    /// Checks the configuration against the IdP (OIDC discovery, or the WorkOS organization) and records the result as the configuration's last success or last error.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgSsoDirectTest(idempotencyKey: String? = nil) async throws -> PostOrgPortalAuthTestResponse {
        return try await send("POST", "/v1/org/sso/direct/test", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Link the org to SSO. POST /v1/org/sso/link
    ///
    /// Creates the org's directory tenant at the SSO provider, with the calling owner (who must have signed in with the provider) as its first admin. Owner session only. 409 when already linked elsewhere. Live mode only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgSsoLink(idempotencyKey: String? = nil) async throws -> PostOrgSsoLinkResponse {
        return try await send("POST", "/v1/org/sso/link", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create an SSO setup link. POST /v1/org/sso/tickets
    ///
    /// A one-time link (valid `expiresInDays`, default 3) for the customer's IT admin to configure SAML or OIDC (and SCIM) on the provider's hosted page. The URL is returned once and never stored. Live mode only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgSsoTickets(_ body: PostOrgSsoTicketsBody, idempotencyKey: String? = nil) async throws -> PostOrgSsoTicketsResponse {
        return try await send("POST", "/v1/org/sso/tickets", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Revoke an SSO setup link. POST /v1/org/sso/tickets/{id}/revoke
    ///
    /// Revokes a pending setup link. Live mode only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postOrgSsoTicketsIdRevoke(id: String, idempotencyKey: String? = nil) async throws -> PostOrgSsoTicketsIdRevokeResponse {
        return try await send("POST", "/v1/org/sso/tickets/\(Self.segment(id))/revoke", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Draft an outreach sequence. POST /v1/outreach/draft
    ///
    /// Drafts a recruiting email sequence for a prospect. Drafts are only sent after you approve them.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postOutreachDraft(_ body: PostOutreachDraftBody, idempotencyKey: String? = nil) async throws -> PostOutreachDraftResponse {
        return try await send("POST", "/v1/outreach/draft", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve an outreach message. POST /v1/outreach/{id}/approve
    ///
    /// Approves a drafted message so `POST /v1/outreach/send-due` sends it when due. Audited.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postOutreachIdApprove(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/outreach/\(Self.segment(id))/approve", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Send due outreach. POST /v1/outreach/send-due
    ///
    /// Sends approved outreach messages that are due, skipping prospects without an email and addresses on the do-not-contact list (unsubscribed).
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func postOutreachSendDue(idempotencyKey: String? = nil) async throws -> PostOutreachSendDueResponse {
        return try await send("POST", "/v1/outreach/send-due", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Take a commission advance. POST /v1/partner/advance/accept
    ///
    /// Takes an advance of `amountMinor` (up to the offer). The principal plus fee is repaid by withholding future commissions from payouts.
    ///
    /// **Auth:** a partner session.
    public func postPartnerAdvanceAccept(_ body: PostPartnerAdvanceAcceptBody, idempotencyKey: String? = nil) async throws -> PostPartnerAdvanceAcceptResponse {
        return try await send("POST", "/v1/partner/advance/accept", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a partner API token. POST /v1/partner/api-tokens
    ///
    /// A token for calling the partner API from your own code, across every programme you're in: `Authorization: Bearer rpt_…`. `read` reaches your profile, stats, links, referrals, payouts, achievements, assets, groups, contracts, deals, disputes, notifications, invitations, recruiting, terms and KYC status; `write` also creates links, deals and disputes and marks notifications read. Security, profile and payout details, KYC, contracts, advances and tax documents stay portal-only. Shown once. Portal session only, with `x-totp-code` when two-factor is on; at most 10 active.
    ///
    /// **Auth:** a partner session.
    public func postPartnerApiTokens(_ body: PostPartnerApiTokensBody, idempotencyKey: String? = nil) async throws -> PostPartnerApiTokensResponse {
        return try await send("POST", "/v1/partner/api-tokens", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Get a wallet sign-in nonce. POST /v1/partner/auth/wallet/nonce
    ///
    /// Starts wallet sign-in (and AI agent registration): returns a single-use nonce, valid 10 minutes, and the message to sign with the wallet.
    ///
    /// **Auth:** none.
    public func postPartnerAuthWalletNonce(_ body: PostPartnerAuthWalletNonceBody, idempotencyKey: String? = nil) async throws -> PostPartnerAuthWalletNonceResponse {
        return try await send("POST", "/v1/partner/auth/wallet/nonce", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Sign in with a wallet. POST /v1/partner/auth/wallet/verify
    ///
    /// Verifies the wallet's signature over the nonce message and signs the partner in (creating the account on first use), setting the session cookie. 401 for an expired nonce or a signature that does not match.
    ///
    /// **Auth:** none.
    public func postPartnerAuthWalletVerify(_ body: PostPartnerAuthWalletVerifyBody, idempotencyKey: String? = nil) async throws -> PostPartnerAuthWalletVerifyResponse {
        return try await send("POST", "/v1/partner/auth/wallet/verify", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Accept a contract. POST /v1/partner/contracts/{id}/accept
    ///
    /// Accepts a sent contract; its compensation then applies to the partner's commissions in that program.
    ///
    /// **Auth:** a partner session.
    public func postPartnerContractsIdAccept(id: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("POST", "/v1/partner/contracts/\(Self.segment(id))/accept", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Decline a contract. POST /v1/partner/contracts/{id}/decline
    ///
    /// Declines a sent contract.
    ///
    /// **Auth:** a partner session.
    public func postPartnerContractsIdDecline(id: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("POST", "/v1/partner/contracts/\(Self.segment(id))/decline", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Register a deal. POST /v1/partner/deals
    ///
    /// A partner registers a B2B deal (company, contact, expected value) in a program they are approved in, for the merchant to approve. Publishes `deal.submitted`.
    ///
    /// **Auth:** a partner session.
    public func postPartnerDeals(_ body: PostPartnerDealsBody, idempotencyKey: String? = nil) async throws -> PostPartnerDealsResponse {
        return try await send("POST", "/v1/partner/deals", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// File a dispute. POST /v1/partner/disputes
    ///
    /// Files a dispute with a merchant about a missing attribution or an unpaid commission, optionally for a referral. The merchant resolves it.
    ///
    /// **Auth:** a partner session.
    public func postPartnerDisputes(_ body: PostPartnerDisputesBody, idempotencyKey: String? = nil) async throws -> PostPartnerDisputesResponse {
        return try await send("POST", "/v1/partner/disputes", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Accept an invitation. POST /v1/partner/invitations/{id}/accept
    ///
    /// Accepts a pending invitation: the partner is created in the merchant's org if needed and enrolled, approved. The merchant is notified.
    ///
    /// **Auth:** a partner session.
    public func postPartnerInvitationsIdAccept(id: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("POST", "/v1/partner/invitations/\(Self.segment(id))/accept", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Decline an invitation. POST /v1/partner/invitations/{id}/decline
    ///
    /// Declines a pending invitation. The merchant is notified.
    ///
    /// **Auth:** a partner session.
    public func postPartnerInvitationsIdDecline(id: String, idempotencyKey: String? = nil) async throws -> OkStatus {
        return try await send("POST", "/v1/partner/invitations/\(Self.segment(id))/decline", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Submit identity verification. POST /v1/partner/kyc/submit
    ///
    /// Submits the partner's legal name, country and optional date of birth and document reference for identity verification and sanctions screening. Merchants that require KYC pay only verified partners. Limited to 5 per hour per IP.
    ///
    /// **Auth:** a partner session.
    public func postPartnerKycSubmit(_ body: PostPartnerKycSubmitBody, idempotencyKey: String? = nil) async throws -> PostPartnerKycSubmitResponse {
        return try await send("POST", "/v1/partner/kyc/submit", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a link. POST /v1/partner/links
    ///
    /// Creates a tracked link in a program the partner is approved in (403 otherwise), optionally for one of the program's marketing assets. `code` is generated when omitted; 409 when taken.
    ///
    /// **Auth:** a partner session.
    public func postPartnerLinks(_ body: PostPartnerLinksBody, idempotencyKey: String? = nil) async throws -> CreatedLink {
        return try await send("POST", "/v1/partner/links", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mark my notification read. POST /v1/partner/notifications/{id}/read
    ///
    /// Marks one of the partner's notifications read.
    ///
    /// **Auth:** a partner session.
    public func postPartnerNotificationsIdRead(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/partner/notifications/\(Self.segment(id))/read", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Accept self-billing. POST /v1/partner/orgs/{orgId}/self-billing
    ///
    /// Accepts the current self-billing agreement with this merchant (`{ "accept": true }`), so the merchant issues the invoices for the partner's payouts. 404 until payout details exist.
    ///
    /// **Auth:** a partner session.
    public func postPartnerOrgsOrgIdSelfBilling(orgId: String, _ body: PostPartnerOrgsOrgIdSelfBillingBody, idempotencyKey: String? = nil) async throws -> PostPartnerOrgsOrgIdSelfBillingResponse {
        return try await send("POST", "/v1/partner/orgs/\(Self.segment(orgId))/self-billing", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Submit my tax form. POST /v1/partner/orgs/{orgId}/tax-form
    ///
    /// Submits a W-9, W-8BEN or W-8BEN-E to this merchant. A tax form is required before the partner is included in payouts.
    ///
    /// **Auth:** a partner session.
    public func postPartnerOrgsOrgIdTaxForm(orgId: String, _ body: PostPartnerOrgsOrgIdTaxFormBody, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/partner/orgs/\(Self.segment(orgId))/tax-form", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Apply to a program. POST /v1/partner/programs/{programId}/apply
    ///
    /// Applies to an active program (for example from the marketplace), creating the partner in that merchant's org if needed. The merchant approves or rejects it. Publishes `partner.applied`. 403 for blocked accounts.
    ///
    /// **Auth:** a partner session.
    public func postPartnerProgramsProgramIdApply(programId: String, idempotencyKey: String? = nil) async throws -> PostPartnerProgramsProgramIdApplyResponse {
        return try await send("POST", "/v1/partner/programs/\(Self.segment(programId))/apply", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a partner. POST /v1/partners
    ///
    /// Creates a partner. `email` is unique per org, and so is `externalRef` (your own id for them, such as a user id). With `upsert: true` an existing partner matching the email or externalRef is returned instead of a 409 (and gets the externalRef if it had none), with `matchedBy` (`email` or `externalRef`) and `externalRefKept`: true when the partner keeps its own externalRef (another product's) and yours was not applied to it, because yours is the program-scoped one on its enrollment. An email match whose partner has a different externalRef and no enrollment carrying yours is a 409. Over the plan's partner limit this is `402 payment_required`. Audited.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postPartners(_ body: PostPartnersBody, idempotencyKey: String? = nil) async throws -> PostPartnersResponse {
        return try await send("POST", "/v1/partners", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Turn off two-factor. POST /v1/partner/security/totp/disable
    ///
    /// Turns two-factor off; needs a valid current `code`. 401 for a wrong code.
    ///
    /// **Auth:** a partner session.
    public func postPartnerSecurityTotpDisable(_ body: PostPartnerSecurityTotpDisableBody, idempotencyKey: String? = nil) async throws -> PostPartnerSecurityTotpDisableResponse {
        return try await send("POST", "/v1/partner/security/totp/disable", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Turn on two-factor. POST /v1/partner/security/totp/enable
    ///
    /// Confirms setup with a current 6-digit `code`. From then on, changing payout details needs a code in `x-totp-code`. 401 for a wrong code.
    ///
    /// **Auth:** a partner session.
    public func postPartnerSecurityTotpEnable(_ body: PostPartnerSecurityTotpEnableBody, idempotencyKey: String? = nil) async throws -> PostPartnerSecurityTotpEnableResponse {
        return try await send("POST", "/v1/partner/security/totp/enable", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Start two-factor setup. POST /v1/partner/security/totp/setup
    ///
    /// Generates a TOTP secret and its `otpauth://` URI for an authenticator app. 400 when two-factor is already on.
    ///
    /// **Auth:** a partner session.
    public func postPartnerSecurityTotpSetup(idempotencyKey: String? = nil) async throws -> PostPartnerSecurityTotpSetupResponse {
        return try await send("POST", "/v1/partner/security/totp/setup", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a portal sign-in link. POST /v1/partners/{id}/portal-link
    ///
    /// A single-use `url` (valid 5 minutes) for a "View earnings" button in your app: opening it signs the partner in to the partner portal for `programId`, with no second account. The session is read-only and limited to this partner in your organization (never the partner's other merchants or account settings) and lasts 12 hours. `returnUrl` must be a path inside the portal, such as `/portal/earnings`. 404 for a partner outside your organization or not enrolled in the program. Owner or admin.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postPartnersIdPortalLink(id: String, _ body: PostPartnersIdPortalLinkBody, idempotencyKey: String? = nil) async throws -> PostPartnersIdPortalLinkResponse {
        return try await send("POST", "/v1/partners/\(Self.segment(id))/portal-link", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Record a partner's tax form. POST /v1/partners/{id}/tax-form
    ///
    /// Records a W-9, W-8BEN or W-8BEN-E for the partner (`data` is the form's fields). A tax form on file is required before a partner is included in a payout run.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postPartnersIdTaxForm(id: String, _ body: PostPartnersIdTaxFormBody, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/partners/\(Self.segment(id))/tax-form", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Accept program terms. POST /v1/partner/terms/{versionId}/accept
    ///
    /// Records the partner's acceptance of a terms version. Repeating it is a no-op.
    ///
    /// **Auth:** a partner session.
    public func postPartnerTermsVersionIdAccept(versionId: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/partner/terms/\(Self.segment(versionId))/accept", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Verify a partner passport. POST /v1/passport/verify
    ///
    /// Checks a partner's signed reputation passport: `valid: true` with its claims, or `valid: false` with the reason (bad signature, expired). No authentication.
    ///
    /// **Auth:** none.
    public func postPassportVerify(_ body: PostPassportVerifyBody, idempotencyKey: String? = nil) async throws -> PostPassportVerifyResponse {
        return try await send("POST", "/v1/passport/verify", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a payout run. POST /v1/payout-runs
    ///
    /// Builds a draft run: one payout per partner who has a payout profile, a tax form and an approved, unpaid balance over their threshold, converted into their payout currency at recorded FX, each with a self-billing invoice. Partners left out are listed in `skipped` with the reason. Nothing is paid until you execute it. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postPayoutRuns(idempotencyKey: String? = nil) async throws -> PayoutRunCreated {
        return try await send("POST", "/v1/payout-runs", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Cancel a payout run. POST /v1/payout-runs/{id}/cancel
    ///
    /// Cancels a run that hasn't paid out and releases its lines back to the partners' approved balances. A run with money in flight is 409. Publishes `payout.cancelled` per payout. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postPayoutRunsIdCancel(id: String, idempotencyKey: String? = nil) async throws -> PostPayoutRunsIdCancelResponse {
        return try await send("POST", "/v1/payout-runs/\(Self.segment(id))/cancel", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Execute a payout run. POST /v1/payout-runs/{id}/execute
    ///
    /// Pays a draft run through the org's own connected payout providers (methods with no connection are simulated and logged; test mode uses the test rail). Returns how many were sent, submitted (settling asynchronously) and failed; each outcome publishes `payout.sent`, `payout.submitted` or `payout.failed`. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postPayoutRunsIdExecute(id: String, idempotencyKey: String? = nil) async throws -> PostPayoutRunsIdExecuteResponse {
        return try await send("POST", "/v1/payout-runs/\(Self.segment(id))/execute", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Run due payout schedules. POST /v1/payout-runs/run-scheduled
    ///
    /// Creates and executes payout runs for every schedule (org or program) that is due now. This also runs hourly on its own.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postPayoutRunsRunScheduled(idempotencyKey: String? = nil) async throws -> PostPayoutRunsRunScheduledResponse {
        return try await send("POST", "/v1/payout-runs/run-scheduled", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Import a brand file into the portal design. POST /v1/portal/theme/import-brand
    ///
    /// A W3C design-tokens (DTCG) brand file, sent as `document` or fetched from an https `url`, merged into the draft: colours (`color.primary`, `color.background`, `color.surface`, `color.text`, `color.muted`, `color.border`, status colours), fonts (`font.body`, `font.heading`, `font.mono`, `font.url`), `radius.base`, `logo.url` and `brand.name`. `applied` lists the tokens used. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postPortalThemeImportBrand(_ body: PostPortalThemeImportBrandBody, idempotencyKey: String? = nil) async throws -> PostPortalThemeImportBrandResponse {
        return try await send("POST", "/v1/portal/theme/import-brand", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Get a preview link for the portal design draft. POST /v1/portal/theme/preview
    ///
    /// A link that shows the draft on your verified portal domain (`?themePreview=rpv_…`) for 7 days, to anyone who has it; minting another retires the last. Partners without the link keep seeing the published design. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postPortalThemePreview(idempotencyKey: String? = nil) async throws -> PostPortalThemePreviewResponse {
        return try await send("POST", "/v1/portal/theme/preview", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Publish the portal design. POST /v1/portal/theme/publish
    ///
    /// Makes the draft what partners see (within a minute), keeps it as a version you can restore, and retires the preview link. Optional `note`. Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postPortalThemePublish(_ body: PostPortalThemePublishBody, idempotencyKey: String? = nil) async throws -> GetPortalThemeResponse {
        return try await send("POST", "/v1/portal/theme/publish", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Restore a portal design version. POST /v1/portal/theme/versions/{id}/restore
    ///
    /// Copies a published version into the draft; publish it to make it live again. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postPortalThemeVersionsIdRestore(id: String, idempotencyKey: String? = nil) async throws -> GetPortalThemeResponse {
        return try await send("POST", "/v1/portal/theme/versions/\(Self.segment(id))/restore", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Mint a DSAR executor key. POST /v1/privacy/executor-keys
    ///
    /// Enables a DSAR tool for your org and mints its executor key (a bearer key, or a `whsec_` secret for Standard Webhooks), returned once. Rotating stops the old key at once. Also stores vendor settings: a Transcend public key and API key for completion callbacks, an Osano webhook secret.
    ///
    /// **Auth:** an API key with `privacy:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:write`, `full`, `admin`.
    public func postPrivacyExecutorKeys(_ body: PostPrivacyExecutorKeysBody, idempotencyKey: String? = nil) async throws -> PostPrivacyExecutorKeysResponse {
        return try await send("POST", "/v1/privacy/executor-keys", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Check a DSAR tool connection. POST /v1/privacy/executors/{adapter}/check
    ///
    /// Whether the tool is ready: a key or the vendor credentials it needs, and no failing requests since it was set up. Answers `{ok, detail, fix}`.
    ///
    /// **Auth:** an API key with `privacy:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:write`, `full`, `admin`.
    public func postPrivacyExecutorsAdapterCheck(adapter: String, idempotencyKey: String? = nil) async throws -> PostPrivacyExecutorsAdapterCheckResponse {
        return try await send("POST", "/v1/privacy/executors/\(Self.segment(adapter))/check", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Erase a data subject. POST /v1/privacy/forget
    ///
    /// Erases (pseudonymizes, keeping the ledger balanced) a customer by `customerRef`, a partner by `partnerId`, or by `email` both the partner with that email and every customer stored under its hash. Send exactly one. 400 when nothing is found. Audited.
    ///
    /// **Auth:** an API key with `privacy:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:write`, `full`, `admin`.
    public func postPrivacyForget(_ body: PostPrivacyForgetBody, idempotencyKey: String? = nil) async throws -> PostPrivacyForgetResponse {
        return try await send("POST", "/v1/privacy/forget", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Find a data subject by email. POST /v1/privacy/lookup
    ///
    /// Which customers and partners an email refers to. The email is hashed on the server and never stored.
    ///
    /// **Auth:** an API key with `privacy:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:write`, `full`, `admin`.
    public func postPrivacyLookup(_ body: PostPrivacyLookupBody, idempotencyKey: String? = nil) async throws -> PostPrivacyLookupResponse {
        return try await send("POST", "/v1/privacy/lookup", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Open a data-subject request. POST /v1/privacy/requests
    ///
    /// Opens an `access` or `erasure` request for one subject (`email`, `customerRef` or `partnerId`) and answers `202` with the request to poll. Publishes `privacy.request_completed` when done.
    ///
    /// **Auth:** an API key with `privacy:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `privacy:write`, `full`, `admin`.
    public func postPrivacyRequests(_ body: PostPrivacyRequestsBody, idempotencyKey: String? = nil) async throws -> PostPrivacyRequestsResponse {
        return try await send("POST", "/v1/privacy/requests", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a partner link. POST /v1/product-links
    ///
    /// `{partner, name?, scopes[], expires_at?}` (Unix ms or ISO 8601, at most a year; default a year; never "never"). Scopes are resource scopes (`integrations:write`, `partners:read`, …) or `connections:read|write` (the auth-platform connection routes only, what Atlas asks for); never admin, full or team. Returns `client_id` and `client_secret` once; the partner swaps them at POST /v1/oauth/token (client_credentials) or sends the secret as a bearer. A root action: an API key cannot hand out more than it holds, and an Atlas operator token needs an MFA sign-in at most 5 minutes old (403 `step_up_required` otherwise).
    ///
    /// **Auth:** an API key with `team:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func postProductLinks(_ body: PostProductLinksBody, idempotencyKey: String? = nil) async throws -> PostProductLinksResponse {
        return try await send("POST", "/v1/product-links", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Rebuild ROI figures. POST /v1/profitability/rebuild
    ///
    /// Recomputes every stored ROI figure from the value events with the current settings and mappings, in the background. Returns a `jobId` to poll; while one rebuild is running, the same job is returned. Audited.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func postProfitabilityRebuild(idempotencyKey: String? = nil) async throws -> PostProfitabilityRebuildResponse {
        return try await send("POST", "/v1/profitability/rebuild", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a program. POST /v1/programs
    ///
    /// Creates an affiliate program: its attribution model, cookie window, how long after sign-up a conversion still counts (`signupToConversionDays`, 1 to 1095, default 365; `cookieWindowDays` is 1 to 400, default 60), terms, public page and settings (`signupPaymentGraceMinutes`, 0 to 1440, default 5: how long before the referral's sign-up time a payment still earns). `slug` is unique per org. Terms are versioned so partners can be asked to accept new ones. `publicHandle` is unique across every org (check it first with `GET /v1/programs/handle-availability`). A taken `slug` or `publicHandle` is `409 conflict` with `details.field` naming it (`slug` or `publicHandle`). Over the plan's program limit this is `402 payment_required`.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postPrograms(_ body: PostProgramsBody, idempotencyKey: String? = nil) async throws -> Program {
        return try await send("POST", "/v1/programs", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Apply partner levels. POST /v1/programs/{id}/apply-leveling
    ///
    /// Promotes the program's partners to the highest level their referral count qualifies for (never demotes). Publishes `partner.level_up` per promotion.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdApplyLeveling(id: String, idempotencyKey: String? = nil) async throws -> PostProgramsIdApplyLevelingResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/apply-leveling", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Run autopricing. POST /v1/programs/{id}/autoprice/run
    ///
    /// Moves each partner's rate toward the target and publishes the new rates as partner overrides on a new rule version. Objective `roas` compares attributed revenue to commission; `roi` uses each partner's matured referral ROI, holding partners with too few matured referrals or an unknown ROI (listed in `held`). 400 when autopricing is off, the program has no percent-based rule, or no partner has a known ROI under `roi`.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdAutopriceRun(id: String, _ body: PostProgramsIdAutopriceRunBody, idempotencyKey: String? = nil) async throws -> PostProgramsIdAutopriceRunResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/autoprice/run", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Requeue stuck account credits. POST /v1/programs/{id}/credit-rail/requeue
    ///
    /// Same as `POST /v1/programs/{id}/stripe-credits/requeue`, for every provider: resets the attempt count of this program's `no_customer`, `ambiguous_customer` and `fx_rate_missing` rows (all, or only `creditIds`). Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postProgramsIdCreditRailRequeue(id: String, _ body: PostProgramsIdCreditRailRequeueBody, idempotencyKey: String? = nil) async throws -> PostProgramsIdCreditRailRequeueResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/credit-rail/requeue", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Enroll a partner. POST /v1/programs/{id}/enrollments
    ///
    /// Enrolls an existing partner in the program, approved at once. Publishes `partner.enrolled`. 409 when already enrolled. `externalRef` is this program's own id for the partner, when their partner `externalRef` belongs to another product sharing the org; this program's webhooks and `GET /v1/partners?externalRef=` then use it. `mint` also gives them a referral code in the program, as `POST /v1/programs/{id}/referrers` does: `coupon: true` a coupon, `link: {}` a tracked link to `link.destinationUrl` or else the program's default destination (`{code}` in it becomes the code; 400 when the program has none and you send none). Their existing code in the program is reused. The response then adds `code` and `linkUrl` (null without a link).
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdEnrollments(id: String, _ body: PostProgramsIdEnrollmentsBody, idempotencyKey: String? = nil) async throws -> PostProgramsIdEnrollmentsResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/enrollments", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve an application. POST /v1/programs/{id}/enrollments/{enrollmentId}/approve
    ///
    /// Approves a pending application (`status: "applied"`). Publishes `partner.approved`. 404 when there is no pending application with that id. Audited.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdEnrollmentsEnrollmentIdApprove(id: String, enrollmentId: String, idempotencyKey: String? = nil) async throws -> PostProgramsIdEnrollmentsEnrollmentIdApproveResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/enrollments/\(Self.segment(enrollmentId))/approve", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Reject an application. POST /v1/programs/{id}/enrollments/{enrollmentId}/reject
    ///
    /// Rejects a pending application. 404 when there is no pending application with that id. Audited.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdEnrollmentsEnrollmentIdReject(id: String, enrollmentId: String, idempotencyKey: String? = nil) async throws -> PostProgramsIdEnrollmentsEnrollmentIdRejectResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/enrollments/\(Self.segment(enrollmentId))/reject", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a partner group. POST /v1/programs/{id}/groups
    ///
    /// A group of partners in a program with its own commission base (or `null` to keep the program rule's), hold days, payout threshold, payout currency, onboarding message and checklist. Names are unique per program (409).
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdGroups(id: String, _ body: PostProgramsIdGroupsBody, idempotencyKey: String? = nil) async throws -> PartnerGroup {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/groups", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Create a promotion. POST /v1/programs/{id}/promotions
    ///
    /// A time-boxed commission change for the whole program or one group: `replace` the base rate, or `boost` it by `bps`, between `startsAt` and `endsAt`. Payments in that window get it.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdPromotions(id: String, _ body: PostProgramsIdPromotionsBody, idempotencyKey: String? = nil) async throws -> Promotion {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/promotions", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Make a user a referrer. POST /v1/programs/{id}/referrers
    ///
    /// One idempotent call for one of your users: finds the partner by `externalRef` (or by `email`, enrolling them under this program's own `externalRef` when they refer for another product in the org), else creates it, then enrolls them and creates a coupon code and a link to the program's default destination when missing. `email` is needed only to create the partner (400 without it). 409 `email_taken` when that email is already enrolled in this program under another id.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postProgramsIdReferrers(id: String, _ body: PostProgramsIdReferrersBody, idempotencyKey: String? = nil) async throws -> PostProgramsIdReferrersResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/referrers", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Requeue stuck Stripe balance credits. POST /v1/programs/{id}/stripe-credits/requeue
    ///
    /// Resets the attempt count of this program's `no_customer`, `ambiguous_customer` and `fx_rate_missing` rows (all of them, or only `creditIds`) so the hourly sweep gives them another 24 tries: call it after adding the billing link, making the customer match unique or recording the FX rate. Rows in other statuses are left alone. Returns the requeued ids. Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postProgramsIdStripeCreditsRequeue(id: String, _ body: PostProgramsIdStripeCreditsRequeueBody, idempotencyKey: String? = nil) async throws -> PostProgramsIdStripeCreditsRequeueResponse {
        return try await send("POST", "/v1/programs/\(Self.segment(id))/stripe-credits/requeue", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// End a promotion. POST /v1/promotions/{id}/end
    ///
    /// Ends a promotion now: payments from this moment on no longer get it.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func postPromotionsIdEnd(id: String, idempotencyKey: String? = nil) async throws -> Promotion {
        return try await send("POST", "/v1/promotions/\(Self.segment(id))/end", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Join a program. POST /v1/public/programs/{handle}/join
    ///
    /// One-step join from the public page for a signed-in partner: creates (or claims, with a verified email) the partner in the merchant's org and enrolls them, approved with a first link when the program auto-approves, otherwise as an application. Publishes `partner.approved` or `partner.applied`. 409 when the merchant's partner with that email belongs to another account.
    ///
    /// **Auth:** a partner session.
    public func postPublicProgramsHandleJoin(handle: String, _ body: PostPublicProgramsHandleJoinBody, idempotencyKey: String? = nil) async throws -> PostPublicProgramsHandleJoinResponse {
        return try await send("POST", "/v1/public/programs/\(Self.segment(handle))/join", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Recompute quality scores. POST /v1/quality/recompute
    ///
    /// Snapshots every partner's quality score now; per the org's policy, low scores open a `quality` case or suspend the partner. Audited.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postQualityRecompute(idempotencyKey: String? = nil) async throws -> PostQualityRecomputeResponse {
        return try await send("POST", "/v1/quality/recompute", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Attribute a new customer. POST /v1/referrals/associate
    ///
    /// The key server-side call: tell Referalli a customer signed up, with whatever you know about where they came from (`referralToken`/`ref_click_id`, `anonId`, `couponCode`, `emailHash`, IP and user agent). The attribution engine picks the partner under the program's model and windows. `referral` is `null` when no partner matched (not an error); `reasoning.notes` says why. Repeating `idempotencyKey` returns the existing referral. `occurredAt` records a late call at the real sign-up time (up to 5 minutes of clock skew is tolerated) and backfills payments since. `emailDomain` lets burner-email sign-ups be held for review. `handoffToken` (from `POST /t/{orgToken}/handoff` or `POST /v1/referrals/handoff-tokens`) fills `anonId`, `referralToken` and `couponCode` where they are not sent; a malformed, expired or other org's token is `400 invalid_handoff_token`. Publishes `referral.created` (or `referral.held`).
    ///
    /// **Auth:** an API key with `referrals:write`, or a session of any role.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func postReferralsAssociate(_ body: PostReferralsAssociateBody, idempotencyKey: String? = nil) async throws -> AssociateResponse {
        return try await send("POST", "/v1/referrals/associate", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mint a hand-off token. POST /v1/referrals/handoff-tokens
    ///
    /// The server-side twin of `POST /t/{orgToken}/handoff`: signs `anonId`, `clickId` and/or `code` (at least one) into a token valid for 24 hours, for this org only, to pass later to `POST /v1/referrals/associate` as `handoffToken`. Use it when the server that saw the landing (`?ref_click_id=`) is not the one that files the sign-up.
    ///
    /// **Auth:** an API key with `referrals:write`, or a session of any role.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func postReferralsHandoffTokens(_ body: PostReferralsHandoffTokensBody, idempotencyKey: String? = nil) async throws -> HandoffToken {
        return try await send("POST", "/v1/referrals/handoff-tokens", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Approve a held referral. POST /v1/referrals/{id}/approve
    ///
    /// Releases a referral held for review (`pending_review`) back to `active`. 404 when it isn't pending review. Publishes `referral.approved`. Audited.
    ///
    /// **Auth:** an API key with `referrals:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func postReferralsIdApprove(id: String, idempotencyKey: String? = nil) async throws -> Referral {
        return try await send("POST", "/v1/referrals/\(Self.segment(id))/approve", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Reassign a referral. POST /v1/referrals/{id}/reassign
    ///
    /// Moves the referral to another partner (recorded as a manual match). Publishes `referral.reassigned` with the previous partner. Audited.
    ///
    /// **Auth:** an API key with `referrals:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func postReferralsIdReassign(id: String, _ body: PostReferralsIdReassignBody, idempotencyKey: String? = nil) async throws -> Referral {
        return try await send("POST", "/v1/referrals/\(Self.segment(id))/reassign", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Void a referral. POST /v1/referrals/{id}/void
    ///
    /// Voids the referral so it earns nothing more. Publishes `referral.voided`. Audited.
    ///
    /// **Auth:** an API key with `referrals:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `referrals:write`, `full`, `admin`.
    public func postReferralsIdVoid(id: String, idempotencyKey: String? = nil) async throws -> Referral {
        return try await send("POST", "/v1/referrals/\(Self.segment(id))/void", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Reward a partner. POST /v1/rewards
    ///
    /// Rewards a partner for something outside a sale (a community answer, an event): one `earned` commission line that is approved and paid like any other. Name the partner by `partnerId` or `partnerExternalRef`; the amount is `amountMinor` (+ `currency`) or comes from a rule (`ruleKey`, or the `event` a rule maps). Idempotent on `idempotencyKey`: a retry returns the first grant with 200; the same key with a different request is 409.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postRewards(_ body: PostRewardsBody, idempotencyKey: String? = nil) async throws -> PostRewardsResponse {
        return try await send("POST", "/v1/rewards", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Redeem a reward. POST /v1/rewards/{id}/redeem
    ///
    /// Records a (possibly partial) redemption: `amountMinor` (default the remaining balance) is capped at what's left, and the reward becomes `redeemed` once it is used up. `externalId` makes it idempotent (409 if reused for another reward). Publishes `credit.redeemed`.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postRewardsIdRedeem(id: String, _ body: PostRewardsIdRedeemBody, idempotencyKey: String? = nil) async throws -> PostRewardsRedeemByCodeResponse {
        return try await send("POST", "/v1/rewards/\(Self.segment(id))/redeem", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Redeem a reward by code. POST /v1/rewards/redeem-by-code
    ///
    /// Records a redemption of the reward with this code; see `POST /v1/rewards/{id}/redeem`. 404 for an unknown code.
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func postRewardsRedeemByCode(_ body: PostRewardsRedeemByCodeBody, idempotencyKey: String? = nil) async throws -> PostRewardsRedeemByCodeResponse {
        return try await send("POST", "/v1/rewards/redeem-by-code", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Open a review for a pattern match. POST /v1/roi/patterns/{pattern}/review
    ///
    /// Turns one live pattern match (by `customerRef` and/or `partnerId`, optionally `programId`) into a `value_pattern` fraud case against its partner, or returns the open case for the same match. Publishes `fraud.case_opened`. 404 when no such match exists. Audited.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func postRoiPatternsPatternReview(pattern: String, _ body: PostRoiPatternsPatternReviewBody, idempotencyKey: String? = nil) async throws -> FraudCase {
        return try await send("POST", "/v1/roi/patterns/\(Self.segment(pattern))/review", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Send a billing event fixture. POST /v1/sandbox/billing-fixtures
    ///
    /// Test mode only (`409 test_mode_only` otherwise). Builds a realistic webhook payload for the provider of billing connection `connectionId` (Stripe, Paddle, Lemon Squeezy, Polar, Chargebee, Shopify, Recurly, Braintree, WooCommerce, BigCommerce or the generic contract) and runs it through the same pipeline as a signed webhook to that connection, so you can watch commissions happen without a provider account. `event` is a provider-neutral name (`payment.paid`, `payment.refunded`, `payment.disputed`, `subscription.created`, `subscription.canceled`; Stripe also `subscription.updated`, `customer.created` and `customer.updated`; generic `customer.updated`) or the provider's own event name; `GET /v1/sandbox/billing-fixtures?provider=` lists what each provider has. `overrides` sets `customerRef` (the provider customer id), `amountMinor`, `currency`, `metadata`, `invoiceId` (alias `orderId`: the paid invoice, order or transaction), `subscriptionId` and, for Stripe, `chargeId`; a refund or dispute finds its payment by `invoiceId` (Stripe: `chargeId`), so reuse the paid one. Recurly and BigCommerce fixtures are the enriched payload, so no API credentials are needed. Each call is a new event unless you pass `eventId`, which replays (the second answers `duplicate: true`). Returns the event id, the processing results, the commission events created and the payload sent. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postSandboxBillingFixtures(_ body: PostSandboxBillingFixturesBody, idempotencyKey: String? = nil) async throws -> PostSandboxBillingFixturesResponse {
        return try await send("POST", "/v1/sandbox/billing-fixtures", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Simulate billing history. POST /v1/sandbox/simulate
    ///
    /// Generates deterministic billing history through the real commission pipeline, so you can see commissions flow without a provider: a new sandbox customer referred to the partner, `months` (default 3) of subscription payments at `priceMinor`, then for `scenario: "refund"` a half refund of the first invoice or for `churn` a cancellation. Returns the customer and what was created. `scenario: "signup_and_pay"` (test mode only, `409 test_mode_only` otherwise) proves the whole loop instead: a sign-up of `customerRef` (default a new `cus_sandbox_…`) referred by `partnerId` (a click on their link) or by `code` (a link or coupon code), filed through auth connection `authConnectionId` exactly as its signed `POST /v1/auth/connections/{id}/signups` would file it (auto-enroll included) or, without one, as `POST /v1/referrals/associate`; then a provider-neutral `payment.paid` of `amountMinor` (default 4900) in `currency` (default USD) through billing connection `billingConnectionId` (default the org's only active one, else `409`), run through the same pipeline as `POST /v1/sandbox/billing-fixtures`. Answers `{ scenario, ok, steps: [signup, payment], commissions }`; a step that could not succeed answers `ok: false` with `notes` saying why (sign-up not credited, auth connection paused or in another program, billing connection `awaiting_secret`, paused or limited to other programs, payment ignored, program without a commission rule) rather than an error. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postSandboxSimulate(_ body: PostSandboxSimulateBody, idempotencyKey: String? = nil) async throws -> PostSandboxSimulateResponse {
        return try await send("POST", "/v1/sandbox/simulate", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Send a Stripe event fixture. POST /v1/sandbox/stripe-fixtures
    ///
    /// Test mode only (`409 test_mode_only` otherwise). Builds a realistic Stripe event (`invoice.paid`, `charge.refunded`, `charge.dispute.created`, `customer.created`, `customer.updated`, `customer.subscription.created`, `customer.subscription.updated` or `customer.subscription.deleted`) and runs it through the same pipeline as a signed webhook to the stripe billing connection `connectionId`, so you can watch commissions happen without a Stripe account. `overrides` sets `customerRef` (the Stripe customer id), `amountMinor`, `currency`, `metadata`, `invoiceId`, `chargeId` and `subscriptionId`; refunds and disputes find their payment by `chargeId`, so reuse the `invoice.paid` one. Each call is a new event unless you pass `eventId`, which replays (the second answers `duplicate: true`). Returns the event id, the processing results, the commission events created and the payload sent. Audited. The Stripe-only alias of `POST /v1/sandbox/billing-fixtures`.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postSandboxStripeFixtures(_ body: PostSandboxStripeFixturesBody, idempotencyKey: String? = nil) async throws -> PostSandboxBillingFixturesResponse {
        return try await send("POST", "/v1/sandbox/stripe-fixtures", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Preview a support card. POST /v1/support/apps/{adapter}/test
    ///
    /// Renders what the tool would show for a contact, from your own session: the context and the tool-format card. Nothing is sent to the tool.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postSupportAppsAdapterTest(adapter: String, _ body: PostSupportAppsAdapterTestBody, idempotencyKey: String? = nil) async throws -> PostSupportAppsAdapterTestResponse {
        return try await send("POST", "/v1/support/apps/\(Self.segment(adapter))/test", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Render a support card for a tool. POST /v1/support/cards/{orgId}/{adapter}
    ///
    /// Called by the support tool, signed in its own scheme (Chatly `x-chatly-signature`, Intercom `X-Body-Signature`, HubSpot v3, Front, Help Scout, a Zendesk app JWT, or the custom `X-Referalli-Signature`). Answers the tool's card format. An unknown org, a tool that is not connected, or a bad or stale signature all answer 404.
    ///
    /// **Auth:** none.
    public func postSupportCardsOrgIdAdapter(orgId: String, adapter: String, _ body: [String: JSONValue], idempotencyKey: String? = nil) async throws -> GetSupportPlatformChatlyAnswersResponse {
        return try await send("POST", "/v1/support/cards/\(Self.segment(orgId))/\(Self.segment(adapter))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Render the card for Referalli's own support desk. POST /v1/support/platform/chatly-card
    ///
    /// Called by Chatly for Referalli's own support workspace, signed `x-chatly-signature` with `CHATLY_PLATFORM_CARD_SECRET`. Names the person by the verified Atlas identity (`iss`, `sub`, `principal`), or by `contact.externalId` (`merchant:<user id>` / `partner:<account id>`), and answers one card across every programme they're in: a partner's status, balances and next payout per programme, or a merchant's organizations and roles. Unknown people get `blocks: null`; a bad or stale signature answers 404.
    ///
    /// **Auth:** none.
    public func postSupportPlatformChatlyCard(_ body: [String: JSONValue], idempotencyKey: String? = nil) async throws -> GetSupportPlatformChatlyAnswersResponse {
        return try await send("POST", "/v1/support/platform/chatly-card", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// File a corrected 1099. POST /v1/tax/1099/documents/{id}/correct
    ///
    /// Files a corrected form for one document with the partner's current amount. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postTax1099DocumentsIdCorrect(id: String, idempotencyKey: String? = nil) async throws -> TaxFiling {
        return try await send("POST", "/v1/tax/1099/documents/\(Self.segment(id))/correct", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// File 1099-NEC forms. POST /v1/tax/1099/filings
    ///
    /// E-files the year's 1099-NEC forms through the connected provider and records one document per partner. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postTax1099Filings(_ body: PostTax1099FilingsBody, idempotencyKey: String? = nil) async throws -> TaxFiling {
        return try await send("POST", "/v1/tax/1099/filings", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Refresh a filing status. POST /v1/tax/1099/filings/{id}/refresh
    ///
    /// Asks the filing provider for the latest status of a filing and its documents; accepted forms are then delivered to partners (`tax.form_delivered`).
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func postTax1099FilingsIdRefresh(id: String, idempotencyKey: String? = nil) async throws -> PostTax1099FilingsIdRefreshResponse {
        return try await send("POST", "/v1/tax/1099/filings/\(Self.segment(id))/refresh", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Advance the test clock. POST /v1/test_clock/advance
    ///
    /// Test mode only. Moves the test org's clock forward by `seconds` (never back), then runs what came due: held commissions are approved, payout schedules fire and retention purges run. Returns the new time and what ran. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func postTestClockAdvance(_ body: PostTestClockAdvanceBody, idempotencyKey: String? = nil) async throws -> PostTestClockAdvanceResponse {
        return try await send("POST", "/v1/test_clock/advance", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Track an event. POST /v1/track/events
    ///
    /// Records one event. `type: "event"` is a product event for a known customer (`event`, such as `trial_started`) that can pay a bounty under the program's commission rule; it returns whether it was recorded and the commission. `idempotencyKey` deduplicates. `type: "click"` records a server-side click for a partner; `type: "custom"` records an audited custom event. Publishable keys may send only custom events.
    ///
    /// **Auth:** an API key with `events:write`, or a session of any role.
    ///
    /// **Scopes:** `events:write`, `full`, `admin`.
    public func postTrackEvents(_ body: JSONValue, idempotencyKey: String? = nil) async throws -> PostTrackEventsResponse {
        return try await send("POST", "/v1/track/events", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Unsubscribe from outreach. POST /v1/unsubscribe/{token}
    ///
    /// The one-click unsubscribe link in outreach emails. No authentication; the token identifies the recipient.
    ///
    /// **Auth:** none.
    public func postUnsubscribeToken(token: String, idempotencyKey: String? = nil) async throws -> PostUnsubscribeTokenResponse {
        return try await send("POST", "/v1/unsubscribe/\(Self.segment(token))", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Record value events. POST /v1/value/events
    ///
    /// Reports up to 500 value facts from your platform: `payment`, `refund`, `credit_granted`, `credit_redeemed`, `credit_expired`, `credit_revoked`, `cost` or `adjustment`. Each needs `kind`, `currency`, `externalId` (your stable id, which makes it idempotent) and `occurredAt`, plus the customer, partner (`partnerId` or `partnerExternalRef`), grant, program, product and amount fields (`cashMinor`, `creditAppliedMinor`, `discountMinor`, `taxMinor`, `feesMinor`, `costMinor`, `faceMinor`) that apply. Each event is validated and recorded on its own: `results` and `errors` are by index. A repeat of an `externalId` with new figures supersedes the earlier one.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session of any role.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func postValueEvents(_ body: PostValueEventsBody, idempotencyKey: String? = nil) async throws -> PostValueEventsResponse {
        return try await send("POST", "/v1/value/events", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Import value events from CSV. POST /v1/value/import
    ///
    /// Imports value events from CSV text (up to 10,000 rows and 5 MB, else `413 payload_too_large`) with a `mapping` from column names to event fields (money as `<field>Minor` or `<field>Major`). `kind` applies to every row unless a column maps to it. Up to 500 rows are recorded before the response; a larger file answers `202` with a `jobId` to poll. `dryRun` returns the first 20 parsed rows and every row error without recording.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session of any role.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func postValueImport(_ body: PostValueImportBody, idempotencyKey: String? = nil) async throws -> PostValueImportResponse {
        return try await send("POST", "/v1/value/import", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Replay a webhook delivery. POST /v1/webhook-deliveries/{id}/replay
    ///
    /// Queues the delivery again at once with its attempt count reset. It keeps its `webhook-id`, so receivers can deduplicate.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func postWebhookDeliveriesIdReplay(id: String, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("POST", "/v1/webhook-deliveries/\(Self.segment(id))/replay", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Create a webhook endpoint. POST /v1/webhook-endpoints
    ///
    /// Subscribes an HTTPS URL to event topics (default `["*"]`, every event; see the `webhooks` section of this document for each topic's payload). `programIds` limits it to events about those programs (org-wide events such as payouts are then not sent). Deliveries are signed the Standard Webhooks way with the returned `secret` (`whsec_…`), shown only here. `legacySignature: true` also sends the deprecated body-only signature. `alertContacts` (up to 10 emails) are emailed, with the org owner, when the endpoint has failed for 1 hour and again at 24 hours; it is disabled after 72 hours of failures or 1,000 failed attempts in a row. `status: "paused"` creates it without delivering anything until you `PATCH` it to `active` (default `active`).
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func postWebhookEndpoints(_ body: PostWebhookEndpointsBody, idempotencyKey: String? = nil) async throws -> PostWebhookEndpointsResponse {
        return try await send("POST", "/v1/webhook-endpoints", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Replay failed deliveries. POST /v1/webhook-endpoints/{id}/replay
    ///
    /// Requeues the endpoint's failed deliveries created at or after `since` (ISO 8601), for after an outage. Each keeps its `webhook-id`, so receivers can dedupe. Audited.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    ///
    /// since: Requeue failed deliveries created at or after this time.
    public func postWebhookEndpointsIdReplay(id: String, since: String, idempotencyKey: String? = nil) async throws -> PostWebhookEndpointsIdReplayResponse {
        return try await send("POST", "/v1/webhook-endpoints/\(Self.segment(id))/replay", query: [("since", Self.queryString(since))], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Rotate an endpoint secret. POST /v1/webhook-endpoints/{id}/rotate-secret
    ///
    /// Issues a new signing secret, returned once. For 24 hours (`previousSecretExpiresAt`) every delivery carries a signature from each secret, so receivers can switch without dropping any. Audited.
    ///
    /// **Auth:** an API key with `webhooks:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `webhooks:write`, `full`, `admin`.
    public func postWebhookEndpointsIdRotateSecret(id: String, idempotencyKey: String? = nil) async throws -> PostWebhookEndpointsIdRotateSecretResponse {
        return try await send("POST", "/v1/webhook-endpoints/\(Self.segment(id))/rotate-secret", query: [], body: nil as NoBody?, idempotencyKey: idempotencyKey)
    }

    /// Exchange a user session for a widget token. POST /v1/widget/session
    ///
    /// Public, called by the referral widget from the browser with no merchant server route: `Authorization: Bearer <the signed-in user's own session JWT>` from their auth provider, body `{ programId }`. The program's auth connections say how to verify it (`tokenVerification`: a preset such as Clerk, Supabase, Firebase, Auth0, Cognito, WorkOS or Atlas, or your own issuer with a JWKS URL or HS256 secret); only connections whose issuer equals the token's `iss` are tried. Signature, issuer, audience (when configured) and expiry are checked with 60 seconds of clock skew. `customerRef` comes from `sub` (or the mapped claim). With the program's `settings.widget.autoEnroll`, a user who is not a partner yet is enrolled, but only with an email the token marks verified (`email_verified`); otherwise `404 not_enrolled`. CORS: only the connection's `allowedOrigins` (another origin gets `403` and no CORS header). Any token problem is a generic `401`. Rate-limited per connection, per user and (failures) per IP.
    ///
    /// **Auth:** none.
    public func postWidgetSession(_ body: PostWidgetSessionBody, idempotencyKey: String? = nil) async throws -> WidgetSession {
        return try await send("POST", "/v1/widget/session", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Mint a referral widget token. POST /v1/widget/tokens
    ///
    /// Your backend mints a short-lived token (60 to 3600 seconds, default 900) for a signed-in customer, identified by `customerRef` or `partnerExternalRef`, for the in-app referral widget. When the program has `settings.widget.autoEnroll`, a customer who isn't a partner yet is created on demand (send `email`). The token only reads that partner's own data.
    ///
    /// **Auth:** an API key with `partners:write`, or a session of any role.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func postWidgetTokens(_ body: PostWidgetTokensBody, idempotencyKey: String? = nil) async throws -> PostWidgetTokensResponse {
        return try await send("POST", "/v1/widget/tokens", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Record a conversion from Zapier. POST /v1/zapier/conversions
    ///
    /// Zapier's "Record conversion" action: a payment (or refund) for a customer through a generic billing connection (the org's first active one unless `connectionId`), with no signature needed. Idempotent by `providerEventId`. 400 without a generic billing connection.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func postZapierConversions(_ body: PostZapierConversionsBody, idempotencyKey: String? = nil) async throws -> PostZapierConversionsResponse {
        return try await send("POST", "/v1/zapier/conversions", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Subscribe a Zapier hook. POST /v1/zapier/hooks
    ///
    /// REST hook subscribe, called by Zapier when a Zap turns on: events of `event` are posted to the HTTPS `target_url`.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func postZapierHooks(_ body: PostZapierHooksBody, idempotencyKey: String? = nil) async throws -> ZapierHook {
        return try await send("POST", "/v1/zapier/hooks", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a connection's allowed origins (signed protocol). PUT /v1/auth/connections/{id}/origins
    ///
    /// The `origins` capability: the auth platform replaces this connection's own `allowedOrigins` (the browser origins that may call `POST /v1/widget/session`) when its app's origins change. Exact origins only (`https://app.example.com`, no path or wildcard; `http` only for localhost), at most 50; the body takes nothing else. Returns `{ id, allowedOrigins }`. Audited. A connection-signed `PATCH /v1/auth/connections/{id}` with the same body does the same. Signed with the connection secret in `x-referalli-signature: t=<unix>,v1=…,v2=…` (v2 also signs the request line; once a connection has seen v2 it requires it), with a unique `x-referalli-id` per call. The legacy header names from before the rename are also accepted, for existing integrations. Calls older than 5 minutes, reused ids (`409 replay`), paused connections (`423 connection_paused`) and unknown fields (`422`) are refused.
    ///
    /// **Auth:** none.
    public func putAuthConnectionsIdOrigins(id: String, _ body: PutAuthConnectionsIdOriginsBody, idempotencyKey: String? = nil) async throws -> PutAuthConnectionsIdOriginsResponse {
        return try await send("PUT", "/v1/auth/connections/\(Self.segment(id))/origins", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a vendor-issued secret. PUT /v1/auth/connections/{id}/secret
    ///
    /// For webhook connectors whose vendor issues the signing secret (Clerk, Stytch, WorkOS) or key set (Kinde's JWKS document): replaces the connection's secret. The previous one keeps verifying for 24 hours. Signed-protocol connections rotate instead. Audited.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `connections:write`, `full`, `admin`.
    public func putAuthConnectionsIdSecret(id: String, _ body: PutAuthConnectionsIdSecretBody, idempotencyKey: String? = nil) async throws -> PutAuthConnectionsIdSecretResponse {
        return try await send("PUT", "/v1/auth/connections/\(Self.segment(id))/secret", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a billing account's owner. PUT /v1/billing/accounts/{accountRef}/owner
    ///
    /// For products that bill an organization (a team, a workspace) rather than a person. `accountRef` is the id your billing events carry for the organization (the `customerRef` of a generic event, or the metadata value a connection's `customerRefMetadataKey` reads, e.g. `organization_id`); `ownerCustomerRef` is the user whose referral its payments earn for. From then on the account's payments earn for the owner's referral (unless a referral is filed under the account itself). The first owner set replays the account's earlier payments for that owner's referral. Changing the owner re-points the account's provider customers, so later payments earn for the new owner's referral; payments made before the change stay with the previous owner's referral. When the organization's id changed, call it under the new id with `previousAccountRef` (the old one) instead of, or as well as, `ownerCustomerRef`: the old id then follows the new one (payments still arriving under it earn for the new id's owner), and the owner carries over unless named. Returns `{ accountRef, ownerCustomerRef, previousOwnerCustomerRef, renamedFrom, deleted, changed, relinked, reprocessedPayments }`; the same call again answers `changed: false`. Publishes `billing_account.owner_changed`. Auth platforms with the `accounts` capability (Atlas) send this for you through `POST /v1/auth/connections/{id}/accounts`. Needs `billing:write`. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func putBillingAccountsAccountRefOwner(accountRef: String, _ body: PutBillingAccountsAccountRefOwnerBody, idempotencyKey: String? = nil) async throws -> PutBillingAccountsAccountRefOwnerResponse {
        return try await send("PUT", "/v1/billing/accounts/\(Self.segment(accountRef))/owner", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set provider API credentials. PUT /v1/billing/connections/{id}/credentials
    ///
    /// For providers that send thin webhooks (Recurly, BigCommerce), the API credentials used to fetch the full event: `apiKey`, or `apiToken` plus `storeHash`, and `region`. Chargebee: `apiKey` and `site` (the subdomain), used by the account-credit rail (`PUT /v1/programs/{id}/credit-rail`); setting them needs a recent sign-in. Stored encrypted. 400 for providers that take no credentials or when a required field is missing. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func putBillingConnectionsIdCredentials(id: String, _ body: PutBillingConnectionsIdCredentialsBody, idempotencyKey: String? = nil) async throws -> PutBillingConnectionsIdCredentialsResponse {
        return try await send("PUT", "/v1/billing/connections/\(Self.segment(id))/credentials", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the webhook signing secret. PUT /v1/billing/connections/{id}/secret
    ///
    /// Replaces the connection's signing secret with the provider's own (at least 8 characters). The previous secret keeps verifying for 24 hours. A connection reading `awaiting_secret` reads `active` from then on. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func putBillingConnectionsIdSecret(id: String, _ body: PutBillingConnectionsIdSecretBody, idempotencyKey: String? = nil) async throws -> PutBillingConnectionsIdSecretResponse {
        return try await send("PUT", "/v1/billing/connections/\(Self.segment(id))/secret", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the value mapping. PUT /v1/billing/connections/{id}/value-mapping
    ///
    /// Where cash, credit applied, discount, cost and product live in this connection's payloads, as dot paths (`[]` sums an array, for example `data.discounts[].amount`), and whether amounts are in minor or major units. Each save bumps the mapping version; a rebuild re-applies it to stored events. Audited.
    ///
    /// **Auth:** an API key with `billing:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `billing:write`, `full`, `admin`.
    public func putBillingConnectionsIdValueMapping(id: String, _ body: PutBillingConnectionsIdValueMappingBody, idempotencyKey: String? = nil) async throws -> PutBillingConnectionsIdValueMappingResponse {
        return try await send("PUT", "/v1/billing/connections/\(Self.segment(id))/value-mapping", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update branding. PUT /v1/branding
    ///
    /// Sets the logo URL, theme (only the documented `--r-*` tokens, with plain CSS values) and email sender. Omitted fields keep their value. `warnings` lists theme text/background pairs (`--r-accent-ink` on `--r-accent`, `--r-ink` on `--r-paper`) below the 4.5:1 WCAG AA contrast; the theme is saved anyway.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putBranding(_ body: PutBrandingBody, idempotencyKey: String? = nil) async throws -> PutBrandingResponse {
        return try await send("PUT", "/v1/branding", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update email settings. PUT /v1/email/settings
    ///
    /// Sets the email provider and its API key (write-only: omit to keep it, `null` to remove), the from address and name, reply-to, logo and primary color for partner emails. Without a provider, no email is sent.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putEmailSettings(_ body: PutEmailSettingsBody, idempotencyKey: String? = nil) async throws -> EmailSettings {
        return try await send("PUT", "/v1/email/settings", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Override an email template. PUT /v1/email/templates/{event}/{locale}
    ///
    /// Replaces the subject, text and optional HTML of one event in one locale. 404 for an unknown event or locale.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putEmailTemplatesEventLocale(event: String, locale: String, _ body: PutEmailTemplatesEventLocaleBody, idempotencyKey: String? = nil) async throws -> PutEmailTemplatesEventLocaleResponse {
        return try await send("PUT", "/v1/email/templates/\(Self.segment(event))/\(Self.segment(locale))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect HubSpot. PUT /v1/integrations/hubspot
    ///
    /// Connects HubSpot with your private-app `token` (required the first time; omit to keep it) to sync partners as contacts and referrals as deals in `pipeline`, moving them to `paidDealStage` when they pay. `status: "paused"` stops syncing.
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func putIntegrationsHubspot(_ body: PutIntegrationsHubspotBody, idempotencyKey: String? = nil) async throws -> IntegrationConnection {
        return try await send("PUT", "/v1/integrations/hubspot", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect Segment. PUT /v1/integrations/segment
    ///
    /// Connects a Segment source with its `writeKey` (required the first time) and sends referral, commission, payout and partner events as track calls; `events` limits which topics (`null` for all).
    ///
    /// **Auth:** an API key with `integrations:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `integrations:write`, `full`, `admin`.
    public func putIntegrationsSegment(_ body: PutIntegrationsSegmentBody, idempotencyKey: String? = nil) async throws -> IntegrationConnection {
        return try await send("PUT", "/v1/integrations/segment", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// List a program in the marketplace. PUT /v1/marketplace/listing
    ///
    /// Creates or updates the marketplace listing of a program: visibility (`public` or `unlisted`), category, headline, description and sponsored placement. Audited.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func putMarketplaceListing(_ body: PutMarketplaceListingBody, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("PUT", "/v1/marketplace/listing", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set my email language. PUT /v1/me/locale
    ///
    /// The signed-in user's preferred locale for emails. User session only.
    ///
    /// **Auth:** an API key with `team:write`, or a session of any role.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func putMeLocale(_ body: PutMeLocaleBody, idempotencyKey: String? = nil) async throws -> PutMeLocaleResponse {
        return try await send("PUT", "/v1/me/locale", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Turn my ROI digest on or off. PUT /v1/me/roi-digest
    ///
    /// Whether the signed-in member receives this org's periodic credit ROI digest email. User session only.
    ///
    /// **Auth:** an API key with `team:write`, or a session of any role.
    ///
    /// **Scopes:** `team:write`, `full`, `admin`.
    public func putMeRoiDigest(_ body: PutMeRoiDigestBody, idempotencyKey: String? = nil) async throws -> PutMeRoiDigestResponse {
        return try await send("PUT", "/v1/me/roi-digest", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Join or leave the attribution network. PUT /v1/network/settings
    ///
    /// Opts the org in or out of the cross-merchant attribution network: contributing its referral touchpoints (as hashed customer identities and partner accounts, never merchant identity or PII) and, in return, reading the network journey.
    ///
    /// **Auth:** an API key with `growth:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `growth:write`, `full`, `admin`.
    public func putNetworkSettings(_ body: PutNetworkSettingsBody, idempotencyKey: String? = nil) async throws -> PutNetworkSettingsResponse {
        return try await send("PUT", "/v1/network/settings", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the Cookie Munch sites to accept consent events for. PUT /v1/org/consent-partners/cookiemunch
    ///
    /// Replaces the list of Cookie Munch sites (cbids) whose signed consent events this org keeps. An event for any other site is acknowledged and dropped, since the org a delivery names is chosen by whoever made the link. Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgConsentPartnersCookiemunch(_ body: PutOrgConsentPartnersCookiemunchBody, idempotencyKey: String? = nil) async throws -> GetOrgConsentPartnersCookiemunchResponse {
        return try await send("PUT", "/v1/org/consent-partners/cookiemunch", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Turn the FX feed on or off. PUT /v1/org/fx-feed
    ///
    /// Turns the daily ECB reference-rate feed on or off. Turning it on syncs once at once and returns how many rates were inserted. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgFxFeed(_ body: PutOrgFxFeedBody, idempotencyKey: String? = nil) async throws -> PutOrgFxFeedResponse {
        return try await send("PUT", "/v1/org/fx-feed", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the hosted-page consent and chat. PUT /v1/org/hosted-pages
    ///
    /// Validates and saves the adapters. A CMP's `scriptUrl` must be https on that vendor's own hosts; `custom` needs every origin listed; every chat vendor also takes `origins` for hosts its account needs beyond the documented list. `chat.identitySecret` (write-only, sealed) is your chat vendor's identity-verification secret, used to sign partners in to your chat: a string sets it, `null` removes it, absent keeps it, and switching vendors drops it. `customOrigins` adds origins per CSP directive (https or wss, no wildcards, no keywords). Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgHostedPages(_ body: PutOrgHostedPagesBody, idempotencyKey: String? = nil) async throws -> GetOrgHostedPagesResponse {
        return try await send("PUT", "/v1/org/hosted-pages", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the org payout schedule. PUT /v1/org/payout-schedule
    ///
    /// When payouts run automatically for every program without its own schedule: a `schedule` (`monthly`, `weekly`, `twice_monthly` or `custom` dates), the older `dayOfMonth` form, or `null` to turn automatic payouts off. Send exactly one of `schedule` and `dayOfMonth`. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func putOrgPayoutSchedule(_ body: PutOrgPayoutScheduleBody, idempotencyKey: String? = nil) async throws -> PutOrgPayoutScheduleResponse {
        return try await send("PUT", "/v1/org/payout-schedule", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set partner sign-in. PUT /v1/org/portal-auth
    ///
    /// Chooses the portal sign-in adapter and its settings. `custom`: `issuer` and `jwksUrl` (https), or `preset` + `tenant` for a known platform (`jwtPresets` in the GET lists them: Clerk, Supabase, Firebase, Auth0, Cognito, Stytch, Kinde, Okta, Entra ID, Google, Keycloak, Descope, FusionAuth), or `keyType: hs256` with a write-only `sharedSecret` (≥ 32 characters, sealed); optional `audience` (default `referalli:<org>`), `maxAgeS` (30 to 3600, default 300), `claims` (where `sub`, `email`, `name`, `emailVerified` live, by name or dot path), `loginUrl` (your page that mints the token) and `autoEnrollProgramId`. `oidc`: `issuer`, `clientId`, `clientSecret`. `referalli` removes any configuration. Owner only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgPortalAuth(_ body: JSONValue, idempotencyKey: String? = nil) async throws -> PutOrgPortalAuthResponse {
        return try await send("PUT", "/v1/org/portal-auth", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set referral query parameters. PUT /v1/org/referral-params
    ///
    /// Replaces the extra query parameters aff.js reads a referral code from (up to 10; lowercase letters, digits and `_`). Built-in names are dropped. Imports add the previous tool's parameter here so already-shared links keep crediting. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgReferralParams(_ body: PutOrgReferralParamsBody, idempotencyKey: String? = nil) async throws -> GetOrgReferralParamsResponse {
        return try await send("PUT", "/v1/org/referral-params", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the data retention policy. PUT /v1/org/retention
    ///
    /// Changes retention days for one or more kinds of raw data (others keep their value). Values below a kind's minimum are rejected. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgRetention(_ body: PutOrgRetentionBody, idempotencyKey: String? = nil) async throws -> Retention {
        return try await send("PUT", "/v1/org/retention", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect your own identity provider. PUT /v1/org/sso/direct
    ///
    /// Team SSO with the org's own IdP, no broker: `adapter` `oidc` (issuer, client id and secret, the claim that holds roles) or `workos` (client id, organization id, the org's own API key). `roleMapping` maps IdP groups or roles to `admin`, `finance`, `analyst` or `support` (never owner); `defaultRole` covers everyone else, or null to keep them out; `domains` are the email domains "require SSO" applies to. The secret is encrypted and never returned; leave it out to keep the stored one. 409 while the org uses the Atlas broker. Owner only.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgSsoDirect(_ body: JSONValue, idempotencyKey: String? = nil) async throws -> PutOrgSsoDirectResponse {
        return try await send("PUT", "/v1/org/sso/direct", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect a 1099 filing provider. PUT /v1/org/tax-filing
    ///
    /// Chooses who e-files 1099-NEC forms: `test` (simulated) or `tax1099` with your own API key (stored encrypted). Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgTaxFiling(_ body: PutOrgTaxFilingBody, idempotencyKey: String? = nil) async throws -> PutOrgTaxFilingResponse {
        return try await send("PUT", "/v1/org/tax-filing", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update the tax profile. PUT /v1/org/tax-profile
    ///
    /// Sets any of the tax profile fields; `null` clears one. A VAT id must be a valid EU VAT number; an EIN looks like `12-3456789`. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgTaxProfile(_ body: PutOrgTaxProfileBody, idempotencyKey: String? = nil) async throws -> TaxProfile {
        return try await send("PUT", "/v1/org/tax-profile", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the tracker's consent default. PUT /v1/org/tracking-consent
    ///
    /// Sets the consent default served inside `/t/{token}/aff.js` (cached up to 5 minutes). Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putOrgTrackingConsent(_ body: PutOrgTrackingConsentBody, idempotencyKey: String? = nil) async throws -> GetOrgTrackingConsentResponse {
        return try await send("PUT", "/v1/org/tracking-consent", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set my email language (partner). PUT /v1/partner/locale
    ///
    /// The partner account's preferred locale for emails.
    ///
    /// **Auth:** a partner session.
    public func putPartnerLocale(_ body: PutPartnerLocaleBody, idempotencyKey: String? = nil) async throws -> PutPartnerLocaleResponse {
        return try await send("PUT", "/v1/partner/locale", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set my payout details. PUT /v1/partner/orgs/{orgId}/payout-profile
    ///
    /// How this merchant pays the partner: the method, its details (checked for what the rail needs, such as a PayPal email or wallet address) and currency. When two-factor sign-in is on, send the current code in `x-totp-code` (`401 step_up_required` otherwise).
    ///
    /// **Auth:** a partner session.
    public func putPartnerOrgsOrgIdPayoutProfile(orgId: String, _ body: PutPartnerOrgsOrgIdPayoutProfileBody, idempotencyKey: String? = nil) async throws -> PutPartnerOrgsOrgIdPayoutProfileResponse {
        return try await send("PUT", "/v1/partner/orgs/\(Self.segment(orgId))/payout-profile", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set my conversion postback. PUT /v1/partner/orgs/{orgId}/postback
    ///
    /// Registers a server-to-server postback URL the merchant calls on the partner's events, with macros `{topic}`, `{partner_id}`, `{referral_id}`, `{customer}`, `{amount}`, `{currency}`. Returns a new signing secret.
    ///
    /// **Auth:** a partner session.
    public func putPartnerOrgsOrgIdPostback(orgId: String, _ body: PutPartnerOrgsOrgIdPostbackBody, idempotencyKey: String? = nil) async throws -> PutPartnerOrgsOrgIdPostbackResponse {
        return try await send("PUT", "/v1/partner/orgs/\(Self.segment(orgId))/postback", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set my VAT number. PUT /v1/partner/orgs/{orgId}/vat
    ///
    /// Sets the partner's own EU VAT number with this merchant, checked against VIES when the merchant requires it.
    ///
    /// **Auth:** a partner session.
    public func putPartnerOrgsOrgIdVat(orgId: String, _ body: PutPartnerOrgsOrgIdVatBody, idempotencyKey: String? = nil) async throws -> PutPartnersIdVatResponse {
        return try await send("PUT", "/v1/partner/orgs/\(Self.segment(orgId))/vat", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update my creator profile. PUT /v1/partner/profile
    ///
    /// Updates the creator profile merchants search. `published: true` lists it in creator search; `acceptsInvites` controls whether merchants can invite the partner.
    ///
    /// **Auth:** a partner session.
    public func putPartnerProfile(_ body: PutPartnerProfileBody, idempotencyKey: String? = nil) async throws -> Ok {
        return try await send("PUT", "/v1/partner/profile", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a partner's payout profile. PUT /v1/partners/{id}/payout-profile
    ///
    /// How the partner is paid: `method` (`paypal`, `wise`, `stripe_connect`, `ach`, `crypto`, `payoneer`, `tremendous` or `csv`), method `details` (a free-form map such as `{ "paypalEmail": … }`), the currency to pay in and the minimum balance before a payout. Partners can also set this themselves in the portal.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func putPartnersIdPayoutProfile(id: String, _ body: PutPartnersIdPayoutProfileBody, idempotencyKey: String? = nil) async throws -> PutPartnersIdPayoutProfileResponse {
        return try await send("PUT", "/v1/partners/\(Self.segment(id))/payout-profile", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a partner's VAT number. PUT /v1/partners/{id}/vat
    ///
    /// Sets (or clears with `null`) the partner's EU VAT number on their payout profile. With `viesCheck` on, VIES must list it as registered. 404 until the partner has payout details. Audited.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func putPartnersIdVat(id: String, _ body: PutPartnersIdVatBody, idempotencyKey: String? = nil) async throws -> PutPartnersIdVatResponse {
        return try await send("PUT", "/v1/partners/\(Self.segment(id))/vat", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect a payout provider. PUT /v1/payout-connections/{provider}
    ///
    /// Connects (or replaces) your own account with a payout provider, so payouts move money from your account: `paypal` (`clientId`, `secret`), `stripe` (`secretKey`), `circle` (`apiKey`, `walletId`), `wise` (`apiToken`, `profileId`), `payoneer` (`clientId`, `secret`, `programId`) or `tremendous` (`apiKey`, `fundingSourceId`), each with `env`. Stored encrypted and never echoed. Live mode only (`409 test_mode_unsupported` in test mode). Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func putPayoutConnectionsProvider(provider: String, _ body: JSONValue, idempotencyKey: String? = nil) async throws -> PutPayoutConnectionsProviderResponse {
        return try await send("PUT", "/v1/payout-connections/\(Self.segment(provider))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Replace the portal design draft. PUT /v1/portal/theme/draft
    ///
    /// Replaces the whole draft: keys you leave out are gone. Unknown keys are refused with 422 naming each one by its full path. Owner or admin.
    ///
    /// **Auth:** an API key with `org:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `org:write`, `full`, `admin`.
    public func putPortalThemeDraft(_ body: [String: JSONValue], idempotencyKey: String? = nil) async throws -> GetPortalThemeResponse {
        return try await send("PUT", "/v1/portal/theme/draft", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a product margin. PUT /v1/profitability/products/{productRef}
    ///
    /// Sets a product's margin (`marginBps`) or unit cost (`unitCostMinor`, in `currency`, default the reporting currency); exactly one of the two. Audited.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func putProfitabilityProductsProductRef(productRef: String, _ body: PutProfitabilityProductsProductRefBody, idempotencyKey: String? = nil) async throws -> GetProfitabilityProductsProductRefResponse {
        return try await send("PUT", "/v1/profitability/products/\(Self.segment(productRef))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Update profitability settings. PUT /v1/profitability/settings
    ///
    /// Changes the org's economics settings, or with `programId` that program's overrides (a program can't override org-only fields such as the reporting currency). Returns the resolved settings. Re-run `POST /v1/profitability/rebuild` to apply changes to past figures. Audited.
    ///
    /// **Auth:** an API key with `analytics:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `analytics:write`, `full`, `admin`.
    public func putProfitabilitySettings(_ body: PutProfitabilitySettingsBody, idempotencyKey: String? = nil) async throws -> GetProfitabilitySettingsResponse {
        return try await send("PUT", "/v1/profitability/settings", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Configure autopricing. PUT /v1/programs/{id}/autopricing
    ///
    /// Self-pricing commissions: a target (`targetRoas`, or with `objective: "roi"` a `targetRoi`) and the `minBps`/`maxBps` band partner rates may move within. `enabled: false` turns it off.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func putProgramsIdAutopricing(id: String, _ body: PutProgramsIdAutopricingBody, idempotencyKey: String? = nil) async throws -> PutProgramsIdAutopricingResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/autopricing", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a program's account-credit rail settings. PUT /v1/programs/{id}/credit-rail
    ///
    /// Turns the account-credit rail on or off for a program and picks where credits go. `connectionId` names a billing connection: its provider picks the adapter (`stripe` or `chargebee`; verified live: Stripe only) and its stored API credentials are used (Chargebee: `PUT /v1/billing/connections/{id}/credentials` with `apiKey` and `site`). The connection's `programIds` must include the program or be empty. With no `connectionId` the provider is Stripe on its own key path (`PUT /v1/stripe-credits/connection`, a program key, or a Stripe payout connection). Every other field means what it means on `PUT /v1/programs/{id}/stripe-credits` and is replaced on every PUT. A provider without customer creation (Chargebee) refuses `createCustomerIfMissing` (400); Chargebee matches `referrerMatch: "metadata"` on `metadataKey` `id` (the customer id) or a custom field `cf_…`. Credentials are checked with the provider on save: `422 provider_credentials_invalid`, `422 provider_credentials_wrong_mode` (a Chargebee `…-test` site in live mode, or another site in test mode), `422 provider_permission` (cannot write credits), `502 provider_unavailable`; enabling without credentials is `409 credit_credentials_required` (`409 stripe_key_required` for Stripe). Owner or admin. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func putProgramsIdCreditRail(id: String, _ body: PutProgramsIdCreditRailBody, idempotencyKey: String? = nil) async throws -> GetProgramsIdCreditRailResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/credit-rail", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the incrementality holdout. PUT /v1/programs/{id}/incrementality
    ///
    /// Holds out a random control share of referrals (`holdoutBps`, up to 5000 = 50%) from being commissioned, so comparing control and treatment conversion measures the true lift partners cause. 0 turns it off.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func putProgramsIdIncrementality(id: String, _ body: PutProgramsIdIncrementalityBody, idempotencyKey: String? = nil) async throws -> PutProgramsIdIncrementalityResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/incrementality", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the agent negotiation policy. PUT /v1/programs/{id}/negotiation-policy
    ///
    /// What an agent may negotiate to in this program: rates between `minBps` and `maxBps`, accepted automatically up to `autoAcceptMaxBps`. Requires `minBps <= autoAcceptMaxBps <= maxBps`. `enabled: false` closes the program to negotiation.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func putProgramsIdNegotiationPolicy(id: String, _ body: PutProgramsIdNegotiationPolicyBody, idempotencyKey: String? = nil) async throws -> PutProgramsIdNegotiationPolicyResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/negotiation-policy", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a partner's group. PUT /v1/programs/{id}/partners/{partnerId}/group
    ///
    /// Puts an enrolled partner in one of the program's groups, or none (`groupId: null`). A partner is in at most one group per program.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func putProgramsIdPartnersPartnerIdGroup(id: String, partnerId: String, _ body: PutProgramsIdPartnersPartnerIdGroupBody, idempotencyKey: String? = nil) async throws -> PutProgramsIdPartnersPartnerIdGroupResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/partners/\(Self.segment(partnerId))/group", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a program's payout schedule. PUT /v1/programs/{id}/payout-schedule
    ///
    /// Overrides the org payout schedule for this program: a schedule, `{ "kind": "off" }` to never pay it automatically, or `null` to follow the org schedule again. Returns the next run date. Audited.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`, `finance`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func putProgramsIdPayoutSchedule(id: String, _ body: PutProgramsIdPayoutScheduleBody, idempotencyKey: String? = nil) async throws -> PutProgramsIdPayoutScheduleResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/payout-schedule", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set the referee reward. PUT /v1/programs/{id}/referee-reward
    ///
    /// What a referred customer gets: `store_credit`, a `coupon` or a `gift_card`, either a flat `amountMinor` or a percent (`bps`, optionally capped with `capMinor`) of their first payment, issued on their first commission or first payment. A percent reward needs `on: "first_payment"`. `enabled: false` removes it. Each reward issued publishes `referee_reward.earned`.
    ///
    /// **Auth:** an API key with `programs:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `programs:write`, `full`, `admin`.
    public func putProgramsIdRefereeReward(id: String, _ body: PutProgramsIdRefereeRewardBody, idempotencyKey: String? = nil) async throws -> PutProgramsIdRefereeRewardResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/referee-reward", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Set a program's Stripe balance credit settings. PUT /v1/programs/{id}/stripe-credits
    ///
    /// Turns the rail on or off for a program. Each `commission.settled` line with method `merchant_credit` is credited to the referrer's Stripe customer balance; a later `commission.reversed` debits it back. `referrerMatch`: `billing_link` (the partner's externalRef is a `cus_…` id or is billing-linked to one; with several linked customers, the one with the most recent activity on a still-active subscription, then the most recently linked, `ambiguous_customer` only on a tie), `metadata` (Stripe customer search on `metadata[metadataKey]` = the partner's externalRef) or `email` (the one Stripe customer with the partner's email). `refereeRewards: true` also credits `store_credit` referee rewards to the referred customer. Custom units (`x_…`) are never credited. `balanceCurrency` (ISO code, stored lowercase) forces the currency every credit is sent in; without it a credit goes in the Stripe customer's balance currency, or the commission's when the customer has none yet. When that differs from the commission's currency the amount is converted at your FX rate (`POST /v1/fx-rates`, half-even rounding); with no rate the credit waits as `fx_rate_missing`. `createCustomerIfMissing: { metadata }` creates a Stripe customer for a referrer none matches (the partner's email, `metadata[metadataKey]` = the partner's externalRef, plus your metadata) and credits it; referee credits never create customers. `waitForCustomer: true` keeps a credit no customer matches `pending` with no attempt cap (instead of `no_customer`) and retries it as soon as a billing webhook links a `cus_…` to that externalRef. Metadata and email matching need exactly one Stripe customer: several is `ambiguous_customer`, never a guess. `balanceCurrency`, `createCustomerIfMissing` and `waitForCustomer` are replaced on every PUT (omitted = off). Enabling needs a key (`409 stripe_key_required`). `secretKey` gives the program its own Stripe key, used instead of the org's for all of its credits and debits (a separate Stripe account per product, say); `null` removes it, omitting it keeps it. The key is checked with Stripe before it is saved: `422 stripe_key_invalid` (Stripe rejects it), `422 stripe_key_wrong_mode` (a test key in live mode or a live key in test mode) or `422 stripe_key_permission` (no Customers write), `502 stripe_unavailable` if Stripe cannot be reached. Owner or admin; setting or removing a key needs a recent sign-in. Audited (never the key).
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func putProgramsIdStripeCredits(id: String, _ body: PutProgramsIdStripeCreditsBody, idempotencyKey: String? = nil) async throws -> GetProgramsIdStripeCreditsResponse {
        return try await send("PUT", "/v1/programs/\(Self.segment(id))/stripe-credits", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Save a reward rule. PUT /v1/rewards/rules/{key}
    ///
    /// Creates or replaces a rule: the amount, the reason, an optional program and an optional `event` it rewards (one rule per event).
    ///
    /// **Auth:** an API key with `commissions:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `commissions:write`, `full`, `admin`.
    public func putRewardsRulesKey(key: String, _ body: PutRewardsRulesKeyBody, idempotencyKey: String? = nil) async throws -> PutRewardsRulesKeyResponse {
        return try await send("PUT", "/v1/rewards/rules/\(Self.segment(key))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect a Stripe key for balance credits. PUT /v1/stripe-credits/connection
    ///
    /// Stores your own Stripe restricted key (`rk_…`, with Customers write) for the balance credit rail, encrypted and never echoed. Without one the rail uses the secret key of your Stripe payout connection, if any. A program can override it with its own key (`PUT /v1/programs/{id}/stripe-credits`). The key is checked with Stripe before it is saved: `422 stripe_key_invalid` (Stripe rejects it), `422 stripe_key_wrong_mode` (a test key in live mode or a live key in test mode) or `422 stripe_key_permission` (no Customers write), `502 stripe_unavailable` if Stripe cannot be reached. Owner or admin, recent sign-in. Audited.
    ///
    /// **Auth:** an API key with `payouts:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `payouts:write`, `full`, `admin`.
    public func putStripeCreditsConnection(_ body: PutStripeCreditsConnectionBody, idempotencyKey: String? = nil) async throws -> GetStripeCreditsConnectionResponse {
        return try await send("PUT", "/v1/stripe-credits/connection", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Connect a support tool. PUT /v1/support/apps/{adapter}
    ///
    /// Enable a support tool and store its signing secret (vendor-issued; write-only) or, for Zendesk, the app public key in `config.publicKeyPem`. For `custom` Referalli mints the secret: it is returned once, and `rotate: true` mints a new one.
    ///
    /// **Auth:** an API key with `partners:write`, or a session with role `owner`, `admin`.
    ///
    /// **Scopes:** `partners:write`, `full`, `admin`.
    public func putSupportAppsAdapter(adapter: String, _ body: PutSupportAppsAdapterBody, idempotencyKey: String? = nil) async throws -> PutSupportAppsAdapterResponse {
        return try await send("PUT", "/v1/support/apps/\(Self.segment(adapter))", query: [], body: body, idempotencyKey: idempotencyKey)
    }

    /// Calls any operation by its id through its typed method; JSON in, JSON out.
    public func call(_ operationId: String, path: [String: String] = [:], query: [String: JSONValue] = [:], body: JSONValue? = nil, idempotencyKey: String? = nil) async throws -> JSONValue {
        switch operationId {
        case "deleteApiKeysId":
            return try Self.encode(try await deleteApiKeysId(id: path["id"] ?? "", cascade: Self.queryString(query["cascade"]), pair: Self.queryString(query["pair"]), idempotencyKey: idempotencyKey))
        case "deleteAssetsId":
            return try Self.encode(try await deleteAssetsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteAuthConnectionsId":
            return try Self.encode(try await deleteAuthConnectionsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteBillingAccountsAccountRef":
            return try Self.encode(try await deleteBillingAccountsAccountRef(accountRef: path["accountRef"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteBillingConnectionsId":
            return try Self.encode(try await deleteBillingConnectionsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteBillingInternalCustomersCustomerRef":
            return try Self.encode(try await deleteBillingInternalCustomersCustomerRef(customerRef: path["customerRef"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteBrandingDomain":
            return try Self.encode(try await deleteBrandingDomain(idempotencyKey: idempotencyKey))
        case "deleteBrandingLinkDomain":
            return try Self.encode(try await deleteBrandingLinkDomain(idempotencyKey: idempotencyKey))
        case "deleteCliListenersId":
            return try Self.encode(try await deleteCliListenersId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteEmailTemplatesEventLocale":
            return try Self.encode(try await deleteEmailTemplatesEventLocale(event: path["event"] ?? "", locale: path["locale"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteIntegrationsKind":
            return try Self.encode(try await deleteIntegrationsKind(kind: path["kind"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteOrgMembersUserId":
            return try Self.encode(try await deleteOrgMembersUserId(userId: path["userId"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteOrgSsoDirect":
            return try Self.encode(try await deleteOrgSsoDirect(idempotencyKey: idempotencyKey))
        case "deletePartnerApiTokensId":
            return try Self.encode(try await deletePartnerApiTokensId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deletePartnersId":
            return try Self.encode(try await deletePartnersId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deletePayoutConnectionsProvider":
            return try Self.encode(try await deletePayoutConnectionsProvider(provider: path["provider"] ?? "", idempotencyKey: idempotencyKey))
        case "deletePortalThemeDraft":
            return try Self.encode(try await deletePortalThemeDraft(idempotencyKey: idempotencyKey))
        case "deletePrivacyExecutorsAdapter":
            return try Self.encode(try await deletePrivacyExecutorsAdapter(adapter: path["adapter"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteProductLinksId":
            return try Self.encode(try await deleteProductLinksId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteProfitabilityProductsProductRef":
            return try Self.encode(try await deleteProfitabilityProductsProductRef(productRef: path["productRef"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteRewardsRulesKey":
            return try Self.encode(try await deleteRewardsRulesKey(key: path["key"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteStripeCreditsConnection":
            return try Self.encode(try await deleteStripeCreditsConnection(idempotencyKey: idempotencyKey))
        case "deleteSupportAppsAdapter":
            return try Self.encode(try await deleteSupportAppsAdapter(adapter: path["adapter"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteWebhookEndpointsId":
            return try Self.encode(try await deleteWebhookEndpointsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "deleteZapierHooksId":
            return try Self.encode(try await deleteZapierHooksId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getAdminMetrics":
            return try Self.encode(try await getAdminMetrics(idempotencyKey: idempotencyKey))
        case "getAdminOrgs":
            return try Self.encode(try await getAdminOrgs(q: Self.queryString(query["q"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAdminPartnerAccounts":
            return try Self.encode(try await getAdminPartnerAccounts(flagged: Self.queryBool(query["flagged"]), q: Self.queryString(query["q"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAgents":
            return try Self.encode(try await getAgents(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAgentsRecommendations":
            return try Self.encode(try await getAgentsRecommendations(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAnalyticsByChannel":
            return try Self.encode(try await getAnalyticsByChannel(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAnalyticsByGeo":
            return try Self.encode(try await getAnalyticsByGeo(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAnalyticsCohortLtv":
            return try Self.encode(try await getAnalyticsCohortLtv(months: Self.queryInt(query["months"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAnalyticsCouponPerformance":
            return try Self.encode(try await getAnalyticsCouponPerformance(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAnalyticsOverview":
            return try Self.encode(try await getAnalyticsOverview(programId: Self.queryString(query["programId"]), days: Self.queryInt(query["days"]), idempotencyKey: idempotencyKey))
        case "getAnalyticsTimeseries":
            return try Self.encode(try await getAnalyticsTimeseries(metric: Self.queryString(query["metric"]) ?? "", days: Self.queryInt(query["days"]), programId: Self.queryString(query["programId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getApiKeys":
            return try Self.encode(try await getApiKeys(mode: Self.queryString(query["mode"]), owner: Self.queryString(query["owner"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getApiKeysId":
            return try Self.encode(try await getApiKeysId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getAssets":
            return try Self.encode(try await getAssets(programId: Self.queryString(query["programId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAssistantSuggestions":
            return try Self.encode(try await getAssistantSuggestions(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAuditLogs":
            return try Self.encode(try await getAuditLogs(actor: Self.queryString(query["actor"]), actorType: Self.queryString(query["actorType"]), action: Self.queryString(query["action"]), subjectType: Self.queryString(query["subjectType"]), subjectId: Self.queryString(query["subjectId"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), idempotencyKey: idempotencyKey))
        case "getAuthConnections":
            return try Self.encode(try await getAuthConnections(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getAuthConnectionsId":
            return try Self.encode(try await getAuthConnectionsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getAuthConnectionsIdExport":
            return try Self.encode(try await getAuthConnectionsIdExport(id: path["id"] ?? "", customerRef: Self.queryString(query["customerRef"]) ?? "", idempotencyKey: idempotencyKey))
        case "getAuthConnectionsIdUsersCustomerRefReferral":
            return try Self.encode(try await getAuthConnectionsIdUsersCustomerRefReferral(id: path["id"] ?? "", customerRef: path["customerRef"] ?? "", idempotencyKey: idempotencyKey))
        case "getAuthConnectionsProviders":
            return try Self.encode(try await getAuthConnectionsProviders(idempotencyKey: idempotencyKey))
        case "getAuthProviders":
            return try Self.encode(try await getAuthProviders(idempotencyKey: idempotencyKey))
        case "getBillingAccountsAccountRef":
            return try Self.encode(try await getBillingAccountsAccountRef(accountRef: path["accountRef"] ?? "", idempotencyKey: idempotencyKey))
        case "getBillingConnections":
            return try Self.encode(try await getBillingConnections(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getBillingConnectionsId":
            return try Self.encode(try await getBillingConnectionsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getBillingEvents":
            return try Self.encode(try await getBillingEvents(customerRef: Self.queryString(query["customerRef"]), status: Self.queryString(query["status"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getBillingInternalCustomers":
            return try Self.encode(try await getBillingInternalCustomers(idempotencyKey: idempotencyKey))
        case "getBillingPlan":
            return try Self.encode(try await getBillingPlan(idempotencyKey: idempotencyKey))
        case "getBranding":
            return try Self.encode(try await getBranding(idempotencyKey: idempotencyKey))
        case "getChatlyIdentity":
            return try Self.encode(try await getChatlyIdentity(idempotencyKey: idempotencyKey))
        case "getCleanroomConsent":
            return try Self.encode(try await getCleanroomConsent(customerRef: Self.queryString(query["customerRef"]) ?? "", idempotencyKey: idempotencyKey))
        case "getCleanroomQuery":
            return try Self.encode(try await getCleanroomQuery(dimension: Self.queryString(query["dimension"]) ?? "", idempotencyKey: idempotencyKey))
        case "getClicksConsentCoverage":
            return try Self.encode(try await getClicksConsentCoverage(days: Self.queryInt(query["days"]), idempotencyKey: idempotencyKey))
        case "getClicksId":
            return try Self.encode(try await getClicksId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getCliDeviceCodesUserCode":
            return try Self.encode(try await getCliDeviceCodesUserCode(userCode: path["userCode"] ?? "", idempotencyKey: idempotencyKey))
        case "getCliListenersIdEvents":
            return try Self.encode(try await getCliListenersIdEvents(id: path["id"] ?? "", wait: Self.queryInt(query["wait"]), idempotencyKey: idempotencyKey))
        case "getCliLogs":
            return try Self.encode(try await getCliLogs(after: Self.queryInt(query["after"]), wait: Self.queryInt(query["wait"]), limit: Self.queryInt(query["limit"]), idempotencyKey: idempotencyKey))
        case "getCliTopics":
            return try Self.encode(try await getCliTopics(idempotencyKey: idempotencyKey))
        case "getCommissionRules":
            return try Self.encode(try await getCommissionRules(programId: Self.queryString(query["programId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getCommissions":
            return try Self.encode(try await getCommissions(partnerId: Self.queryString(query["partnerId"]), programId: Self.queryString(query["programId"]), type: Self.queryString(query["type"]), referralId: Self.queryString(query["referralId"]), customerRef: Self.queryString(query["customerRef"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getCommissionsId":
            return try Self.encode(try await getCommissionsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getContracts":
            return try Self.encode(try await getContracts(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getCoupons":
            return try Self.encode(try await getCoupons(programId: Self.queryString(query["programId"]), partnerId: Self.queryString(query["partnerId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getCreators":
            return try Self.encode(try await getCreators(q: Self.queryString(query["q"]), category: Self.queryString(query["category"]), channel: Self.queryString(query["channel"]), minAudience: Self.queryInt(query["minAudience"]), minEngagementBps: Self.queryInt(query["minEngagementBps"]), audienceCountry: Self.queryString(query["audienceCountry"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getCreatorsAccountId":
            return try Self.encode(try await getCreatorsAccountId(accountId: path["accountId"] ?? "", idempotencyKey: idempotencyKey))
        case "getDeals":
            return try Self.encode(try await getDeals(status: Self.queryString(query["status"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getDisputes":
            return try Self.encode(try await getDisputes(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getEmailSettings":
            return try Self.encode(try await getEmailSettings(idempotencyKey: idempotencyKey))
        case "getEmailTemplates":
            return try Self.encode(try await getEmailTemplates(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getEmbedSummary":
            return try Self.encode(try await getEmbedSummary(idempotencyKey: idempotencyKey))
        case "getEvents":
            return try Self.encode(try await getEvents(since: Self.queryString(query["since"]), topics: Self.queryString(query["topics"]), after: Self.queryString(query["after"]), limit: Self.queryInt(query["limit"]), idempotencyKey: idempotencyKey))
        case "getExportAccounting":
            return .string(try await getExportAccounting(format: Self.queryString(query["format"]), year: Self.queryInt(query["year"]) ?? 0, idempotencyKey: idempotencyKey))
        case "getExportFull":
            return .string(try await getExportFull(idempotencyKey: idempotencyKey))
        case "getFraudCases":
            return try Self.encode(try await getFraudCases(status: Self.queryString(query["status"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getFxRates":
            return try Self.encode(try await getFxRates(base: Self.queryString(query["base"]), quote: Self.queryString(query["quote"]), effectiveAtGte: Self.queryString(query["effectiveAt[gte]"]), effectiveAtLte: Self.queryString(query["effectiveAt[lte]"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getGraphql":
            return try Self.encode(try await getGraphql(idempotencyKey: idempotencyKey))
        case "getHealth":
            return try Self.encode(try await getHealth(idempotencyKey: idempotencyKey))
        case "getHostsCurrent":
            return try Self.encode(try await getHostsCurrent(themePreview: Self.queryString(query["themePreview"]), idempotencyKey: idempotencyKey))
        case "getHostsCurrentChatIdentity":
            return try Self.encode(try await getHostsCurrentChatIdentity(idempotencyKey: idempotencyKey))
        case "getHostsCurrentThemeCss":
            return .string(try await getHostsCurrentThemeCss(themePreview: Self.queryString(query["themePreview"]), idempotencyKey: idempotencyKey))
        case "getIncrementality":
            return try Self.encode(try await getIncrementality(programId: Self.queryString(query["programId"]) ?? "", idempotencyKey: idempotencyKey))
        case "getIntegrationHealth":
            return try Self.encode(try await getIntegrationHealth(idempotencyKey: idempotencyKey))
        case "getIntegrations":
            return try Self.encode(try await getIntegrations(idempotencyKey: idempotencyKey))
        case "getIntegrationsDeliveries":
            return try Self.encode(try await getIntegrationsDeliveries(kind: Self.queryString(query["kind"]), status: Self.queryString(query["status"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getInvitations":
            return try Self.encode(try await getInvitations(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getLinks":
            return try Self.encode(try await getLinks(programId: Self.queryString(query["programId"]), partnerId: Self.queryString(query["partnerId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getLinksIdQr":
            return .string(try await getLinksIdQr(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getMarketplaceListing":
            return try Self.encode(try await getMarketplaceListing(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getMe":
            return try Self.encode(try await getMe(idempotencyKey: idempotencyKey))
        case "getNegotiations":
            return try Self.encode(try await getNegotiations(programId: Self.queryString(query["programId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getNetworkJourney":
            return try Self.encode(try await getNetworkJourney(emailHash: Self.queryString(query["emailHash"]) ?? "", model: Self.queryString(query["model"]), idempotencyKey: idempotencyKey))
        case "getNetworkSettings":
            return try Self.encode(try await getNetworkSettings(idempotencyKey: idempotencyKey))
        case "getNotifications":
            return try Self.encode(try await getNotifications(unread: Self.queryString(query["unread"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getOnchainConnections":
            return try Self.encode(try await getOnchainConnections(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getOpenapiJson":
            return try Self.encode(try await getOpenapiJson(idempotencyKey: idempotencyKey))
        case "getOpenapiYaml":
            return .string(try await getOpenapiYaml(idempotencyKey: idempotencyKey))
        case "getOrg":
            return try Self.encode(try await getOrg(idempotencyKey: idempotencyKey))
        case "getOrgConsentPartnersCookiemunch":
            return try Self.encode(try await getOrgConsentPartnersCookiemunch(idempotencyKey: idempotencyKey))
        case "getOrgConsentPartnersCookiemunchEvents":
            return try Self.encode(try await getOrgConsentPartnersCookiemunchEvents(stamp: Self.queryString(query["stamp"]), limit: Self.queryInt(query["limit"]), idempotencyKey: idempotencyKey))
        case "getOrgFxFeed":
            return try Self.encode(try await getOrgFxFeed(idempotencyKey: idempotencyKey))
        case "getOrgHostedPages":
            return try Self.encode(try await getOrgHostedPages(idempotencyKey: idempotencyKey))
        case "getOrgMembers":
            return try Self.encode(try await getOrgMembers(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getOrgPayoutSchedule":
            return try Self.encode(try await getOrgPayoutSchedule(idempotencyKey: idempotencyKey))
        case "getOrgPortalAuth":
            return try Self.encode(try await getOrgPortalAuth(idempotencyKey: idempotencyKey))
        case "getOrgReferralParams":
            return try Self.encode(try await getOrgReferralParams(idempotencyKey: idempotencyKey))
        case "getOrgRetention":
            return try Self.encode(try await getOrgRetention(idempotencyKey: idempotencyKey))
        case "getOrgSso":
            return try Self.encode(try await getOrgSso(idempotencyKey: idempotencyKey))
        case "getOrgSsoConnectionsIdSamlMetadata":
            return try Self.encode(try await getOrgSsoConnectionsIdSamlMetadata(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getOrgTaxProfile":
            return try Self.encode(try await getOrgTaxProfile(idempotencyKey: idempotencyKey))
        case "getOrgTrackingConsent":
            return try Self.encode(try await getOrgTrackingConsent(idempotencyKey: idempotencyKey))
        case "getOrgTrackingTokens":
            return try Self.encode(try await getOrgTrackingTokens(idempotencyKey: idempotencyKey))
        case "getOutreach":
            return try Self.encode(try await getOutreach(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerAchievements":
            return try Self.encode(try await getPartnerAchievements(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerAdvance":
            return try Self.encode(try await getPartnerAdvance(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerAdvanceOffer":
            return try Self.encode(try await getPartnerAdvanceOffer(idempotencyKey: idempotencyKey))
        case "getPartnerApiTokens":
            return try Self.encode(try await getPartnerApiTokens(idempotencyKey: idempotencyKey))
        case "getPartnerAssets":
            return try Self.encode(try await getPartnerAssets(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerContracts":
            return try Self.encode(try await getPartnerContracts(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerDeals":
            return try Self.encode(try await getPartnerDeals(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerDisputes":
            return try Self.encode(try await getPartnerDisputes(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerGroups":
            return try Self.encode(try await getPartnerGroups(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerInvitations":
            return try Self.encode(try await getPartnerInvitations(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerKycStatus":
            return try Self.encode(try await getPartnerKycStatus(idempotencyKey: idempotencyKey))
        case "getPartnerLinks":
            return try Self.encode(try await getPartnerLinks(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerLinksIdQr":
            return .string(try await getPartnerLinksIdQr(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartnerMarketplace":
            return try Self.encode(try await getPartnerMarketplace(category: Self.queryString(query["category"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerMe":
            return try Self.encode(try await getPartnerMe(idempotencyKey: idempotencyKey))
        case "getPartnerNotifications":
            return try Self.encode(try await getPartnerNotifications(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerOrgsOrgIdSelfBilling":
            return try Self.encode(try await getPartnerOrgsOrgIdSelfBilling(orgId: path["orgId"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartnerPassport":
            return try Self.encode(try await getPartnerPassport(idempotencyKey: idempotencyKey))
        case "getPartnerPayouts":
            return try Self.encode(try await getPartnerPayouts(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerPayoutsIdInvoice":
            return try Self.encode(try await getPartnerPayoutsIdInvoice(id: path["id"] ?? "", format: Self.queryString(query["format"]), idempotencyKey: idempotencyKey))
        case "getPartnerPostbackLogs":
            return try Self.encode(try await getPartnerPostbackLogs(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerProfile":
            return try Self.encode(try await getPartnerProfile(idempotencyKey: idempotencyKey))
        case "getPartnerProfileVerified":
            return try Self.encode(try await getPartnerProfileVerified(idempotencyKey: idempotencyKey))
        case "getPartnerProgramsProgramIdLeaderboard":
            return try Self.encode(try await getPartnerProgramsProgramIdLeaderboard(programId: path["programId"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartnerRecruit":
            return try Self.encode(try await getPartnerRecruit(idempotencyKey: idempotencyKey))
        case "getPartnerReferrals":
            return try Self.encode(try await getPartnerReferrals(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerReferralsIdTransparency":
            return try Self.encode(try await getPartnerReferralsIdTransparency(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartners":
            return try Self.encode(try await getPartners(email: Self.queryString(query["email"]), externalRef: Self.queryString(query["externalRef"]), programId: Self.queryString(query["programId"]), status: Self.queryString(query["status"]), includeArchived: Self.queryString(query["includeArchived"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerSecurity":
            return try Self.encode(try await getPartnerSecurity(idempotencyKey: idempotencyKey))
        case "getPartnersId":
            return try Self.encode(try await getPartnersId(id: path["id"] ?? "", programId: Self.queryString(query["programId"]), idempotencyKey: idempotencyKey))
        case "getPartnersIdBalances":
            return try Self.encode(try await getPartnersIdBalances(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnersIdEnrollments":
            return try Self.encode(try await getPartnersIdEnrollments(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnersIdPayoutProfile":
            return try Self.encode(try await getPartnersIdPayoutProfile(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartnersIdQuality":
            return try Self.encode(try await getPartnersIdQuality(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartnersIdStats":
            return try Self.encode(try await getPartnersIdStats(id: path["id"] ?? "", programId: Self.queryString(query["programId"]), idempotencyKey: idempotencyKey))
        case "getPartnersIdSummary":
            return try Self.encode(try await getPartnersIdSummary(id: path["id"] ?? "", programId: Self.queryString(query["programId"]) ?? "", idempotencyKey: idempotencyKey))
        case "getPartnerStats":
            return try Self.encode(try await getPartnerStats(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerTaxDocuments":
            return try Self.encode(try await getPartnerTaxDocuments(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPartnerTaxDocumentsId":
            return .string(try await getPartnerTaxDocumentsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getPartnerTerms":
            return try Self.encode(try await getPartnerTerms(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPassportPublicKey":
            return try Self.encode(try await getPassportPublicKey(idempotencyKey: idempotencyKey))
        case "getPayoutConnections":
            return try Self.encode(try await getPayoutConnections(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPayoutRuns":
            return try Self.encode(try await getPayoutRuns(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPayouts":
            return try Self.encode(try await getPayouts(partnerId: Self.queryString(query["partnerId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPayoutsIdInvoice":
            return try Self.encode(try await getPayoutsIdInvoice(id: path["id"] ?? "", format: Self.queryString(query["format"]), idempotencyKey: idempotencyKey))
        case "getPlans":
            return try Self.encode(try await getPlans(idempotencyKey: idempotencyKey))
        case "getPortalAuthCurrent":
            return try Self.encode(try await getPortalAuthCurrent(org: Self.queryString(query["org"]), idempotencyKey: idempotencyKey))
        case "getPortalTheme":
            return try Self.encode(try await getPortalTheme(idempotencyKey: idempotencyKey))
        case "getPortalThemeCompiled":
            return try Self.encode(try await getPortalThemeCompiled(which: Self.queryString(query["which"]), idempotencyKey: idempotencyKey))
        case "getPortalThemeSchema":
            return try Self.encode(try await getPortalThemeSchema(idempotencyKey: idempotencyKey))
        case "getPortalThemeVersions":
            return try Self.encode(try await getPortalThemeVersions(idempotencyKey: idempotencyKey))
        case "getPrivacyExecutorRequests":
            return try Self.encode(try await getPrivacyExecutorRequests(idempotencyKey: idempotencyKey))
        case "getPrivacyExecutors":
            return try Self.encode(try await getPrivacyExecutors(idempotencyKey: idempotencyKey))
        case "getPrivacyExport":
            return try Self.encode(try await getPrivacyExport(customerRef: Self.queryString(query["customerRef"]) ?? "", idempotencyKey: idempotencyKey))
        case "getPrivacyRequests":
            return try Self.encode(try await getPrivacyRequests(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPrivacyRequestsId":
            return try Self.encode(try await getPrivacyRequestsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getPrivacyRequestsIdResult":
            return try Self.encode(try await getPrivacyRequestsIdResult(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProductLinks":
            return try Self.encode(try await getProductLinks(idempotencyKey: idempotencyKey))
        case "getProfitabilityProducts":
            return try Self.encode(try await getProfitabilityProducts(idempotencyKey: idempotencyKey))
        case "getProfitabilityProductsProductRef":
            return try Self.encode(try await getProfitabilityProductsProductRef(productRef: path["productRef"] ?? "", idempotencyKey: idempotencyKey))
        case "getProfitabilityRebuildJobId":
            return try Self.encode(try await getProfitabilityRebuildJobId(jobId: path["jobId"] ?? "", idempotencyKey: idempotencyKey))
        case "getProfitabilitySettings":
            return try Self.encode(try await getProfitabilitySettings(programId: Self.queryString(query["programId"]), idempotencyKey: idempotencyKey))
        case "getPrograms":
            return try Self.encode(try await getPrograms(slug: Self.queryString(query["slug"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProgramsHandleAvailability":
            return try Self.encode(try await getProgramsHandleAvailability(handle: Self.queryString(query["handle"]) ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsId":
            return try Self.encode(try await getProgramsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsIdAutopricing":
            return try Self.encode(try await getProgramsIdAutopricing(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsIdCreditRail":
            return try Self.encode(try await getProgramsIdCreditRail(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsIdCreditRailLog":
            return try Self.encode(try await getProgramsIdCreditRailLog(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdEnrollments":
            return try Self.encode(try await getProgramsIdEnrollments(id: path["id"] ?? "", status: Self.queryString(query["status"]), partnerId: Self.queryString(query["partnerId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdGraph":
            return try Self.encode(try await getProgramsIdGraph(id: path["id"] ?? "", root: Self.queryString(query["root"]) ?? "", depth: Self.queryInt(query["depth"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdGroups":
            return try Self.encode(try await getProgramsIdGroups(id: path["id"] ?? "", includeArchived: Self.queryString(query["includeArchived"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdNegotiationPolicy":
            return try Self.encode(try await getProgramsIdNegotiationPolicy(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsIdPromotions":
            return try Self.encode(try await getProgramsIdPromotions(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdRefereeReward":
            return try Self.encode(try await getProgramsIdRefereeReward(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsIdStripeCredits":
            return try Self.encode(try await getProgramsIdStripeCredits(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getProgramsIdStripeCreditsLog":
            return try Self.encode(try await getProgramsIdStripeCreditsLog(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdTerms":
            return try Self.encode(try await getProgramsIdTerms(id: path["id"] ?? "", locale: Self.queryString(query["locale"]), idempotencyKey: idempotencyKey))
        case "getProgramsIdTermsAcceptances":
            return try Self.encode(try await getProgramsIdTermsAcceptances(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getProspects":
            return try Self.encode(try await getProspects(status: Self.queryString(query["status"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getPublicProgramsHandle":
            return try Self.encode(try await getPublicProgramsHandle(handle: path["handle"] ?? "", locale: Self.queryString(query["locale"]), idempotencyKey: idempotencyKey))
        case "getReferrals":
            return try Self.encode(try await getReferrals(programId: Self.queryString(query["programId"]), partnerId: Self.queryString(query["partnerId"]), status: Self.queryString(query["status"]), customerRef: Self.queryString(query["customerRef"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getReferralsId":
            return try Self.encode(try await getReferralsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getReferralsIdJourney":
            return try Self.encode(try await getReferralsIdJourney(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getReportsFilteredClicks":
            return try Self.encode(try await getReportsFilteredClicks(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getReportsPartnerPerformance":
            return try Self.encode(try await getReportsPartnerPerformance(format: Self.queryString(query["format"]), idempotencyKey: idempotencyKey))
        case "getRewards":
            return try Self.encode(try await getRewards(status: Self.queryString(query["status"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getRewardsGranted":
            return try Self.encode(try await getRewardsGranted(idempotencyKey: idempotencyKey))
        case "getRewardsLookupCode":
            return try Self.encode(try await getRewardsLookupCode(code: path["code"] ?? "", idempotencyKey: idempotencyKey))
        case "getRewardsRules":
            return try Self.encode(try await getRewardsRules(idempotencyKey: idempotencyKey))
        case "getRoiBreakdown":
            return try Self.encode(try await getRoiBreakdown(from: Self.queryString(query["from"]), to: Self.queryString(query["to"]), programId: Self.queryString(query["programId"]), partnerId: Self.queryString(query["partnerId"]), windowDays: Self.queryInt(query["windowDays"]), currency: Self.queryString(query["currency"]), format: Self.queryString(query["format"]), by: Self.queryString(query["by"]) ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getRoiDataQuality":
            return try Self.encode(try await getRoiDataQuality(from: Self.queryString(query["from"]), to: Self.queryString(query["to"]), format: Self.queryString(query["format"]), idempotencyKey: idempotencyKey))
        case "getRoiGrants":
            return try Self.encode(try await getRoiGrants(from: Self.queryString(query["from"]), to: Self.queryString(query["to"]), programId: Self.queryString(query["programId"]), partnerId: Self.queryString(query["partnerId"]), windowDays: Self.queryInt(query["windowDays"]), currency: Self.queryString(query["currency"]), format: Self.queryString(query["format"]), status: Self.queryString(query["status"]), role: Self.queryString(query["role"]), paidBack: Self.queryString(query["paidBack"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getRoiPartnersIdTrace":
            return try Self.encode(try await getRoiPartnersIdTrace(id: path["id"] ?? "", windowDays: Self.queryInt(query["windowDays"]), format: Self.queryString(query["format"]), idempotencyKey: idempotencyKey))
        case "getRoiPatterns":
            return try Self.encode(try await getRoiPatterns(idempotencyKey: idempotencyKey))
        case "getRoiPatternsPattern":
            return try Self.encode(try await getRoiPatternsPattern(pattern: path["pattern"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getRoiSummary":
            return try Self.encode(try await getRoiSummary(from: Self.queryString(query["from"]), to: Self.queryString(query["to"]), programId: Self.queryString(query["programId"]), partnerId: Self.queryString(query["partnerId"]), windowDays: Self.queryInt(query["windowDays"]), currency: Self.queryString(query["currency"]), format: Self.queryString(query["format"]), model: Self.queryString(query["model"]), includeProjection: Self.queryString(query["includeProjection"]), idempotencyKey: idempotencyKey))
        case "getRoiTraceCustomerRef":
            return try Self.encode(try await getRoiTraceCustomerRef(customerRef: path["customerRef"] ?? "", windowDays: Self.queryInt(query["windowDays"]), format: Self.queryString(query["format"]), idempotencyKey: idempotencyKey))
        case "getSandboxBillingFixtures":
            return try Self.encode(try await getSandboxBillingFixtures(provider: Self.queryString(query["provider"]), idempotencyKey: idempotencyKey))
        case "getSandboxStripeFixtures":
            return try Self.encode(try await getSandboxStripeFixtures(idempotencyKey: idempotencyKey))
        case "getSetupStatus":
            return try Self.encode(try await getSetupStatus(idempotencyKey: idempotencyKey))
        case "getStatus":
            return try Self.encode(try await getStatus(idempotencyKey: idempotencyKey))
        case "getStatusIncidents":
            return try Self.encode(try await getStatusIncidents(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getStatusIncidentsAtom":
            return .string(try await getStatusIncidentsAtom(idempotencyKey: idempotencyKey))
        case "getStatusIncidentsId":
            return try Self.encode(try await getStatusIncidentsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getStripeCreditsConnection":
            return try Self.encode(try await getStripeCreditsConnection(idempotencyKey: idempotencyKey))
        case "getSupportApps":
            return try Self.encode(try await getSupportApps(idempotencyKey: idempotencyKey))
        case "getSupportCardsOrgIdAdapter":
            return try Self.encode(try await getSupportCardsOrgIdAdapter(orgId: path["orgId"] ?? "", adapter: path["adapter"] ?? "", email: Self.queryString(query["email"]), externalId: Self.queryString(query["externalId"]), idempotencyKey: idempotencyKey))
        case "getSupportContext":
            return try Self.encode(try await getSupportContext(email: Self.queryString(query["email"]), customerRef: Self.queryString(query["customerRef"]), partnerExternalRef: Self.queryString(query["partnerExternalRef"]), ext: Self.queryString(query["ext"]), idempotencyKey: idempotencyKey))
        case "getSupportPlatformChatlyAnswers":
            return try Self.encode(try await getSupportPlatformChatlyAnswers(subject: Self.queryString(query["subject"]), principal: Self.queryString(query["principal"]), question: Self.queryString(query["question"]), idempotencyKey: idempotencyKey))
        case "getTax1099":
            return try Self.encode(try await getTax1099(year: Self.queryInt(query["year"]) ?? 0, limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getTax1099Filings":
            return try Self.encode(try await getTax1099Filings(year: Self.queryInt(query["year"]) ?? 0, limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getTax1099Preview":
            return try Self.encode(try await getTax1099Preview(year: Self.queryInt(query["year"]) ?? 0, idempotencyKey: idempotencyKey))
        case "getTestClock":
            return try Self.encode(try await getTestClock(idempotencyKey: idempotencyKey))
        case "getTestEmails":
            return try Self.encode(try await getTestEmails(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getValueImportJobId":
            return try Self.encode(try await getValueImportJobId(jobId: path["jobId"] ?? "", idempotencyKey: idempotencyKey))
        case "getVersions":
            return try Self.encode(try await getVersions(idempotencyKey: idempotencyKey))
        case "getWebhookDeliveries":
            return try Self.encode(try await getWebhookDeliveries(endpointId: Self.queryString(query["endpointId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getWebhookDeliveriesId":
            return try Self.encode(try await getWebhookDeliveriesId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getWebhookEndpoints":
            return try Self.encode(try await getWebhookEndpoints(programId: Self.queryString(query["programId"]), limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getWebhookEndpointsId":
            return try Self.encode(try await getWebhookEndpointsId(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "getWebhookEndpointsIdDeliveries":
            return try Self.encode(try await getWebhookEndpointsIdDeliveries(id: path["id"] ?? "", limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getZapierEvents":
            return try Self.encode(try await getZapierEvents(idempotencyKey: idempotencyKey))
        case "getZapierHooks":
            return try Self.encode(try await getZapierHooks(limit: Self.queryInt(query["limit"]), startingAfter: Self.queryString(query["starting_after"]), endingBefore: Self.queryString(query["ending_before"]), createdGte: Self.queryString(query["created[gte]"]), createdLte: Self.queryString(query["created[lte]"]), idempotencyKey: idempotencyKey))
        case "getZapierTriggersEvent":
            return try Self.encode(try await getZapierTriggersEvent(event: path["event"] ?? "", limit: Self.queryInt(query["limit"]), idempotencyKey: idempotencyKey))
        case "patchAdminStatusIncidentsId":
            return try Self.encode(try await patchAdminStatusIncidentsId(id: path["id"] ?? "", try Self.decode(PatchAdminStatusIncidentsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchApiKeysId":
            return try Self.encode(try await patchApiKeysId(id: path["id"] ?? "", try Self.decode(PatchApiKeysIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchAuthConnectionsId":
            return try Self.encode(try await patchAuthConnectionsId(id: path["id"] ?? "", try Self.decode(PatchAuthConnectionsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchAuthConnectionsIdOrigins":
            return try Self.encode(try await patchAuthConnectionsIdOrigins(id: path["id"] ?? "", try Self.decode(PatchAuthConnectionsIdOriginsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchBillingConnectionsId":
            return try Self.encode(try await patchBillingConnectionsId(id: path["id"] ?? "", try Self.decode(PatchBillingConnectionsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchOrg":
            return try Self.encode(try await patchOrg(try Self.decode(PatchOrgBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchOrgMembersUserId":
            return try Self.encode(try await patchOrgMembersUserId(userId: path["userId"] ?? "", try Self.decode(PatchOrgMembersUserIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchOrgSso":
            return try Self.encode(try await patchOrgSso(try Self.decode(PatchOrgSsoBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchPartnerGroupsId":
            return try Self.encode(try await patchPartnerGroupsId(id: path["id"] ?? "", try Self.decode(PatchPartnerGroupsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchPartnersId":
            return try Self.encode(try await patchPartnersId(id: path["id"] ?? "", try Self.decode(PatchPartnersIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchPartnersIdPayoutProfile":
            return try Self.encode(try await patchPartnersIdPayoutProfile(id: path["id"] ?? "", try Self.decode(PatchPartnersIdPayoutProfileBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchPortalThemeDraft":
            return try Self.encode(try await patchPortalThemeDraft(try Self.decode([String: JSONValue].self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchProgramsId":
            return try Self.encode(try await patchProgramsId(id: path["id"] ?? "", try Self.decode(PatchProgramsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchReferralsId":
            return try Self.encode(try await patchReferralsId(id: path["id"] ?? "", try Self.decode(PatchReferralsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "patchWebhookEndpointsId":
            return try Self.encode(try await patchWebhookEndpointsId(id: path["id"] ?? "", try Self.decode(PatchWebhookEndpointsIdBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAccountClose":
            return try Self.encode(try await postAccountClose(try Self.decode(PostAccountCloseBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAdminOrgsIdPlan":
            return try Self.encode(try await postAdminOrgsIdPlan(id: path["id"] ?? "", try Self.decode(PostAdminOrgsIdPlanBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAdminOrgsIdSuspend":
            return try Self.encode(try await postAdminOrgsIdSuspend(id: path["id"] ?? "", try Self.decode(PostAdminOrgsIdSuspendBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAdminOrgsIdUnsuspend":
            return try Self.encode(try await postAdminOrgsIdUnsuspend(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postAdminPartnerAccountsIdBan":
            return try Self.encode(try await postAdminPartnerAccountsIdBan(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postAdminPartnerAccountsIdUnban":
            return try Self.encode(try await postAdminPartnerAccountsIdUnban(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postAdminStatusIncidents":
            return try Self.encode(try await postAdminStatusIncidents(try Self.decode(PostAdminStatusIncidentsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAdminStatusIncidentsIdUpdates":
            return try Self.encode(try await postAdminStatusIncidentsIdUpdates(id: path["id"] ?? "", try Self.decode(PostAdminStatusIncidentsIdUpdatesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAgentsRegister":
            return try Self.encode(try await postAgentsRegister(try Self.decode(PostAgentsRegisterBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAnomaliesScan":
            return try Self.encode(try await postAnomaliesScan(idempotencyKey: idempotencyKey))
        case "postApiKeys":
            return try Self.encode(try await postApiKeys(try Self.decode(PostApiKeysBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postApiKeysIdRotate":
            return try Self.encode(try await postApiKeysIdRotate(id: path["id"] ?? "", try Self.decode(PostApiKeysIdRotateBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAssets":
            return try Self.encode(try await postAssets(try Self.decode(PostAssetsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAttributionReplay":
            return try Self.encode(try await postAttributionReplay(try Self.decode(PostAttributionReplayBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthBackchannelLogout":
            return try Self.encode(try await postAuthBackchannelLogout(try Self.decode(PostAuthBackchannelLogoutBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnections":
            return try Self.encode(try await postAuthConnections(try Self.decode(PostAuthConnectionsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdAccounts":
            return try Self.encode(try await postAuthConnectionsIdAccounts(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdAccountsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdAliases":
            return try Self.encode(try await postAuthConnectionsIdAliases(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdAliasesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdErase":
            return try Self.encode(try await postAuthConnectionsIdErase(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdEraseBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdPartners":
            return try Self.encode(try await postAuthConnectionsIdPartners(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdPartnersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdPing":
            return try Self.encode(try await postAuthConnectionsIdPing(id: path["id"] ?? "", try Self.decode([String: JSONValue].self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdRevokePreviousSecret":
            return try Self.encode(try await postAuthConnectionsIdRevokePreviousSecret(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdRotateSecret":
            return try Self.encode(try await postAuthConnectionsIdRotateSecret(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdSignals":
            return try Self.encode(try await postAuthConnectionsIdSignals(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdSignalsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdSignups":
            return try Self.encode(try await postAuthConnectionsIdSignups(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdSignupsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdUsers":
            return try Self.encode(try await postAuthConnectionsIdUsers(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdUsersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsIdWidgetTokens":
            return try Self.encode(try await postAuthConnectionsIdWidgetTokens(id: path["id"] ?? "", try Self.decode(PostAuthConnectionsIdWidgetTokensBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthConnectionsInstall":
            return try Self.encode(try await postAuthConnectionsInstall(try Self.decode(PostAuthConnectionsInstallBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postAuthLogout":
            return try Self.encode(try await postAuthLogout(idempotencyKey: idempotencyKey))
        case "postBillingActivate":
            return try Self.encode(try await postBillingActivate(try Self.decode(PostBillingActivateBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBillingCheckout":
            return try Self.encode(try await postBillingCheckout(try Self.decode(PostBillingCheckoutBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBillingConnections":
            return try Self.encode(try await postBillingConnections(try Self.decode(PostBillingConnectionsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBillingConnectionsIdEvents":
            return try Self.encode(try await postBillingConnectionsIdEvents(id: path["id"] ?? "", try Self.decode(PostBillingConnectionsIdEventsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBillingConnectionsIdRotateSecret":
            return try Self.encode(try await postBillingConnectionsIdRotateSecret(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postBillingConnectionsIdValueMappingPreview":
            return try Self.encode(try await postBillingConnectionsIdValueMappingPreview(id: path["id"] ?? "", try Self.decode(PostBillingConnectionsIdValueMappingPreviewBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBillingEventsIdRelease":
            return try Self.encode(try await postBillingEventsIdRelease(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postBillingInternalCustomers":
            return try Self.encode(try await postBillingInternalCustomers(try Self.decode(PostBillingInternalCustomersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBillingPortal":
            return try Self.encode(try await postBillingPortal(idempotencyKey: idempotencyKey))
        case "postBrandingDomain":
            return try Self.encode(try await postBrandingDomain(try Self.decode(PostBrandingDomainBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBrandingDomainVerify":
            return try Self.encode(try await postBrandingDomainVerify(idempotencyKey: idempotencyKey))
        case "postBrandingLinkDomain":
            return try Self.encode(try await postBrandingLinkDomain(try Self.decode(PostBrandingLinkDomainBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postBrandingLinkDomainVerify":
            return try Self.encode(try await postBrandingLinkDomainVerify(idempotencyKey: idempotencyKey))
        case "postCliDeviceCodes":
            return try Self.encode(try await postCliDeviceCodes(try Self.decode(PostCliDeviceCodesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCliDeviceCodesToken":
            return try Self.encode(try await postCliDeviceCodesToken(try Self.decode(PostCliDeviceCodesTokenBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCliDeviceCodesUserCodeApprove":
            return try Self.encode(try await postCliDeviceCodesUserCodeApprove(userCode: path["userCode"] ?? "", try Self.decode(PostCliDeviceCodesUserCodeApproveBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCliDeviceCodesUserCodeDeny":
            return try Self.encode(try await postCliDeviceCodesUserCodeDeny(userCode: path["userCode"] ?? "", idempotencyKey: idempotencyKey))
        case "postCliListeners":
            return try Self.encode(try await postCliListeners(try Self.decode(PostCliListenersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCliTrigger":
            return try Self.encode(try await postCliTrigger(try Self.decode(PostCliTriggerBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCommissionRules":
            return try Self.encode(try await postCommissionRules(try Self.decode(PostCommissionRulesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCommissionsApproveDue":
            return try Self.encode(try await postCommissionsApproveDue(idempotencyKey: idempotencyKey))
        case "postCommissionsIdAdjust":
            return try Self.encode(try await postCommissionsIdAdjust(id: path["id"] ?? "", try Self.decode(PostCommissionsIdAdjustBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCommissionsIdSettle":
            return try Self.encode(try await postCommissionsIdSettle(id: path["id"] ?? "", try Self.decode(PostCommissionsIdSettleBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postContracts":
            return try Self.encode(try await postContracts(try Self.decode(PostContractsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postContractsIdSend":
            return try Self.encode(try await postContractsIdSend(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postCoupons":
            return try Self.encode(try await postCoupons(try Self.decode(PostCouponsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postCreatorsAccountIdInvite":
            return try Self.encode(try await postCreatorsAccountIdInvite(accountId: path["accountId"] ?? "", try Self.decode(PostCreatorsAccountIdInviteBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postDealsIdApprove":
            return try Self.encode(try await postDealsIdApprove(id: path["id"] ?? "", try Self.decode(PostDealsIdApproveBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postDealsIdReject":
            return try Self.encode(try await postDealsIdReject(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postDealsIdWon":
            return try Self.encode(try await postDealsIdWon(id: path["id"] ?? "", try Self.decode(PostDealsIdWonBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postDiscoveryCorpus":
            return try Self.encode(try await postDiscoveryCorpus(try Self.decode(PostDiscoveryCorpusBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postDiscoverySearch":
            return try Self.encode(try await postDiscoverySearch(try Self.decode(PostDiscoverySearchBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postDisputesIdResolve":
            return try Self.encode(try await postDisputesIdResolve(id: path["id"] ?? "", try Self.decode(PostDisputesIdResolveBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postEmailPreview":
            return try Self.encode(try await postEmailPreview(try Self.decode(PostEmailPreviewBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postEmailSettingsVerifyDomain":
            return try Self.encode(try await postEmailSettingsVerifyDomain(idempotencyKey: idempotencyKey))
        case "postEmailTest":
            return try Self.encode(try await postEmailTest(try Self.decode(PostEmailTestBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postEmbedTokens":
            return try Self.encode(try await postEmbedTokens(try Self.decode(PostEmbedTokensBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postFraudCasesIdResolve":
            return try Self.encode(try await postFraudCasesIdResolve(id: path["id"] ?? "", try Self.decode(PostFraudCasesIdResolveBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postFraudDetectRings":
            return try Self.encode(try await postFraudDetectRings(idempotencyKey: idempotencyKey))
        case "postFraudInvalidTrafficScan":
            return try Self.encode(try await postFraudInvalidTrafficScan(try Self.decode(PostFraudInvalidTrafficScanBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postFxRates":
            return try Self.encode(try await postFxRates(try Self.decode(PostFxRatesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postFxRatesClearOverride":
            return try Self.encode(try await postFxRatesClearOverride(try Self.decode(PostFxRatesClearOverrideBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postFxRatesSync":
            return try Self.encode(try await postFxRatesSync(idempotencyKey: idempotencyKey))
        case "postGraphql":
            return try Self.encode(try await postGraphql(try Self.decode(PostGraphqlBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postImportProvider":
            return try Self.encode(try await postImportProvider(provider: path["provider"] ?? "", try Self.decode(PostImportProviderBody.self, from: body ?? .object([:])), programId: Self.queryString(query["programId"]) ?? "", dryRun: Self.queryBool(query["dryRun"]), destinationUrl: Self.queryString(query["destinationUrl"]), idempotencyKey: idempotencyKey))
        case "postIntegrationsDeliveriesIdRetry":
            return try Self.encode(try await postIntegrationsDeliveriesIdRetry(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postIntegrationsHubspotTest":
            return try Self.encode(try await postIntegrationsHubspotTest(try Self.decode(PostIntegrationsHubspotTestBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postIntegrationsSegmentTest":
            return try Self.encode(try await postIntegrationsSegmentTest(idempotencyKey: idempotencyKey))
        case "postInvitationsIdWithdraw":
            return try Self.encode(try await postInvitationsIdWithdraw(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postLinks":
            return try Self.encode(try await postLinks(try Self.decode(PostLinksBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postMobilePurchases":
            return try Self.encode(try await postMobilePurchases(try Self.decode(PostMobilePurchasesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postNotificationsIdRead":
            return try Self.encode(try await postNotificationsIdRead(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postOauthToken":
            return try Self.encode(try await postOauthToken(try Self.decode(JSONValue.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOnchainConnections":
            return try Self.encode(try await postOnchainConnections(try Self.decode(PostOnchainConnectionsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOrgConsentPartnersCookiemunchStampsCheck":
            return try Self.encode(try await postOrgConsentPartnersCookiemunchStampsCheck(try Self.decode(PostOrgConsentPartnersCookiemunchStampsCheckBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOrgHostedPagesCheck":
            return try Self.encode(try await postOrgHostedPagesCheck(idempotencyKey: idempotencyKey))
        case "postOrgMembers":
            return try Self.encode(try await postOrgMembers(try Self.decode(PostOrgMembersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOrgPortalAuthTest":
            return try Self.encode(try await postOrgPortalAuthTest(idempotencyKey: idempotencyKey))
        case "postOrgs":
            return try Self.encode(try await postOrgs(try Self.decode(PostOrgsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOrgsOrgIdPrivacyExecutorKey":
            return try Self.encode(try await postOrgsOrgIdPrivacyExecutorKey(orgId: path["orgId"] ?? "", try Self.decode(PostOrgsOrgIdPrivacyExecutorKeyBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOrgSsoDirectTest":
            return try Self.encode(try await postOrgSsoDirectTest(idempotencyKey: idempotencyKey))
        case "postOrgSsoLink":
            return try Self.encode(try await postOrgSsoLink(idempotencyKey: idempotencyKey))
        case "postOrgSsoTickets":
            return try Self.encode(try await postOrgSsoTickets(try Self.decode(PostOrgSsoTicketsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOrgSsoTicketsIdRevoke":
            return try Self.encode(try await postOrgSsoTicketsIdRevoke(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postOutreachDraft":
            return try Self.encode(try await postOutreachDraft(try Self.decode(PostOutreachDraftBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postOutreachIdApprove":
            return try Self.encode(try await postOutreachIdApprove(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postOutreachSendDue":
            return try Self.encode(try await postOutreachSendDue(idempotencyKey: idempotencyKey))
        case "postPartnerAdvanceAccept":
            return try Self.encode(try await postPartnerAdvanceAccept(try Self.decode(PostPartnerAdvanceAcceptBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerApiTokens":
            return try Self.encode(try await postPartnerApiTokens(try Self.decode(PostPartnerApiTokensBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerAuthWalletNonce":
            return try Self.encode(try await postPartnerAuthWalletNonce(try Self.decode(PostPartnerAuthWalletNonceBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerAuthWalletVerify":
            return try Self.encode(try await postPartnerAuthWalletVerify(try Self.decode(PostPartnerAuthWalletVerifyBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerContractsIdAccept":
            return try Self.encode(try await postPartnerContractsIdAccept(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPartnerContractsIdDecline":
            return try Self.encode(try await postPartnerContractsIdDecline(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPartnerDeals":
            return try Self.encode(try await postPartnerDeals(try Self.decode(PostPartnerDealsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerDisputes":
            return try Self.encode(try await postPartnerDisputes(try Self.decode(PostPartnerDisputesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerInvitationsIdAccept":
            return try Self.encode(try await postPartnerInvitationsIdAccept(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPartnerInvitationsIdDecline":
            return try Self.encode(try await postPartnerInvitationsIdDecline(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPartnerKycSubmit":
            return try Self.encode(try await postPartnerKycSubmit(try Self.decode(PostPartnerKycSubmitBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerLinks":
            return try Self.encode(try await postPartnerLinks(try Self.decode(PostPartnerLinksBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerNotificationsIdRead":
            return try Self.encode(try await postPartnerNotificationsIdRead(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPartnerOrgsOrgIdSelfBilling":
            return try Self.encode(try await postPartnerOrgsOrgIdSelfBilling(orgId: path["orgId"] ?? "", try Self.decode(PostPartnerOrgsOrgIdSelfBillingBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerOrgsOrgIdTaxForm":
            return try Self.encode(try await postPartnerOrgsOrgIdTaxForm(orgId: path["orgId"] ?? "", try Self.decode(PostPartnerOrgsOrgIdTaxFormBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerProgramsProgramIdApply":
            return try Self.encode(try await postPartnerProgramsProgramIdApply(programId: path["programId"] ?? "", idempotencyKey: idempotencyKey))
        case "postPartners":
            return try Self.encode(try await postPartners(try Self.decode(PostPartnersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerSecurityTotpDisable":
            return try Self.encode(try await postPartnerSecurityTotpDisable(try Self.decode(PostPartnerSecurityTotpDisableBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerSecurityTotpEnable":
            return try Self.encode(try await postPartnerSecurityTotpEnable(try Self.decode(PostPartnerSecurityTotpEnableBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerSecurityTotpSetup":
            return try Self.encode(try await postPartnerSecurityTotpSetup(idempotencyKey: idempotencyKey))
        case "postPartnersIdPortalLink":
            return try Self.encode(try await postPartnersIdPortalLink(id: path["id"] ?? "", try Self.decode(PostPartnersIdPortalLinkBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnersIdTaxForm":
            return try Self.encode(try await postPartnersIdTaxForm(id: path["id"] ?? "", try Self.decode(PostPartnersIdTaxFormBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPartnerTermsVersionIdAccept":
            return try Self.encode(try await postPartnerTermsVersionIdAccept(versionId: path["versionId"] ?? "", idempotencyKey: idempotencyKey))
        case "postPassportVerify":
            return try Self.encode(try await postPassportVerify(try Self.decode(PostPassportVerifyBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPayoutRuns":
            return try Self.encode(try await postPayoutRuns(idempotencyKey: idempotencyKey))
        case "postPayoutRunsIdCancel":
            return try Self.encode(try await postPayoutRunsIdCancel(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPayoutRunsIdExecute":
            return try Self.encode(try await postPayoutRunsIdExecute(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPayoutRunsRunScheduled":
            return try Self.encode(try await postPayoutRunsRunScheduled(idempotencyKey: idempotencyKey))
        case "postPortalThemeImportBrand":
            return try Self.encode(try await postPortalThemeImportBrand(try Self.decode(PostPortalThemeImportBrandBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPortalThemePreview":
            return try Self.encode(try await postPortalThemePreview(idempotencyKey: idempotencyKey))
        case "postPortalThemePublish":
            return try Self.encode(try await postPortalThemePublish(try Self.decode(PostPortalThemePublishBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPortalThemeVersionsIdRestore":
            return try Self.encode(try await postPortalThemeVersionsIdRestore(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPrivacyExecutorKeys":
            return try Self.encode(try await postPrivacyExecutorKeys(try Self.decode(PostPrivacyExecutorKeysBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPrivacyExecutorsAdapterCheck":
            return try Self.encode(try await postPrivacyExecutorsAdapterCheck(adapter: path["adapter"] ?? "", idempotencyKey: idempotencyKey))
        case "postPrivacyForget":
            return try Self.encode(try await postPrivacyForget(try Self.decode(PostPrivacyForgetBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPrivacyLookup":
            return try Self.encode(try await postPrivacyLookup(try Self.decode(PostPrivacyLookupBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPrivacyRequests":
            return try Self.encode(try await postPrivacyRequests(try Self.decode(PostPrivacyRequestsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProductLinks":
            return try Self.encode(try await postProductLinks(try Self.decode(PostProductLinksBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProfitabilityRebuild":
            return try Self.encode(try await postProfitabilityRebuild(idempotencyKey: idempotencyKey))
        case "postPrograms":
            return try Self.encode(try await postPrograms(try Self.decode(PostProgramsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdApplyLeveling":
            return try Self.encode(try await postProgramsIdApplyLeveling(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postProgramsIdAutopriceRun":
            return try Self.encode(try await postProgramsIdAutopriceRun(id: path["id"] ?? "", try Self.decode(PostProgramsIdAutopriceRunBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdCreditRailRequeue":
            return try Self.encode(try await postProgramsIdCreditRailRequeue(id: path["id"] ?? "", try Self.decode(PostProgramsIdCreditRailRequeueBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdEnrollments":
            return try Self.encode(try await postProgramsIdEnrollments(id: path["id"] ?? "", try Self.decode(PostProgramsIdEnrollmentsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdEnrollmentsEnrollmentIdApprove":
            return try Self.encode(try await postProgramsIdEnrollmentsEnrollmentIdApprove(id: path["id"] ?? "", enrollmentId: path["enrollmentId"] ?? "", idempotencyKey: idempotencyKey))
        case "postProgramsIdEnrollmentsEnrollmentIdReject":
            return try Self.encode(try await postProgramsIdEnrollmentsEnrollmentIdReject(id: path["id"] ?? "", enrollmentId: path["enrollmentId"] ?? "", idempotencyKey: idempotencyKey))
        case "postProgramsIdGroups":
            return try Self.encode(try await postProgramsIdGroups(id: path["id"] ?? "", try Self.decode(PostProgramsIdGroupsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdPromotions":
            return try Self.encode(try await postProgramsIdPromotions(id: path["id"] ?? "", try Self.decode(PostProgramsIdPromotionsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdReferrers":
            return try Self.encode(try await postProgramsIdReferrers(id: path["id"] ?? "", try Self.decode(PostProgramsIdReferrersBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postProgramsIdStripeCreditsRequeue":
            return try Self.encode(try await postProgramsIdStripeCreditsRequeue(id: path["id"] ?? "", try Self.decode(PostProgramsIdStripeCreditsRequeueBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postPromotionsIdEnd":
            return try Self.encode(try await postPromotionsIdEnd(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postPublicProgramsHandleJoin":
            return try Self.encode(try await postPublicProgramsHandleJoin(handle: path["handle"] ?? "", try Self.decode(PostPublicProgramsHandleJoinBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postQualityRecompute":
            return try Self.encode(try await postQualityRecompute(idempotencyKey: idempotencyKey))
        case "postReferralsAssociate":
            return try Self.encode(try await postReferralsAssociate(try Self.decode(PostReferralsAssociateBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postReferralsHandoffTokens":
            return try Self.encode(try await postReferralsHandoffTokens(try Self.decode(PostReferralsHandoffTokensBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postReferralsIdApprove":
            return try Self.encode(try await postReferralsIdApprove(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postReferralsIdReassign":
            return try Self.encode(try await postReferralsIdReassign(id: path["id"] ?? "", try Self.decode(PostReferralsIdReassignBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postReferralsIdVoid":
            return try Self.encode(try await postReferralsIdVoid(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postRewards":
            return try Self.encode(try await postRewards(try Self.decode(PostRewardsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postRewardsIdRedeem":
            return try Self.encode(try await postRewardsIdRedeem(id: path["id"] ?? "", try Self.decode(PostRewardsIdRedeemBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postRewardsRedeemByCode":
            return try Self.encode(try await postRewardsRedeemByCode(try Self.decode(PostRewardsRedeemByCodeBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postRoiPatternsPatternReview":
            return try Self.encode(try await postRoiPatternsPatternReview(pattern: path["pattern"] ?? "", try Self.decode(PostRoiPatternsPatternReviewBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postSandboxBillingFixtures":
            return try Self.encode(try await postSandboxBillingFixtures(try Self.decode(PostSandboxBillingFixturesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postSandboxSimulate":
            return try Self.encode(try await postSandboxSimulate(try Self.decode(PostSandboxSimulateBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postSandboxStripeFixtures":
            return try Self.encode(try await postSandboxStripeFixtures(try Self.decode(PostSandboxStripeFixturesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postSupportAppsAdapterTest":
            return try Self.encode(try await postSupportAppsAdapterTest(adapter: path["adapter"] ?? "", try Self.decode(PostSupportAppsAdapterTestBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postSupportCardsOrgIdAdapter":
            return try Self.encode(try await postSupportCardsOrgIdAdapter(orgId: path["orgId"] ?? "", adapter: path["adapter"] ?? "", try Self.decode([String: JSONValue].self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postSupportPlatformChatlyCard":
            return try Self.encode(try await postSupportPlatformChatlyCard(try Self.decode([String: JSONValue].self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postTax1099DocumentsIdCorrect":
            return try Self.encode(try await postTax1099DocumentsIdCorrect(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postTax1099Filings":
            return try Self.encode(try await postTax1099Filings(try Self.decode(PostTax1099FilingsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postTax1099FilingsIdRefresh":
            return try Self.encode(try await postTax1099FilingsIdRefresh(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postTestClockAdvance":
            return try Self.encode(try await postTestClockAdvance(try Self.decode(PostTestClockAdvanceBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postTrackEvents":
            return try Self.encode(try await postTrackEvents(try Self.decode(JSONValue.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postUnsubscribeToken":
            return try Self.encode(try await postUnsubscribeToken(token: path["token"] ?? "", idempotencyKey: idempotencyKey))
        case "postValueEvents":
            return try Self.encode(try await postValueEvents(try Self.decode(PostValueEventsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postValueImport":
            return try Self.encode(try await postValueImport(try Self.decode(PostValueImportBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postWebhookDeliveriesIdReplay":
            return try Self.encode(try await postWebhookDeliveriesIdReplay(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postWebhookEndpoints":
            return try Self.encode(try await postWebhookEndpoints(try Self.decode(PostWebhookEndpointsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postWebhookEndpointsIdReplay":
            return try Self.encode(try await postWebhookEndpointsIdReplay(id: path["id"] ?? "", since: Self.queryString(query["since"]) ?? "", idempotencyKey: idempotencyKey))
        case "postWebhookEndpointsIdRotateSecret":
            return try Self.encode(try await postWebhookEndpointsIdRotateSecret(id: path["id"] ?? "", idempotencyKey: idempotencyKey))
        case "postWidgetSession":
            return try Self.encode(try await postWidgetSession(try Self.decode(PostWidgetSessionBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postWidgetTokens":
            return try Self.encode(try await postWidgetTokens(try Self.decode(PostWidgetTokensBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postZapierConversions":
            return try Self.encode(try await postZapierConversions(try Self.decode(PostZapierConversionsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "postZapierHooks":
            return try Self.encode(try await postZapierHooks(try Self.decode(PostZapierHooksBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putAuthConnectionsIdOrigins":
            return try Self.encode(try await putAuthConnectionsIdOrigins(id: path["id"] ?? "", try Self.decode(PutAuthConnectionsIdOriginsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putAuthConnectionsIdSecret":
            return try Self.encode(try await putAuthConnectionsIdSecret(id: path["id"] ?? "", try Self.decode(PutAuthConnectionsIdSecretBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putBillingAccountsAccountRefOwner":
            return try Self.encode(try await putBillingAccountsAccountRefOwner(accountRef: path["accountRef"] ?? "", try Self.decode(PutBillingAccountsAccountRefOwnerBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putBillingConnectionsIdCredentials":
            return try Self.encode(try await putBillingConnectionsIdCredentials(id: path["id"] ?? "", try Self.decode(PutBillingConnectionsIdCredentialsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putBillingConnectionsIdSecret":
            return try Self.encode(try await putBillingConnectionsIdSecret(id: path["id"] ?? "", try Self.decode(PutBillingConnectionsIdSecretBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putBillingConnectionsIdValueMapping":
            return try Self.encode(try await putBillingConnectionsIdValueMapping(id: path["id"] ?? "", try Self.decode(PutBillingConnectionsIdValueMappingBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putBranding":
            return try Self.encode(try await putBranding(try Self.decode(PutBrandingBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putEmailSettings":
            return try Self.encode(try await putEmailSettings(try Self.decode(PutEmailSettingsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putEmailTemplatesEventLocale":
            return try Self.encode(try await putEmailTemplatesEventLocale(event: path["event"] ?? "", locale: path["locale"] ?? "", try Self.decode(PutEmailTemplatesEventLocaleBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putIntegrationsHubspot":
            return try Self.encode(try await putIntegrationsHubspot(try Self.decode(PutIntegrationsHubspotBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putIntegrationsSegment":
            return try Self.encode(try await putIntegrationsSegment(try Self.decode(PutIntegrationsSegmentBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putMarketplaceListing":
            return try Self.encode(try await putMarketplaceListing(try Self.decode(PutMarketplaceListingBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putMeLocale":
            return try Self.encode(try await putMeLocale(try Self.decode(PutMeLocaleBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putMeRoiDigest":
            return try Self.encode(try await putMeRoiDigest(try Self.decode(PutMeRoiDigestBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putNetworkSettings":
            return try Self.encode(try await putNetworkSettings(try Self.decode(PutNetworkSettingsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgConsentPartnersCookiemunch":
            return try Self.encode(try await putOrgConsentPartnersCookiemunch(try Self.decode(PutOrgConsentPartnersCookiemunchBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgFxFeed":
            return try Self.encode(try await putOrgFxFeed(try Self.decode(PutOrgFxFeedBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgHostedPages":
            return try Self.encode(try await putOrgHostedPages(try Self.decode(PutOrgHostedPagesBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgPayoutSchedule":
            return try Self.encode(try await putOrgPayoutSchedule(try Self.decode(PutOrgPayoutScheduleBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgPortalAuth":
            return try Self.encode(try await putOrgPortalAuth(try Self.decode(JSONValue.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgReferralParams":
            return try Self.encode(try await putOrgReferralParams(try Self.decode(PutOrgReferralParamsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgRetention":
            return try Self.encode(try await putOrgRetention(try Self.decode(PutOrgRetentionBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgSsoDirect":
            return try Self.encode(try await putOrgSsoDirect(try Self.decode(JSONValue.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgTaxFiling":
            return try Self.encode(try await putOrgTaxFiling(try Self.decode(PutOrgTaxFilingBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgTaxProfile":
            return try Self.encode(try await putOrgTaxProfile(try Self.decode(PutOrgTaxProfileBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putOrgTrackingConsent":
            return try Self.encode(try await putOrgTrackingConsent(try Self.decode(PutOrgTrackingConsentBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnerLocale":
            return try Self.encode(try await putPartnerLocale(try Self.decode(PutPartnerLocaleBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnerOrgsOrgIdPayoutProfile":
            return try Self.encode(try await putPartnerOrgsOrgIdPayoutProfile(orgId: path["orgId"] ?? "", try Self.decode(PutPartnerOrgsOrgIdPayoutProfileBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnerOrgsOrgIdPostback":
            return try Self.encode(try await putPartnerOrgsOrgIdPostback(orgId: path["orgId"] ?? "", try Self.decode(PutPartnerOrgsOrgIdPostbackBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnerOrgsOrgIdVat":
            return try Self.encode(try await putPartnerOrgsOrgIdVat(orgId: path["orgId"] ?? "", try Self.decode(PutPartnerOrgsOrgIdVatBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnerProfile":
            return try Self.encode(try await putPartnerProfile(try Self.decode(PutPartnerProfileBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnersIdPayoutProfile":
            return try Self.encode(try await putPartnersIdPayoutProfile(id: path["id"] ?? "", try Self.decode(PutPartnersIdPayoutProfileBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPartnersIdVat":
            return try Self.encode(try await putPartnersIdVat(id: path["id"] ?? "", try Self.decode(PutPartnersIdVatBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPayoutConnectionsProvider":
            return try Self.encode(try await putPayoutConnectionsProvider(provider: path["provider"] ?? "", try Self.decode(JSONValue.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putPortalThemeDraft":
            return try Self.encode(try await putPortalThemeDraft(try Self.decode([String: JSONValue].self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProfitabilityProductsProductRef":
            return try Self.encode(try await putProfitabilityProductsProductRef(productRef: path["productRef"] ?? "", try Self.decode(PutProfitabilityProductsProductRefBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProfitabilitySettings":
            return try Self.encode(try await putProfitabilitySettings(try Self.decode(PutProfitabilitySettingsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdAutopricing":
            return try Self.encode(try await putProgramsIdAutopricing(id: path["id"] ?? "", try Self.decode(PutProgramsIdAutopricingBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdCreditRail":
            return try Self.encode(try await putProgramsIdCreditRail(id: path["id"] ?? "", try Self.decode(PutProgramsIdCreditRailBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdIncrementality":
            return try Self.encode(try await putProgramsIdIncrementality(id: path["id"] ?? "", try Self.decode(PutProgramsIdIncrementalityBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdNegotiationPolicy":
            return try Self.encode(try await putProgramsIdNegotiationPolicy(id: path["id"] ?? "", try Self.decode(PutProgramsIdNegotiationPolicyBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdPartnersPartnerIdGroup":
            return try Self.encode(try await putProgramsIdPartnersPartnerIdGroup(id: path["id"] ?? "", partnerId: path["partnerId"] ?? "", try Self.decode(PutProgramsIdPartnersPartnerIdGroupBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdPayoutSchedule":
            return try Self.encode(try await putProgramsIdPayoutSchedule(id: path["id"] ?? "", try Self.decode(PutProgramsIdPayoutScheduleBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdRefereeReward":
            return try Self.encode(try await putProgramsIdRefereeReward(id: path["id"] ?? "", try Self.decode(PutProgramsIdRefereeRewardBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putProgramsIdStripeCredits":
            return try Self.encode(try await putProgramsIdStripeCredits(id: path["id"] ?? "", try Self.decode(PutProgramsIdStripeCreditsBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putRewardsRulesKey":
            return try Self.encode(try await putRewardsRulesKey(key: path["key"] ?? "", try Self.decode(PutRewardsRulesKeyBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putStripeCreditsConnection":
            return try Self.encode(try await putStripeCreditsConnection(try Self.decode(PutStripeCreditsConnectionBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        case "putSupportAppsAdapter":
            return try Self.encode(try await putSupportAppsAdapter(adapter: path["adapter"] ?? "", try Self.decode(PutSupportAppsAdapterBody.self, from: body ?? .object([:])), idempotencyKey: idempotencyKey))
        default:
            throw ReferalliError.unknownOperation(operationId)
        }
    }
}
