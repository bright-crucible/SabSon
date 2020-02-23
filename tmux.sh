#!/usr/bin/env bash
tmux new-session top\; split-window -d ./venv/bin/docker-compose logs -f
