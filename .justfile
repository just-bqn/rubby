default:

get-version *tag:
  sh ./scripts/get-version.sh {{tag}}

get-version-tag *tag:
  echo "v$(just get-version '{{tag}}')"

generate-title *tag:
  sh ./scripts/generate-title.sh {{tag}}

generate-notes *tag:
  sh ./scripts/generate-notes.sh {{tag}}

create-release *tag:
  gh release create "$(just get-version-tag '{{tag}}')" --title "$(just generate-title '{{tag}}')" --notes "$(just generate-notes '{{tag}}')"
