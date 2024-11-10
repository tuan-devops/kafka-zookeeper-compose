#!/bin/bash

# Script to create Kafka and Zookeeper directory structure

# Exit on any error
set -euo pipefail

# Variables
BASE_DIR="$HOME/kafka_zookeeper_data"
USER="tuan-devops"
GROUP="tuan-devops"
PERMISSIONS="777"
KAFKA_DIRS=(kafka1 kafka2 kafka3)
ZOOKEEPER_DIRS=(zookeeper1 zookeeper2 zookeeper3)

# Log messages
log() {
    local MSG="$1"
    echo "[INFO] $MSG"
}

# Error handling
error_exit() {
    local MSG="$1"
    echo "[ERROR] $MSG" >&2
    exit 1
}

# Create directories
create_directories() {
    log "Ensuring Kafka directories exist..."
    for dir in "${KAFKA_DIRS[@]}"; do
        local target="$BASE_DIR/$dir/data"
        if [[ ! -d "$target" ]]; then
            mkdir -p "$target" || error_exit "Failed to create $target"
            log "Created $target"
        else
            log "$target already exists"
        fi
    done

    log "Ensuring Zookeeper directories exist..."
    for dir in "${ZOOKEEPER_DIRS[@]}"; do
        for subdir in data datalog; do
            local target="$BASE_DIR/$dir/$subdir"
            if [[ ! -d "$target" ]]; then
                mkdir -p "$target" || error_exit "Failed to create $target"
                log "Created $target"
            else
                log "$target already exists"
            fi
        done
    done
}

# Set ownership and permissions
set_permissions() {
    log "Setting ownership to $USER:$GROUP..."
    chown -R "$USER:$GROUP" "$BASE_DIR" || error_exit "Failed to set ownership on $BASE_DIR"

    log "Setting permissions to $PERMISSIONS..."
    chmod -R "$PERMISSIONS" "$BASE_DIR" || error_exit "Failed to set permissions on $BASE_DIR"
}

# Display directory structure
display_structure() {
    if command -v tree >/dev/null 2>&1; then
        log "Displaying directory structure:"
        tree "$BASE_DIR"
    else
        log "'tree' command not found. Install it to display the directory structure."
    fi
}

# Main function
main() {
    log "Starting script execution..."
    create_directories
    set_permissions
    display_structure
    log "Script execution completed successfully."
}

# Run the main function
main