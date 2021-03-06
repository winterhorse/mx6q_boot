#include <config.h>
#include <mx6.h>

#ifndef CONFIG_FLASH_HEADER_OFFSET
# error "Must define the offset of flash header"
#endif

#define CPU_2_BE_32(l) \
       ((((l) & 0x000000FF) << 24) | \
	(((l) & 0x0000FF00) << 8)  | \
	(((l) & 0x00FF0000) >> 8)  | \
	(((l) & 0xFF000000) >> 24))

#define MXC_DCD_ITEM(addr, val)   \
        .word CPU_2_BE_32(addr) ;     \
        .word CPU_2_BE_32(val)  ;     \

.section ".text.flasheader", "x"
ivt_header:       .word 0x402000D1 /* Tag=0xD1, Len=0x0020, Ver=0x40 */
app_code_jump_v:  .word _start
reserv1:          .word 0x0
dcd_ptr:          .word dcd_hdr
boot_data_ptr:	  .word boot_data
self_ptr:         .word ivt_header
app_code_csf:     .word 0
reserv2:          .word 0x0

boot_data:        .word TEXT_BASE
image_len:        .word _end_of_copy  - TEXT_BASE + CONFIG_FLASH_HEADER_OFFSET
plugin:           .word 0x0


/*************************************************/
/*            DCD, DDR3配置                      */		
/*************************************************/
dcd_hdr:          .word 0x40E002D2		/* Tag=0xD2, Len=AAAA, Ver=0x40 */
write_dcd_cmd:    .word 0x04DC02CC		/* Tag=0xCC, Len=AAAA, Param=0x04 */

MXC_DCD_ITEM(CCM_BASE_ADDR + 0x068, 0xFFFFFFFF)
MXC_DCD_ITEM(CCM_BASE_ADDR + 0x06C, 0xFFFFFFFF)
MXC_DCD_ITEM(CCM_BASE_ADDR + 0x070, 0xFFFFFFFF)
MXC_DCD_ITEM(CCM_BASE_ADDR + 0x074, 0xFFFFFFFF)
MXC_DCD_ITEM(CCM_BASE_ADDR + 0x078, 0xFFFFFFFF)
MXC_DCD_ITEM(CCM_BASE_ADDR + 0x07C, 0xFFFFFFFF)
MXC_DCD_ITEM(CCM_BASE_ADDR + 0x080, 0xFFFFFFFF)
# IOMUXC_BASE_ADDR  = 0x20e0000
# DDR IO TYPE
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x798, 0x000C0000)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x758, 0x00000000)
# CLOCK
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x588, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x594, 0x00000028)
# ADDRESS
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x56C, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x578, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x74C, 0x00000028)
# Control
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x57C, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x58C, 0x00000000)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x59C, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5A0, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x78C, 0x00000028)
# Data Strobes
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x750, 0x00020000)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5A8, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5B0, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x524, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x51C, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x518, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x50C, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5B8, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5C0, 0x00000028)
# Data
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x774, 0x00020000)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x784, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x788, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x794, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x79C, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x7A0, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x7A4, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x7A8, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x748, 0x00000028)

MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5AC, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5B4, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x528, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x520, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x514, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x510, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5BC, 0x00000028)
MXC_DCD_ITEM(IOMUXC_BASE_ADDR + 0x5C4, 0x00000028)
        

# MMDC_P0_BASE_ADDR = 0x021b0000
# MMDC_P1_BASE_ADDR = 0x021b4000
//=============================================================================			
// DDR Controller Registers			
//=============================================================================			
// Manufacturer:			Micron		
// Device Part Number:		MT41K128M16JT-125		
// Clock Freq.:				528MHz		
// Density per CS in Gb:	8		
// Chip Selects used:		1		
// Number of Banks:			8	
// Row address:    			14	
// Column address: 			10	
// Data bus width			64	
//=============================================================================			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x00008000)

# Calibrations
# ZQ
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x800, 0xA1390003)

# MMDC PHY write leveling delay control register
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x80C, 0x001A0018)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x810, 0x0023001C)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x80C, 0x00130026)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x810, 0x00110021)

# Read DQS Gating calibration			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x83C, 0x0328033C)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x840, 0x032C0324)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x83C, 0x033C034C)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x840, 0x03340304)

# Read calibration			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x848, 0x40303436)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x848, 0x36302E3E)
			
# Write calibration                     			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x850, 0x38343E30)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x850, 0x42324A3E)
		
# read data bit delay: (3 is the reccommended default value, although out of reset value is 0)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x81C, 0x33333333)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x820, 0x33333333)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x824, 0x33333333)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x828, 0x33333333)

MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x81C, 0x33333333)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x820, 0x33333333)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x824, 0x33333333)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x828, 0x33333333)

# Complete calibration by forced measurement:                  			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x8b8, 0x00000800)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x8b8, 0x00000800)
	

# MMDC init: 			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x004, 0x00020036)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x008, 0x09444040)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x00C, 0x54597955)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x010, 0xFF328F64)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x014, 0x01FF00DB)
	
# MDMISC: RALAT kept to the high level of 5. 			
# MDMISC: consider reducing RALAT if your 528MHz board design allow that. Lower RALAT benefits:
# a. better operation at low frequency, for LPDDR2 freq < 100MHz, change RALAT to 3			
# b. Small performence improvment 			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x018, 0x00011740)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x00008000)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x02C, 0x000026D2)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x030, 0x00591023)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x040, 0x00000027)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x000, 0x831A0000)

# Mode register writes                 			
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x02088032)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x00008033)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x00048031)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x19408030)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x04008040)
	
#
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x020, 0x00007800)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x818, 0x00022227)
MXC_DCD_ITEM(MMDC_P1_BASE_ADDR + 0x818, 0x00022227)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x004, 0x00025576)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x404, 0x00011006)
MXC_DCD_ITEM(MMDC_P0_BASE_ADDR + 0x01C, 0x00000000)
