FROM debian:13

RUN apt-get update && apt-get install -y git curl build-essential xz-utils libatomic1 python3 python3-pip python3-venv && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

ENTRYPOINT ["hermes", "--tui"]
EXPOSE 9119
VOLUME ["/root/.hermes"]