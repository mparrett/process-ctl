# Current Priorities

## Completed Core Features ✅

### 1. Core process-ctl Script
- [x] ✅ Create main `process-ctl` bash script with argument parsing
- [x] ✅ Implement configuration discovery (walks up directory tree)
- [x] ✅ Add basic commands: start, start-bg, stop, restart, status, logs, tail, follow
- [x] ✅ Implement PID file management in `~/.cache/process-ctl/pids/`
- [x] ✅ Add logging system to `~/.cache/process-ctl/logs/`

### 2. Process Management Features
- [x] ✅ Implement port conflict detection
- [x] ✅ Add graceful shutdown (SIGTERM → SIGKILL)
- [x] ✅ Handle stale PID file cleanup
- [x] ✅ Add process monitoring and resource usage display

### 3. Configuration System
- [x] ✅ Parse `.process-ctl-cfg` files (PROJECT_NAME, START_CMD, PORT, LOG_MAX_SIZE)
- [x] ✅ Validate required configuration fields
- [x] ✅ Add configuration examples and templates

### 4. Testing & Validation
- [x] ✅ Test all commands with sample configurations (Tank AI, MiniTime, HTTP server)
- [x] ✅ Verify cross-platform compatibility (macOS/Linux)
- [x] ✅ Test configuration discovery in nested directories
- [x] ✅ Validate error handling and edge cases

### 5. Documentation & Integration
- [x] ✅ Create example `.process-ctl-cfg` files
- [x] ✅ Add justfile integration examples
- [x] ✅ Document installation and setup process
- [x] ✅ Create troubleshooting guide
- [x] ✅ Add service development guidelines with signal handling

## Active Tasks

### Current Sprint
- [x] ✅ Fix `tail` command UX (now shows N lines and exits, separate `follow` command)
- [ ] Consider log rotation visibility in status output

## Next Phase (Future)
- Health checks and HTTP/TCP endpoint monitoring
- Process recovery and auto-restart
- Workspace management for multiple projects
- Integration with monitoring systems