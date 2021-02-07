/*
 * sfuntmpl_basic.c: Basic 'C' template for a level 2 S-function.
 *
 *  -------------------------------------------------------------------------
 *  | See matlabroot/simulink/src/sfuntmpl_doc.c for a more detailed template |
 *  -------------------------------------------------------------------------
 *
 * Copyright 1990-2002 The MathWorks, Inc.
 * $Revision: 1.27.4.2 $
 */

//Build S-Function with mex -l"Ws2_32" FPGADriver.c


/*
 * You must specify the S_FUNCTION_NAME as the name of your S-function
 * (i.e. replace sfuntmpl_basic with the name of your S-function).
 */

#define S_FUNCTION_NAME  FPGADriver
#define S_FUNCTION_LEVEL 2

/*
 * Need to include simstruc.h for the definition of the SimStruct and
 * its associated macro definitions.
 */
#include "simstruc.h"
#include "tchar.h"
//#include "windows.h"
#include "Winsock2.h"

/* Error handling
 * --------------
 *
 * You should use the following technique to report errors encountered within
 * an S-function:
 *
 *       ssSetErrorStatus(S,"Error encountered due to ...");
 *       return;
 *
 * Note that the 2nd argument to ssSetErrorStatus must be persistent memory.
 * It cannot be a local variable. For example the following will cause
 * unpredictable errors:
 *
 *      mdlOutputs()
 *      {
 *         char msg[256];         {ILLEGAL: to fix use "static char msg[256];"}
 *         sprintf(msg,"Error due to %s", string);
 *         ssSetErrorStatus(S,msg);
 *         return;
 *      }
 *
 * See matlabroot/simulink/src/sfuntmpl_doc.c for more details.
 */

/*====================*
 * S-function methods *
 *====================*/

/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *    The sizes information is used by Simulink to determine the S-function
 *    block's characteristics (number of inputs, outputs, states, etc.).
 */
static void mdlInitializeSizes(SimStruct *S)
{
    /* See sfuntmpl_doc.c for more details on the macros below */

    ssSetNumSFcnParams(S, 0);  /* Number of expected parameters */
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        /* Return if number of expected != number of actual parameters */
        return;
    }

    ssSetNumContStates(S, 0);
    ssSetNumDiscStates(S, 0);

    if (!ssSetNumInputPorts(S, 1)) return;
    ssSetInputPortWidth(S, 0, 1);
    ssSetInputPortDataType(S, 0, SS_DOUBLE);
    ssSetInputPortRequiredContiguous(S, 0, true); /*direct input signal access*/
    
    /*ssSetInputPortWidth(S, 1, 2);
    ssSetInputPortDataType(S, 1, SS_DOUBLE);
    ssSetInputPortRequiredContiguous(S, 1, true); /*direct input signal access*/
    
    /*ssSetInputPortWidth(S, 2, 3);
    ssSetInputPortDataType(S, 2, SS_DOUBLE);
    ssSetInputPortRequiredContiguous(S, 2, true); /*direct input signal access*/
    /*
     * Set direct feedthrough flag (1=yes, 0=no).
     * A port has direct feedthrough if the input is used in either
     * the mdlOutputs or mdlGetTimeOfNextVarHit functions.
     * See matlabroot/simulink/src/sfuntmpl_directfeed.txt.
     */
    ssSetInputPortDirectFeedThrough(S, 0, 1);

    if (!ssSetNumOutputPorts(S, 2)) return;
    ssSetOutputPortWidth(S, 0, 4);
    ssSetOutputPortDataType(S, 0, SS_UINT8);
    
    ssSetOutputPortWidth(S, 1, 1);
    ssSetOutputPortDataType(S, 1, SS_DOUBLE);

    ssSetNumSampleTimes(S, 1);
    ssSetNumRWork(S, 0);
    ssSetNumIWork(S, 6);
    ssSetNumPWork(S, 0);
    ssSetNumModes(S, 0);
    ssSetNumNonsampledZCs(S, 0);

    /* Specify the sim state compliance to be same as a built-in block */
    ssSetSimStateCompliance(S, USE_DEFAULT_SIM_STATE);

    ssSetOptions(S, 0);
}



