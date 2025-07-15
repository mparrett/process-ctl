# Development tasks for process-ctl

# Run shellcheck on the main script
lint:
    @if command -v shellcheck >/dev/null 2>&1; then \
        shellcheck process-ctl; \
    else \
        echo "⚠️  shellcheck not installed. Install with: brew install shellcheck"; \
        echo "   Script appears syntactically valid (bash -n check)"; \
        bash -n process-ctl; \
    fi

# Test the script with example config
test:
    @echo "Testing process-ctl with example config..."
    cp .process-ctl-cfg.example .process-ctl-cfg
    ./process-ctl status
    @echo "✓ Basic functionality test passed"

# Clean up test artifacts
clean:
    rm -f .process-ctl-cfg
    rm -rf ~/.cache/process-ctl/pids/example-service.pid
    rm -rf ~/.cache/process-ctl/logs/example-service.log

# Show help
help:
    ./process-ctl help

# Install to ~/bin (for local development)
install:
    cp process-ctl ~/bin/process-ctl
    chmod +x ~/bin/process-ctl
    @echo "✓ Installed to ~/bin/process-ctl"