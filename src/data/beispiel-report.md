# NIS2 Compliance Report — §30 BSIG

## Unternehmen: Demo Firma GmbH
## NIS2-Kategorie: Besonders wichtige Einrichtung (Selbsteinstufung)
## Scan-Datum: 24.07.2026 09:15:00 UTC
## Scan-ID: f0588f7a-cc76-46ae-96f5-dd3b96e05538
## Scope: AWS
## Rechtsstand: BSIG i. d. F. des NIS2UmsuCG (BGBl. 2025 I Nr. 301), in Kraft seit 06.12.2025

---

### Executive Summary

| Eigenschaft | Wert |
|-------------|------|
| **Erfüllungsgrad (cloud-technischer Teilaspekt)** | **Teilweise erfüllt** |
| Zusatzsicht: Bereiche strikt erfüllt oder alle Mängel per dokumentierter Ausnahme akzeptiert | 6 von 8 (davon 6 strikt erfüllt) |
| **Checks ausgeführt** | 10 |
| **Checks bestanden (von anwendbaren)** | 6/10 |
| **Checks nicht bestanden** | 4 |
| **Checks nicht anwendbar (keine Prüfobjekte)** | 0 |
| **Checks mit Fehler (nicht ausgewertet)** | 0 |
| **Mängel gesamt** | 4 |
| — davon per dokumentierter Ausnahme akzeptiert | 1 |
| **Positivnachweise** | 10 |
| Kritisch | 2 |
| Hoch | 2 |
| Mittel | 0 |
| Niedrig | 0 |
| Info | 0 |
| **§30-Bereiche geprüft** | 8/10 |


Der Erfüllungsgrad bewertet ausschließlich den cloud-technisch prüfbaren Teilaspekt der jeweiligen §30-Maßnahme. Organisatorische Anforderungen (Richtlinien, Prozesse, Schulungen) sind nicht Gegenstand dieses Scans.

---

### Compliance-Matrix §30 BSIG

| §30 Nr. | Bereich | Erfüllungsgrad | Checks bestanden | N. a. | Fehler | Mängel | davon Ausnahme | Kritisch | Hoch |
|----------|---------|----------------|------------------|-------|--------|--------|-----------------|----------|------|
| 1 | Risikoanalyse und IT-Sicherheitskonzepte | Erfüllt | 1/1 | 0 | 0 | 0 | - | 0 | 0 |
| 2 | Bewältigung von Sicherheitsvorfällen | Erfüllt | 1/1 | 0 | 0 | 0 | - | 0 | 0 |
| 3 | Aufrechterhaltung des Betriebs | Erfüllt | 1/1 | 0 | 0 | 0 | - | 0 | 0 |
| 6 | Bewertung der Wirksamkeit von Risikomanagementmaßnahmen | Erfüllt | 1/1 | 0 | 0 | 0 | - | 0 | 0 |
| 7 | Grundlegende Schulungen und Sensibilisierung | Erfüllt | 1/1 | 0 | 0 | 0 | - | 0 | 0 |
| 8 | Kryptographie | Nicht erfüllt | 0/1 | 0 | 0 | 1 | - | 0 | 1 |
| 9 | Personalsicherheit, Zugriffskontrolle und IKT-Verwaltung | Nicht erfüllt | 0/3 | 0 | 0 | 3 | 1 | 2 | 1 |
| 10 | MFA und gesicherte Kommunikation | Erfüllt | 1/1 | 0 | 0 | 0 | - | 0 | 0 |

„Checks bestanden" zählt nur anwendbare Checks (mit Prüfobjekten in der Umgebung). „N. a." = nicht anwendbar: keine Prüfobjekte vorhanden — kein Nachweis, kein Mangel. „davon Ausnahme" nennt Mängel, die per dokumentierter Ausnahme akzeptiert sind (Abschnitt „Ausnahmen") — sie zählen in der Mängel-Spalte weiterhin voll mit, keine stille Herausrechnung.

---

### Mängel nach §30-Bereich

#### §30 Abs. 2 Nr. 8 — Kryptographie

