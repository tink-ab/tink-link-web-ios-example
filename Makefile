all:

bootstrap:
ifeq ($(strip $(shell command -v brew 2> /dev/null)),)
	$(error "`brew` is not available, please install homebrew")
endif
	brew install swiftlint swiftformat 2> /dev/null

lint:
ifeq ($(strip $(shell command -v swiftlint 2> /dev/null)),)
	$(error "`swiftlint` is not available, please run `make bootstrap` first")
endif
	swiftlint 2> /dev/null

format:
ifeq ($(strip $(shell command -v swiftformat 2> /dev/null)),)
	$(error "`swiftformat` is not available, please run `make bootstrap` first")
endif
	swiftformat .

release: format lint
