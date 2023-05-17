FROM mcr.microsoft.com/ccf/app/dev:4.0.1-sgx

RUN apt update && \
    apt install -y \
    python3.8

RUN python3.8 -m pip install pip

# Install CCF Python package to procure cose_signing
pip install ccf

COPY entrypoint.sh actions/deploy/entrypoint.sh

ENTRYPOINT ["/actions/deploy/entrypoint.sh"]