# DAILYFLOW CAPSULE

purpose: orchestrates the daily backoffice train:
MOM → PAYBOT → ANAREP → ADPRO → LIFCO → GVCOM

outputs:
- mom/logs
- payment/invoices
- analytics/reports
- ads/campaigns
- lifecoach/notes

safety:
- ≤12s latency target
- risk separation (SAFEG) redirects risky ops
- .env controlled: POSTMARK, SHOPIFY, GIT
