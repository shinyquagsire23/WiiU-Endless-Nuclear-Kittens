.SUFFIXES:

ifeq ($(strip $(WUT_ROOT)),)
$(error "Please ensure WUT_ROOT is in your environment.")
endif

ifeq ($(findstring CYGWIN,$(shell uname -s)),CYGWIN)
ROOT := $(shell cygpath -w ${CURDIR})
WUT_ROOT := $(shell cygpath -w ${WUT_ROOT})
else
ROOT := $(CURDIR)
endif

include $(WUT_ROOT)/rules/rpl.mk

TARGET   := $(notdir $(CURDIR))
BUILD    := build
SOURCE   := src src/nuclear src/screens src/weapon src/entity src/entity/projectile src/entity/enemy src/entity/graphic src/geom src/wiiu src/wiiu/matrix src/animator
INCLUDE  := include src src/nuclear src/screens src/weapon src/entity src/entity/projectile src/entity/enemy src/entity/graphic src/geom src/wiiu src/wiiu/matrix src/animator
DATA     := data
LIBPATHS += -L$(ROOT)/../minlibd/libdruntime
LIBS     := -lcrt -lgcc -lm -lcoreinit -lgx2 -lvpad -lproc_ui -lsysapp -lgd -lpng -lz -ljpeg -lfreetype -lm -ldruntime

DFLAGS   += -fno-builtin -I$(ROOT)/../minlibd/libdruntime -I$(ROOT)/../include_d 
CFLAGS   += -O2 -Wall -std=c11
CXXFLAGS += -O2 -Wall

ifneq ($(BUILD),$(notdir $(CURDIR)))

export OUTPUT   := $(ROOT)/$(TARGET)
export VPATH    := $(foreach dir,$(SOURCE),$(ROOT)/$(dir)) \
                   $(foreach dir,$(DATA),$(ROOT)/$(dir))
export BUILDDIR := $(ROOT)
export DEPSDIR  := $(BUILDDIR)

DFILES    := $(foreach dir,$(SOURCE),$(notdir $(wildcard $(dir)/*.d)))
CFILES    := $(foreach dir,$(SOURCE),$(notdir $(wildcard $(dir)/*.c)))
CXXFILES  := $(foreach dir,$(SOURCE),$(notdir $(wildcard $(dir)/*.cpp)))
SFILES    := $(foreach dir,$(SOURCE),$(notdir $(wildcard $(dir)/*.S)))

ifeq ($(strip $(CXXFILES)),)
export LD := $(CC)
else
export LD := $(CXX)
endif

export OFILES := $(DFILES:.d=.o) \
                 $(CFILES:.c=.o) \
                 $(CXXFILES:.cpp=.o) \
                 $(SFILES:.S=.o)
export INCLUDES := $(foreach dir,$(INCLUDE),-I$(ROOT)/$(dir)) \
                   -I$(ROOT)/$(BUILD) -I $(DEVKITPPC)/include

.PHONY: $(BUILD) clean

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(ROOT)/Makefile

clean:
	@echo "[RM]  $(notdir $(OUTPUT))"
	@rm -rf $(BUILD) $(OUTPUT).elf $(OUTPUT).rpx $(OUTPUT).a
	@rm $(OUTPUT)/code/*.rpx

else

DEPENDS	:= $(OFILES:.o=.dep)

$(OUTPUT).woomy: $(OUTPUT).rpx
	cp $(OUTPUT).rpx $(OUTPUT)/code/
	makefst -out $(OUTPUT).woomy -name "Endless Nuclear Kittens" -internal "Application" -entry "nuclear" -icon "$(OUTPUT)/meta/iconTex.tga" $(OUTPUT)/
$(OUTPUT).rpx: $(OUTPUT).elf
$(OUTPUT).elf: $(OFILES)

-include $(DEPENDS)

endif
