#!/bin/bash

VERSION="v0.1.0"

# Helper function to show the help message
function show_help() {
    echo "sysopctl - A cli-tool designed for managing system resources and tasks."
    echo ""
    echo "Usage: sysopctl <command> [options]"
    echo ""
    echo "Commands:"
    echo "    service list                List all active services"
    echo "    system load                 Show system load averages"
    echo "    service start <name>        Start a specific service"
    echo "    service stop <name>         Stop a specific service"
    echo "    disk usage                  Show disk usage statistics"
    echo "    process monitor             Show real-time process activity"
    echo "    logs analyze                Show summary of recent critical logs"
    echo "    backup <path>               Backup files at the given path"
    echo ""
    echo "Options:"
    echo "    --help                      Show this help message"
    echo "    --version                   Show version information"
    echo ""
    echo "Examples:"
    echo "    sysopctl service list"
    echo "    sysopctl disk usage"
    echo "    sysopctl process monitor"
    echo ""
}

# Function to show version information
function show_version() {
    echo "sysopctl version $VERSION"
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Error: No command provided. Please provide a command."
    echo "Use 'sysopctl --help' to see available commands and options."
    exit 1
fi
