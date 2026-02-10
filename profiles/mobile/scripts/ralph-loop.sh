#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

for ((i=1; i<=$1; i++)); do
  result=$(docker sandbox run claude --permission-mode acceptEdits -p "@prd.json @progress.txt \
  1. Read the prd.json and progress.text file. \
  2. Find the next incomplete task. \
  3. Create a new branch for your work. Branch off ralph-integration. \
  4. Implement the task fully. You should be 100% confident it works as expected/designed. \
  5. Add/Update XCUIAutomation tests (do not run tests). \
  6. Update any relevant documentation. \
  7. Update progress.txt with what you did. \
  8. Set 'passes' to true in prd.json for the item you completed and validated via automated testing. \
  9. Commit all changes to the new branch. \
  10. Locally merge the new branch into ralph-integration. No need to create PR on GitHub. \
  ONLY WORK ON A SINGLE FEATURE PER BRANCH. \
  If the PRD is complete, output <promise>COMPLETE</promise>.")

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "PRD complete after $i iterations."
    exit 0
  fi
done