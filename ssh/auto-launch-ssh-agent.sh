#!/usr/bin/env bash

env="$HOME/.ssh/agent.env.$(hostname)"

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state () {
    ssh-add -l >| /dev/null 2>&1; echo $?
}

# if no existing (e.g. forwarded) agent, load from env
if [[ "$(agent_run_state)" -eq 2 ]]; then
    agent_load_env
    # if failed to load from env, start agent
    if [[ "$(agent_run_state)" -eq 2 ]]; then
        agent_start
    fi
fi

# if agent without key, add key
if [[ "$(agent_run_state)" -eq 1 ]]; then
    ssh-add
fi

unset env