**Gesetzestext:** "Konzepte und Prozesse für den Einsatz von kryptographischen Verfahren"
**Quelle:** [§ 30 Abs. 2 Nr. 8 BSIG](https://www.gesetze-im-internet.de/bsig_2025/__30.html) (abgerufen am 2026-07-11)

**ISO 27001 Referenz:** A.8.24

##### AWS-NR8-001: S3-Bucket ohne Default-Verschlüsselung

- **Schweregrad:** HIGH
- **Resource:** `arn:aws:s3:::demo-firma-uploads`
- **Region:** eu-central-1
- **Ist-Zustand:** Der S3-Bucket 'demo-firma-uploads' hat keine serverseitige Default-Verschlüsselung konfiguriert. Alle hochgeladenen Objekte sind unverschlüsselt gespeichert.
- **Soll-Zustand:** SSE-S3 (AES-256) oder SSE-KMS Default-Verschlüsselung aktiviert
- **Empfehlung:** Aktivieren Sie die Default-Verschlüsselung für den S3-Bucket mit SSE-S3 (AES-256) oder SSE-KMS. AWS CLI: aws s3api put-bucket-encryption --bucket demo-firma-uploads --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
- **Aufwand:** LOW
- **ISO 27001:** A.8.24 Verwendung von Kryptographie
- **Audit-Nachweis:** `GetBucketEncryption returned ServerSideEncryptionConfigurationNotFoundError for bucket 'demo-firma-uploads'`

#### §30 Abs. 2 Nr. 9 — Personalsicherheit, Zugriffskontrolle und IKT-Verwaltung

**Gesetzestext:** "Erstellung von Konzepten für die Sicherheit des Personals, die Zugriffskontrolle und für die Verwaltung von IKT-Systemen, -Produkten und -Prozessen"
**Quelle:** [§ 30 Abs. 2 Nr. 9 BSIG](https://www.gesetze-im-internet.de/bsig_2025/__30.html) (abgerufen am 2026-07-11)

**ISO 27001 Referenz:** A.5.9, A.5.10, A.5.11, A.5.12, A.5.13, A.5.14, A.5.15, A.5.16, A.5.17, A.5.18

##### AWS-NR9-004: Security Group mit öffentlichem Zugriff auf 22 (SSH)

- **Schweregrad:** CRITICAL
- **Resource:** `sg-0f1e2d3c4b5a69870`
- **Region:** eu-central-1
- **Ist-Zustand:** Die Security Group 'sg-0f1e2d3c4b5a69870' (demo-firma-bastion-sg) erlaubt eingehenden Zugriff von 0.0.0.0/0 auf Port(s) 22 (SSH).
- **Soll-Zustand:** Kein unrestricted Inbound-Zugriff auf kritische/administrative Ports
- **Empfehlung:** Beschränken Sie den Zugriff auf spezifische IP-Bereiche oder verwenden Sie AWS Systems Manager Session Manager für SSH-Zugriff anstelle von öffentlichen Security-Group-Regeln.
- **Aufwand:** LOW
- **ISO 27001:** A.5.15-A.5.18 Access control
- **Audit-Nachweis:** `DescribeSecurityGroups: sg-0f1e2d3c4b5a69870 allows 0.0.0.0/0 on 22 (SSH)`

##### AWS-NR9-006: S3-Bucket-Policy erlaubt öffentlichen Zugriff

- **Schweregrad:** CRITICAL
- **Resource:** `arn:aws:s3:::demo-firma-website`
- **Region:** eu-central-1
- **Ist-Zustand:** Die Bucket-Policy erlaubt Zugriff für Principal: * ohne Bedingung. Dies kann zu ungewollter Datenexposition führen.
- **Soll-Zustand:** Kein Principal: * in Bucket-Policies
- **Empfehlung:** Entfernen Sie den öffentlichen Zugriff aus der Bucket-Policy. Verwenden Sie stattdessen spezifische IAM-Rollen oder Account-IDs als Principal.
- **Aufwand:** LOW
- **ISO 27001:** A.5.15-A.5.18 Access control
- **Audit-Nachweis:** `GetBucketPolicy: Principal=* with Effect=Allow, no Condition`

##### AWS-NR9-001: IAM-Benutzer ohne MFA

- **Schweregrad:** HIGH
- **Resource:** `arn:aws:iam::111122223333:user/j.schmidt`
- **Region:** global
- **Ist-Zustand:** Der IAM-Benutzer 'j.schmidt' hat keine MFA-Authentifizierung konfiguriert. Ohne MFA ist der Account anfällig für Credential-basierte Angriffe.
- **Soll-Zustand:** MFA aktiviert (Virtual MFA, Hardware-Token, oder FIDO2)
- **Empfehlung:** Aktivieren Sie MFA für den IAM-Benutzer. Empfohlen: FIDO2 Security Key oder Virtual MFA App. AWS Console: IAM → Users → Security credentials → MFA
- **Aufwand:** LOW
- **ISO 27001:** A.5.15-A.5.18 Access control
- **Audit-Nachweis:** `ListMFADevices returned 0 devices for user j.schmidt`


---

### Ausnahmen

Dokumentierte, befristete Ausnahmen unterdrücken keinen Befund — der Mangel bleibt oben sichtbar und zählt in den Mängel-Zahlen weiterhin voll mit. Diese Sektion macht zusätzlich transparent, welche Mängel die Einrichtung bewusst und nachvollziehbar akzeptiert hat. Eine dokumentierte Ausnahme ist eine Risikoentscheidung der Einrichtung; sie beseitigt den technischen Mangel nicht und nimmt eine Bewertung durch Auditor oder Aufsicht nicht vorweg.

| Check | Ressource | Vermerk | Befristet bis | Autor/Ticket |
|-------|-----------|---------|----------------|--------------|
| AWS-NR9-006 | `arn:aws:s3:::demo-firma-website` | Bewusst öffentlicher Static-Website-Bucket für den Unternehmensauftritt (demo-firma.de). Der Zugriff über die Bucket-Policy ist auf lesende GetObject-Berechtigungen für öffentliche HTML/CSS/Bild-Assets beschränkt; es werden keine personenbezogenen oder vertraulichen Daten über diesen Bucket bereitgestellt. Risikoakzeptanz durch die Geschäftsführung dokumentiert. | 24.01.2027 | M. Mustermann / WEB-142 |


---

### Positivnachweise nach §30-Bereich

Konforme Prüfobjekte als belastbarer Nachweis (nicht nur Abwesenheit von Mängeln).

#### §30 Abs. 2 Nr. 1 — Risikoanalyse und IT-Sicherheitskonzepte

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR1-001 | Config Recorder aktiv | `arn:aws:config:eu-central-1:111122223333:recorder/default` | DescribeConfigurationRecorderStatus: recording=true for default in eu-central-1 |

#### §30 Abs. 2 Nr. 2 — Bewältigung von Sicherheitsvorfällen

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR2-001 | GuardDuty aktiviert | `arn:aws:guardduty:eu-central-1:111122223333:detector/64b1f3a9c8d2e7f0` | GetDetector: Status=ENABLED in eu-central-1 |

#### §30 Abs. 2 Nr. 3 — Aufrechterhaltung des Betriebs

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR3-002 | S3-Bucket mit Versionierung | `arn:aws:s3:::demo-firma-backups` | GetBucketVersioning: Status=Enabled for demo-firma-backups |

#### §30 Abs. 2 Nr. 6 — Bewertung der Wirksamkeit von Risikomanagementmaßnahmen

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR6-001 | CloudTrail-Zustellung betrieblich wirksam | `arn:aws:cloudtrail:eu-central-1:111122223333:trail/demo-firma-trail` | GetTrailStatus: LatestDeliveryTime=2026-07-24T07:52:00+00:00 (hours_ago=1.4), log_file_validation=True |

#### §30 Abs. 2 Nr. 7 — Grundlegende Schulungen und Sensibilisierung

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR7-001 | IAM-Passwort-Richtlinie erfüllt Anforderungen | `arn:aws:iam::111122223333:account-password-policy` | GetAccountPasswordPolicy: all requirements met (length=16) |

#### §30 Abs. 2 Nr. 8 — Kryptographie

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR8-001 | S3-Bucket mit Default-Verschlüsselung | `arn:aws:s3:::demo-firma-logs` | GetBucketEncryption: SSEAlgorithm=aws:kms for demo-firma-logs |

#### §30 Abs. 2 Nr. 9 — Personalsicherheit, Zugriffskontrolle und IKT-Verwaltung

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR9-001 | IAM-Benutzer mit MFA | `arn:aws:iam::111122223333:user/m.mueller` | ListMFADevices returned 1 device(s) for user m.mueller |
| AWS-NR9-004 | Security Group ohne öffentlichen Zugriff | `sg-0a1b2c3d4e5f67890` | DescribeSecurityGroups: sg-0a1b2c3d4e5f67890 has no public inbound rule on critical/administrative ports |
| AWS-NR9-006 | S3-Bucket ohne öffentliche Bucket-Policy | `arn:aws:s3:::demo-firma-assets` | GetBucketPolicy: Keine Bucket-Policy vorhanden |

#### §30 Abs. 2 Nr. 10 — MFA und gesicherte Kommunikation

| Check | Titel | Ressource | Nachweis |
|-------|-------|-----------|----------|
| AWS-NR10-001 | AWS Root-Account mit MFA | `arn:aws:iam::111122223333:root` | GetAccountSummary: AccountMFAEnabled=1 |


---

### Prüfabdeckung: Ergebnisse aller Checks

Jeder ausgeführte Check ist hier aufgeführt — auch fehlgeschlagene und nicht ausgewertete (keine stillen Lücken).

#### Alle Check-Ergebnisse

| Check-ID | Titel | §30 Nr. | Ergebnis |
|----------|-------|---------|----------|
| AWS-NR1-001 | AWS Config Recorder | 1 | Bestanden |
| AWS-NR2-001 | GuardDuty Aktivierung | 2 | Bestanden |
| AWS-NR3-002 | S3 Bucket Versioning | 3 | Bestanden |
| AWS-NR6-001 | CloudTrail Betriebliche Wirksamkeit | 6 | Bestanden |
| AWS-NR7-001 | IAM Password Policy | 7 | Bestanden |
| AWS-NR8-001 | S3 Default Encryption | 8 | Nicht bestanden |
| AWS-NR9-001 | IAM User MFA Status | 9 | Nicht bestanden |
| AWS-NR9-004 | Security Group Open Access | 9 | Nicht bestanden |
| AWS-NR9-006 | S3 Bucket Policy Public Access | 9 | Nicht bestanden |
| AWS-NR10-001 | Root Account MFA | 10 | Bestanden |

#### Prüfgrenzen der Checks (Known Limitations)

Jeder Check prüft einen abgegrenzten technischen Aspekt — was er ausdrücklich **nicht** prüft, steht hier (Fail-Safe-Transparenz).

- **AWS-NR1-001** (AWS Config Recorder): Prüft nur, ob ein Config Recorder in den gescannten Regionen aufzeichnet. Nicht geprüft werden der Aufzeichnungsumfang (alle Ressourcentypen?) und ob die aufgezeichneten Daten ausgewertet werden.
- **AWS-NR2-001** (GuardDuty Aktivierung): Prüft nur den Detector-Status je Region. Nicht geprüft werden aktivierte Schutzmodule und ob GuardDuty-Befunde in einen Incident-Prozess münden.
- **AWS-NR3-002** (S3 Bucket Versioning): Prüft nur den Versioning-Status der Buckets. Nicht geprüft werden Lifecycle-Regeln, die alte Versionen löschen, und ob Versioning als Wiederherstellungsweg tatsächlich trägt.
- **AWS-NR6-001** (CloudTrail Betriebliche Wirksamkeit): Prüft nur, ob CloudTrail aktiv Ereignisse liefert (betriebliche Funktion). Nicht geprüft wird, ob die Ereignisse ausgewertet werden.
- **AWS-NR7-001** (IAM Password Policy): Prüft nur die IAM-Passwort-Richtlinie des Accounts. Föderierte Identitäten (SSO/IdP) unterliegen der Richtlinie des Identitätsanbieters und werden hier nicht geprüft.
- **AWS-NR8-001** (S3 Default Encryption): Prüft nur die Default-Encryption-Einstellung der Buckets. Nicht geprüft werden einzelne Objekte, die vor der Aktivierung unverschlüsselt abgelegt wurden.
- **AWS-NR9-001** (IAM User MFA Status): Prüft nur IAM-Benutzer mit Konsolen-Login. Föderierte Zugänge (SSO/IdP) werden vom Identitätsanbieter durchgesetzt und hier nicht geprüft.
- **AWS-NR9-004** (Security Group Open Access): Prüft Security-Group-Regeln auf offene kritische/administrative Ports (SSH/RDP u. a.) sowie Vollbereichs-Freigaben (alle Ports) von 0.0.0.0/0 bzw. ::/0. Öffentliche Regeln auf nicht-administrative Ports werden nicht bewertet. Ob hinter einer offenen Regel tatsächlich eine Instanz erreichbar ist (Routing, NACLs), wird nicht geprüft.
- **AWS-NR9-006** (S3 Bucket Policy Public Access): Prüft Bucket-Policies auf öffentliche Freigaben (Principal: *). Öffentliche Freigaben über Bucket-ACLs, Zugriffe über CloudFront-Distributionen oder vorsignierte URLs sind nicht Gegenstand.
- **AWS-NR10-001** (Root Account MFA): Prüft nur, ob Root-MFA aktiviert ist. Art des zweiten Faktors (Hardware vs. virtuell) und die sichere Verwahrung werden nicht geprüft.

---

### Attestierungs-Checkliste: manuell zu erbringende Nachweise

Dieser Scan bewertet ausschließlich den cloud-technisch prüfbaren Teilaspekt jeder §30-Maßnahme. Die folgenden Nachweise kann kein Cloud-Scan erbringen — sie sind organisatorisch zu attestieren und gehören zur vollständigen NIS2-Dokumentation.

#### §30 Abs. 2 Nr. 1 — Risikoanalyse und IT-Sicherheitskonzepte

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft wird ausschließlich, ob technische Grundlagen für die Risikoerkennung in der Cloud-Umgebung aktiv sind (z. B. Konfigurations-Aufzeichnung, Bedrohungserkennungsdienste, zentrale Sicherheitsauswertung). Ob eine Risikoanalyse tatsächlich durchgeführt, dokumentiert und aktuell gehalten wird, kann ein Cloud-API-Scan strukturell nicht feststellen — aktivierte Dienste sind ein Indiz, kein Nachweis.

**Manuell zu attestieren:**

- [ ] Dokumentierte Informationssicherheitsleitlinie liegt vor und ist von der Leitung freigegeben
- [ ] Risikoanalyse-Verfahren ist dokumentiert und wird regelmäßig durchgeführt
- [ ] Risikobehandlungsplan mit Verantwortlichkeiten und Terminen existiert und ist aktuell

#### §30 Abs. 2 Nr. 2 — Bewältigung von Sicherheitsvorfällen

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft wird nur der technische Detektionsunterbau in der Cloud-Umgebung (Bedrohungserkennung, Alarmierung, Ereignis-Routing) sowie das Vorhandensein in der Cloud hinterlegter technischer Reaktions- und Analysebausteine (z. B. Response-Pläne, Automatisierungs-Playbooks, Forensik-Dienste). Nicht prüfbar sind der Incident-Response-Prozess selbst, die organisatorische Reaktionsfähigkeit und die Einhaltung der Meldepflichten nach §32 BSIG.

**Manuell zu attestieren:**

- [ ] Incident-Response-Plan ist dokumentiert und wurde in den letzten 12 Monaten geübt
- [ ] Meldewege an das BSI (§32 BSIG) sind definiert, Fristen und Zuständigkeiten bekannt
- [ ] Rollen, Eskalationswege und Erreichbarkeiten für Sicherheitsvorfälle sind festgelegt

#### §30 Abs. 2 Nr. 3 — Aufrechterhaltung des Betriebs

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft werden technische BCM-Bausteine in der Cloud (Backups, Versionierung, Redundanz über Verfügbarkeitszonen, Health-Checks). Nicht prüfbar sind das BCM-Konzept, Wiederanlaufpläne, definierte Wiederherstellungsziele (RTO/RPO) und ob Wiederherstellungen tatsächlich geübt werden.

**Manuell zu attestieren:**

- [ ] BCM-/Notfallkonzept ist dokumentiert und von der Leitung freigegeben
- [ ] Wiederherstellungsziele (RTO/RPO) sind je kritischem System definiert
- [ ] Wiederherstellungsübungen (Restore-Tests) sind durchgeführt und dokumentiert
- [ ] Krisenmanagement-Organisation (Stab, Kommunikation) ist festgelegt

#### §30 Abs. 2 Nr. 6 — Bewertung der Wirksamkeit von Risikomanagementmaßnahmen

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft wird nur, ob technische Grundlagen für Wirksamkeitsbewertung vorhanden sind (manipulationssichere Audit-Protokolle, Regel-Auswertungen, Sicherheits-Dashboards). Ob Wirksamkeit tatsächlich bewertet wird — interne Audits, Kennzahlen, Management-Bewertungen — ist organisatorisch und nicht per API prüfbar.

**Manuell zu attestieren:**

- [ ] Auditprogramm (interne Überprüfungen) ist festgelegt und wird durchgeführt
- [ ] Management-Bewertung der Informationssicherheit findet regelmäßig statt und ist dokumentiert
- [ ] Kennzahlen zur Wirksamkeit der Maßnahmen sind definiert und werden erhoben

#### §30 Abs. 2 Nr. 7 — Grundlegende Schulungen und Sensibilisierung

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft werden technische Cyberhygiene-Grundlagen in der Cloud-Umgebung (Passwort-/Kontorichtlinien, sicherheitsrelevante Organisationsrichtlinien, Sicherheits-Ansprechpartner). Schulungen und Awareness-Maßnahmen — der Kern dieser Maßnahme — sind nicht per Cloud-API prüfbar.

**Manuell zu attestieren:**

- [ ] Schulungsprogramm zur Informationssicherheit existiert; Teilnahmenachweise liegen vor
- [ ] Auch Geschäftsleitung/Leitungsorgane nehmen nachweislich an Schulungen teil
- [ ] Regelmäßige Awareness-Maßnahmen (z. B. Phishing-Simulationen) werden durchgeführt

#### §30 Abs. 2 Nr. 8 — Kryptographie

**Automatisiert geprüfter Teilaspekt:** Dieser Bereich ist cloud-technisch gut prüfbar: Verschlüsselung at Rest und in Transit, Schlüsselrotation, TLS-Mindestversionen und Zertifikatsgültigkeit werden automatisiert geprüft. Nicht prüfbar ist das Kryptokonzept selbst — welche Verfahren wofür einzusetzen sind und wie Schlüssel organisatorisch verwaltet werden.

**Manuell zu attestieren:**

- [ ] Kryptokonzept ist dokumentiert (Verfahren, Schlüssellängen, Einsatzbereiche)
- [ ] Prozess für Schlüsselverwaltung und -wechsel ist festgelegt (auch außerhalb der Cloud)

#### §30 Abs. 2 Nr. 9 — Personalsicherheit, Zugriffskontrolle und IKT-Verwaltung

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft wird die technische Zugriffskontrolle in der Cloud (IAM-Rollen und -Richtlinien, Schlüsselhygiene, Netzwerkzugriffe, öffentliche Freigaben). Nicht prüfbar sind Personalsicherheit, das Zugriffskontrollkonzept als Dokument, Joiner/Mover/Leaver-Prozesse und das Asset-Inventar außerhalb der gescannten Cloud-Umgebung.

**Manuell zu attestieren:**

- [ ] Zugriffskontrollkonzept (Least Privilege, Need-to-Know) ist dokumentiert
- [ ] Prozess für Eintritt/Wechsel/Austritt (Joiner/Mover/Leaver) inkl. Rechteentzug ist geregelt
- [ ] Asset-Inventar umfasst auch Systeme außerhalb der gescannten Cloud-Umgebung
- [ ] Maßnahmen zur Personalsicherheit (Verpflichtungen, Vertraulichkeit) sind umgesetzt

#### §30 Abs. 2 Nr. 10 — MFA und gesicherte Kommunikation

**Automatisiert geprüfter Teilaspekt:** Automatisiert geprüft wird die MFA-Konfiguration der Cloud-Zugänge und die Absicherung administrativer Zugriffswege. Nicht prüfbar sind MFA außerhalb der Cloud (z. B. VPN, lokale Systeme), gesicherte Sprach-, Video- und Textkommunikation sowie Notfallkommunikationssysteme.

**Manuell zu attestieren:**

- [ ] MFA oder kontinuierliche Authentifizierung ist für Zugänge geregelt; der Geltungsbereich (auch außerhalb der gescannten Cloud-Umgebung) ist dokumentiert
- [ ] Gesicherte Kommunikationsmittel (Sprache, Video, Text) sind festgelegt und im Einsatz
- [ ] Notfallkommunikationssystem für den Fall kompromittierter Systeme ist definiert

---

### Anhang A: Scan-Metadaten

| Eigenschaft | Wert |
|-------------|------|
| Tool-Version | 0.1.4 |
| Report-Profil | Intern (Klardaten) |
| Schema-Version | 1.1.0 |
| Mapping-Version | 2026.07 |
| Rechtsstand | BSIG i. d. F. des NIS2UmsuCG (BGBl. 2025 I Nr. 301), in Kraft seit 06.12.2025 |
| Python-Version | 3.13.14 |
| boto3-Version | 1.35.0 |
| Scan-Dauer | 8.7s |
| Ausnahmen-Datei | exceptions-demo-firma.yaml |
| Ausnahmen angewendet | 1 |

### Anhang B: §30 BSIG Referenz

Die 10 Kernmaßnahmen des §30 Abs. 2 BSIG (Normtext wörtlich nach Primärquelle):

1. **Risikoanalyse und IT-Sicherheitskonzepte** — "Konzepte in Bezug auf die Risikoanalyse und auf die Sicherheit in der Informationstechnik"
2. **Bewältigung von Sicherheitsvorfällen** — "Bewältigung von Sicherheitsvorfällen"
3. **Aufrechterhaltung des Betriebs** — "Aufrechterhaltung des Betriebs, wie Backup-Management und Wiederherstellung nach einem Notfall, und Krisenmanagement"
4. **Sicherheit der Lieferkette** — "Sicherheit der Lieferkette einschließlich sicherheitsbezogener Aspekte der Beziehungen zu unmittelbaren Anbietern oder Diensteanbietern"
5. **Sicherheit bei Erwerb, Entwicklung und Wartung** — "Sicherheitsmaßnahmen bei Erwerb, Entwicklung und Wartung von informationstechnischen Systemen, Komponenten und Prozessen, einschließlich Management und Offenlegung von Schwachstellen"
6. **Bewertung der Wirksamkeit von Risikomanagementmaßnahmen** — "Konzepte und Verfahren zur Bewertung der Wirksamkeit von Risikomanagementmaßnahmen im Bereich der Sicherheit in der Informationstechnik"
7. **Grundlegende Schulungen und Sensibilisierung** — "grundlegende Schulungen und Sensibilisierungsmaßnahmen im Bereich der Sicherheit in der Informationstechnik"
8. **Kryptographie** — "Konzepte und Prozesse für den Einsatz von kryptographischen Verfahren"
9. **Personalsicherheit, Zugriffskontrolle und IKT-Verwaltung** — "Erstellung von Konzepten für die Sicherheit des Personals, die Zugriffskontrolle und für die Verwaltung von IKT-Systemen, -Produkten und -Prozessen"
10. **MFA und gesicherte Kommunikation** — "Verwendung von Lösungen zur Multi-Faktor-Authentifizierung oder kontinuierlichen Authentifizierung, gesicherte Sprach-, Video- und Textkommunikation sowie gegebenenfalls gesicherte Notfallkommunikationssysteme innerhalb der Einrichtung"

*Quelle aller Normtexte: [https://www.gesetze-im-internet.de/bsig_2025/__30.html](https://www.gesetze-im-internet.de/bsig_2025/__30.html), abgerufen am 2026-07-11.*

---

*Dieser Report wurde automatisch generiert von [nis2scan](https://github.com/letaible/nis2scan) v0.1.4.*
*Er dient als technische Grundlage für die NIS2-Compliance-Dokumentation und ersetzt keine rechtliche Beratung.*
*Die NIS2-Kategorie beruht auf der Selbsteinstufung des Unternehmens und wurde nicht durch das Tool geprüft.*