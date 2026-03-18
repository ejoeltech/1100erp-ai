<?php
/**
 * Security Verification Test Suite
 */
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../includes/security.php';
require_once __DIR__ . '/../includes/helpers.php';

function test_csrf_token() {
    echo "Testing CSRF Token Generation... ";
    $token = generateCSRFToken();
    if (strlen($token) === 64 && validateCSRFToken($token)) {
        echo "PASSED\n";
    } else {
        echo "FAILED\n";
    }
}

function test_html_escaping() {
    echo "Testing HTML Escaping (h helper)... ";
    $input = "<script>alert('xss')</script>";
    $expected = "&lt;script&gt;alert(&#039;xss&#039;)&lt;/script&gt;";
    if (h($input) === $expected) {
        echo "PASSED\n";
    } else {
        echo "FAILED (Got: " . h($input) . ")\n";
    }
}

function test_password_policy() {
    echo "Testing Password Policy... ";
    $weak = "short";
    $strong = "StrongPass123!@#";
    if (validatePasswordPolicy($weak) !== true && validatePasswordPolicy($strong) === true) {
        echo "PASSED\n";
    } else {
        echo "FAILED\n";
    }
}

function test_pii_encryption() {
    echo "Testing PII Encryption... ";
    // Mock ENCRYPTION_KEY if not set
    if (!getenv('ENCRYPTION_KEY')) {
        putenv('ENCRYPTION_KEY=test-key-32-chars-long-1234567890');
    }
    $pii = "1234567890";
    $encrypted = encryptPII($pii);
    $decrypted = decryptPII($encrypted);
    if ($encrypted !== $pii && $decrypted === $pii) {
        echo "PASSED\n";
    } else {
        echo "FAILED\n";
    }
}

echo "--- Security Hardening Verification Suite ---\n";
test_csrf_token();
test_html_escaping();
test_password_policy();
test_pii_encryption();
echo "--------------------------------------------\n";
