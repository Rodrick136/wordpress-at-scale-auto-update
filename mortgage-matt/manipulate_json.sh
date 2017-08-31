#!/bin/bash


reference_Url="https://${MULTIDEV}-${SITENAME}.pantheonsite.io/"
reference_Url_contact="${reference_Url}/contact-us/"

jq --arg reference_Url $reference_Url --arg reference_Url_contact $reference_Url_contact 'del(.scenarios | .? | .[0] | .referenceUrl) |(.scenarios[] | select(.label == "Homepage")) |= . + {"referenceUrl": $reference_Url} |del(.scenarios | .? | .[1] | .referenceUrl) |(.scenarios[] | select(.label == "Contact Us")) |= . + {"referenceUrl": $reference_Url_contact }' $VARIANT_FILE/backstop.json > $VARIANT_FILE/tmp.$$.json

mv $VARIANT_FILE/tmp.$$.json $VARIANT_FILE/backstop.json
