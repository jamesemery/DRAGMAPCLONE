USE_BAM ?= 0
ifeq (,$(REFERENCE))
$(error REFERENCE is a required variable)
endif

FASTQALL:=$(REFERENCE)/paired.fastq
FASTQR1:=$(REFERENCE)/single.fastq

OUTPUT:=$(REFERENCE)/runs$(BASELINE_ID)
ID:=
GOOD_ID:=

STATIC_PREFIX:=dna
BASELINE_PREFIX:=$(OUTPUT)/$(STATIC_PREFIX)
GOOD_PREFIX:=$(BASELINE_PREFIX)

#USER_PARAMS:= --Aligner.vectorized-sw yes
PE_STATS:=--Aligner.pe-stat-mean-insert 209.814 --Aligner.pe-stat-stddev-insert 80.7387 \
--Aligner.pe-stat-quartiles-insert '154 198 260' --Aligner.pe-stat-mean-read-len 142.043
STATIC_PARAMS:= --RGID rgid --RGSM rgsm --ref-load-hash-bin false --preserve-map-align-order true


DRAGEN_OS_MAKE_DIR?=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ifeq (,$(DRAGEN_OS_MAKE_DIR))
$(error Failed to infer DRAGEN_OS_MAKE_DIR from MAKEFILE_LIST: $(MAKEFILE_LIST))
endif

include $(DRAGEN_OS_MAKE_DIR)/validate_core.mk

