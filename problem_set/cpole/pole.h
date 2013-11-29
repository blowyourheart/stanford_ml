/* ----------------------------------------------------------------------
    This file contains parameters for the cart and pole dynamic system
    program, pole.c.  In the first section are the reinforcement algorithm 
    parameters, and in the second section are the parameters particular to
    the cart-pole simulation.   

 These routines were written by Rich Sutton and Chuck Anderson.  Claude Sammut 
 translated parts from Fortran to C.  Please address correspondence to
 Rich at

                GTE Laboratories Incorporated
		40 Sylvan Road
		Waltham, MA  02254

 or send email to     sutton@gte.com   or   anderson@cs.colostate.edu
---------------------------------------------------------------------- */

/* Parameters for reinforcement algorithm.  */                          

#define min(x, y)               ((x <= y) ? x : y)
#define max(x, y)	        ((x >= y) ? x : y)
#define prob_push_right(s)      (1.0 / (1.0 + exp(-max(-50.0, min(s, 50.0)))))
#define random                  ((float) rand() / (float)((1 << 31) - 1))

#define N_BOXES         162         /* Number of disjoint boxes of state space. */
#define ALPHA		1000        /* Learning rate for action weights, w. */
#define BETA		0.5         /* Learning rate for critic weights, v. */
#define GAMMA		0.95        /* Discount factor for critic. */
#define LAMBDAw		0.9         /* Decay rate for w eligibility trace. */
#define LAMBDAv		0.8         /* Decay rate for v eligibility trace. */

#define MAX_FAILURES     300         /* Termination criterion. */
#define MAX_STEPS        100000

#define RUNS 1


/*** Parameters for simulation ***/

#define GRAVITY 9.8
#define MASSCART 1.0
#define MASSPOLE 0.1
#define TOTAL_MASS (MASSPOLE + MASSCART)
#define LENGTH 0.5		  /* actually half the pole's length */
#define POLEMASS_LENGTH (MASSPOLE * LENGTH)
#define FORCE_MAG 10.0
#define TAU 0.02		  /* seconds between state updates */
#define FOURTHIRDS 1.3333333333333

