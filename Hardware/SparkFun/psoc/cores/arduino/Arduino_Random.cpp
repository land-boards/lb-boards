/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/
extern "C" {
#include <project.h>
}

#include <Arduino_Random.h>

int32_t random(int32_t min, int32_t max)
{
    if (min >= max) 
    {
        return min;
    }
    int32_t diff = max - min;
    int32_t randTemp = PRS_Read() % diff;
    return randTemp + min; 
}

void randomSeed(uint32_t seed)
{
    if (seed == 0) seed = 1;
    PRS_WriteSeed(seed);
}

/* [] END OF FILE */
