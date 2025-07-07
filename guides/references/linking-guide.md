# Internal Linking Guide
*How to create reliable, maintainable internal links in Thunder's training guide.*

---

## Page Links
- Use Jekyll's `relative_url` filter for all internal page links:
  - `[Week 8 Training]({{ "/week-8/" | relative_url }})`
  - `[Crate Training Guide]({{ "/crate-training/" | relative_url }})`
- **Why:** Reliable, consistent, GitHub Pages compatible.

---

## Header Links
- Headers get IDs based on text (remove emojis/special chars for anchors).
- Link to headers: `[Section Title]({{ "/page/" | relative_url }}#header-id)`
- Same-page: `[Jump to Section](#header-id)`

---

## Table of Contents (TOC)
- Add `{% include toc.html %}` to long pages for navigation.
- Use for weekly guides, long references, or multi-section pages.

---

## Link Validation
- Automatic: Build log will show warnings.
- Manual: Run `./tools/check_links.sh`.
- Common fixes:
  - Add leading slash: `[Week 8]({{ "/week-8/" | relative_url }})`
  - Use correct permalinks.
  - Remove emojis/special chars from header anchors.

---

## Best Practices
- Always use `relative_url`.
- Check permalinks in front matter.
- Test header links (remove emojis for anchors).
- Use meaningful link text.

---

## Quick Reference Templates
- Page: `[Link Text]({{ "/page-permalink/" | relative_url }})`
- Header: `[Link Text]({{ "/page-permalink/" | relative_url }}#header-id)`
- Same-page: `[Link Text](#header-id)`
- TOC: `{% include toc.html %}`

---

## Quick Reference Links
- [Weekly Guides]({{ "/week-7/" | relative_url }})
- [Training Games Reference]({{ "/training-games/" | relative_url }})

---

**Pro Tip**: When in doubt, use the Jekyll `relative_url` filter. It's the most reliable way to ensure your links work everywhere! 🎯 