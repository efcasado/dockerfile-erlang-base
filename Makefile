###========================================================================
### File: Makefile
###
### Author(s): Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
###========================================================================
.PHONY: all build test


##=========================================================================
## Settings
##=========================================================================

ENV      ?= dev

VERSIONS ?= 18.1     \
			18.0     \
			17.5     \
			17.1     \
			R16B03-1 \
			R15B03   \
			R14B04


##=========================================================================
## Macros
##=========================================================================

PROJECT       := erlang-base

BUILD_TARGETS := $(patsubst %,bld-%,$(VERSIONS))
TEST_TARGETS  := $(patsubst %,test-%,$(VERSIONS))

GIT_TAG       := $(shell git describe --tags 2> /dev/null)
GIT_BRANCH    := $(shell git rev-parse --abbrev-ref HEAD 2> /dev/null)
GIT_COMMIT    := $(shell git rev-parse --short HEAD 2> /dev/null)

ifeq ($(ENV),snapshot)
VERSION       := $(GIT_BRANCH)-git$(GIT_COMMIT)
else ifeq ($(ENV),release)
VERSION       := $(GIT_TAG)
endif


ifeq ($(ENV),dev)
define TAG
$(PROJECT):$(1)
endef
else
define TAG
$(PROJECT):$(1)-$(VERSION)
endef
endif

DOCKER=$(shell which docker)


##=========================================================================
## Targets
##=========================================================================

all: | build test

build: $(BUILD_TARGETS)

bld-%: %/Dockerfile
	docker build -t $(call TAG,$*) $*

$(VERSIONS):
	mkdir -p $@

%/Dockerfile: %
	mustache vars/$*.yml Dockerfile.in > $*/Dockerfile

test: $(TEST_TARGETS)

DOCKER_OPTS := --rm -it
test-%:
	@echo "[TEST] $*"
	@case $* in \
		R*) $(DOCKER) run $(DOCKER_OPTS) erlang-base:$* erl -noshell -eval "\"$*\" = erlang:system_info(otp_release)." -s init stop ;; \
		*) $(DOCKER) run $(DOCKER_OPTS) erlang-base:$* erl -noshell -eval "{ok, <<\"$*\\n\">>} = file:read_file(filename:join([code:root_dir(), \"releases\", erlang:system_info(otp_release), \"OTP_VERSION\"]))." -s init stop ;; \
	esac
