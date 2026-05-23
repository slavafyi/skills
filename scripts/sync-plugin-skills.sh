#!/usr/bin/env bash
set -euo pipefail

# Sync shared skills into Claude and Codex plugin folders.

START_DIR=$(pwd -P)
ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." >/dev/null && pwd -P)
DRY_RUN=0
CLEAN=1

usage() {
  cat <<'EOF'
Usage: sync-plugin-skills.sh [--root PATH] [--dry-run] [--no-clean]

Copy skills/<plugin>/ into claude-plugins/<plugin>/skills and codex-plugins/<plugin>/skills.

Options:
  --root PATH  Repository root. Defaults to the parent of scripts/.
  --dry-run    Print planned changes without copying files.
  --no-clean   Merge files instead of replacing plugin skills directories.
  -h, --help   Show this help message.
EOF
}

display_path() {
  local path=$1

  if [[ $path == "$START_DIR" ]]; then
    printf '.'
  elif [[ $path == "$START_DIR"/* ]]; then
    printf '%s' "${path#"$START_DIR"/}"
  else
    printf '%s' "$path"
  fi
}

while (($#)); do
  case $1 in
  --root)
    if (($# < 2)); then
      printf 'Missing value for --root\n' >&2
      exit 2
    fi
    ROOT=$2
    shift 2
    ;;
  --root=*)
    ROOT=${1#--root=}
    shift
    ;;
  --dry-run)
    DRY_RUN=1
    shift
    ;;
  --no-clean)
    CLEAN=0
    shift
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  *)
    printf 'Unknown argument: %s\n' "$1" >&2
    usage >&2
    exit 2
    ;;
  esac
done

ROOT=$(cd -- "$ROOT" >/dev/null && pwd -P)
SOURCE_ROOT=$ROOT/skills
COPIED=0

if [ ! -d "$SOURCE_ROOT" ]; then
  printf 'Missing skills directory: %s\n' "$(display_path "$SOURCE_ROOT")" >&2
  exit 1
fi

for plugin_root in "$ROOT"/claude-plugins "$ROOT"/codex-plugins; do
  [ -d "$plugin_root" ] || continue

  for plugin in "$plugin_root"/*; do
    [ -d "$plugin" ] || continue

    name=${plugin##*/}
    source=$SOURCE_ROOT/$name
    destination=$plugin/skills

    if [ ! -d "$source" ]; then
      printf 'Skipping %s: no matching source skills directory at %s\n' \
        "$(display_path "$plugin")" "$(display_path "$source")" >&2
      continue
    fi

    if ((DRY_RUN)); then
      if ((CLEAN)); then
        printf 'Would replace %s with %s\n' "$(display_path "$destination")" "$(display_path "$source")"
      else
        printf 'Would merge into %s with %s\n' "$(display_path "$destination")" "$(display_path "$source")"
      fi
    else
      ((CLEAN)) && rm -rf "$destination"
      mkdir -p "$destination"
      cp -pR "$source"/. "$destination"/
    fi

    COPIED=$((COPIED + 1))
  done
done

if ((COPIED == 0)); then
  printf 'No plugin skills were copied.\n' >&2
  exit 1
fi
