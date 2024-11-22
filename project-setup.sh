# Owner default is "@me" and does not usually need to be specified
owner=${GITHUB_USER:-"Neudrino"}
repo="github-projects-demo"
my_title="Github Projects and Issues Demo"

# Create new project
jq_expression=".projects[] | select(.title == \"${my_title}\") | .number"
existing_project=$(gh project list --owner ${owner} --format json --jq "${jq_expression}")

if [ -n "${existing_project}" ]; then
    my_project_number=${existing_project}
    echo "Project with >${my_title}< exists as number ${my_project_number}."
else
    echo "Creating new project with ${my_title}."
    gh project create --owner ${owner} --title "${my_title}"
    my_project_number=$(gh project list --owner ${owner} --format json --jq "${jq_expression}")
fi

# Link project to repository
gh project link ${my_project_number} --owner ${owner} --repo ${repo}
