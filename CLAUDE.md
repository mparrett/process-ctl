## Project Overview
Process Control (process-ctl) - A bash-only system for unified process management across development teams. A single-script solution that provides consistent commands for starting, stopping, and monitoring services without complexity.

## Dependencies & Tools
- **Pure Bash** - No package managers, no external dependencies
- **Standard Unix Tools** - Uses `ps`, `lsof`, `kill`, etc.
- **Task Runner** - `just` for common development tasks (optional)

## Development Guidelines
- **Bash-focused** - All implementation in bash scripting
- **Zero Dependencies** - Must work with standard Unix tools only
- **Portable** - Works on macOS and Linux out of the box
- **Simple Interface** - Keep the `process-ctl <command>` interface clean

## Project Structure
- `process-ctl` - Main executable bash script
- `docs/DESIGN_SPEC.md` - Complete design specification
- `.process-ctl-cfg` - Per-project configuration files

## Testing & Validation
- Test on both macOS and Linux
- Verify all commands work: start, daemon, stop, restart, status, logs, tail
- Test configuration discovery (walks up directory tree)
- Validate PID file cleanup and port conflict detection

## Conductor Integration
This project is managed by the Claude Conductor system:
- **Worker Communication**: Messages sent via conductor CLI
- **Status Monitoring**: Participates in conductor status checks
- **Permission Handling**: Uses conductor-compatible permission prompts
- **Context Management**: Follows conductor context management protocols

## Work Management
- **Priorities**: Maintain `CURRENT_PRIORITIES.md` for active work tracking
- **Context**: Use `workspace/SCRATCHPAD_CONTEXT.md` for session state
- **Documentation**: Follow team documentation standards

## Development Philosophy
- **Fail Fast, Fail Loud**: Clear error messages over silent failures
- **Explicit over Implicit**: Clear intentions and documented decisions
- **Test-Driven**: Validate functionality before completion
- **Unix Philosophy**: Do one thing well, compose with other tools
