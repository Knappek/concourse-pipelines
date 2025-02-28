# Platform Automation Reference Pipeline Configs

This repo is a fork from [docs-platform-automation-reference-pipeline-config](https://github.com/pivotal/docs-platform-automation-reference-pipeline-config)
and is an opinionated deployment of

* TAS
* TKGI
* plus some components like Healthwatch etc

## Login to Concourse

In order to easily login to Concourse, you can simply adapt [login_to_concourse](./login_to_concourse) and then execute

```shell
source ./login_to_concourse
```

## Fresh Opsman Installation

1. If you had a previous Opsman installation with this Concourse, but you have deleted the Opsman VM in vSphere, then the `foundation-state` bucket in MinIO still holds the state of the previous Opsman installation. To do a fresh installation, run

    ```shell
    fly -t ci clear-versions --resource=deploy-sandbox-foundation/state
    ```

1. Navigate to the Concourse UI (get the UI with `fly targets`) and start the `deploy-sandbox-foundation/install-opsman` job.
