# Gnosis Bridge Helm chart

This is a helm chart to install Gnosis Bridge validator

## Developing

There are common actions wrapped in the `just` tool:
- `just template`: Prints the parsed templates for the chart
- `just package`: Packages the helm chart in a tar.gz file
- `just login`: Connects to the helm chart registry required to publish new versions
- `just push`: Publishes a new version into the helm chart registry
- `just lint`: Lint the helm chart
- `just docs`: Updates the docs for the helm-chart


## Parameters

### Common parameters

| Name                         | Description                                                                                                            | Value  |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------ |
| `nameOverride`               | String to partially override common.names.fullname                                                                     | `""`   |
| `fullnameOverride`           | String to fully override common.names.fullname                                                                         | `""`   |
| `serviceAccount.create`      | Boolean to specify whether a service account should be created                                                         | `true` |
| `serviceAccount.automount`   | Boolean to specify whether to automatically mount a ServiceAccount's API credentials                                   | `true` |
| `serviceAccount.annotations` | Object to add annotations to the service account                                                                       | `{}`   |
| `serviceAccount.name`        | The name of the service account to use. If not set and create is true, a name is generated using the fullname template | `""`   |

### AMB Parameters

| Name                              | Description                                                           | Value                            |
| --------------------------------- | --------------------------------------------------------------------- | -------------------------------- |
| `amb.image.repository`            | The AMB image repository                                              | `gnosischain/tokenbridge-oracle` |
| `amb.image.pullPolicy`            | The AMB image pull policy                                             | `Always`                         |
| `amb.image.tag`                   | The AMB image tag                                                     | `""`                             |
| `amb.oracleValidator.address`     | The AMB oracle validator address                                      | `""`                             |
| `amb.oracleValidator.privateKey`  | The AMB oracle validator private key                                  | `""`                             |
| `amb.resources.bridgeRequest`     | Resource requests and limits for the AMB bridge request container     | `{}`                             |
| `amb.resources.bridgeAffirmation` | Resource requests and limits for the AMB bridge affirmation container | `{}`                             |
| `amb.resources.senderHome`        | Resource requests and limits for the AMB sender home container        | `{}`                             |
| `amb.resources.senderForeign`     | Resource requests and limits for the AMB sender foreign container     | `{}`                             |
| `amb.resources.shutdown`          | Resource requests and limits for the AMB shutdown container           | `{}`                             |
| `amb.envVars`                     | Environment variables to set in the ConfigMap for AMB                 | `{}`                             |
| `amb.secretEnvVars`               | Environment variables to set in the Secret for AMB                    | `{}`                             |

### XDAI Parameters

| Name                               | Description                                                            | Value                            |
| ---------------------------------- | ---------------------------------------------------------------------- | -------------------------------- |
| `xdai.image.repository`            | The XDAI image repository                                              | `gnosischain/tokenbridge-oracle` |
| `xdai.image.pullPolicy`            | The XDAI image pull policy                                             | `Always`                         |
| `xdai.image.tag`                   | The XDAI image tag                                                     | `""`                             |
| `xdai.oracleValidator.address`     | The XDAI oracle validator address                                      | `""`                             |
| `xdai.oracleValidator.privateKey`  | The XDAI oracle validator private key                                  | `""`                             |
| `xdai.resources.bridgeRequest`     | Resource requests and limits for the XDAI bridge request container     | `{}`                             |
| `xdai.resources.bridgeAffirmation` | Resource requests and limits for the XDAI bridge affirmation container | `{}`                             |
| `xdai.resources.senderHome`        | Resource requests and limits for the XDAI sender home container        | `{}`                             |
| `xdai.resources.senderForeign`     | Resource requests and limits for the XDAI sender foreign container     | `{}`                             |
| `xdai.resources.shutdown`          | Resource requests and limits for the XDAI shutdown container           | `{}`                             |
| `xdai.envVars`                     | Environment variables to set in the ConfigMap for XDAI                 | `{}`                             |
| `xdai.secretEnvVars`               | Environment variables to set in the Secret for XDAI                    | `{}`                             |

### External components

| Name                   | Description                                         | Value |
| ---------------------- | --------------------------------------------------- | ----- |
| `rabbitmq.namespace`   | The RabbitMQ namespace                              | `""`  |
| `rabbitmq.clusterName` | The RabbitMQ cluster name                           | `""`  |
| `rabbitmq.username`    | The RabbitMQ username                               | `""`  |
| `rabbitmq.password`    | The RabbitMQ password                               | `""`  |
| `redis.resources`      | Resource requests and limits for the Redis instance | `{}`  |

### Config parameters

| Name                          | Description                                   | Value |
| ----------------------------- | --------------------------------------------- | ----- |
| `config.homeRpcUrl`           | The Gnosis RPC provider URL                   | `""`  |
| `config.foreignRpcUrl`        | The Ethereum RPC provider URL                 | `""`  |
| `config.foreignArchiveRpcUrl` | The Ethereum archive RPC provider URL         | `""`  |
| `config.envVars`              | Environment variables to set in the ConfigMap | `{}`  |
| `config.secretEnvVars`        | Environment variables to set in the Secret    | `{}`  |
