# Before & After: CV Transformation Quality Bar

This example demonstrates the expected quality level. Every CV produced should
match the "after" standard.

## Before (Generic, No Metrics, Vague)

```
Jonathan Pollack
Senior frontend developer

Summary:
I'm interested in building software solutions to address process/social problems;
especially through developing tools that make peoples' jobs/lives easier or more efficient.

Experience:

bp
Senior Frontend Developer
September 2021 - Present (3 years 3 months)

Helped build an internal tool for DevOps and SRE teammates to better share tools
and knowledge. It evolved from a Create React App with Django backend, to a self
hosted Next.js application querying many microservices via graphQL.

We were able to leverage Next's server side pre-generation, and incremental
regeneration to get page load times down to less than 500 ms.

Delivery Hero SE
Senior Software Engineer
July 2015 - March 2017

Was a member of the front-end team that: built new features, implemented the
redesign, and maintained the website Lieferheld.de (technologies: node.js /
isomorphic-javascript, gulp, sass)

Helped manage as well as participate in the development of the complete rebuild
of the website Pizza.de (technologies: node.js, react, redux, redux-sagas,
webpack, sass, kubernetes, and TeamCity)

Zalando SE
Software Engineer
June 2014 - December 2014

Helped modernize the customer support page and maintain the checkout & shopping
cart pages on the website Zalando.de (technologies: javascript, require.js,
thoughts & prayers)
```

### Problems:
- "Helped build" — vague ownership level
- No user counts, no scale metrics
- No business impact (revenue, cost savings)
- Generic technologies without depth indicators
- No quantified improvements
- Summary is about interests, not demonstrated value

---

## After (Metrics-Driven, Specific, Impact-Focused)

```
Jonathan Pollack
jonathan@gnobel.com | +1 415 470 2938 | New York, NY

Executive summary: Business-minded full-stack engineer who ships at scale and builds
teams with exceptional culture. Saved BP $65M annually building their first enterprise
RAG platform (5K users, early OpenAI/Microsoft partnership). Core engineer during
Delivery Hero's unicorn scaling (to 10M+ users, 300M+ orders, €5B IPO). Expert in
AI-assisted workflows that accelerate delivery without creating technical debt.

Senior Developer → Lead Platform Engineer | BP | 2021-2025
Led 6-engineer team building AI developer productivity platform for 5,000+ engineers
globally ($65M annual impact)

- Enterprise RAG at Fortune 50 scale: Pioneered BP's Azure OpenAI integration through
  direct Microsoft partnership (Fall 2023). Built production RAG with ChromaDB embeddings
  processing 2,000 queries/day across 100GB knowledge base, achieving 1.3s p99 latency

- 240x deployment acceleration: Migrated to Bazel-based monorepo with incremental builds,
  reducing CI/CD from 4 hours to sub-minute. Saved 200+ developer hours weekly, $2M
  annually in compute costs

- 93% latency reduction: Optimized frontend from 7s → 500ms through Next.js migration
  with ISR, federated GraphQL orchestrating 5 microservices, intelligent Redis caching
  serving 5,000 DAU

Senior Software Engineer | Delivery Hero SE | 2014-2018
Core engineer during unicorn scaling: 10M+ users, 300M+ orders/year, €5B IPO → €8B merger

- Platform rebuild at scale: Architected complete migration from jQuery monolith to
  React/Redux serving 10M+ monthly users. Maintained 99.99% uptime, zero P0 incidents
  during 100K+ concurrent Friday night peaks

- Germany's first fuzzy address search: 25% conversion increase. Innovation copied by
  all competitors within 12 months, became industry standard
```

### What changed:
- **Ownership is clear**: "Led 6-engineer team", "Architected complete migration" vs "helped build"
- **Every bullet has a number**: $65M, 5K users, 93%, 240x, 99.99%
- **Specific technologies with context**: "ChromaDB embeddings processing 2,000 queries/day" not "used a database"
- **Business impact is explicit**: "$2M annually in compute costs", "25% conversion increase"
- **Temporal signals show foresight**: "Fall 2023", "pre-Next.js era"
- **Scale is front and center**: "10M+ users", "100K+ concurrent", "Fortune 50"
- **Summary sells with evidence**: quantified wins, not vague interests

## Rules Demonstrated

1. Replace "helped with X" → "Led/Architected/Built X serving Y users"
2. Replace "improved performance" → "Reduced latency from Xms to Yms (Z% improvement)"
3. Replace technology lists → "Technology achieving specific metric"
4. Add business context → "(first enterprise deployment)", "($XM annual impact)"
5. Show career trajectory → each role demonstrates growing scope and ownership
