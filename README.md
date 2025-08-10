

### 🛠 Developer Tools

- **Kafka Tools (optional)**:
  - Apache Kafka CLI (`kafka-topics`, `kafka-console-producer`, `kafka-console-consumer`)
  - `kcat` (formerly kafkacat) for quick topic produce/consume tests
  - Optional GUI (Docker): `provectuslabs/kafka-ui`


#### Kafka quickstart (local, CLI)
```sh
# Start a local Kafka (for quick tests) - prefer Docker-based stacks in projects
# Kafka via brew installs scripts, but running a full broker locally is out of scope here.
# Use Docker-based Kafka stacks (e.g., Confluent or Bitnami) in project repos.

# Verify tools:
kafka-topics --version
kcat -V
```
