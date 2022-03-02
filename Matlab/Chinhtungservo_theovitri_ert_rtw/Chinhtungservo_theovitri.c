/*
 * File: Chinhtungservo_theovitri.c
 *
 * Code generated for Simulink model 'Chinhtungservo_theovitri'.
 *
 * Model version                  : 1.11
 * Simulink Coder version         : 8.10 (R2016a) 10-Feb-2016
 * C/C++ source code generated on : Fri Dec 22 20:24:54 2017
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "Chinhtungservo_theovitri.h"
#include "Chinhtungservo_theovitri_private.h"

/* Real-time model */
RT_MODEL_Chinhtungservo_theov_T Chinhtungservo_theovitri_M_;
RT_MODEL_Chinhtungservo_theov_T *const Chinhtungservo_theovitri_M =
  &Chinhtungservo_theovitri_M_;
real_T rt_roundd_snf(real_T u)
{
  real_T y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

/* Model step function */
void Chinhtungservo_theovitri_step(void)
{
  /* local block i/o variables */
  real_T rtb_Clock;
  real_T x;
  uint8_T tmp;

  /* Clock: '<Root>/Clock' */
  rtb_Clock = Chinhtungservo_theovitri_M->Timing.t[0];

  /* MATLAB Function: '<Root>/MATLAB Function6' incorporates:
   *  Constant: '<Root>/Constant1'
   */
  /* MATLAB Function 'MATLAB Function6': '<S1>:1' */
  /* '<S1>:1:4' deta2=deta(: , 1); */
  /* '<S1>:1:5' Deta2=deta2*180/pi; */
  /* '<S1>:1:6' k = mod(round(u/ts), 101)+1; */
  x = rt_roundd_snf(rtb_Clock / Chinhtungservo_theovitri_P.ts);

  /* DataTypeConversion: '<S2>/Data Type Conversion' incorporates:
   *  Constant: '<Root>/Constant14'
   *  Constant: '<Root>/Constant5'
   *  Gain: '<Root>/Gain4'
   *  MATLAB Function: '<Root>/MATLAB Function6'
   *  Sum: '<Root>/Sum'
   */
  /* '<S1>:1:8' y=Deta2(k); */
  x = Chinhtungservo_theovitri_P.deta[(int32_T)((x - floor(x / 101.0) * 101.0) +
    1.0) - 1] * 180.0 / 3.1415926535897931 *
    Chinhtungservo_theovitri_P.Gain4_Gain +
    Chinhtungservo_theovitri_P.Constant5_Value;
  if (x < 256.0) {
    if (x >= 0.0) {
      tmp = (uint8_T)x;
    } else {
      tmp = 0U;
    }
  } else {
    tmp = MAX_uint8_T;
  }

  /* End of DataTypeConversion: '<S2>/Data Type Conversion' */

  /* S-Function (arduinoservowrite_sfcn): '<S2>/Servo Write' */
  MW_servoWrite(Chinhtungservo_theovitri_P.ServoWrite_p1, tmp);

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++Chinhtungservo_theovitri_M->Timing.clockTick0)) {
    ++Chinhtungservo_theovitri_M->Timing.clockTickH0;
  }

  Chinhtungservo_theovitri_M->Timing.t[0] =
    Chinhtungservo_theovitri_M->Timing.clockTick0 *
    Chinhtungservo_theovitri_M->Timing.stepSize0 +
    Chinhtungservo_theovitri_M->Timing.clockTickH0 *
    Chinhtungservo_theovitri_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.02s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 0.02, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    Chinhtungservo_theovitri_M->Timing.clockTick1++;
    if (!Chinhtungservo_theovitri_M->Timing.clockTick1) {
      Chinhtungservo_theovitri_M->Timing.clockTickH1++;
    }
  }
}

/* Model initialize function */
void Chinhtungservo_theovitri_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)Chinhtungservo_theovitri_M, 0,
                sizeof(RT_MODEL_Chinhtungservo_theov_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&Chinhtungservo_theovitri_M->solverInfo,
                          &Chinhtungservo_theovitri_M->Timing.simTimeStep);
    rtsiSetTPtr(&Chinhtungservo_theovitri_M->solverInfo, &rtmGetTPtr
                (Chinhtungservo_theovitri_M));
    rtsiSetStepSizePtr(&Chinhtungservo_theovitri_M->solverInfo,
                       &Chinhtungservo_theovitri_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&Chinhtungservo_theovitri_M->solverInfo,
                          (&rtmGetErrorStatus(Chinhtungservo_theovitri_M)));
    rtsiSetRTModelPtr(&Chinhtungservo_theovitri_M->solverInfo,
                      Chinhtungservo_theovitri_M);
  }

  rtsiSetSimTimeStep(&Chinhtungservo_theovitri_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&Chinhtungservo_theovitri_M->solverInfo,"FixedStepDiscrete");
  rtmSetTPtr(Chinhtungservo_theovitri_M,
             &Chinhtungservo_theovitri_M->Timing.tArray[0]);
  Chinhtungservo_theovitri_M->Timing.stepSize0 = 0.02;

  /* Start for S-Function (arduinoservowrite_sfcn): '<S2>/Servo Write' */
  MW_servoAttach(Chinhtungservo_theovitri_P.ServoWrite_p1,
                 Chinhtungservo_theovitri_P.ServoWrite_pinNumber);
}

/* Model terminate function */
void Chinhtungservo_theovitri_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
