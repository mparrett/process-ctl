# Scratchpad Context

## Current Session State
- **Project**: process-ctl - bash-only process management system
- **Phase**: Initial bootstrap and setup
- **Goal**: Create conductor-compatible project structure

## Key Insights
- Pure bash implementation, zero dependencies
- Single script approach for simplicity
- Configuration discovery walks up directory tree
- Standard Unix tools only (ps, lsof, kill, etc.)
- File locations: PID files in `~/.cache/process-ctl/pids/`, logs in `~/.cache/process-ctl/logs/`

## Next Steps
1. Implement core process-ctl script with argument parsing
2. Add configuration discovery and parsing
3. Implement basic process management commands
4. Add robust error handling and cleanup

## Important Context
- This is a conductor-managed project (tmux orchestration)
- Must follow conductor protocols for communication
- Focus on Unix philosophy: do one thing well
- Design spec is in `docs/DESIGN_SPEC.md`