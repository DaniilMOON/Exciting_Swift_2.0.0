BREW := /usr/local/bin/brew
ROOT_DIRECTORY=.

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	@echo "Generate resources locally"
	mint run swiftgen

.PHONY: swiftgen