---
layout: page
title: "Setup Instructions"
---

# Thunder's Puppy Training Guide Website

This repository contains a comprehensive guide for training a Pomeranian puppy, organized into logical directories and formatted as a GitHub Pages website.

## 🌐 View the Website

Once GitHub Pages is enabled, your website will be available at:
`https://arriw.github.io/thunder`

## 🚀 How to Enable GitHub Pages

1. **Push your changes to GitHub:**
   ```bash
   git add .
   git commit -m "Organize files and set up GitHub Pages"
   git push origin main
   ```

2. **Enable GitHub Pages in your repository:**
   - Go to your repository on GitHub
   - Click on **Settings** tab
   - Scroll down to **Pages** section in the left sidebar
   - Under "Source", select **Deploy from a branch**
   - Choose **main** branch and **/ (root)** folder
   - Click **Save**

3. **Wait for deployment:**
   - GitHub will automatically build your site
   - It may take a few minutes for the first deployment
   - You'll get a green checkmark when it's ready

## 📝 How to Update Content

Your website is built from markdown files. To update content:

1. **Edit any `.md` file** in the `guides/` directory
2. **Commit and push your changes:**
   ```bash
   git add .
   git commit -m "Update content"
   git push origin main
   ```
3. **GitHub Pages will automatically rebuild** your site (takes 1-2 minutes)

## 📁 File Structure

```
/
├── index.md                        # Homepage with navigation
├── _config.yml                     # Jekyll configuration
├── README.md                       # Setup instructions
├── guides/
│   ├── comprehensive-guide.md      # Main training guide
│   ├── puppy-schedule.md          # Daily schedule guide
│   ├── nighttime-guide.md         # Nighttime potty training
│   └── adoption-plan.md           # Adoption and cost planning
├── images/
│   ├── Thunder_1.jpg              # Thunder's photo (JPG)
│   └── Thunder_2.PNG              # Thunder's photo (PNG)
└── tools/
    ├── compile_to_html.sh         # Legacy HTML compiler
    ├── template.html              # HTML template
    └── Refence_Material.txt       # Reference notes
```

## 🎨 Customization

The site uses Jekyll's default **Minima** theme, which provides:
- Clean, responsive design
- Automatic navigation from markdown files
- Mobile-friendly layout
- Print-friendly pages

To customize styling, you can:
- Edit `_config.yml` to change site title/description
- Add custom CSS in `assets/main.scss`
- Change themes by modifying the `theme:` line in `_config.yml`

## 🔧 Local Development (Optional)

To preview changes locally before pushing:

```bash
# Install Jekyll
gem install bundler jekyll

# Create Gemfile
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'github-pages', group: :jekyll_plugins" >> Gemfile

# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve
```

Visit `http://localhost:4000` to preview your site.

## 💡 Benefits of This Organization

✅ **Organized**: Clear separation of content, images, and tools  
✅ **Simple**: Edit markdown files directly on GitHub  
✅ **Automatic**: Changes deploy automatically  
✅ **Professional**: Clean, responsive design  
✅ **Free**: No hosting costs  
✅ **Fast**: Static site loads quickly  
✅ **Mobile-friendly**: Works on all devices

## 📝 Adding New Content

To add new training guides:
1. Create a new `.md` file in the `guides/` directory
2. Add Jekyll front matter at the top:
   ```yaml
   ---
   layout: page
   title: "Your Guide Title"
   permalink: /your-guide-url/
   ---
   ```
3. Add the file to `_config.yml` under `header_pages:`
4. Link to it from `index.md` or other guides 