# RenderCV YAML Schema Reference

The `cv.yaml` file in the project root contains only CV content. Design/styling is
handled separately by each theme's `design.yaml`.

## Structure

```yaml
cv:
  name: "Full Name"
  label: "Positioning Phrase 1 | Phrase 2 | Phrase 3"
  summary: "2-3 sentence executive summary in quotes"
  location: "City, State/Country"
  email: user@example.com
  phone: "+1 555 123 4567"
  social_networks:
    - network: LinkedIn
      username: handle-without-url

  sections:
    # Bullet section (key-value list of bullets)
    What I Bring:
      - bullet: "**Bold Header:** Description with metrics and specifics."
      - bullet: "**Bold Header:** Another value proposition."

    # Experience section
    Experience:
      - company: Company Name
        position: Role Title
        location: City, Country
        start_date: 2023-07 # YYYY-MM format
        end_date: present # or YYYY-MM
        highlights:
          - "**Bold category:** Achievement with numbers, tech, and impact."
          - "Another achievement bullet."

    # Education section
    Education:
      - institution: University Name
        area: "Field (with honors note)"
        degree: MEng # or BSc, PhD, etc.
        start_date: 2011
        end_date: 2016
        highlights:
          - "Honors, awards, study abroad, relevant details."

    # Additional bullet sections (optional)
    Beyond Work:
      - bullet: "**Bold Header:** Achievement or activity."
```

## Key Rules

- **Dates**: Use `YYYY-MM` (e.g., `2023-07`) or `YYYY` for education. Use `present` for current roles.
- **Markdown**: `**bold**` is supported in strings. Other markdown is not rendered.
- **Quotes**: Wrap strings containing colons, special characters, or markdown in double quotes.
- **Section names**: Any string works as a section key. Common: `Experience`, `Education`, `What I Bring`, `Beyond Work`, `Technical Skills`.
- **Entry types**: The section content format determines the entry type:
  - Objects with `company`/`position` → experience entries
  - Objects with `institution`/`degree` → education entries
  - Objects with `bullet` key → bullet entries (for value propositions, community, etc.)
- **No design in cv.yaml**: Colors, fonts, margins, and layout are in each theme's `design.yaml`.
- **Phone**: Wrap in quotes if it starts with `+`.

## Available Themes

Each `cv_*` directory in the project root contains a `design.yaml` and a template folder:

| Directory     | Style                                 |
| ------------- | ------------------------------------- |
| cv_classic    | Blue accents, partial line dividers   |
| cv_moderncv   | Slate accents, moderncv-style headers |
| cv_engclassic | Teal accents, full line dividers      |
| cv_engresumes | Maroon accents, no line dividers      |
| cv_sb2nov     | Black text, full dividers, minimal    |
