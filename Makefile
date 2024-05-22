TARGETS := init vfork execl run signal

CC := $(ARCH)-linux-gnu-gcc
STRIP := $(ARCH)-linux-gnu-strip
DST_DIR := ./build/$(ARCH)/sbin
PREFIX_TARGETS := $(addprefix $(DST_DIR)/,$(TARGETS))

all: $(PREFIX_TARGETS)

$(DST_DIR)/%: %.c
	@mkdir -p $(DST_DIR)
	$(CC) $< -o $@
	$(STRIP) $@

clean:
	@rm -rf ./build
