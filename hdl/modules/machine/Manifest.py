if (machine_pkg == "sirius_sr_130M"):
    modules = { "local" : "sirius_sr_130M"}
elif (machine_pkg == "sirius_sr_250M"):
    modules = { "local" : "sirius_sr_250M"}
elif (machine_pkg == "sirius_bo_250M"):
    modules = { "local" : "sirius_bo_250M"}
elif (machine_pkg == "pbpm_fmcpico1M"):
    modules = { "local" : "pbpm_fmcpico1M"}
else:
    quit("Invalid machine module! Check machine_pkg variable!")
