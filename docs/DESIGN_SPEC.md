# process-ctl: Simple Process Management for Development Teams

## Overview

`process-ctl` is a single-script solution for unified process management across development teams. It provides consistent commands for starting, stopping, and monitoring services without the complexity of enterprise-grade process managers.

### Why This Approach Over Existing Tools?

While tools like PM2, Supervisor, systemd, and Docker exist for process management, `process-ctl` hits the sweet spot for development teams by providing:

- **Zero Dependencies** - One bash script, works everywhere
- **Dead Simple Setup** - `curl` script to `~/bin`, echo config, done
- **Unified Interface** - Same commands work across all projects
- **Project-Scoped Control** - No system-wide configuration headaches
- **Future-Proof** - Can evolve without changing the interface

This isn't reinventing the wheel - it's building exactly the right abstraction for teams that need consistent, simple process control without enterprise overhead.

## Installation

### One-Time Setup
```bash
# Install process-ctl
curl https://raw.githubusercontent.com/your-org/process-ctl/main/process-ctl > ~/bin/process-ctl
chmod +x ~/bin/process-ctl

# Make sure ~/bin is in your PATH
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Per-Project Setup
```bash
# Create configuration in your project directory
echo "PROJECT_NAME=my-api
START_CMD=python -m uvicorn main:app --host 0.0.0.0 --port 8000
PORT=8000" > .process-ctl-cfg

# Add to .gitignore to avoid committing runtime files
echo ".process-ctl-cfg" >> .gitignore
```

## Core Operations

### Basic Commands
```bash
# Start in foreground (development)
process-ctl start

# Start as background daemon
process-ctl start-bg

# Stop background service
process-ctl stop

# Restart service
process-ctl restart

# Check status
process-ctl status

# View logs
process-ctl logs

# Tail logs
process-ctl tail
```

## Configuration

`process-ctl` automatically discovers `.process-ctl-cfg` files by walking up the directory tree from your current location.

### Required Configuration
```bash
PROJECT_NAME="my-service"          # Used for PID and log files
START_CMD="your-start-command"     # How to start your service
```

### Optional Configuration
```bash
PORT=8000                          # Enable port conflict detection
LOG_MAX_SIZE="50M"                 # Log rotation threshold
```

### Example Configurations

**Python/FastAPI Service:**
```bash
PROJECT_NAME="user-api"
START_CMD="python -m uvicorn main:app --host 0.0.0.0 --port 8000"
PORT=8000
```

**Node.js Service:**
```bash
PROJECT_NAME="notification-service"
START_CMD="node server.js"
PORT=3000
```

**Go Service:**
```bash
PROJECT_NAME="auth-service"
START_CMD="./bin/auth-server"
PORT=8080
```

**Background Worker:**
```bash
PROJECT_NAME="email-worker"
START_CMD="python -m worker.email_processor"
# No PORT needed for workers
```

## Key Features

### Automatic Discovery
`process-ctl` finds your configuration automatically:
- Checks current directory for `.process-ctl-cfg`
- Walks up parent directories until found
- Works from anywhere within your project

### Robust Process Management
- **PID File Cleanup** - Automatically handles stale PID files after crashes/reboots
- **Port Conflict Detection** - Prevents "port already in use" errors
- **Graceful Shutdown** - SIGTERM followed by SIGKILL if needed
- **Process Monitoring** - Shows resource usage with status

### Safe Operation
- **Conflict Prevention** - Checks if service already running
- **Resource Cleanup** - Removes PID files on shutdown
- **Error Handling** - Clear error messages and safe defaults

## Advanced Usage

### Integration with Justfiles
For teams using `just`, create standard recipes:

```just
# Justfile
start:
    process-ctl start

start-bg:
    process-ctl start-bg

stop:
    process-ctl stop

restart:
    process-ctl restart

status:
    process-ctl status

logs:
    process-ctl logs

tail:
    process-ctl tail
```

### Multiple Environments
Use different configs for different environments:

```bash
# Development
cp .process-ctl-cfg.dev .process-ctl-cfg

# Staging  
cp .process-ctl-cfg.staging .process-ctl-cfg

# Production (use systemd instead)
```

### Self-Managing Services
Services can manage themselves by calling `process-ctl`:

```python
# In your application code
import subprocess

def restart_self():
    subprocess.run(["process-ctl", "restart"], cwd="/path/to/project")
```

## File Locations

### Configuration
- `.process-ctl-cfg` - Project configuration (committed to repo)

### Runtime Files
- `~/.cache/process-ctl/pids/` - PID files
- `~/.cache/process-ctl/logs/` - Log files

Add to your global `.gitignore`:
```
.cache/process-ctl/
```

## Implementation Checklist

### For Each Project:
- [ ] Create `.process-ctl-cfg` with PROJECT_NAME and START_CMD
- [ ] Test all operations: start, stop, restart, status
- [ ] Add `.process-ctl-cfg` to version control
- [ ] Add runtime cache to `.gitignore`

### Team Standardization:
- [ ] Install `process-ctl` on all development machines
- [ ] Document project-specific configuration patterns
- [ ] Create justfile templates if using `just`
- [ ] Train team on consistent workflow

## Benefits

**Consistency** - Same commands work across all projects and team members

**Simplicity** - One script, one config file, no dependencies

**Portability** - Works on macOS and Linux out of the box  

**Developer Experience** - No more remembering different commands per project

**Debuggability** - Clear logging, status checking, and conflict detection

**Maintainability** - Single script to update, distribute, and customize

## Migration Strategy

1. **Install once** - Get `process-ctl` in everyone's PATH
2. **Start with one project** - Create `.process-ctl-cfg` and test
3. **Iterate** - Add configs to other projects gradually  
4. **Standardize** - Create templates and document patterns
5. **Scale** - Use justfiles or other automation as needed

## Troubleshooting

### Service won't start
```bash
# Check configuration
cat .process-ctl-cfg

# Check logs
process-ctl logs

# Check port conflicts
lsof -i :PORT_NUMBER
```

### Stale processes
```bash
# Clean up manually if needed
rm ~/.cache/process-ctl/pids/PROJECT_NAME.pid

# Status will auto-cleanup stale PIDs
process-ctl status
```

### Permission issues
```bash
# Ensure script is executable
chmod +x ~/bin/process-ctl

# Check PATH
echo $PATH | grep -o "$HOME/bin"
```

## Future Extensions

The simple interface leaves room to grow:

- **Health checks** - Add HTTP/TCP endpoint monitoring
- **Process recovery** - Auto-restart crashed services  
- **Workspace management** - Control multiple projects at once
- **Integration** - Hook into monitoring systems
- **Deployment** - Integrate with CI/CD pipelines

The beauty of this approach is adding these features incrementally without breaking the simple `process-ctl start` interface teams love.
