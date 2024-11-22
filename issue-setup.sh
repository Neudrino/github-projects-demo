set -x

date=$(date -I)

if [ -n "${GITHUB_ACTIONS}" ]; then
    title_suffix="on ${date}"
else
    title_suffix=""
fi

# Create new issue on project with initial instructions
if gh issue view 1; then
    gh issue edit 1 \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo presentation ${title_suffix}"
else
    gh issue create \
        --assignee "@me" \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo presentation"
fi
