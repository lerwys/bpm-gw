target = "xilinx"
action = "synthesis"

language = "vhdl"

# Allow the user to override fetchto using:
#  hdlmake -p "fetchto='xxx'"
if locals().get('fetchto', None) is None:
    fetchto = "../../ip_cores"

syn_device = "xc7a200t"
syn_grade = "-2"
syn_package = "ffg1156"
syn_top = "dbe_bpm2_with_dcc"
syn_project = "dbe_bpm2_with_dcc"
syn_tool = "vivado"
syn_properties = [
    ["steps.synth_design.args.more options", "-verbose"],
    ["steps.synth_design.args.retiming", "1"],
    ["steps.synth_design.args.assert", "1"],
    ["steps.opt_design.args.verbose", "1"],
    ["steps.opt_design.args.directive", "ExploreWithRemap"],
    ["steps.opt_design.is_enabled", "1"],
    ["steps.phys_opt_design.args.directive", "Explore"],
    ["steps.phys_opt_design.args.more options", "-verbose"],
    ["steps.phys_opt_design.is_enabled", "1"],
    ["steps.route_design.args.directive", "NoTimingRelaxation"],
    ["steps.route_design.args.more options", "-tns_cleanup"],
    ["steps.post_route_phys_opt_design.args.directive", "Explore"],
    ["steps.post_route_phys_opt_design.args.more options", "-verbose"],
    ["steps.post_route_phys_opt_design.is_enabled", "1"],
    ["steps.write_bitstream.args.verbose", "1"],
    ["steps.write_bitstream.args.bin_file", "true",  "get_runs impl_1"]
]

board = "afc"

# For appending the afc_ref_design.xdc to synthesis
afc_base_xdc = ['acq']

files = []

import os
import sys
if os.path.isfile("synthesis_descriptor_pkg.vhd"):
    files.append("synthesis_descriptor_pkg.vhd");
else:
    sys.exit("Generate the SDB descriptor before using HDLMake (./build_synthesis_sdb.sh)")

# TCL commands file
files.append("../commands.tcl")

machine_pkg = "sirius_bo_250M";

# Pass more XDC to afc-gw so it will merge it last with
# other .xdc. We need this as we depend on variables defined
# on afc_base xdc files.
xdc_files = [
    "../dbe_common/dbe_bpm2.xdc",
    "../dbe_common/afc_p2p_gts.xdc",
]

additional_xdc = []
for f in xdc_files:
    additional_xdc.append(os.path.abspath(f))

modules = {
    "local" : [
        "../../../top/afc_v3/dbe_bpm2_with_dcc"
    ]
}
