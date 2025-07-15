# Current Priorities

## Active Development Tasks

### 1. Implement Core process-ctl Script
- [ ] Create main `process-ctl` bash script with argument parsing
- [ ] Implement configuration discovery (walks up directory tree)
- [ ] Add basic commands: start, daemon, stop, restart, status, logs, tail
- [ ] Implement PID file management in `~/.cache/process-ctl/pids/`
- [ ] Add logging system to `~/.cache/process-ctl/logs/`

### 2. Process Management Features
- [ ] Implement port conflict detection
- [ ] Add graceful shutdown (SIGTERM → SIGKILL)
- [ ] Handle stale PID file cleanup
- [ ] Add process monitoring and resource usage display

### 3. Configuration System
- [ ] Parse `.process-ctl-cfg` files (PROJECT_NAME, START_CMD, PORT, LOG_MAX_SIZE)
- [ ] Validate required configuration fields
- [ ] Add configuration examples and templates

### 4. Testing & Validation
- [ ] Test all commands with sample configurations
- [ ] Verify cross-platform compatibility (macOS/Linux)
- [ ] Test configuration discovery in nested directories
- [ ] Validate error handling and edge cases

### 5. Documentation & Integration
- [ ] Create example `.process-ctl-cfg` files
- [ ] Add justfile integration examples
- [ ] Document installation and setup process
- [ ] Create troubleshooting guide

## Next Phase (Future)
- Health checks and HTTP/TCP endpoint monitoring
- Process recovery and auto-restart
- Workspace management for multiple projects
- Integration with monitoring systems