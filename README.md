<p align="center">
  <img src="Python%20Files/vortek_logo.png" alt="Vortek Appliances" width="400">
</p>

<h1 align="center">Vortek Appliances — Quality Analytics Case Study</h1>

<p align="center">
  <em>Test-bay failure rate reduction across a UK commercial-appliance production line.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-MySQL-4479A1?style=flat-square"/>
  <img src="https://img.shields.io/badge/Python-pandas%20·%20matplotlib-3776AB?style=flat-square"/>
  <img src="https://img.shields.io/badge/BI-Power%20BI-F2C811?style=flat-square"/>
  <img src="https://img.shields.io/badge/Measures-DAX-000000?style=flat-square"/>
  <img src="https://img.shields.io/badge/Method-SPC%20·%20Pareto-6C4CB4?style=flat-square"/>
  <img src="https://img.shields.io/badge/Anonymised-Yes-lightgrey?style=flat-square"/>
</p>

---

## 1. About This Project

Vortek Appliances is a UK commercial-appliance manufacturer working from a rebranded real-world test dataset (all identifiers have been anonymised; the failure modes, workflow and interventions are faithful to the original engagement).

Please read this summary case study for the project: [Vortek Quality Case Study](Project%20Slide%20Deck%20%26%20BI%20Dash/Vortek_Quality_Case_Study.pdf)

When the engagement began, Vortek had test-bay records only — no analytics layer, no dashboards, no derived metrics, and no view of quality performance beyond spreadsheet exports and shop-floor recall. This project delivered the analytics stack end-to-end:

- Cleaned and modelled a MySQL layer from the raw test-bay extract
- Designed and built two Power BI executive dashboards, including all DAX measures used to derive Failure Rate, MTTR, COPQ and cost per test
- Applied Pareto analysis and statistical process control (p-chart) to isolate what mattered and prove the intervention worked
- Mapped every finding on the chart to a mechanism found on the shop floor
- Produced a three-tier intervention programme now sustaining the improvement

> **Anonymisation notice.** *Vortek Appliances* is a fictional alias. All names, IDs and identifiers have been transposed from the real client to protect commercial confidentiality.

---

## 2. The Business Question

One in three units was failing first-time test. Rework was consuming £20K and 350+ hours in peak months. There was no structured pipeline behind the numbers — reporting was spreadsheets and gut feel.

The analytics stack was commissioned to answer four questions:

- **What's actually failing?** — which fault categories are driving the failure rate, not the anecdotal top-of-mind ones.
- **Is the process in control?** — is the failure rate stable, drifting, or genuinely out of statistical control.
- **Did the intervention work?** — a defensible before/after view that leadership can act on, not a gut-feel narrative.
- **How do we sustain it?** — a monitoring and escalation playbook that keeps the improvement in place after the project ends.

Everything that follows is organised around answering those four questions in order.

---

## 3. Executive Summary

Vortek's test-bay failure rate has roughly halved through a targeted intervention programme built on evidence from the analytics stack. The change is statistically supported (three consecutive months below the lower control limit post-intervention) and financially material (peak monthly rework cost down ~60%).

The stack built for this engagement makes the quality problem visible, measurable and defensible — from the KPIs on the executive dashboard down to the mechanism behind every major fault category.

| Metric | Value |
|---|---|
| Pre-intervention failure rate | 32.6% |
| Post-intervention failure rate | 15.0% |
| Failure rate reduction | −17.6 pp |
| Peak monthly rework cost (pre → post) | £20K → £8K (−60%) |
| SPC status (post) | 3 consecutive months below LCL |

---

## 4. Key Findings

The analysis surfaced five findings that reframed how the quality problem should be approached.

- **Wiring dominates the fault mix.** Consolidating the five wiring failure modes revealed ~50% of all faults trace back to a single assembly step. One category, one intervention point.
- **The process was genuinely out of control, not just noisy.** Three consecutive months above the upper control limit pre-intervention confirmed the failure rate was a signal, not variation — justifying a structured response rather than a monthly grumble.
- **Gas Escape spikes traced to a training-gap mechanism.** The data flagged the spikes; a shop-floor investigation found an operator transferred to a safety-critical station without full training sign-off. Skills-matrix control had quietly failed.
- **Procedure drift at the test bay was inflating the failure rate independently.** Testers had begun executing beyond the documented procedure, introducing variability the process wasn't designed to absorb.
- **The step-change is statistically defensible.** Three months above UCL pre, three months below LCL post — coinciding with the intervention window. Inference over prediction: the change worked, and it wasn't luck.

---

## 5. Recommendations to Vortek Senior Leadership

The following recommendations are drawn from the findings above and are intended as strategic areas to sustain and extend the improvement rather than prescriptive targets.

