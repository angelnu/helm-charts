# tt-rss

![Version: 6.0.0](https://img.shields.io/badge/Version-6.0.0-informational?style=flat-square) ![AppVersion: v2.0.9200](https://img.shields.io/badge/AppVersion-v2.0.9200-informational?style=flat-square)

Tiny Tiny RSS is a free and open source web-based news feed (RSS/Atom) reader and aggregator

**Homepage:** <https://github.com/angelnu/helm-charts/tree/main/charts/apps/tt-rss>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://git.tt-rss.org/fox/tt-rss>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |
| https://charts.bitnami.com/bitnami | postgresql | 15.5.21 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below. | See more environment variables in the tt-rss documentation https://git.tt-rss.org/fox/tt-rss/src/branch/master/classes/config.php#L9 |
| env.TTRSS_DB_HOST | string | internal postgresql URL | Postgres database hostname |
| env.TTRSS_DB_NAME | string | postgresql.auth.database value | Postgres database password |
| env.TTRSS_DB_PASS | string | postgresql.auth.password value | Postgres database password |
| env.TTRSS_DB_PORT | string | `"5432"` | Postgres database port. |
| env.TTRSS_DB_USER | string | postgresql.auth.username value | Postgres database user name |
| env.TTRSS_SELF_URL_PATH | string | `""` | External URL you use to connect to the RSS (the one you enter in your browser) |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"ghcr.io/angelnu/tt-rss"` | image repository |
| image.tag | string | `"2.0.9486"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| postgresql | object | see bellow | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.auth.database | string | `"tt-rss"` | Postgres database |
| postgresql.auth.password | string | `"changeme"` | Postgres database password |
| postgresql.auth.username | string | `"tt-rss"` | Postgres database user name |
| postgresql.enabled | bool | `true` | By default uses an internal postgress. Dissable if you use your own Postgres. |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| service | object | See below. | Configure the services for the chart here. |

----------------------------------------------
