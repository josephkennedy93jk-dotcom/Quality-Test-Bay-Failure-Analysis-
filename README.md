<p align="center">
  <img src="./vortek_logo.png" alt="Vortek Appliances" width="360"/>
</p>

<h1 align="center">Vortek Appliances — Quality Analytics Case Study</h1>

<p align="center">
  <em>Test-bay failure rate reduction — SQL → Python → Power BI, end-to-end.</em><br/>
  <sub>Joseph Kennedy · Quality &amp; Operations Analytics · Portfolio 2026</sub>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-MySQL%208-blue?logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Python-pandas%20·%20matplotlib-yellow?logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-DAX%20·%20Power%20Query-F2C811?logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/Method-SPC%20·%20Pareto-brightgreen"/>
  <img src="https://img.shields.io/badge/Anonymised-Yes-lightgrey"/>
</p>

---

## About this project

**Domain-first, not tool-first.** Built by a quality and operations professional using a data pipeline to solve a business problem I have lived with. The stack (SQL, Python, Power BI) is a means to an end — a defensible view of quality performance that leadership can act on.

> **Anonymisation notice.** *Vortek Appliances* is a fictional alias. All names, IDs and identifiers have been transposed from a real UK commercial-appliance manufacturer to protect commercial confidentiality. The failure modes, workflow and interventions are faithful to reality.

---

## The business problem

One in three units failing first-time test.

| Metric | Value |
|---|---|
| Test-bay failure rate | **~30%** |
| Peak monthly rework cost | **£20K** |
| Peak monthly rework hours | **350+** |
| Structured pipeline in place | **None** |

**The ask from leadership:**

- **FD** — visibility on rework cost, run rate, and impact of change
- **Ops Director** — a pipeline the team can trust, not spreadsheets and gut feel
- **Technical Director** — root-cause detail behind the failure numbers
- **MD** — evidence the intervention programme is delivering results

The ask wasn't *"build a dashboard"* — it was *"give leadership a defensible view of quality performance and prove whether interventions are working"*.

---

## Approach — SQL → Python → Power BI

Each stage had a job. The pipeline was designed, not stitched together.

| Stage | Tool | Purpose |
|---|---|---|
| 1. Foundation | **MySQL** | Load raw test data, initial exploratory queries, cleaning, column drops. Server-side, repeatable. |
| 2. Discovery | **Python** (pandas, matplotlib) | Pass/fail split, fault frequency, monthly trend, cost & hours impact, breakdowns by unit and assembler. |
| 3. Crystallisation | **Python** (Pareto + p-chart) | Which faults matter. Is the process in statistical control. Dashboard design fell out of this step. |
| 4. Delivery | **Power BI** (DAX + Power Query) | Live SQL connection, cleaning, KPI measures (Failure Rate, MTTR, COPQ, pre/post). C-suite dashboards. |

Stage 3 is the pivot — the Pareto and p-chart didn't just report findings, they defined what belonged on the dashboards.

---

## Discovery — Pareto: wiring dominates

<p align="center"><img src="./Pareto%20Chart.png" alt="Pareto of fault types with wiring combined" width="820"/></p>

**Key finding — Wiring Issues = 1,759 faults**, roughly 50% of all faults once the five wiring failure modes are consolidated. Gas Escape sits second at 420.

**So what** — attack wiring at the assembly step (feedback loop, procedure, training) and you neutralise half the problem in one intervention. The 80/20 cutoff = 10 fault categories, and half of those 10 are wiring alone.

---

## Discovery — p-chart: process is not in statistical control

<p align="center"><img src="./P%20Chart%20analysis.png" alt="Phased p-chart with 3-month control limits" width="820"/></p>

Three consecutive months **above UCL** pre-intervention. Three consecutive months **below LCL** post-intervention. This is a step-change, not noise.

| Phase | Window | Failure rate p̄ | Status |
|---|---|---|---|
| Phase 1 — pre | Oct – Dec 2025 | **32.6%** | 🔴 Above UCL |
| Phase 2 — transition | Jan – Mar 2026 | **26.7%** | 🟠 Regime change |
| Phase 3 — post | Apr – Jun 2026 | **15.0%** | 🟢 Below LCL |

Method — phased control limits recalculated every three months, with per-month σ using its own sample size but the phase p̄. Out-of-control points flagged in red.

---

## Root causes — beyond the numbers

Two mechanisms found in the plant that map to the two biggest Pareto bars.

| # | Root cause | Where | Mechanism | Maps to |
|---|---|---|---|---|
| 1 | **Training gap** | Assembly — safety-critical station | Operator transferred without full training sign-off. Skills-matrix control failed. | Gas Escape spikes |
| 2 | **Procedure drift** | Test bay — standard-work violation | Tester executing beyond the documented test procedure. Introduced variability the process wasn't designed for. | Gas Escape spikes |
| 3 | **Wiring workmanship** | Assembly — routing & connection | Five failure modes: loose, trapped, not-fitted, broken, incorrectly wired. Same underlying category. | Wiring dominance |

The data flagged the signal; the shop-floor investigation found the mechanism. **Mechanistic evidence + SPC evidence** = a defensible causal argument without a formal control group.

---

## Interventions — mapped to root causes

Every change addressed a specific mechanism. AI was the enabler, not the cause.

