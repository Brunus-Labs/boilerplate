# List defaults
default:
    @just --list

GREEN  := "\\u001b[32m"
RESET  := "\\u001b[0m"
CHECK  := `/usr/bin/printf "\xE2\x9C\x94"`

build:
    @docker compose build

up: build
    @docker compose up -d

down:
    @docker compose down

test:
    @echo -e " {{GREEN}}{{CHECK}} No tests yet, so guess they pass? {{CHECK}} {{RESET}}"

# Checkout a worktree, short for WorkTree Add
wta branch:
    @git worktree add .worktrees/{{branch}} {{branch}}
    @ln -s {{invocation_directory()}}/.env {{invocation_directory()}}/.worktrees/{{branch}}/.env
    @echo -e " {{GREEN}}{{CHECK}} Added worktree for {{branch}} {{CHECK}} {{RESET}}"

# Remove a worktree, short for WorkTree Add
wtrm branch:
    @git worktree remove {{branch}}
    @echo -e " {{GREEN}}{{CHECK}} Removed worktree for {{branch}} {{CHECK}} {{RESET}}"

# ls worktrees
wtls:
    @cd .worktrees && find . -mindepth 2 -maxdepth 2 -type d
