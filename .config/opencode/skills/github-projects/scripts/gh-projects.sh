#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  gh-projects.sh list-projects --owner <owner> [--closed] [--limit N]
  gh-projects.sh list-items --owner <owner> --project <number> [--limit N]
  gh-projects.sh create-item --owner <owner> --project <number> --title <title> --body <body>
  gh-projects.sh add-item --owner <owner> --project <number> --url <url>
EOF
}

cmd="${1:-}"
if [[ -z "$cmd" ]]; then
  usage
  exit 1
fi
shift || true

owner=""
project=""
title=""
body=""
url=""
closed=false
limit=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --owner)
      owner="${2:-}"
      shift 2
      ;;
    --project)
      project="${2:-}"
      shift 2
      ;;
    --title)
      title="${2:-}"
      shift 2
      ;;
    --body)
      body="${2:-}"
      shift 2
      ;;
    --url)
      url="${2:-}"
      shift 2
      ;;
    --limit)
      limit="${2:-}"
      shift 2
      ;;
    --closed)
      closed=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown flag: $1" >&2
      usage
      exit 1
      ;;
  esac
done

case "$cmd" in
  list-projects)
    [[ -n "$owner" ]] || { echo "--owner required" >&2; exit 1; }
    args=(project list --owner "$owner" --format json)
    [[ -n "$limit" ]] && args+=(--limit "$limit")
    [[ "$closed" == true ]] && args+=(--closed)
    gh "${args[@]}"
    ;;
  list-items)
    [[ -n "$owner" ]] || { echo "--owner required" >&2; exit 1; }
    [[ -n "$project" ]] || { echo "--project required" >&2; exit 1; }
    args=(project item-list "$project" --owner "$owner" --format json)
    [[ -n "$limit" ]] && args+=(--limit "$limit")
    gh "${args[@]}"
    ;;
  create-item)
    [[ -n "$owner" ]] || { echo "--owner required" >&2; exit 1; }
    [[ -n "$project" ]] || { echo "--project required" >&2; exit 1; }
    [[ -n "$title" ]] || { echo "--title required" >&2; exit 1; }
    [[ -n "$body" ]] || { echo "--body required" >&2; exit 1; }
    gh project item-create "$project" --owner "$owner" --title "$title" --body "$body"
    ;;
  add-item)
    [[ -n "$owner" ]] || { echo "--owner required" >&2; exit 1; }
    [[ -n "$project" ]] || { echo "--project required" >&2; exit 1; }
    [[ -n "$url" ]] || { echo "--url required" >&2; exit 1; }
    gh project item-add "$project" --owner "$owner" --url "$url"
    ;;
  *)
    echo "Unknown command: $cmd" >&2
    usage
    exit 1
    ;;
esac
