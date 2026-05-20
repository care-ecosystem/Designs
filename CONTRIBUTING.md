# Contributing to Care Design Features

Thank you for contributing to the Care Design Features repository! This guide will help you add new features and maintain the repository.

## Quick Start

1. **Create your feature directory**
   ```bash
   mkdir -p features/my-feature
   ```

2. **Copy template files**
   ```bash
   cp features/example-feature/* features/my-feature/
   ```

3. **Edit your files**
   - Update `index.html` with your design
   - Modify `styles.css` for custom styling
   - Add interactions in `script.js`

4. **Register in features.json**
   ```json
   {
     "id": "my-feature",
     "name": "My Feature Name",
     "description": "What this feature does",
     "status": "Draft",
     "dateAdded": "2026-05-20",
     "path": "features/my-feature/index.html",
     "tags": ["category"]
   }
   ```

5. **Test locally**
   ```bash
   python3 -m http.server 8000
   # Visit http://localhost:8000
   ```

6. **Commit and push**
   ```bash
   git add .
   git commit -m "Add feature: My Feature Name"
   git push
   ```

## Feature Structure

Each feature should follow this structure:

```
features/your-feature/
├── index.html      # Main feature page
├── styles.css      # Feature-specific styles
├── script.js       # Feature-specific JavaScript
└── assets/         # Optional: feature-specific assets
    ├── images/
    └── data/
```

## Naming Conventions

- **Feature IDs**: Use kebab-case (`user-profile`, `dashboard-widgets`)
- **File names**: Lowercase with hyphens (`user-settings.html`)
- **CSS classes**: Use BEM or semantic names (`.feature-card`, `.btn-primary`)
- **JavaScript**: Use camelCase for functions (`loadFeatures`, `createCard`)

## Status Labels

Use these standard status labels in `features.json`:

- `Draft` - Work in progress
- `Review` - Ready for stakeholder review
- `Approved` - Design approved, ready for development
- `Implemented` - Feature has been built
- `Sample` - Example or template feature

## Styling Guidelines

### Use CSS Variables

Always use CSS variables from `main.css` for consistency:

```css
.my-element {
    color: var(--primary-color);
    background: var(--surface);
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
}
```

Available variables:
- Colors: `--primary-color`, `--secondary-color`, `--success`, `--warning`, `--error`
- Text: `--text-primary`, `--text-secondary`
- Backgrounds: `--background`, `--surface`
- Effects: `--shadow`, `--shadow-lg`, `--border`

### Responsive Design

Always test and ensure responsive behavior:

```css
@media (max-width: 768px) {
    .my-grid {
        grid-template-columns: 1fr;
    }
}
```

## Content Guidelines

### Feature Page Sections

Include these sections in your feature page:

1. **Header** - Feature name and back link
2. **Overview** - Brief description and context
3. **Interactive Demo** - The actual feature UI
4. **Design Specifications** - Colors, typography, spacing
5. **Implementation Notes** - Developer guidance
6. **Feedback Section** - How to provide input

### Writing Descriptions

- Keep descriptions concise (1-2 sentences)
- Focus on what problem the feature solves
- Avoid technical jargon
- Use active voice

Good: "Allows users to quickly filter and export patient data"
Bad: "A comprehensive data management interface with multiple filtering capabilities"

## JavaScript Best Practices

- Use vanilla JavaScript when possible
- Add comments for complex logic
- Use event delegation for dynamic content
- Handle errors gracefully

```javascript
// Good: Clear, documented, error-handled
async function loadData() {
    try {
        const response = await fetch('data.json');
        if (!response.ok) throw new Error('Load failed');
        return await response.json();
    } catch (error) {
        console.error('Error loading data:', error);
        showErrorMessage('Failed to load data');
    }
}
```

## Accessibility

Ensure your designs are accessible:

- Use semantic HTML (`<button>`, `<nav>`, `<main>`)
- Add ARIA labels where needed
- Ensure keyboard navigation works
- Maintain sufficient color contrast (WCAG AA minimum)
- Test with screen readers when possible

```html
<!-- Good -->
<button aria-label="Close dialog" onclick="closeDialog()">×</button>

<!-- Bad -->
<div onclick="closeDialog()">×</div>
```

## Testing Checklist

Before committing, verify:

- [ ] Feature appears on index page
- [ ] All links work correctly
- [ ] Responsive on mobile, tablet, desktop
- [ ] No console errors
- [ ] Images and assets load properly
- [ ] Back button returns to index
- [ ] Styling is consistent with other features
- [ ] Code is commented where needed

## Git Workflow

### Branch Naming

- Feature: `feature/feature-name`
- Fix: `fix/issue-description`
- Update: `update/what-changed`

### Commit Messages

Use clear, descriptive commit messages:

```bash
# Good
git commit -m "Add user profile feature with edit functionality"
git commit -m "Fix responsive layout on mobile devices"
git commit -m "Update color scheme to match brand guidelines"

# Bad
git commit -m "Updates"
git commit -m "Fix"
git commit -m "WIP"
```

### Pull Requests

When creating a PR:

1. Use a descriptive title
2. Include screenshots or GIF of the feature
3. List what was added/changed
4. Tag relevant reviewers
5. Link to related issues

## Common Patterns

### Loading States

```html
<div id="content" class="loading">Loading...</div>

<script>
async function loadContent() {
    const container = document.getElementById('content');
    try {
        const data = await fetchData();
        container.classList.remove('loading');
        renderContent(data);
    } catch (error) {
        container.innerHTML = 'Error loading content';
    }
}
</script>
```

### Empty States

```html
<div class="empty-state">
    <p>No items found</p>
    <button class="btn btn-primary">Add First Item</button>
</div>
```

### Error Handling

```javascript
function showError(message) {
    const errorDiv = document.createElement('div');
    errorDiv.className = 'error-message';
    errorDiv.textContent = message;
    document.body.appendChild(errorDiv);

    setTimeout(() => errorDiv.remove(), 5000);
}
```

## Getting Help

- Check existing features for examples
- Review the README for detailed instructions
- Ask in team chat or discussions
- Create an issue for bugs or questions

## Code Review

All contributions should be reviewed:

1. Code quality and consistency
2. Design accuracy
3. Accessibility compliance
4. Performance considerations
5. Documentation completeness

## Additional Tips

- Keep files under 500 lines when possible
- Use consistent indentation (2 spaces)
- Remove unused code and commented sections
- Optimize images before committing
- Test in multiple browsers
- Document any browser-specific code

Thank you for contributing to Care Design Features!