| Intervention | Leverage | Rationale |
|---|---|---|
| **Wiring feedback loop** | High | Test-bench findings routed daily to assembly. Attacks the #1 Pareto bar. |
| **Updated build procedures** | High | Closed the training-gap category. Sustained fix, not a meeting-decayed one. |
| **Updated test procedures** | High | Locked down standard work at the test bay. Eliminated procedure drift. |
| **Weekly quality meetings** | Medium | Cadence for issues to surface and be actioned. Without this the loop doesn't land. |
| **Weekly spot checks** | Medium | Verifies procedures are being followed. Early warning if drift returns. |
| **AI-generated reports** | Enabler | Cut reporting time so hours went to root cause, not formatting. |

---

## Delivery — Test Bay KPI dashboard

<p align="center"><img src="./power%20bi%20dashboard%20KPI.png" alt="Test Bay KPI dashboard" width="900"/></p>

Executive KPIs vs targets — the four numbers a quality manager cares about:

| KPI | Value | Target | Status |
|---|---|---|---|
| Failure Rate % | 20.80% | <10% | 🔴 |
| Avg Cost / Test | £8.67 | <£10 | 🟢 |
| MTTR (mins) | 49.02 | <30 mins | 🔴 |
| Avg COPQ / month | £12K | <£10K | 🟠 |

Trend charts underneath (failure rate, cost, fix time) confirm all three lines dropping through 2026.

## Delivery — Overall summary dashboard

<p align="center"><img src="./Overall%20Summary%20KPI%20dashboard.png" alt="Overall summary dashboard" width="900"/></p>

Cost, hours, fault mix and pass/fail — one page, six visuals, executive-ready. Green/red colour semantics for pass/fail, monthly aggregation, live via SQL Server connection.

---

## Result — the numbers moved

| | **Before** *(Oct – Dec 2025)* | **After** *(Apr – Jun 2026)* | Δ |
|---|---:|---:|---:|
| Failure rate | **32.6%** | **15.0%** | **−17.6 pp** |
| Peak monthly rework cost | £20K | £8K | **−60%** |
| SPC status | 3 months **above UCL** | 3 months **below LCL** | Step-change confirmed |

*Failure rate roughly halved. Cost roughly halved. SPC evidence supports the change is statistical, not noise, and the timing coincides with the intervention programme.*

---

## Considered and rejected — analytical honesty

Fitting the wrong model is worse than not fitting one.

| Considered | Verdict | Reason |
|---|---|---|
| Time-series forecasting (ARIMA / Prophet) | ❌ Rejected | Only 9 months of data and a deliberate step-change in Feb 2026 breaks stationarity. Any forecast would misfit either regime. |
| Row-level Pass/Fail classification | ❌ Rejected | Dominant predictor would be a pre/post-intervention flag — descriptive, not predictive. Model rediscovers what we already know. |
| NLP on Comments field | ❌ Rejected | Comments column is templated boilerplate from the fault code — NLP would re-derive `FaultDesc`. Would add real value only on genuine free-text engineer notes. |

**Inference over prediction.** The analytical value here is proving the change worked, not guessing what happens next.

---

## Next steps — scale, rigour, close the loop

1. **Star-schema migration** — `fact_test` + `fact_fault` (unpivoted) with `dim_date`, `dim_fault` (categorised), `dim_tester`, `dim_assembler`, `dim_stock`, `dim_unit_type`. Faster refresh, native fault-category slicing, time-intelligence unlocked.
2. **Row-level predictive model** — Random forest / logistic regression on Pass/Fail with UnitType, Assembler, StockCode, Month features. Per-unit risk score surfaced on the dashboard.
3. **Automated SPC monitoring** — Scheduled refresh flags a month the moment it breaches a control limit. Alerts to Ops via Teams / Slack.
4. **Intervention log integration** — Small table (or Jira / ServiceNow feed) that pins each SPC change to a documented corrective action. Closes cause-to-effect loop.
5. **Data-quality hardening** — Fix `£` encoding, lock date format to ISO-8601, add NOT NULL / FK constraints once the star schema exists.

Ordered as they'd actually be built: foundations before features.

---

## Repository contents

```
Quality analysis project/
├── README.md                              ← you are here
├── vortek_logo.png                        ← brand asset
│
├── SQL/
│   ├── TEST DATA QUERY CLEAN.sql          ← MySQL cleaning script
│   └── TEST DATA QUERY2.sql
│
├── Python/
│   ├── Quality_Data_Analysis_SQL_Clean_&_Transform.ipynb
│   ├── Exploreatory Analysis Test Data.ipynb   ← exploratory + Pareto + p-chart
│   └── P-chart & Pareto.ipynb                  ← standalone SPC notebook
│
├── Power BI/
│   └── Quality Analysis BI Dash.pbix
│
├── Data/
│   ├── Manufacture appliance test results.csv  ← raw (anonymised)
│   └── Manufacture Data Clean Final.csv        ← cleaned
│
├── Images/
│   ├── Pareto Chart.png
│   ├── P Chart analysis.png
│   ├── power bi dashboard KPI.png
│   └── Overall Summary KPI dashboard.png
│
└── Vortek_Quality_Case_Study.pptx         ← 15-slide portfolio deck
```

---

## Takeaway

Three claims a hiring manager should walk away with:

- ✅ **Pipeline** — SQL → Python → Power BI, end-to-end, repeatable, defensible.
- ✅ **Quality engineering** — Pareto, SPC, MTTR and COPQ used correctly, not as buzzwords.
- ✅ **Audience awareness** — dashboards designed for FD, Ops, Tech and MD decisions, not vanity metrics.

---

<sub>Vortek Appliances is a fictional alias for an anonymised real-world manufacturer. All figures, names and identifiers are transposed. Methodology, workflow and interventions are faithful to the original engagement.</sub>
