set -x

date=$(date -I)

# Create new issue on project with initial instructions
if gh issue view 1; then
    gh issue edit 1 \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo presentation on ${date}"
else
    gh issue create \
        --assignee "@me" \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo presentation"
fi
