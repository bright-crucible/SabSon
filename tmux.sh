#!/usr/bin/env bash
tmux new-session top\; split-window -d docker compose logs -f
