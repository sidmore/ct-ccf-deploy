#!/bin/bash

cp $1 /opt/ccf/bin

echo "$CERTD" > /opt/ccf/bin/cert
echo "$KEYD" > /opt/ccf/bin/key

cd /opt/ccf/bin
content=$(ccf_cose_sign1 --ccf-gov-msg-type proposal --ccf-gov-msg-created_at `date -Is` --signing-key key --signing-cert cert --content set_js_app.json | curl ${CCF_URL}/gov/proposals --cacert service_cert.pem --data-binary @set_js_app.json -H "content-type: application/cose")
proposal=$(echo "${content}" | jq '.proposal_id')
echo "proposal=$proposal" >> $GITHUB_OUTPUT