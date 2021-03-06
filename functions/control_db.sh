function control_db ()
{
  local type="$1"
  local launch_agent=""

  case "$type" in
  "mongo")
    launch_agent=~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    ;;
  "mysql")
    launch_agent=~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    ;;
  "postgresql")
    launch_agent=~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    ;;
  "redis")
    launch_agent=~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    ;;
  "memcached")
    launch_agent=~/Library/LaunchAgents/com.danga.memcached.plist
    ;;
  * )
    echo "Unknown database"
    return
    ;;
  esac

  local action="$2"
  local launch_command=""

  case "$action" in
  "start")
    launch_command="load -F"
    ;;
  "stop")
    launch_command="unload -w"
    ;;
  * )
    echo "Unknown action"
    return
    ;;
  esac

  launchctl $launch_command $launch_agent
}
