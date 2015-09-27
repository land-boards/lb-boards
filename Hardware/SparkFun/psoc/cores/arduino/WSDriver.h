/* ========================================
 *
 * Strip Light Controller
 * By Mark Hastings
 *
 * 05/27/2013  v1.0  Mark Hastings   Initial working version
 *
 * ========================================
*/

#if (!defined(CY_SLIGHTS_WSDriver_H))
#define CY_SLIGHTS_WSDriver_H

#include "cytypes.h"
#include "cyfitter.h"

/* Function Prototypes */
void   WSDriver_Start(void);
void   WSDriver_Stop(void);
void   WSDriver_WriteColor(uint32 color);
void   WSDriver_DisplayClear(uint32 color);
void   WSDriver_MemClear(uint32 color);
void   WSDriver_Trigger(uint32 rst);
uint32 WSDriver_Ready(void);

void   WSDriver_DrawRect(int32 x0, int32 y0, int32 x1, int32 y1, int32 fill, uint32 color);
void   WSDriver_DrawLine(int32 x0, int32 y0, int32 x1, int32 y1, uint32 color);
void   WSDriver_DrawCircle (int32 x0, int32 y0, int32 radius, uint32 color);
void   WSDriver_Pixel(int32 x, int32 y, uint32 color);
uint32 WSDriver_GetPixel(int32 x, int32 y);
uint32 WSDriver_ColorInc(uint32 incValue);
void   WSDriver_Dim(uint32 dimLevel); 

#define WSDriver_DimLevel_0   0
#define WSDriver_DimLevel_1   1
#define WSDriver_DimLevel_2   2
#define WSDriver_DimLevel_3   3
#define WSDriver_DimLevel_4   4




#define WSDriver_CIRQ_Enable() CyIntEnable(WSDriver_CIRQ__INTC_NUMBER ); 
#define WSDriver_CIRQ_Disable() CyIntDisable(WSDriver_CIRQ__INTC_NUMBER );
CY_ISR_PROTO(WSDriver_CISR);

#define WSDriver_FIRQ_Enable() CyIntEnable(WSDriver_FIRQ__INTC_NUMBER ); 
#define WSDriver_FIRQ_Disable() CyIntDisable(WSDriver_FIRQ__INTC_NUMBER );
CY_ISR_PROTO(WSDriver_FISR);

/* Register Definitions */
#define WSDriver_DATA         (*(reg8 *) WSDriver_B_WS2811_dshifter_u0__F0_REG)
#define WSDriver_DATA_PTR     ((reg8 *)  WSDriver_B_WS2811_dshifter_u0__F0_REG)

#define WSDriver_CONTROL      (*(reg8 *) WSDriver_B_WS2811_ctrl__CONTROL_REG)
#define WSDriver_STATUS       (*(reg8 *) WSDriver_B_WS2811_StatusReg__STATUS_REG)

#define WSDriver_Period       (*(reg8 *) WSDriver_B_WS2811_pwm8_u0__F0_REG)
#define WSDriver_Period_PTR   ((reg8 *)  WSDriver_B_WS2811_pwm8_u0__F0_REG)

#define WSDriver_Compare0     (*(reg8 *) WSDriver_B_WS2811_pwm8_u0__D0_REG)
#define WSDriver_Compare1     (*(reg8 *) WSDriver_B_WS2811_pwm8_u0__D1_REG)

#define WSDriver_Period2      (*(reg8 *) WSDriver_B_WS2811_pwm8_u0__F1_REG)
#define WSDriver_Period2_PTR  ((reg8 *)  WSDriver_B_WS2811_pwm8_u0__F1_REG)

#define WSDriver_ACTL0_REG    (*(reg8 *) WSDriver_B_WS2811_pwm8_u0__DP_AUX_CTL_REG)
#define WSDriver_DISABLE_FIFO  0x03


#define WSDriver_Channel      (*(reg8 *) WSDriver_StringSel_Sync_ctrl_reg__CONTROL_REG)
#define WSDriver_Channel_PTR  ((reg8 *)  WSDriver_StringSel_Sync_ctrl_reg__CONTROL_REG)



/* Status Register Constants  */
#define WSDriver_FIFO_EMPTY       0x01
#define WSDriver_FIFO_NOT_FULL    0x02
#define WSDriver_STATUS_ENABLE    0x80
#define WSDriver_STATUS_XFER_CMPT 0x40

/* Control Register Constants */
#define WSDriver_ENABLE         0x01
#define WSDriver_DISABLE        0x00
#define WSDriver_RESTART        0x02
#define WSDriver_CNTL           0x04
#define WSDriver_FIFO_IRQ_EN    0x08
#define WSDriver_XFRCMPT_IRQ_EN 0x10
#define WSDriver_ALL_IRQ_EN     0x18
#define WSDriver_NEXT_ROW       0x20

#define WSDriver_TRANSFER           1
#define WSDriver_TRANSFER_FIRMWARE  0
#define WSDriver_TRANSFER_ISR       1
#define WSDriver_TRANSFER_DMA       2

#define WSDriver_SPEED        
#define WSDriver_SPEED_400KHZ 0
#define WSDriver_SPEED_800KHZ 1

#define WSDriver_MEMORY_TYPE  0
#define WSDriver_MEMORY_RGB   0
#define WSDriver_MEMORY_LUT   1

