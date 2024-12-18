set -x

my_project_title="Github Projects and Issues Demo"
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
        --title "Welcome to the Github Projects demo presentation ${title_suffix}" \
        --add-project "${my_project_title}"
else
    gh issue create \
        --assignee "@me" \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo presentation"
fi
