// Code generated from the Referalli OpenAPI document. DO NOT EDIT.
// Changes belong in the generator, which overwrites this file.

import Foundation

/// `validation_error` (HTTP 400).
public final class ValidationError: APIError, @unchecked Sendable {}

/// `mode_mismatch` (HTTP 400).
public final class ModeMismatchError: APIError, @unchecked Sendable {}

/// `bad_request` (HTTP 400).
public final class BadRequestError: APIError, @unchecked Sendable {}

/// `unauthorized` (HTTP 401).
public final class AuthenticationError: APIError, @unchecked Sendable {}

/// `step_up_required` (HTTP 401).
public final class StepUpRequiredError: APIError, @unchecked Sendable {}

/// `reauth_required` (HTTP 401).
public final class ReauthRequiredError: APIError, @unchecked Sendable {}

/// `payment_required` (HTTP 402).
public final class PaymentRequiredError: APIError, @unchecked Sendable {}

/// `forbidden` (HTTP 403).
public final class PermissionDeniedError: APIError, @unchecked Sendable {}

/// `webhooks_disabled` (HTTP 403).
public final class WebhooksDisabledError: APIError, @unchecked Sendable {}

/// `sso_required` (HTTP 403).
public final class SsoRequiredError: APIError, @unchecked Sendable {}

/// `access_suspended` (HTTP 403).
public final class AccessSuspendedError: APIError, @unchecked Sendable {}

/// `not_found` (HTTP 404).
public final class NotFoundError: APIError, @unchecked Sendable {}

/// `conflict` (HTTP 409).
public final class ConflictError: APIError, @unchecked Sendable {}

/// `idempotency_in_progress` (HTTP 409).
public final class IdempotencyInProgressError: APIError, @unchecked Sendable {}

/// `replay` (HTTP 409).
public final class ReplayError: APIError, @unchecked Sendable {}

/// `live_mode_only` (HTTP 409).
public final class LiveModeOnlyError: APIError, @unchecked Sendable {}

/// `test_mode_only` (HTTP 409).
public final class TestModeOnlyError: APIError, @unchecked Sendable {}

/// `test_mode_unsupported` (HTTP 409).
public final class TestModeUnsupportedError: APIError, @unchecked Sendable {}

/// `gone` (HTTP 410).
public final class GoneError: APIError, @unchecked Sendable {}

/// `idempotency_key_reused` (HTTP 422).
public final class IdempotencyKeyReusedError: APIError, @unchecked Sendable {}

/// `payload_too_large` (HTTP 413).
public final class PayloadTooLargeError: APIError, @unchecked Sendable {}

/// `connection_paused` (HTTP 423).
public final class ConnectionPausedError: APIError, @unchecked Sendable {}

/// `rate_limited` (HTTP 429).
public final class RateLimitedError: APIError, @unchecked Sendable {}

/// `internal_error` (HTTP 500).
public final class InternalServerError: APIError, @unchecked Sendable {}

/// `atlas_error` (HTTP 502).
public final class AtlasError: APIError, @unchecked Sendable {}

/// `sso_provider_error` (HTTP 502).
public final class SsoProviderError: APIError, @unchecked Sendable {}

/// `sso_not_configured` (HTTP 503).
public final class SsoNotConfiguredError: APIError, @unchecked Sendable {}

extension APIError {
    static let classes: [String: APIError.Type] = [
        "validation_error": ValidationError.self,
        "mode_mismatch": ModeMismatchError.self,
        "bad_request": BadRequestError.self,
        "unauthorized": AuthenticationError.self,
        "step_up_required": StepUpRequiredError.self,
        "reauth_required": ReauthRequiredError.self,
        "payment_required": PaymentRequiredError.self,
        "forbidden": PermissionDeniedError.self,
        "webhooks_disabled": WebhooksDisabledError.self,
        "sso_required": SsoRequiredError.self,
        "access_suspended": AccessSuspendedError.self,
        "not_found": NotFoundError.self,
        "conflict": ConflictError.self,
        "idempotency_in_progress": IdempotencyInProgressError.self,
        "replay": ReplayError.self,
        "live_mode_only": LiveModeOnlyError.self,
        "test_mode_only": TestModeOnlyError.self,
        "test_mode_unsupported": TestModeUnsupportedError.self,
        "gone": GoneError.self,
        "idempotency_key_reused": IdempotencyKeyReusedError.self,
        "payload_too_large": PayloadTooLargeError.self,
        "connection_paused": ConnectionPausedError.self,
        "rate_limited": RateLimitedError.self,
        "internal_error": InternalServerError.self,
        "atlas_error": AtlasError.self,
        "sso_provider_error": SsoProviderError.self,
        "sso_not_configured": SsoNotConfiguredError.self,
    ]
}
