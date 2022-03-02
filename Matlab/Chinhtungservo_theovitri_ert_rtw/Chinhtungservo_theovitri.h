/*
 * File: Chinhtungservo_theovitri.h
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

#ifndef RTW_HEADER_Chinhtungservo_theovitri_h_
#define RTW_HEADER_Chinhtungservo_theovitri_h_
#include <math.h>
#include <string.h>
#include <stddef.h>
#ifndef Chinhtungservo_theovitri_COMMON_INCLUDES_
# define Chinhtungservo_theovitri_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "arduino_servowrite_lct.h"
#endif                                 /* Chinhtungservo_theovitri_COMMON_INCLUDES_ */

#include "Chinhtungservo_theovitri_types.h"
#include "MW_target_hardware_resources.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

/* Parameters (auto storage) */
struct P_Chinhtungservo_theovitri_T_ {
  real_T deta[1212];                   /* Variable: deta
                                        * Referenced by: '<Root>/Constant14'
                                        */
  real_T ts;                           /* Variable: ts
                                        * Referenced by: '<Root>/Constant1'
                                        */
  uint32_T ServoWrite_pinNumber;       /* Mask Parameter: ServoWrite_pinNumber
                                        * Referenced by: '<S2>/Servo Write'
                                        */
  real_T Constant5_Value;              /* Expression: 90
                                        * Referenced by: '<Root>/Constant5'
                                        */
  real_T Gain4_Gain;                   /* Expression: 1
                                        * Referenced by: '<Root>/Gain4'
                                        */
  uint8_T ServoWrite_p1;               /* Computed Parameter: ServoWrite_p1
                                        * Referenced by: '<S2>/Servo Write'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_Chinhtungservo_theovi_T {
  const char_T *errorStatus;
  RTWSolverInfo solverInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    SimTimeStep simTimeStep;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (auto storage) */
extern P_Chinhtungservo_theovitri_T Chinhtungservo_theovitri_P;

/* Model entry point functions */
extern void Chinhtungservo_theovitri_initialize(void);
extern void Chinhtungservo_theovitri_step(void);
extern void Chinhtungservo_theovitri_terminate(void);

/* Real-time Model object */
extern RT_MODEL_Chinhtungservo_theov_T *const Chinhtungservo_theovitri_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'Chinhtungservo_theovitri'
 * '<S1>'   : 'Chinhtungservo_theovitri/MATLAB Function6'
 * '<S2>'   : 'Chinhtungservo_theovitri/Standard Servo Write5'
 */
#endif                                 /* RTW_HEADER_Chinhtungservo_theovitri_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
