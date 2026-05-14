# Financial Services skills bundle for Claude.ai

Bundles **66 unique skills** from [anthropics/financial-services](https://github.com/anthropics/financial-services) as individual `.zip` files, ready to upload one-by-one to Claude.ai.

## Build the zips

```bash
bash download-financial-services.sh
```

Generates `out/*.zip` (66 files).

## Upload to Claude.ai

Claude.ai → Settings → Capabilities → Skills → **Upload skill** → pick the `.zip`.

> **Important:** Claude.ai limits active custom skills per account (typically 8-10). You cannot keep all 66 active simultaneously. Start with the top 8 below.

## Recommended top 8 for general finance

| # | Skill | What it covers |
|---|-------|----------------|
| 1 | `xlsx-author` | Foundational Excel authoring (every model uses it) |
| 2 | `pptx-author` | Foundational PowerPoint authoring (decks, IC memos) |
| 3 | `dcf-model` | DCF valuation with WACC, sensitivity, terminal value |
| 4 | `comps-analysis` | Trading & precedent comparable companies |
| 5 | `3-statement-model` | Linked IS / BS / CF projections |
| 6 | `audit-xls` | Spreadsheet review and validation |
| 7 | `morning-note` | Equity research morning notes |
| 8 | `ic-memo` | Investment committee memos |

Swap any of these for other zips later depending on your workflow (LBO, KYC, NAV tie-out, GL recon, etc.).

## All 66 skills (by category)

### Valuation & modeling
`3-statement-model`, `dcf-model`, `lbo-model`, `merger-model`, `comps-analysis`, `audit-xls`, `clean-data-xls`, `xlsx-author`

### Equity research
`morning-note`, `earnings-analysis`, `earnings-preview`, `model-update`, `initiating-coverage`, `catalyst-calendar`, `thesis-tracker`, `sector-overview`, `competitive-analysis`, `idea-generation`

### Investment banking
`pitch-deck`, `cim-builder`, `teaser`, `process-letter`, `buyer-list`, `datapack-builder`, `deal-tracker`, `strip-profile`, `ib-check-deck`, `deck-refresh`, `ppt-template-creator`, `pptx-author`

### Private equity
`deal-sourcing`, `deal-screening`, `dd-checklist`, `dd-meeting-prep`, `ic-memo`, `value-creation-plan`, `unit-economics`, `returns-analysis`, `portfolio-monitoring`, `ai-readiness`

### Wealth management
`client-report`, `client-review`, `investment-proposal`, `financial-plan`, `portfolio-rebalance`, `tax-loss-harvesting`

### Fund admin & operations
`gl-recon`, `nav-tieout`, `accrual-schedule`, `roll-forward`, `variance-commentary`, `break-trace`, `kyc-doc-parse`, `kyc-rules`

### Partner-built (LSEG, S&P Global)
`tear-sheet`, `funding-digest`, `earnings-preview-beta`, `equity-research`, `bond-futures-basis`, `bond-relative-value`, `fixed-income-portfolio`, `fx-carry-trade`, `macro-rates-monitor`, `option-vol-analysis`, `swap-curve-strategy`

### Misc
`skill-creator`

---

## If you use Claude Code or Cowork instead

Claude.ai (chat) requires zip uploads. **Claude Code** and **Claude Cowork** install the same skills as plugins natively:

- **Claude Code:** `/plugin marketplace add anthropics/financial-services` then `/plugin install <name>`
- **Claude Cowork:** Settings → Plugins → Add plugin → paste `https://github.com/anthropics/financial-services`

No zipping needed in those products.
