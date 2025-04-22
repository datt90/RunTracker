SHELL := /bin/bash
CWD := $(shell cd -P -- '$(shell dirname -- "$0")' && pwd -P)

echo:
	@echo WELLCOME
	@echo $(CWD)
init_env:
	brew install carthage
	brew install xcodegen
install:
	swift -target arm64-apple-macosx15.0 installer.swift -template Template
