# Finance skills bundle for Claude.ai

Five skills focused on finance workflows, ready to upload to Claude.ai.

| Skill | What it does | Source |
|-------|--------------|--------|
| `xlsx` | Create/edit Excel files: formulas, tables, charts | anthropics/skills |
| `pdf` | Extract data from PDFs (invoices, statements), split/merge | anthropics/skills |
| `docx` | Generate Word reports with formatting and tracked changes | anthropics/skills |
| `csv-data-summarizer` | Stats and charts from CSVs | coffeefuelbump/csv-data-summarizer-claude-skill |
| `invoice-organizer` | Parse and categorize invoices | ComposioHQ/awesome-claude-skills |

## Build the 5 zips

```bash
bash download-finance-skills.sh
```

Produces `out/xlsx.zip`, `out/pdf.zip`, `out/docx.zip`, `out/csv-data-summarizer.zip`, `out/invoice-organizer.zip`.

## Upload to Claude.ai

For each `.zip`:

1. Open Claude.ai
2. Settings -> Capabilities -> Skills -> Upload skill
3. Select the `.zip`

Note: Claude.ai limits the number of active custom skills per account.
