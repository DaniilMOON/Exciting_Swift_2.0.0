BREW := /usr/local/bin/brew
ROOT_DIRECTORY=.

all: bootstrap

## swiftgen: Trigger code generation from assets with swiftgen tool
swiftgen:
	@echo "Generate resources locally"
	mint run swiftgen

.PHONY: swiftgen