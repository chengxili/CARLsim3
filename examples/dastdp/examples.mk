# module include file for random example program
example := dastdp
output := *.dot *.txt *.log

# local info (vars can be overwritten)
local_dir := examples/$(example)
local_src := $(local_dir)/main_$(example).cpp
local_prog := $(local_dir)/$(example)

# info passed up to Makefile
sources += $(local_src)
carlsim_programs += $(local_prog)
output_files += $(addprefix $(local_dir)/,$(output))
all_targets += $(local_prog)

.PHONY: $(example)
$(example): $(local_src) $(local_prog)

$(local_prog): $(local_src) $(carlsim_deps) $(carlsim_objs)
	$(NVCC) $(CARLSIM_INCLUDES) $(CARLSIM_FLAGS) $(CARLSIM_LFLAGS) \
	$(CARLSIM_LIBS) $(carlsim_objs) $< -o $@
