# Enable loading .env
set dotenv-load	:= true

# Default
default:
  just --list

# Main
dev OPTS="":
 #HUGO_FLECHES_SHEET_ID is in .env
 hugo server --enableGitInfo --renderToMemory --watch {{OPTS}}

clean:
  rm -rf public/*

data:
    duckdb :memory: < scripts/extract.sql > assets/fleches/results.json
