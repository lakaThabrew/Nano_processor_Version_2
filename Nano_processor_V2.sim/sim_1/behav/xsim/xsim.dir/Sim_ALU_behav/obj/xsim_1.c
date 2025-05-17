/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_128(char*, char *);
extern void execute_17(char*, char *);
extern void execute_18(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_85(char*, char *);
extern void execute_86(char*, char *);
extern void execute_87(char*, char *);
extern void execute_88(char*, char *);
extern void execute_90(char*, char *);
extern void execute_92(char*, char *);
extern void execute_94(char*, char *);
extern void execute_96(char*, char *);
extern void execute_98(char*, char *);
extern void execute_100(char*, char *);
extern void execute_102(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_127(char*, char *);
extern void execute_109(char*, char *);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[40] = {(funcp)execute_128, (funcp)execute_17, (funcp)execute_18, (funcp)execute_19, (funcp)execute_20, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_29, (funcp)execute_30, (funcp)execute_24, (funcp)execute_25, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_85, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_90, (funcp)execute_92, (funcp)execute_94, (funcp)execute_96, (funcp)execute_98, (funcp)execute_100, (funcp)execute_102, (funcp)execute_104, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_127, (funcp)execute_109, (funcp)execute_110, (funcp)execute_111, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 40;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Sim_ALU_behav/xsim.reloc",  (void **)funcTab, 40);
	iki_vhdl_file_variable_register(dp + 18256);
	iki_vhdl_file_variable_register(dp + 18312);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Sim_ALU_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Sim_ALU_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern int xsim_argc_copy ;
extern char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Sim_ALU_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Sim_ALU_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Sim_ALU_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
