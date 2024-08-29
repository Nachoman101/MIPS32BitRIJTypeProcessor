transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+RIJTypeDatapath  -L xil_defaultlib -L xlslice_v1_0_3 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.RIJTypeDatapath xil_defaultlib.glbl

do {RIJTypeDatapath.udo}

run 1000ns

endsim

quit -force