### 1. Protect the wiring assembly step as the highest-leverage control point
Wiring alone accounts for around half of all faults once its five failure modes are consolidated. Any drift here undoes the biggest single gain of the programme. The daily feedback loop from test bench to assembly should be treated as a permanent control, not a project artefact.

### 2. Formalise the skills-matrix control across all safety-critical stations
The Gas Escape spike traced to a single training-gap breach. That control failure is a template for future risk. A locked-down sign-off requirement for safety-critical stations — audited monthly — would close the category off structurally.

### 3. Treat standard work at the test bay as a maintained document, not a one-off
The procedure drift finding shows that written standard work decays if it isn't actively verified. Weekly spot checks and a quarterly refresh cadence, owned by the Technical Director, would prevent the drift returning.

### 4. Keep SPC in the room, not in the appendix
The p-chart is what made the improvement defensible. Ongoing monthly SPC reporting to the leadership team — with clear escalation thresholds when a point breaches a control limit — would turn a project deliverable into a governance rhythm.

### 5. Close the loop between intervention and outcome
Every future corrective action should be logged against the SPC record so that cause-and-effect can be assessed in the same way this programme was. Without the log, the next improvement claim will be as ambiguous as the original problem statement was.

### 6. Move from batch reporting to a live quality feed
The Power BI dashboards are currently refreshed on a schedule. A live SQL connection with automated alerts on failure-rate breaches would shift the operating model from monthly review to same-week response.

### 7. Prioritise the star-schema migration as the next infrastructure investment
The current flat-table model works for the questions asked today. Native fault-category slicing, faster refresh and time-intelligence measures require the star schema — and unlock the next generation of analysis (per-unit risk scoring, tester-level performance, tenure effects).

### Areas to explore further
Three areas warrant deeper investigation: the drivers behind wiring workmanship variability by shift or assembler, the interaction between unit type and failure mode, and the feasibility of a row-level predictive score once enough post-intervention data is available. Each has the potential to unlock further gains beyond the actions listed above.

---

## 6. Data Foundation

The analysis draws on the full test-bay record from the plant — one row per test, covering unit type, assembler, tester, stock code, fault codes, fault descriptions, cost, and repair time — reconciled into a single analytical layer.

**Scope**
- 9 months of test-bay records spanning the pre- and post-intervention periods
- Fields include pass/fail outcome, up to five fault codes per test, assembler and tester IDs, stock code, and per-test cost and repair time
- Failure defined operationally from the pass/fail flag — no reliance on a pre-existing quality label
- Data extracted directly from the plant's MySQL server

**Data quality treatment**
- De-duplication of repeated test records
- Standardisation of categorical values (case, whitespace, spelling variants across fault descriptions)
- Consolidation of the five wiring failure modes into a single analysable category
- `£` symbol encoding fix on monetary columns
- Date parsing to ISO-8601
- All transformations logged and reproducible

Raw source data: [Manufacture appliance test results.csv](Raw%20CSV%20Data/Manufacture%20appliance%20test%20results.csv)

---

## 7. Data Architecture

The current warehouse is a cleaned flat table in MySQL, extracted directly from the plant's operational database. This structure supports the current BI dashboards and Python analysis from a single trusted source. A star-schema migration is on the roadmap (see Section 15).

<p align="center">
  <img src="SQL%20Files/MySQL%20server.png" alt="MySQL server layout" width="700">
</p>

| Layer | Tables |
|---|---|
| **Current** | `test_results` (flat, cleaned) |
| **Planned** | `fact_test`, `fact_fault`, `dim_date`, `dim_fault`, `dim_tester`, `dim_assembler`, `dim_stock`, `dim_unit_type` |

---

## 8. SQL Layer

The SQL layer handles cleaning, transformation and view creation for downstream consumers (Power BI and the Python notebooks).

| File | Purpose |
|---|---|
| [TEST DATA QUERY CLEAN.sql](SQL%20Files/TEST%20DATA%20QUERY%20CLEAN.sql) | Cleans the raw extract — de-duplicates, standardises casing, fixes `£` encoding, consolidates wiring fault modes, parses dates. |
| [TEST DATA QUERY2.sql](SQL%20Files/TEST%20DATA%20QUERY2.sql) | Exploratory queries and column drops used to shape the analytical view feeding Python and Power BI. |

---

## 9. Power BI Dashboard

Vortek had no BI capability prior to this engagement. Two dashboards were built from the cleaned MySQL layer up in Power BI Desktop, with a full set of DAX measures written to derive the quality KPIs leadership needed.

**Dashboard pages**
- Test-bay KPI dashboard — Failure Rate, MTTR, COPQ, avg cost per test, all vs target
- Overall summary — cost, hours, fault mix, pass/fail, monthly aggregation, live SQL feed
- Trend charts underneath every KPI confirming direction of travel through 2026

  ![Test Bay KPI Dashboard](Project%20Images/power%20bi%20dashboard%20KPI.png)

  ![Overall Summary Dashboard](Project%20Images/Overall%20Summary%20KPI%20dashboard.png)