/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    This function is used to specify the sample time(s) for your
 *    S-function. You must register the same number of sample times as
 *    specified in ssSetNumSampleTimes.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, CONTINUOUS_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);

}



#define MDL_INITIALIZE_CONDITIONS   /* Change to #undef to remove function */
#if defined(MDL_INITIALIZE_CONDITIONS)
  /* Function: mdlInitializeConditions ========================================
   * Abstract:
   *    In this function, you should initialize the continuous and discrete
   *    states for your S-function block.  The initial states are placed
   *    in the state vector, ssGetContStates(S) or ssGetRealDiscStates(S).
   *    You can also perform any other initialization activities that your
   *    S-function may require. Note, this routine will be called at the
   *    start of simulation and if it is present in an enabled subsystem
   *    configured to reset states, it will be call when the enabled subsystem
   *    restarts execution to reset the states.
   */
  static void mdlInitializeConditions(SimStruct *S)
  {
  }
#endif /* MDL_INITIALIZE_CONDITIONS */



#define MDL_START  /* Change to #undef to remove function */
#if defined(MDL_START) 
  /* Function: mdlStart =======================================================
   * Abstract:
   *    This function is called once at start of model execution. If you
   *    have states that should be initialized once, this is the place
   *    to do it.
   */
  static void mdlStart(SimStruct *S)
  {
    SOCKET* sk1;
    SOCKET* ClientSocket;
    WSADATA* SockInfo1;
    struct sockaddr_in* RecvAddr;
    struct sockaddr_in* LocalAddr;
    int bufi1;
    u_long bufi;
    int err;
    
    sk1=(SOCKET*)malloc(sizeof(SOCKET));
    SockInfo1=(WSADATA*)malloc(sizeof(WSADATA));
    RecvAddr=(struct sockaddr_in*)malloc(sizeof(struct sockaddr_in));
    LocalAddr=(struct sockaddr_in*)malloc(sizeof(struct sockaddr_in));
    
    WSAStartup(2,SockInfo1);
    //Create socket to FPGA
    *sk1 = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
	if (*sk1 == INVALID_SOCKET) return;
    RecvAddr->sin_family = AF_INET;
	RecvAddr->sin_port = htons(1024);
	RecvAddr->sin_addr.s_addr = inet_addr("193.168.1.10");

	LocalAddr->sin_family = AF_INET;
	LocalAddr->sin_port = htons(1024);
	LocalAddr->sin_addr.s_addr = inet_addr("193.168.1.2");
    
    err = bind(*sk1,(SOCKADDR *)LocalAddr,sizeof(struct sockaddr_in));
	if (err!=0) return;
    //FIONBIO option - blocking 0, nonblocking 1
    bufi = 0;
    err = ioctlsocket(*sk1,FIONBIO,&bufi);
	if (err!=0) return;
    
    bufi1=sk1;
    ssSetIWorkValue(S,0,bufi1);
    bufi1=SockInfo1;
    ssSetIWorkValue(S,1,bufi1);
    bufi1=RecvAddr;
    ssSetIWorkValue(S,2,bufi1);
    bufi1=LocalAddr;
    ssSetIWorkValue(S,3,bufi1);
  }
#endif /*  MDL_START */

/* Function: mdlOutputs =======================================================
 * Abstract:
 *    In this function, you compute the outputs of your S-function
 *    block.
 */
