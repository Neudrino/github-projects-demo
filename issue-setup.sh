set -x

date=$(date -I)

if [ -n "${GITHUB_ACTIONS}" ]; then
    title_suffix="on ${date}"
else
    title_suffix=""
fi

# According to
# https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#permissions
# `repository-projects: read`
# is only for classic projects.
# https://github.com/cli/cli/issues/8798
# suggests the following workaround.
# However, this workaround only works for local execution, not in GH actions
#gh auth refresh -s project

# Create new issue with initial instructions
if gh issue view 1; then
    gh issue edit 1 \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo ${title_suffix}"
else
    gh issue create \
        --assignee "@me" \
        --body-file "issue-01-body.md" \
        --title "Welcome to the Github Projects demo"
fi
