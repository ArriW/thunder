---
layout: page
title: "Internal Linking Guide"
description: "How to create reliable internal links in Thunder's training guide"
permalink: /linking-guide/
---

# 🔗 Internal Linking Guide

This guide shows you how to create reliable internal links between pages and sections in Thunder's training guide.

## 📄 Linking to Pages

### Basic Page Links
Use Jekyll's `relative_url` filter for all internal page links:

```markdown
[Week 8 Training]({{ "/week-8/" | relative_url }})
[Crate Training Guide]({{ "/crate-training/" | relative_url }})
```

### Why This Works
- **Reliable**: Won't break if the site moves to a different URL
- **Consistent**: Works in all Jekyll environments
- **GitHub Pages Compatible**: No special configuration needed

## 🎯 Linking to Headers Within Pages

### How Header IDs Are Generated
Headers automatically get IDs based on their text content:

```markdown
## 🎯 Week Overview        → #week-overview
### Morning Routine        → #morning-routine
#### Potty Training Steps  → #potty-training-steps
```

### Linking to Headers
Combine page links with header anchors:

```markdown
[Week 8 Morning Routine]({{ "/week-8/" | relative_url }}#morning-routine)
[Training Games Overview]({{ "/training-games/" | relative_url }}#susan-garretts-5-core-games)
```

### Same-Page Header Links
For links within the same page:

```markdown
[Jump to Success Metrics](#success-metrics)
[See Problem Prevention](#problem-prevention)
```

## 📋 Table of Contents

### Adding TOC to Long Pages
For pages with many sections, add a table of contents:

```markdown
---
layout: page
title: "Your Page Title"
---

{% include toc.html %}

# Your Page Title

Your content here...
```

### When to Use TOC
- **Weekly guides**: Always helpful for navigation
- **Long reference guides**: Essential for findability
- **Multi-section pages**: Improves user experience

## 🔍 Link Validation

### Automatic Checking
The site automatically validates internal links during build. Check the build log for warnings.

### Manual Checking
Run the link checker script:

```bash
./tools/check_links.sh
```

### Common Issues and Fixes

**Issue**: `Broken link: Week 8 -> week-8`
**Fix**: Add the leading slash: `[Week 8]({{ "/week-8/" | relative_url }})`

**Issue**: `Broken link: Training Games -> training-games`
**Fix**: Use the correct permalink: `[Training Games]({{ "/training-games/" | relative_url }})`

**Issue**: `Header link not working`
**Fix**: Check the header ID - remove emojis and special characters

## 🎯 Best Practices

### 1. Always Use Relative URLs
```markdown
✅ Good: {{ "/week-8/" | relative_url }}
❌ Bad:  /week-8/
❌ Bad:  week-8.md
```

### 2. Check Your Permalinks
Make sure your page's permalink matches your links:

```yaml
---
permalink: /week-8/
---
```

### 3. Test Header Links
Headers with emojis and special characters need careful handling:

```markdown
## 🎯 Week Overview     → #week-overview
## Susan's 5 Games     → #susans-5-games
## Q&A Section         → #qa-section
```

### 4. Use Meaningful Link Text
```markdown
✅ Good: [Week 8 Training Schedule]({{ "/week-8/" | relative_url }})
❌ Bad:  [Click here]({{ "/week-8/" | relative_url }})
```

## 🔧 Advanced Features

### Link Previews
Hover over any header to see the link icon (🔗) for copying the URL.

### Smooth Scrolling
All anchor links use smooth scrolling for better user experience.

### Mobile Optimization
- Quick jump menu for mobile navigation
- Responsive table of contents
- Touch-friendly link targets

## 📝 Quick Reference

### Page Link Template
```markdown
[Link Text]({{ "/page-permalink/" | relative_url }})
```

### Header Link Template
```markdown
[Link Text]({{ "/page-permalink/" | relative_url }}#header-id)
```

### Same-Page Header Link Template
```markdown
[Link Text](#header-id)
```

### Adding TOC Template
```markdown
{% include toc.html %}
```

## 🚀 Next Steps

1. **Test Your Links**: Run `./tools/check_links.sh`
2. **Add TOCs**: Include `{% include toc.html %}` in long pages
3. **Validate**: Check the Jekyll build log for warnings
4. **Improve**: Update any broken links found

---

**Pro Tip**: When in doubt, use the Jekyll `relative_url` filter. It's the most reliable way to ensure your links work everywhere! 🎯 