static void mdlOutputs(SimStruct *S, int_T tid)
{
    //const unsigned char *u = (const unsigned char *)ssGetInputPortSignalPtrs(S,0);
    unsigned char *y = (unsigned char *)ssGetOutputPortSignal(S,0);
    const double *sig_in = (const double *)ssGetInputPortSignalPtrs(S,0);
    double *sig_out = (double *)ssGetOutputPortSignal(S,1);
    //Server ports
    /*const double *us = (const double *)ssGetInputPortSignalPtrs(S,2);
    double *ys = (double *)ssGetOutputPortSignal(S,2);*/
    
    SOCKET* sk1;
    struct sockaddr_in* RecvAddr;
    unsigned char Tx_Buf[118];
    unsigned char Rx_Buf[118];
    int bufi;
    int err;
    int fix1;
    double sig_buf[4];
    
    bufi = (int)ssGetIWorkValue(S,0);
    sk1 = (SOCKET*)bufi;
    bufi = (int)ssGetIWorkValue(S,2);
    RecvAddr = (struct sockaddr_in*)bufi;
    
    err = recv(*sk1,Rx_Buf,118,0);
    memcpy(y,Rx_Buf,4);
    fix1=(Rx_Buf[5]<<8)|Rx_Buf[4];
    //fix1=(Rx_Buf[11]<<8)|Rx_Buf[10];
    *sig_out=(double)(fix1);
    /*fix1=(Rx_Buf[11]<<24)|(Rx_Buf[10]<<16)|(Rx_Buf[9]<<8)|Rx_Buf[8];
    sig_out[0]=(double)(fix1)/32768;*/
    
    Tx_Buf[0]=0;
    Tx_Buf[1]=Rx_Buf[1];
    Tx_Buf[2]=Rx_Buf[2];
    Tx_Buf[3]=Rx_Buf[3];
    fix1=(int)(*sig_in); //2^15
    Tx_Buf[4]=(unsigned char)(fix1);
    Tx_Buf[5]=(unsigned char)(fix1 >> 8);
    fix1=(int)(0); //2^15
    Tx_Buf[6]=(unsigned char)(fix1);
    Tx_Buf[7]=(unsigned char)(fix1 >> 8);
    /*Tx_Buf[6]=(unsigned char)(fix1 >> 16);
    Tx_Buf[7]=(unsigned char)(fix1 >> 24);
    fix1=(int)((sig_in[0])*32768); //2^15
    Tx_Buf[8]=(unsigned char)(fix1);
    Tx_Buf[9]=(unsigned char)(fix1 >> 8);
    Tx_Buf[10]=(unsigned char)(fix1 >> 16);
    Tx_Buf[11]=(unsigned char)(fix1 >> 24);*/
    err = sendto(*sk1,Tx_Buf,16,0,(SOCKADDR *)RecvAddr,sizeof(struct sockaddr_in));
    y[0]=Rx_Buf[5];
    //sig_out[1]=sig_in[1];
}



#define MDL_UPDATE  /* Change to #undef to remove function */
#if defined(MDL_UPDATE)
  /* Function: mdlUpdate ======================================================
   * Abstract:
   *    This function is called once for every major integration time step.
   *    Discrete states are typically updated here, but this function is useful
   *    for performing any tasks that should only take place once per
   *    integration step.
   */
  static void mdlUpdate(SimStruct *S, int_T tid)
  {
  }
#endif /* MDL_UPDATE */



#define MDL_DERIVATIVES  /* Change to #undef to remove function */
#if defined(MDL_DERIVATIVES)
  /* Function: mdlDerivatives =================================================
   * Abstract:
   *    In this function, you compute the S-function block's derivatives.
   *    The derivatives are placed in the derivative vector, ssGetdX(S).
   */
  static void mdlDerivatives(SimStruct *S)
  {
  }
#endif /* MDL_DERIVATIVES */



/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
static void mdlTerminate(SimStruct *S)
{   
    SOCKET* sk1;
    WSADATA* SockInfo1;
    struct sockaddr_in* RecvAddr;
    struct sockaddr_in* LocalAddr;
    int bufi;
    
    bufi = (int)ssGetIWorkValue(S,0);
    sk1 = (SOCKET*)bufi;
    closesocket(*sk1);
    free(sk1);
    
    bufi = (int)ssGetIWorkValue(S,1);
    SockInfo1 = (WSADATA*)bufi;
    free(SockInfo1);
    
    bufi = (int)ssGetIWorkValue(S,2);
    RecvAddr = (struct sockaddr_in*)bufi;
    free(RecvAddr);
    
    bufi = (int)ssGetIWorkValue(S,3);
    LocalAddr = (struct sockaddr_in*)bufi;
    free(LocalAddr);
    
    WSACleanup();
}


/*======================================================*
 * See sfuntmpl_doc.c for the optional S-function methods *
 *======================================================*/

/*=============================*
 * Required S-function trailer *
 *=============================*/

#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
