---
name: cv-builder
description: "Build a targeted CV and strategic package from achievements data. Generates cv.yaml, renders PDF via RenderCV, and produces strategic-package/ with elevator pitch, interview narratives, and outreach templates. Use when asked to build my CV, create a resume, render my CV, or any request to produce a formatted CV/resume document."
---

# CV Builder

Transform `data-about-career/achievements.md` into a targeted, metrics-driven CV
rendered as a professional PDF.

## Prerequisites

- `data-about-career/achievements.md` must exist and contain career data.
  If missing or empty, tell the user to run `/achievement-discovery` first.
- RenderCV must be installed (`pip install "rendercv[full]"`)
- The `render_all.sh` script and `cv_*` theme directories must exist in the project root.

## Workflow

### Step 1: Read Achievements

Read `data-about-career/achievements.md`. Confirm it has substantive content.
If it only contains placeholder text, stop and direct the user to `/achievement-discovery`.

### Step 2: Gather Targeting Information

Ask the user to post the job description for the role they are applying for. Or if it's a generic CV ask them to say what type of roles they're thinking about:

1. **Target role** - Specific job title, or paste a job description. If general, ask for
   the type (e.g., "senior backend engineer", "engineering manager", "VP of Product").
2. **Industry/company type** - FAANG, startups, enterprise, specific company name.
3. **Page count** - How many pages should the CV be? (1 or 2. Default: 1)
4. **Theme** - Which theme to render:
   - List available `cv_*` directories in the project root
   - Or "all" to render every theme via `render_all.sh`

### Step 3: Craft the CV Content

Apply the Elite CV Transformation methodology. Read [tone-guide.md](tone-guide.md)
before writing any content.

**Label** (one-line identity under the name):

- 3-4 pipe-separated positioning phrases tailored to the target role
- Example: `Client-Facing AI Delivery | Cross-Functional Engineering Leadership | Systems Thinking`

**Summary** (2-3 sentences):

- Role identity + unique value proposition
- Biggest quantified win
- Specific expertise matching the target role

**Sections** - select and prioritize from achievements.md:

1. **What I Bring** (3 bullet entries) - Top value propositions with bold headers
2. **Experience** (most impactful roles for this target) - Each role gets:
   - company, position, location, start_date, end_date
   - highlights: metrics-driven bullets following the density rules below
3. **Education** - Degrees, honors, relevant highlights
4. **Additional sections** as needed (e.g., "Beyond Work" for leadership/community)

**Bullet density rules** - every highlight must contain:

1. A number that matters (%, time, money, users, scale)
2. Specific technology (never "database" — always "PostgreSQL with read replicas")
3. Business impact (why would a CEO care?)
4. Temporal context when impressive ("early 2023, before industry standard")

Use parentheticals for bonus context: `(first team to ship with technology X)`.
Use compound achievements: `Built X while maintaining Y and improving Z`.
Show progressive scope increase across roles.

See [before-after-example.md](before-after-example.md) for the quality bar.

### Step 4: Write cv.yaml

Write the file following the exact RenderCV schema.
See [cv-yaml-schema.md](cv-yaml-schema.md) for the structure and field reference.

The cv.yaml goes in the project root. It contains only content, not design.
Design is handled by each theme's `design.yaml`.

### Step 5: Render PDF

Run the render script:

```bash
# All themes:
bash render_all.sh

# Single theme:
cd cv_<theme> && cat ../cv.yaml design.yaml > cv.yaml && rendercv render cv.yaml
```

After rendering, confirm the PDF files exist in the `cv_*` directories.

### Step 6: Validate Page Count

Read the generated PDF to check the actual page count.

- **If pages > target**: Remove the lowest-impact bullets first. Shorten verbose
  highlights. Remove the least-relevant role if needed. Re-render and re-check.
- **If pages < target**: Expand descriptions with more detail from achievements.md.
  Add additional roles or sections. Re-render and re-check.
- **Repeat** until the page count matches the user's target.

Present the final PDF location(s) to the user.

### Step 7: Generate the Strategic Package

After the CV is finalized, generate supporting materials as markdown files in a
`strategic-package/` directory at the project root. Each file is tailored to the
same target role and draws from the same achievements used in the CV.

**Files to generate:**

1. **`strategic-package/elevator-pitch.md`** — 30-second spoken pitch.
   Structure: "I'm a [role] who [unique value]. Recently at [Company], I [quantified win].
   I'm drawn to [Target] because [specific mission alignment + what you bring]."

2. **`strategic-package/interview-opener.md`** — 2-minute "tell me about yourself" answer.
   Structure: Challenge → Action → Result → Learning, expanded from the elevator pitch.
   Include one technical deep-dive hook that invites follow-up questions.

3. **`strategic-package/deep-dive.md`** — 5-minute narrative of the candidate's strongest
   achievement. Full story with technical details, team dynamics, strategic thinking,
   and measurable outcomes. Written as speaking notes, not bullet points.

4. **`strategic-package/outreach-email.md`** — Cold email template for reaching target
   companies. Structure:
   - Subject line referencing a specific challenge the target company faces
   - Opening: specific observation about their work/team/challenge
   - Middle: directly relevant achievement with a number
   - Close: one sentence on unique perspective, request for 15-minute conversation
   - Keep under 150 words total

5. **`strategic-package/role-versions.md`** — If the user mentioned multiple target
   companies or role types, document a versioning strategy: which achievements to lead
   with, which technologies to emphasize, and which sections to expand or trim for each
   variant. Skip this file if there is only one target.

All files follow the same tone rules as the CV — see [tone-guide.md](tone-guide.md).
Write like an engineer, not a recruiter. Let evidence carry the weight.

### Step 8: Update achievements.md

If there's any concrete information to add to achievements.md please add it. Only remove existing information if explicitly asked.

## Content Guidelines

- Read [tone-guide.md](tone-guide.md) for the complete anti-cringe protocol.
  Summary: write like an engineering RFC, not a LinkedIn post. Let numbers generate
  excitement. Avoid superlatives, emojis, and hype language.
- Read [before-after-example.md](before-after-example.md) to calibrate quality.
  Every bullet should look like the "after" example, never the "before".
- Tailor content to the target role. A backend engineer CV emphasizes different
  achievements than a product manager CV, even from the same achievements.md.
