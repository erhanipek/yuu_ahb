clean:
	@rm .[a-zA-Z0-9]* -rf
	@ls | grep -v Makefile | grep -v bench.f | grep -v top.sv | xargs rm -rf
	@echo clean done
	
comp:
	@mkdir -p log
	vcs -sverilog -full64 ${ADD} -debug_acc+all \
			-q -ntb_opts uvm -lca -kdb \
			-f bench.f \
			-l log/compile.log

case:
	@ls ../test | grep case | cut -d "." -f 1

run:
	simv +UVM_TESTNAME=${CASE} -l log/sim.log ${ADD}
