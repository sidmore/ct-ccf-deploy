FROM mcr.microsoft.com/ccf/app/dev:4.0.1-sgx

RUN python3.8 -m pip install pip

# Install CCF Python package to procure cose_signing
pip install ccf==4.*

COPY entrypoint.sh actions/deploy/entrypoint.sh

ENTRYPOINT ["/actions/deploy/entrypoint.sh"]