function gitwta() {
	local branch_name="$1"
	local source_branch="$2"

	if [[ -z "$branch_name" ]]; then
		echo "Error: Branch name is required"
		echo "Usage: gwt <branch_name> [source_branch]"
		return 1
	fi

	local uuid=$(uuidgen | tr '[:upper:]' '[:lower:]')
	local worktree_dir=".git/tree/$uuid"

	mkdir -p .git/tree
	if [[ -n "$source_branch" ]]; then
		git worktree add "$worktree_dir" -b "$branch_name" "$source_branch"
	else
		git worktree add "$worktree_dir" -b "$branch_name"
	fi

	if [[ $? -eq 0 ]]; then
		echo "Worktree created: $worktree_dir"
	fi
}

function gitwtr() {
	local delete_branch=false

	if [[ "$1" == "-b" ]]; then
		delete_branch=true
	fi

	local selected_worktrees=$(git worktree list | grep ".git" | fzf --multi --preview 'echo "Path: {1}\nBranch: {3}"' --preview-window=up:3)

	if [[ -z "$selected_worktrees" ]]; then
		echo "No worktree selected"
		return 1
	fi

	while IFS= read -r worktree_info; do
		local worktree_path=$(echo "$worktree_info" | awk '{print $1}')
		local branch_name=$(echo "$worktree_info" | awk '{print $3}' | sed 's/\[//;s/\]//')

		echo "Removing worktree: $worktree_path"
		git worktree remove "$worktree_path"

		if [[ $? -eq 0 && "$delete_branch" == true ]]; then
			echo "Deleting branch: $branch_name"
			git branch -D "$branch_name"
		fi
	done <<< "$selected_worktrees"
}

function gitwts() {
	local selected_worktree=$(git worktree list | fzf --preview 'echo "Path: {1}\nBranch: {3}"' --preview-window=up:3)

	if [[ -z "$selected_worktree" ]]; then
		echo "No worktree selected"
		return 1
	fi

	local worktree_path=$(echo "$selected_worktree" | awk '{print $1}')
	echo "Switching to worktree: $worktree_path"
	cd "$worktree_path"
}