scad_files := $(shell find frames/ -type f)
stl_files := $(patsubst frames/%,stl/%,$(patsubst %.scad,%.stl,$(scad_files)))

.PHONY: all
all: $(stl_files)

stl/%.stl: frames/%.scad frame.scad
	mkdir -p $(dir $@)
	openscad -o $@ $<
