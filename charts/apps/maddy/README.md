# maddy

![Version: 4.1.1](https://img.shields.io/badge/Version-4.1.1-informational?style=flat-square) ![AppVersion: 0.6.2](https://img.shields.io/badge/AppVersion-0.6.2-informational?style=flat-square)

Maddy Mail Server

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/maddy>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://github.com/foxcpp/maddy>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |
| https://charts.bitnami.com/bitnami | postgresql | 12.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/foxcpp/maddy"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| maddy.auth.ldap | object | See [See Maddy auth](https://maddy.email/man/_generated_maddy-auth.5/#configuration-directives_5) | If type is ldap the following options are required |
| maddy.auth.ldap."bind plain" | string | `"\"cn=maddy,ou=people,dc=maddy,dc=test\" \"123456\""` | Specify initial bind credentials. Not required ('bind off') if DN template is used. |
| maddy.auth.ldap.base_dn | string | `"\"ou=people,dc=maddy,dc=test\""` | Specify base_dn to lookup DN. |
| maddy.auth.ldap.connect_timeout | string | `"1m"` | Timeout for initial connection to the directory server. |
| maddy.auth.ldap.debug | string | `"off"` | Enable verbose logging. You don't need that unless you are reporting a bug. |
| maddy.auth.ldap.dn_template | string | `"\"cn={username},ou=people,dc=maddy,dc=test\""` | Specify DN template to skip lookup. |
| maddy.auth.ldap.filter | string | `"\"(&(objectClass=posixAccount)(uid={username}))\""` | Specify filter to lookup DN. |
| maddy.auth.ldap.starttls | string | `"off"` | Whether to upgrade connection to TLS using STARTTLS. |
| maddy.auth.ldap.urls | string | `"ldap://maddy.test:389"` | URLs of the directory servers to use. First available server is used - no load-balancing is done. |
| maddy.auth.type | string | `"sql"` | Where to store authorised users. Valid values are `sql` and `ldap` |
| maddy.config_files.alias | string | `"## Replace 'cat' with any domain to 'dog'.\n## E.g. cat@example.net -> dog@example.net\n# cat: dog\n\n## Replace cat@example.org with cat@example.com.\n## Takes priority over the previous line.\n#cat@example.org: cat@example.com\n"` | Alias file used in smtp_rule See [alias examples](https://maddy.email/man/_generated_maddy-filters.5/). |
| maddy.extra_settings.imap | object | `{}` | Additional settings for imap backend |
| maddy.extra_settings.local_mailboxes | object | `{}` | Additional settings for local_mailboxes storage |
| maddy.hostname | string | `"mx.example.com"` | Hostname the service will listen to (incoming SMTP and IMAP) |
| maddy.primary_domain | string | `"example.com"` | Primary domain - will be included in SMTP protocol |
| maddy.secondary_domains | string | `nil` | Space separated list of additional domains this server handles |
| maddy.smtp_rules | object | See values.yaml | The main part of the configuration - rules for the smtp pipelines. You can define multiple blocks. Content comes from the chart when setting `file` (see files/smtp_rules folder) and/or the custom block |
| maddy.sql.postgres_dsn | object | See [Go DSN](https://pkg.go.dev/github.com/lib/pq?utm_source=godoc#hdr-Connection_String_Parameters) | If type is postgres configure the Data Source Name (DSN) |
| maddy.sql.postgres_dsn.dbname | string | DB name set in embedded postgres chart | The name of the DB |
| maddy.sql.postgres_dsn.host | string | host of embedded postgres chart | The host to connect to |
| maddy.sql.postgres_dsn.password | string | user set in embedded postgres chart | The DB user password |
| maddy.sql.postgres_dsn.sslmode | string | `"disable"` | SSL model for the DB disable - No SSL require - Always SSL (skip verification) verify-ca - Always SSL (verify that the certificate presented by the             server was signed by a trusted CA) verify-full - Always SSL (verify that the certification presented by               the server was signed by a trusted CA and the server host name               matches the one in the certificate) |
| maddy.sql.postgres_dsn.user | string | user set in embedded postgres chart | The DB user |
| maddy.sql.type | string | `"sqlite3"` | DB type to use. Supported are `sqlite3` and `postgres` Database is used to store IMAP indexes and (when not using LDAP) authorized users |
| maddy.tls_secret_name | string | `"myTLSSecret"` | name of K8S secret containing the cert and key to use by maddy. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | see bellow | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `false` | Enable if you want to use the embedded postgresql chart (not neeeded if you use your own postgres DB). |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"postgres"` | Postgres database password |
| postgresql.postgresqlPassword | string | `"changeme"` | Postgres database password |
| postgresql.postgresqlUsername | string | `"postgres"` | Postgres database user name |
| service | object | See values.yaml | Configures service settings for the chart. |

----------------------------------------------
