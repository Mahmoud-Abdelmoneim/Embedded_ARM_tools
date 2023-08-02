
/*MEMORIES*/



_estack = ORIGIN(RAM) + LENGTH(RAM);

_MIN_HEAP_SIZE  = 0x200;
_MIN_STACK_SIZE = 0x400; 
MEMORY
{

	
	
	RAM    (xrw)    : ORIGIN = 0x20000000,   LENGTH = 20K
	FLASH  (rx)     : ORIGIN = 0x08000000,   LENGTH = 64K
}


SECTIONS{

	.isr_vector :
	{
		. = ALIGN(4);
		*(.isr_vector*)
		. = ALIGN(4);
	}>FLASH



	.text : 
	{
		. = ALIGN(4);
		*(.text)
		*(.text*)
		. = ALIGN(4);
		_etext = .; 
	} >FLASH





	.rodata :
	{

		. = ALIGN(4);
		*(.rodata)
		*(.rodata*)	
		. = ALIGN(4);
		_erodata = .;
		
	}>FLASH

	_sidata = LOADADDR(.data);



	.data :
	{
		_sdata = .; 
		. = ALIGN(4);
		*(.data)
		*(.data*)
		. = ALIGN(4);
		_edata = .; 
	} >RAM AT> FLASH




	.bss :
	{
		_sbss = .; 
		. = ALIGN(4);
		*(.bss)
		*(.bss*)
		. = ALIGN(4);
		_ebss = .; 	
	} >RAM


/*
	.user_heap_stack :
	{
		. = ALIGN(4);
		*(.user_heap_stack)
		*(.user_heap_stack*)	
		. = ALIGN(4);
	} >RAM*/
	

}