**Key DAX measures**

```dax
-- Failure Rate (%)
Failure Rate =
DIVIDE (
    CALCULATE ( COUNTROWS ( test_results ), test_results[Result] = "Fail" ),
    COUNTROWS ( test_results )
)
```

```dax
-- Mean Time To Repair
MTTR (mins) =
AVERAGEX (
    FILTER ( test_results, test_results[Result] = "Fail" ),
    test_results[RepairTimeMins]
)
```

```dax
-- Cost of Poor Quality (monthly)
COPQ per Month =
CALCULATE (
    SUM ( test_results[RepairCost] ),
    test_results[Result] = "Fail"
)
```

```dax
-- Average Cost per Test
Avg Cost per Test =
DIVIDE (
    SUM ( test_results[RepairCost] ),
    COUNTROWS ( test_results )
)
```

```dax
-- Pre / Post Intervention Failure Rate
Failure Rate (Post) =
CALCULATE (
    [Failure Rate],
    test_results[Phase] = "Post"
)
```

Deliverable: [Quality Analysis BI Dash](Project%20Slide%20Deck%20%26%20BI%20Dash/Quality%20Analysis%20BI%20Dash.pdf)

---

## 10. Python Analysis Workflow & Findings

The Python layer moves from cleaned MySQL view through exploratory analysis, fault-frequency Pareto, and phased statistical process control. Two techniques carry the analytical weight — Pareto to isolate what mattered, and a phased p-chart to prove the change was statistical rather than noise.

**Pipeline**
1. Pull cleaned test-results table from the MySQL warehouse
2. Exploratory analysis — pass/fail split, monthly trend, fault frequency, breakdowns by unit type and assembler
3. Pareto analysis across consolidated fault categories
4. Phased p-chart with 3-month control limits, per-month σ, out-of-control point flagging
5. Root-cause mapping — every dominant Pareto bar traced to a mechanism on the shop floor

**Pareto — wiring dominates**

<p align="center">
  <img src="Python%20Files/Pareto%20Chart.png" alt="Pareto of fault types with wiring combined" width="820"/>
</p>

Wiring Issues = 1,759 faults, roughly 50% of all faults once the five wiring failure modes are consolidated. Gas Escape sits second at 420. The 80/20 cutoff falls at 10 fault categories — half of those 10 are wiring alone. Attack wiring at the assembly step and you neutralise half the problem in one intervention.

**p-chart — the process was not in statistical control**

<p align="center">
  <img src="Python%20Files/P%20Chart%20analysis.png" alt="Phased p-chart with 3-month control limits" width="820"/>
</p>

| Phase | Window | Failure rate p̄ | Status |
|---|---|---|---|
| Phase 1 — pre | Oct – Dec 2025 | **32.6%** | Above UCL |
| Phase 2 — transition | Jan – Mar 2026 | **26.7%** | Regime change |
| Phase 3 — post | Apr – Jun 2026 | **15.0%** | Below LCL |

Three consecutive months above UCL pre-intervention, three consecutive months below LCL post-intervention — a defensible statistical step-change.

Notebooks:
- [Exploratory Analysis Test Data.ipynb](Python%20Files/Exploreatory%20Analysis%20Test%20Data.ipynb)
- [P-chart & Pareto.ipynb](Python%20Files/P-chart%20%26%20Pareto.ipynb)

---

## 11. Root-Cause Diagnosis

Every dominant signal on the chart was traced to a mechanism found on the shop floor. The data flagged the signal; the plant investigation found the cause. **Mechanistic evidence + SPC evidence** = a defensible causal argument without needing a formal control group.

| # | Root cause | Location | Mechanism | Maps to |
|---|---|---|---|---|
| 1 | **Training gap** | Assembly — safety-critical station | Operator transferred without full training sign-off. Skills-matrix control failed. | Gas Escape spikes |
| 2 | **Procedure drift** | Test bay — standard-work violation | Tester executing beyond documented test procedure. Introduced variability the process wasn't designed for. | Gas Escape spikes |
| 3 | **Wiring workmanship** | Assembly — routing & connection | Five failure modes: loose, trapped, not-fitted, broken, incorrectly wired. Same underlying category. | Wiring dominance |

---

## 12. Intervention Programme

Every change addressed a specific mechanism identified above. AI was the enabler, not the cause.