#if (CY_PSOC3 || CY_PSOC5LP)
    #define  WSDriver_PERIOD     ((BCLK__BUS_CLK__KHZ)/800)
#elif (CY_PSOC4)
    #define  WSDriver_PERIOD     ((CYDEV_BCLK__HFCLK__KHZ)/800)
#endif /* CY_PSOC5A */
        

#define  WSDriver_DATA_ZERO  ((WSDriver_PERIOD * 20)/25) 
#define  WSDriver_DATA_ONE   ((WSDriver_PERIOD * 12)/25) 


#if (WSDriver_SPEED_800KHZ)
    #define WSDriver_BYTE_TIME_US 10u
    #define WSDriver_WORD_TIME_US 30u
#else
    #define WSDriver_BYTE_TIME_US 20u
    #define WSDriver_WORD_TIME_US 60u
#endif

#define WSDriver_COLUMNS     64
#define WSDriver_ROWS        4
#define WSDriver_TOTAL_LEDS   (WSDriver_COLUMNS*WSDriver_ROWS)

#define WSDriver_ARRAY_COLS  (int32)(64)
#define WSDriver_ARRAY_ROWS  (int32)(4)
#define WSDriver_CHIP        (2)
#define WSDriver_CHIP_WS2811 1
#define WSDriver_CHIP_WS2812 2

#define WSDriver_MIN_X        (int32)0u
#define WSDriver_MAX_X        (int32)(WSDriver_COLUMNS - 1)
#define WSDriver_MIN_Y        (int32)0u
#define WSDriver_MAX_Y        (int32)(WSDriver_ROWS - 1)

//#define WSDriver_RBCOLORS     48
#define WSDriver_COLOR_WHEEL_SIZE  24

#if(WSDriver_CHIP == WSDriver_CHIP_WS2812)
#define WSDriver_RED_MASK   0x0000FF00
#define WSDriver_GREEN_MASK 0x000000FF
#define WSDriver_BLUE_MASK  0x00FF0000
#else
#define WSDriver_RED_MASK   0x000000FF
#define WSDriver_GREEN_MASK 0x0000FF00
#define WSDriver_BLUE_MASK  0x00FF0000	
#endif

#if(WSDriver_MEMORY_TYPE == WSDriver_MEMORY_RGB)
   #define WSDriver_getColor( a ) WSDriver_CLUT[a]
#else  /* Else use lookup table */
   #define WSDriver_getColor( a ) a
#endif


#define WSDriver_CWHEEL_SIZE 24
#define WSDriver_YELLOW      WSDriver_getColor(1)
#define WSDriver_GREEN       WSDriver_getColor((70 + WSDriver_CWHEEL_SIZE))
#define WSDriver_ORANGE      WSDriver_getColor(20)
#define WSDriver_BLACK       WSDriver_getColor((0 + WSDriver_CWHEEL_SIZE))
#define WSDriver_OFF         WSDriver_getColor((0 + WSDriver_CWHEEL_SIZE))
#define WSDriver_LTBLUE      WSDriver_getColor((1 + WSDriver_CWHEEL_SIZE))
#define WSDriver_MBLUE       WSDriver_getColor((2 + WSDriver_CWHEEL_SIZE))
#define WSDriver_BLUE        WSDriver_getColor((3 + WSDriver_CWHEEL_SIZE))
#define WSDriver_LTGREEN     WSDriver_getColor((4 + WSDriver_CWHEEL_SIZE))
#define WSDriver_MGREEN      WSDriver_getColor((8 + WSDriver_CWHEEL_SIZE))
//#define WSDriver_GREEN       (12 + WSDriver_CWHEEL_SIZE) 
#define WSDriver_LTRED       WSDriver_getColor((16 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_LTYELLOW    WSDriver_getColor((20 + WSDriver_CWHEEL_SIZE))
#define WSDriver_MGRED       WSDriver_getColor((32 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_RED         WSDriver_getColor((48 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_MAGENTA     WSDriver_getColor((51 + WSDriver_CWHEEL_SIZE))
#define WSDriver_WHITE       WSDriver_getColor((63 + WSDriver_CWHEEL_SIZE)) 

#define WSDriver_SPRING_GREEN WSDriver_getColor((64 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_TURQUOSE    WSDriver_getColor((65 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_CYAN        WSDriver_getColor((66 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_OCEAN       WSDriver_getColor((67 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_VIOLET      WSDriver_getColor((68 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_RASPBERRY   WSDriver_getColor((69 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_DIM_WHITE   WSDriver_getColor((71 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_DIM_BLUE    WSDriver_getColor((72 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_INVISIBLE   WSDriver_getColor((73 + WSDriver_CWHEEL_SIZE))

#define WSDriver_COLD_TEMP   WSDriver_getColor((80 + WSDriver_CWHEEL_SIZE)) 
#define WSDriver_HOT_TEMP    WSDriver_getColor((95 + WSDriver_CWHEEL_SIZE)) 

#define WSDriver_CLUT_SIZE  (96 + WSDriver_CWHEEL_SIZE)

#define WSDriver_RESET_DELAY_US  55

#endif  /* CY_SLIGHTS_WSDriver_H */

//[] END OF FILE
