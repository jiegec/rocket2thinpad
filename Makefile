JOBS = 16
ROCKET_DIR ?= $(BASE_DIR)/rocket-chip
TOP_MODULE_PROJECT ?= thinpad
TOP_MODULE ?= RocketChip
CONFIG ?= ThinpadFPGAConfig

BASE_DIR = $(abspath .)
BUILD = $(BASE_DIR)/build
SRC = $(BASE_DIR)/src

SHELL := /bin/bash

# Taken from rocket chip 2a5aeea. TODO: Maybe source this directly from makefrag?
SBT ?= java -Xmx2G -Xss8M -jar $(ROCKET_DIR)/sbt-launch.jar

FIRRTL_JAR ?= $(ROCKET_DIR)/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -cp $(FIRRTL_JAR) firrtl.Driver

all: $(BUILD)/$(TOP_MODULE_PROJECT).$(CONFIG).v

$(FIRRTL_JAR): $(shell find $(ROCKET_DIR)/firrtl/src/main/scala -iname "*.scala" 2> /dev/null)
	$(MAKE) -C $(ROCKET_DIR)/firrtl SBT="$(SBT)" root_dir=$(ROCKET_DIR)/firrtl build-scala

CHISEL_ARGS := $(BUILD)

LOOKUP_SCALA_SRCS = $(shell find $(1)/. -iname "*.scala" 2> /dev/null)
BOOTROM := $(shell find bootrom -iname "*.img" 2> /dev/null)

$(BUILD)/$(TOP_MODULE_PROJECT).$(CONFIG).fir: $(call LOOKUP_SCALA_SRCS,$(SRC)) $(BOOTROM)
	mkdir -p $(@D)
	$(SBT) "runMain freechips.rocketchip.system.Generator $(CHISEL_ARGS) $(TOP_MODULE_PROJECT) $(TOP_MODULE) $(TOP_MODULE_PROJECT) $(CONFIG)"

$(BUILD)/$(TOP_MODULE_PROJECT).$(CONFIG).v: $(BUILD)/$(TOP_MODULE_PROJECT).$(CONFIG).fir $(FIRRTL_JAR)
	$(FIRRTL) -i $< -o $@ -X verilog
	cp $@ $@.bak
	sed 's/wire \[63:0\] coreMonitorBundle/(* mark_debug="true" *) \0/g' $@.bak > $@

clean:
	rm -rf build/*

.PHONY:  all clean
