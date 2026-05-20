# Care Design Features

A centralized repository for showcasing UI/UX design prototypes and feature implementations. This repository enables rapid feedback from stakeholders and serves as a reference for developers.

## Live Demo

Visit the live site: `https://your-username.github.io/designs`

## Overview

This repository hosts interactive HTML prototypes of various features being developed for Care. Each feature includes:

- Interactive UI prototypes
- Design specifications
- Implementation notes for developers
- Responsive layouts for all devices

## Repository Structure

```
Designs/
├── index.html              # Main landing page (auto-generated)
├── features.json           # Configuration file listing all features
├── features/               # Feature prototypes directory
│   └── example-feature/    # Example feature (use as template)
│       ├── index.html
│       ├── styles.css
│       └── script.js
├── assets/                 # Shared assets
│   ├── css/
│   │   └── main.css       # Global styles
│   └── js/
│       └── main.js        # Shared JavaScript
└── .github/
    └── workflows/
        └── deploy.yml     # GitHub Actions deployment
```

## Getting Started

### Prerequisites

- Git
- A GitHub account
- Basic knowledge of HTML/CSS/JS

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/your-org/designs.git
cd designs
```

2. Open `index.html` in your browser:
```bash
open index.html  # macOS
# or
start index.html  # Windows
# or just double-click index.html
```

3. For better local development, use a local server:
```bash
# Using Python
python3 -m http.server 8000

# Using Node.js
npx serve

# Using PHP
php -S localhost:8000
```

Then visit `http://localhost:8000`

## Adding a New Feature

### Step 1: Create Feature Directory

Create a new directory under `features/`:

```bash
mkdir -p features/your-feature-name
```

### Step 2: Copy Template Files

Use the example feature as a template:

```bash
cp features/example-feature/index.html features/your-feature-name/
cp features/example-feature/styles.css features/your-feature-name/
cp features/example-feature/script.js features/your-feature-name/
```

### Step 3: Customize Your Feature

Edit the files in `features/your-feature-name/`:

- `index.html` - Update content, structure, and feature demonstration
- `styles.css` - Add feature-specific styles
- `script.js` - Add interactive functionality

### Step 4: Register Feature

Add your feature to `features.json`:

```json
{
  "features": [
    {
      "id": "your-feature-name",
      "name": "Your Feature Display Name",
      "description": "Brief description of what this feature does",
      "status": "In Progress",
      "dateAdded": "2026-05-20",
      "path": "features/your-feature-name/index.html",
      "tags": ["tag1", "tag2"]
    }
  ]
}
```

### Step 5: Commit and Push

```bash
git add .
git commit -m "Add new feature: Your Feature Name"
git push origin main
```

The site will automatically deploy via GitHub Actions.

## features.json Schema

```json
{
  "features": [
    {
      "id": "unique-identifier",           // Required: Unique ID (use kebab-case)
      "name": "Display Name",              // Required: Human-readable name
      "description": "Brief description",  // Required: What this feature does
      "status": "Status Badge",            // Required: e.g., "Draft", "Review", "Final"
      "dateAdded": "YYYY-MM-DD",          // Required: Date added
      "path": "features/id/index.html",   // Required: Relative path to feature
      "tags": ["tag1", "tag2"]            // Optional: Searchable tags
    }
  ]
}
```

## GitHub Pages Deployment

### Initial Setup

1. Go to your repository settings on GitHub
2. Navigate to **Pages** in the left sidebar
3. Under **Source**, select **GitHub Actions**
4. The workflow will automatically deploy on every push to `main`

### Deployment Process

The deployment happens automatically via GitHub Actions:

1. Push changes to the `main` branch
2. GitHub Actions workflow triggers
3. Site builds and deploys to GitHub Pages
4. Available at `https://your-username.github.io/designs`

### Manual Deployment

You can also trigger deployment manually:

1. Go to **Actions** tab in GitHub
2. Select **Deploy to GitHub Pages** workflow
3. Click **Run workflow**

## Best Practices

### For Designers

1. **Keep it simple**: Focus on the core feature interaction
2. **Be responsive**: Test on mobile, tablet, and desktop
3. **Document decisions**: Use the implementation notes section
4. **Show all states**: Include loading, error, and empty states
5. **Gather feedback early**: Share the link before implementation

### For Developers

1. **Reference designs**: Use these prototypes as implementation reference
2. **Check specifications**: Review design specs for colors, spacing, typography
3. **Ask questions**: Use GitHub Issues for clarifications
4. **Update as built**: Keep designs in sync with actual implementation

### File Organization

- Keep feature files self-contained in their directory
- Use relative paths for linking to shared assets
- Name files descriptively: `user-profile.html`, not `page1.html`
- Add comments in code for complex interactions

## Styling Guidelines

### Using Shared Styles

The main stylesheet (`assets/css/main.css`) provides:

- CSS variables for consistent colors and spacing
- Reusable component classes
- Responsive utilities
- Common layout patterns

Reference these in your feature styles:

```css
/* Use CSS variables */
.my-component {
    color: var(--primary-color);
    padding: var(--spacing-md);
    border: 1px solid var(--border);
}
```

### Feature-Specific Styles

Keep feature-specific styles in the feature's `styles.css`:

```html
<link rel="stylesheet" href="../../assets/css/main.css">
<link rel="stylesheet" href="styles.css">
```

## Common Issues

### Features not appearing on index page

1. Check `features.json` syntax is valid (use a JSON validator)
2. Ensure the `path` field points to the correct location
3. Check browser console for JavaScript errors

### Styles not loading

1. Verify relative paths are correct (`../../assets/css/main.css`)
2. Clear browser cache
3. Check file names match exactly (case-sensitive on some systems)

### GitHub Pages not updating

1. Check **Actions** tab for deployment status
2. Ensure GitHub Pages is enabled in repository settings
3. Wait 1-2 minutes for CDN cache to clear
4. Hard refresh browser (Cmd+Shift+R or Ctrl+Shift+R)

## Contributing

1. Create a new branch for your feature:
```bash
git checkout -b feature/your-feature-name
```

2. Make your changes and commit:
```bash
git add .
git commit -m "Add feature: description"
```

3. Push and create a pull request:
```bash
git push origin feature/your-feature-name
```

4. Request review from team members

## Feedback and Questions

- **Issues**: Use GitHub Issues for bugs or feature requests
- **Discussions**: Use GitHub Discussions for questions
- **Urgent matters**: Contact the design team directly

## License

Internal use only - Care Team

## Maintainers

- Design Team
- Development Team

## Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [HTML Best Practices](https://github.com/hail2u/html-best-practices)
- [CSS Guidelines](https://cssguidelin.es/)

---

Last updated: 2026-05-20