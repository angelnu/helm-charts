# zalando-postgres-cluster

![Version: 4.1.1](https://img.shields.io/badge/Version-4.1.1-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Creates a postgres cluster using the Zalando Postgres operator and local storage

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/zalando-postgres-cluster>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| angelnu | <git@angelnu.com> |  |

## Source Code

* <https://github.com/zalando/postgres-operator>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 1.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dumpBackup.enabled | bool | `false` | Enable backups to a PVC |
| dumpBackup.existingClaim | string | `nil` | existing claim |
| dumpBackup.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| dumpBackup.image.repository | string | `"postgres"` | image used for the backups |
| dumpBackup.image.tag | string | `"latest"` | image pull tag |
| dumpBackup.resources.requests.cpu | string | `"5m"` | requested cpu for backup |
| dumpBackup.resources.requests.memory | string | `"10Mi"` | requested memory for backup |
| dumpBackup.schedule | string | `"@daily"` | Backup schedule for postgres dumps |
| dumpBackup.startDelay | int | `2` | Delay the start of the backup (address race condition) |
| dumpBackup.subpath | string | `nil` | Persistent volume claim subpath for the backups @default: <subpathPrefix/<release-name> |
| dumpBackup.subpathPrefix | string | `"backup/db"` | Persistent volume claim subpath prefix for the backups |
| dumpBackup.type | string | `nil` | Sets the persistence type. Valid options are pvc, emptyDir, hostPath or custom. See [common chart persistence doc](https://github.com/k8s-at-home/library-charts/blob/main/charts/stable/common/values.yaml) |
| persistentVolumes.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistentVolumes.annotations | object | `{}` |  |
| persistentVolumes.hostPath | string | `nil` | Local path for the persistent volumes @default: <hostPathPrefix/<release-name> |
| persistentVolumes.hostPathPrefix | string | `"/run/db"` | Local prefix for persistent volumes NOTE: The default is in tempfs - you should change to a persistent place for production!!! |
| persistentVolumes.labels | object | `{}` |  |
| persistentVolumes.reclaimPolicy | string | `"Retain"` | persistentVolumeReclaimPolicy for the persistent volumes Recicle will delete content once DB is deleted while Retain (default) will keep it. |
| persistentVolumes.replicaNodes | list | `["node1.example.com","node2.example.com"]` | Replica nodes Must set with at least 2 nodes for the cluster to be highly available |
| postgresql.databases | object | `{"postgres":"postgres"}` | databases to create and their user |
| postgresql.numberOfInstances | string | `nil` | Number of replicas It will be automatically set with the number of replicaNodes so any values set here are ignored. |
| postgresql.postgresql.version | string | `"13"` | Postgres version to deploy - see which versions are supported by the operator |
| postgresql.teamId | string | `nil` | team Id for the DB cluster |
| postgresql.users | object | `{"postgres":["superuser","createdb"]}` | DB users to create (see operator) |
| postgresql.volume.size | string | `"1Gi"` | Size of the persistance volume to allocate |
| postgresql.volume.storageClass | string | chart fullname | Name of the storage class |
| superuser.password | string | randomly generated on first install of the chart | Superuser password |
| superuser.secret | string | <user>.<db name>.credentials.postgresql.acid.zalan.do | Superuser k8s secret name. It must match the patter used by the operator |
| superuser.user | string | first user in postgresql.users | Superuser user used for cronjobs |