| Intervention | Leverage | Rationale |
|---|---|---|
| **Wiring feedback loop** | High | Test-bench findings routed daily to assembly. Attacks the #1 Pareto bar. |
| **Updated build procedures** | High | Closed the training-gap category. Sustained fix, not a meeting-decayed one. |
| **Updated test procedures** | High | Locked down standard work at the test bay. Eliminated procedure drift. |
| **Weekly quality meetings** | Medium | Cadence for issues to surface and be actioned. Without this the loop doesn't land. |
| **Weekly spot checks** | Medium | Verifies procedures are being followed. Early warning if drift returns. |
| **AI-generated reports** | Enabler | Cut reporting time so hours went to root cause, not formatting. |

**Result — the numbers moved**

| | **Before** *(Oct – Dec 2025)* | **After** *(Apr – Jun 2026)* | Δ |
|---|---:|---:|---:|
| Failure rate | **32.6%** | **15.0%** | **−17.6 pp** |
| Peak monthly rework cost | £20K | £8K | **−60%** |
| SPC status | 3 months **above UCL** | 3 months **below LCL** | Step-change confirmed |

---

## 13. Recommended Ongoing Playbook

| Tier | Focus | Treatment | Expected effect |
|---|---|---|---|
| **Daily** | Wiring assembly step | Test-bench feedback loop · shift huddle · immediate rework log | Protect the highest-leverage control point and prevent drift on the #1 fault category |
| **Weekly** | Standard-work discipline | Spot checks on test procedure adherence · quality meeting cadence · action-log review | Catch procedure drift early; keep interventions embedded rather than decaying |
| **Monthly** | Governance | SPC review at leadership meeting · escalation triggered by any point breaching UCL · corrective-action log against SPC record | Convert the project deliverable into a permanent governance rhythm |

---

## 14. Considered and Rejected — Analytical Honesty

Fitting the wrong model is worse than not fitting one.

| Considered | Verdict | Reason |
|---|---|---|
| Time-series forecasting (ARIMA / Prophet) | Rejected | Only 9 months of data and a deliberate step-change in Feb 2026 breaks stationarity. Any forecast would misfit either regime. |
| Row-level Pass/Fail classification | Rejected | Dominant predictor would be a pre/post-intervention flag — descriptive, not predictive. Model rediscovers what we already know. |
| NLP on Comments field | Rejected | Comments column is templated boilerplate from the fault code — NLP would re-derive `FaultDesc`. Would add real value only on genuine free-text engineer notes. |

**Inference over prediction.** The analytical value here is proving the change worked, not guessing what happens next.

---

## 15. Deliverables

The tangible outputs of the engagement, each linked below:

| Deliverable | File |
|---|---|
| Executive slide deck | [Vortek_Quality_Case_Study.pdf](Project%20Slide%20Deck%20%26%20BI%20Dash/Vortek_Quality_Case_Study.pdf) |
| Power BI dashboard export | [Quality Analysis BI Dash.pdf](Project%20Slide%20Deck%20%26%20BI%20Dash/Quality%20Analysis%20BI%20Dash.pdf) |
| Exploratory & fault-frequency notebook | [Exploratory Analysis Test Data.ipynb](Python%20Files/Exploreatory%20Analysis%20Test%20Data.ipynb) |
| SPC & Pareto notebook | [P-chart & Pareto.ipynb](Python%20Files/P-chart%20%26%20Pareto.ipynb) |
| Cleaned raw data | [Manufacture appliance test results.csv](Raw%20CSV%20Data/Manufacture%20appliance%20test%20results.csv) |
| SQL cleaning & transform | [SQL Files](SQL%20Files) |

---

## 16. What I'd Do Next

Given more time or a follow-up engagement, five extensions would materially strengthen the stack:

- **Star-schema migration** — `fact_test` + `fact_fault` (unpivoted) with `dim_date`, `dim_fault` (categorised), `dim_tester`, `dim_assembler`, `dim_stock`, `dim_unit_type`. Faster refresh, native fault-category slicing, time-intelligence unlocked.
- **Row-level predictive model** — random forest / logistic regression on Pass/Fail with UnitType, Assembler, StockCode, Month features. Per-unit risk score surfaced on the dashboard.
- **Automated SPC monitoring** — scheduled refresh flags a month the moment it breaches a control limit. Alerts to Ops via Teams / Slack.
- **Intervention log integration** — small table (or Jira / ServiceNow feed) that pins each SPC change to a documented corrective action. Closes cause-to-effect loop.
- **Data-quality hardening** — lock date format to ISO-8601, add NOT NULL / FK constraints once the star schema exists, formalise the `£` encoding fix at ingest.

Ordered as they'd actually be built: foundations before features.

---

## 17. Author

**Joseph Kennedy** — Data Analyst

End-to-end delivery: data engineering, MySQL cleaning and transformation, BI dashboarding (Power BI / DAX), statistical process control (Pareto, p-chart), root-cause investigation and stakeholder communication.

<sub>Underlying dataset has been anonymised from a real UK commercial-appliance manufacturer's test-bay records. The failure modes, workflow and interventions are faithful to the original engagement.</sub>
