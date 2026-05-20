// Main JavaScript file for shared functionality

document.addEventListener('DOMContentLoaded', function() {
    // Load features dynamically if on index page
    const featuresContainer = document.getElementById('features-container');
    if (featuresContainer) {
        loadFeatures();
    }

    // Add smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Add current year to copyright
    const yearElements = document.querySelectorAll('.current-year');
    yearElements.forEach(el => {
        el.textContent = new Date().getFullYear();
    });

    console.log('Design Features Showcase loaded successfully');
});

// Function to load and render features dynamically
async function loadFeatures() {
    const container = document.getElementById('features-container');

    try {
        const response = await fetch('features.json');
        if (!response.ok) {
            throw new Error('Failed to load features');
        }

        const data = await response.json();
        const features = data.features;

        if (features.length === 0) {
            container.innerHTML = '<p class="text-muted">No features available yet. Add your first feature to get started!</p>';
            return;
        }

        // Clear loading message
        container.innerHTML = '';

        // Render each feature
        features.forEach(feature => {
            const card = createFeatureCard(feature);
            container.appendChild(card);
        });

    } catch (error) {
        console.error('Error loading features:', error);
        container.innerHTML = '<p class="text-muted">Error loading features. Please check the console for details.</p>';
    }
}

// Function to create a feature card element
function createFeatureCard(feature) {
    const card = document.createElement('div');
    card.className = 'feature-card';

    const featureHeader = document.createElement('div');
    featureHeader.className = 'feature-header';

    const title = document.createElement('h3');
    title.textContent = feature.name;

    const badge = document.createElement('span');
    badge.className = 'badge';
    badge.textContent = feature.status;

    featureHeader.appendChild(title);
    featureHeader.appendChild(badge);

    const description = document.createElement('p');
    description.className = 'feature-description';
    description.textContent = feature.description;

    const meta = document.createElement('div');
    meta.className = 'feature-meta';

    const date = document.createElement('span');
    date.className = 'date';
    date.textContent = `Added: ${feature.dateAdded}`;
    meta.appendChild(date);

    // Add tags if available
    if (feature.tags && feature.tags.length > 0) {
        const tagsContainer = document.createElement('div');
        tagsContainer.className = 'tags mt-1';
        tagsContainer.style.display = 'flex';
        tagsContainer.style.gap = '0.5rem';
        tagsContainer.style.flexWrap = 'wrap';

        feature.tags.forEach(tag => {
            const tagSpan = document.createElement('span');
            tagSpan.style.fontSize = '0.75rem';
            tagSpan.style.color = 'var(--text-secondary)';
            tagSpan.textContent = `#${tag}`;
            tagsContainer.appendChild(tagSpan);
        });

        meta.appendChild(tagsContainer);
    }

    const link = document.createElement('a');
    link.href = feature.path;
    link.className = 'btn btn-primary';
    link.textContent = 'View Design';

    card.appendChild(featureHeader);
    card.appendChild(description);
    card.appendChild(meta);
    card.appendChild(link);

    return card;
}
