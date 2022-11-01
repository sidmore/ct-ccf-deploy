FROM mcr.microsoft.com/ccf/app/dev:2.0.8-sgx

COPY entrypoint.sh actions/deploy/entrypoint.sh

ENTRYPOINT ["/actions/deploy/entrypoint.sh"]