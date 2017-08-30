#!/bin/bash

reference_Url="https://${MULTIDEV}-${SITENAME}.pantheonsite.io/"

jq --arg reference_Url $reference_Url --arg reference_Url_contact $reference_Url_contact '
	del(.scenarios | .? | .[0] | .referenceUrl) |
	(.scenarios[] | select(.label == "Homepage")) |= . + {"referenceUrl": $reference_Url} |
	del(.scenarios | .? | .[1] | .referenceUrl) |
	(.scenarios[] | select(.label == "Contact Us")) |= . + {"referenceUrl": $reference_Url_contact }
	' backstop.json > tmp.$$.json
	
mv tmp.$$.json backstop.json