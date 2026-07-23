<?php
// Kontaktformular-Handler fuer Strato-Webspace (PHP).
// Sendet an info@letaible.de und leitet zurueck auf /kontakt/?sent=1|0.
// Honeypot-Feld "website": Bots fuellen es aus -> stillschweigend verwerfen.

declare(strict_types=1);

function back(string $status): never {
    header('Location: /kontakt/?sent=' . $status, true, 303);
    exit;
}

if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
    back('0');
}

$honeypot = trim((string)($_POST['website'] ?? ''));
if ($honeypot !== '') {
    back('1'); // Bot: so tun als ob, nichts senden
}

$name    = trim((string)($_POST['name'] ?? ''));
$email   = trim((string)($_POST['email'] ?? ''));
$message = trim((string)($_POST['message'] ?? ''));

if ($name === '' || $message === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)
    || strlen($name) > 200 || strlen($email) > 320 || strlen($message) > 5000) {
    back('0');
}

// Header-Injection verhindern: Zeilenumbrueche aus Kopf-Feldern entfernen
$name  = str_replace(["\r", "\n"], ' ', $name);
$email = str_replace(["\r", "\n"], '', $email);

$to      = 'info@letaible.de';
$subject = '=?UTF-8?B?' . base64_encode('[nis2scan.de] Kontaktanfrage von ' . $name) . '?=';
$body    = "Name: {$name}\nE-Mail: {$email}\n\n{$message}\n";
$headers = implode("\r\n", [
    'From: nis2scan.de Kontaktformular <noreply@nis2scan.de>',
    'Reply-To: ' . $email,
    'Content-Type: text/plain; charset=UTF-8',
    'X-Mailer: kontakt.php',
]);

$ok = mail($to, $subject, $body, $headers);
back($ok ? '1' : '0');
