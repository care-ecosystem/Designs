#!/bin/bash

# Helper script to create a new feature from template

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Care Design Features - New Feature Creator ===${NC}\n"

# Get feature name
read -p "Enter feature name (kebab-case, e.g., 'user-profile'): " FEATURE_ID

if [ -z "$FEATURE_ID" ]; then
    echo -e "${YELLOW}Error: Feature name cannot be empty${NC}"
    exit 1
fi

# Check if feature already exists
if [ -d "features/$FEATURE_ID" ]; then
    echo -e "${YELLOW}Error: Feature '$FEATURE_ID' already exists${NC}"
    exit 1
fi

# Get display name
read -p "Enter display name (e.g., 'User Profile'): " FEATURE_NAME

if [ -z "$FEATURE_NAME" ]; then
    FEATURE_NAME=$FEATURE_ID
fi

# Get description
read -p "Enter brief description: " DESCRIPTION

if [ -z "$DESCRIPTION" ]; then
    DESCRIPTION="A new feature for Care"
fi

# Get status
echo -e "\nSelect status:"
echo "1) Draft"
echo "2) Review"
echo "3) Approved"
read -p "Enter choice (1-3): " STATUS_CHOICE

case $STATUS_CHOICE in
    1) STATUS="Draft";;
    2) STATUS="Review";;
    3) STATUS="Approved";;
    *) STATUS="Draft";;
esac

# Get tags
read -p "Enter tags (comma-separated, e.g., 'ui,dashboard'): " TAGS_INPUT

if [ -n "$TAGS_INPUT" ]; then
    IFS=',' read -ra TAGS_ARRAY <<< "$TAGS_INPUT"
    TAGS_JSON=$(printf ',"%s"' "${TAGS_ARRAY[@]}")
    TAGS_JSON="[${TAGS_JSON:1}]"
else
    TAGS_JSON="[]"
fi

# Create feature directory
echo -e "\n${BLUE}Creating feature directory...${NC}"
mkdir -p "features/$FEATURE_ID"

# Copy template files
echo -e "${BLUE}Copying template files...${NC}"
cp features/example-feature/index.html "features/$FEATURE_ID/"
cp features/example-feature/styles.css "features/$FEATURE_ID/"
cp features/example-feature/script.js "features/$FEATURE_ID/"

# Update index.html with feature name
sed -i.bak "s/Example Feature/$FEATURE_NAME/g" "features/$FEATURE_ID/index.html"
sed -i.bak "s/example-feature/$FEATURE_ID/g" "features/$FEATURE_ID/index.html"
rm "features/$FEATURE_ID/index.html.bak"

# Get today's date
TODAY=$(date +%Y-%m-%d)

# Update features.json
echo -e "${BLUE}Updating features.json...${NC}"

# Create new feature entry
NEW_FEATURE=$(cat <<EOF
    {
      "id": "$FEATURE_ID",
      "name": "$FEATURE_NAME",
      "description": "$DESCRIPTION",
      "status": "$STATUS",
      "dateAdded": "$TODAY",
      "path": "features/$FEATURE_ID/index.html",
      "tags": $TAGS_JSON
    }
EOF
)

# Add to features.json
if [ -f "features.json" ]; then
    # Write new feature to a temporary file
    echo "$NEW_FEATURE" > /tmp/new_feature.json

    # Use Python for reliable JSON manipulation
    python3 << 'PYTHON_SCRIPT'
import json
import sys

try:
    # Read existing features.json
    with open('features.json', 'r') as f:
        data = json.load(f)

    # Read new feature
    with open('/tmp/new_feature.json', 'r') as f:
        new_feature = json.load(f)

    # Add new feature to the beginning of the array
    data['features'].insert(0, new_feature)

    # Write back to features.json
    with open('features.json', 'w') as f:
        json.dump(data, f, indent=2)

    print("✓ Features.json updated successfully")
except Exception as e:
    print(f"Error updating features.json: {e}", file=sys.stderr)
    sys.exit(1)
PYTHON_SCRIPT

    # Clean up temp file
    rm -f /tmp/new_feature.json
fi

echo -e "\n${GREEN}✓ Feature created successfully!${NC}"
echo -e "\nNext steps:"
echo -e "1. Edit ${BLUE}features/$FEATURE_ID/index.html${NC} to customize your design"
echo -e "2. Update ${BLUE}features/$FEATURE_ID/styles.css${NC} with custom styles"
echo -e "3. Add interactions in ${BLUE}features/$FEATURE_ID/script.js${NC}"
echo -e "4. Test locally: ${BLUE}python3 -m http.server 8000${NC}"
echo -e "5. Commit and push:\n   ${BLUE}git add .${NC}\n   ${BLUE}git commit -m \"Add feature: $FEATURE_NAME\"${NC}\n   ${BLUE}git push${NC}"
echo -e "\nFeature URL will be: ${YELLOW}features/$FEATURE_ID/index.html${NC}\n"
