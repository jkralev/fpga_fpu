/*
 * File: ert_main.c
 *
 * Real-Time Workshop code generated for Simulink model Helicopter_Server1.
 *
 * Model version                        : 1.113
 * Real-Time Workshop file version      : 7.6  (R2010b)  03-Aug-2010
 * Real-Time Workshop file generated on : Mon Oct 29 22:11:27 2012
 * TLC version                          : 7.6 (Jul 13 2010)
 * C/C++ source code generated on       : Mon Oct 29 22:11:28 2012
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Generic->32-bit x86 compatible
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include <stdio.h>                     /* This ert_main.c example uses printf/fflush */
#include "Helicopter_Server1.h"        /* Model's header file */
#include "rtwtypes.h"                  /* MathWorks types */
#include "windows.h"

/*
 * Associating rt_OneStep with a real-time clock or interrupt service routine
 * is what makes the generated code "real-time".  The function rt_OneStep is
 * always associated with the base rate of the model.  Subrates are managed
 * by the base rate from inside the generated code.  Enabling/disabling
 * interrupts and floating point context switches are target specific.  This
 * example code indicates where these should take place relative to executing
 * the generated code step function.  Overrun behavior should be tailored to
 * your application needs.  This example simply sets an error status in the
 * real-time model and returns from rt_OneStep.
 */
void rt_OneStep(void);
void rt_OneStep(void)
{ 
  static boolean_T OverrunFlag = FALSE;
  LARGE_INTEGER buf;
	LARGE_INTEGER t;
	int bufi;
    
     QueryPerformanceCounter(&t);
     buf=t; bufi=0;

  /* Disable interrupts here */

  /* Check for overrun */
  if (OverrunFlag) {
    rtmSetErrorStatus(Helicopter_Server1_M, "Overrun");
    return;
  }

  OverrunFlag = TRUE;

  /* Save FPU context here (if necessary) */
  /* Re-enable timer or interrupt here */
  /* Set model inputs here */

  /* Step the model for base rate */
  Helicopter_Server1_step(0);

  /* Get model outputs here */

  /* Indicate task complete */
  OverrunFlag = FALSE;

	//3579545
	while (bufi<3579) {
		Sleep(0);
		QueryPerformanceCounter(&t);
 		bufi=(int)((__int64)t.QuadPart - (__int64)buf.QuadPart);
    }

  /* Disable interrupts here */
  /* Restore FPU context here (if necessary) */
  /* Enable interrupts here */
}

/*
 * The example "main" function illustrates what is required by your
 * application code to initialize, execute, and terminate the generated code.
 * Attaching rt_OneStep to a real-time clock is target specific.  This example
 * illustates how you do this relative to initializing the model.
 */
int_T main(int_T argc, const char_T *argv[]);
int_T main(int_T argc, const char_T *argv[])
{
  /* Initialize model */
  Helicopter_Server1_initialize();

  /* Simulating the model step behavior (in non real-time) to
   *  simulate model behavior at stop time.
   */
  while ((rtmGetErrorStatus(Helicopter_Server1_M) == (NULL)) &&
         !rtmGetStopRequested(Helicopter_Server1_M)) {
    rt_OneStep();
  }

  /* Disable rt_OneStep() here */

  /* Terminate model */
  Helicopter_Server1_terminate();
  return 0;
}

/*
 * File trailer for Real-Time Workshop generated code.
 *
 * [EOF]
 */
