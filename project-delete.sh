my_project_number=5
# Owner default is "@me" and does not usually need to be specified
owner=${GITHUB_USER:-"Neudrino"}

gh project delete ${my_project_number} --owner ${owner}
