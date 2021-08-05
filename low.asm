BITS 32

    org 0x00010000

mg  db	0x7F, "ELF"         ; e_ident
	  dd	1                         ; p_type
	  dd	0                         ; p_offset
	  dd	$$                        ; p_vaddr 
	  dw	2           ; e_type      ; p_paddr
	  dw	3           ; e_machine
	  dd	_start      ; e_version   ; p_filesz
	  dd	_start      ; e_entry     ; p_memsz
	  dd	4           ; e_phoff     ; p_flags

_start:
	  mov 	al, 0x25    ; sys_kill    ; e_shoff   ; p_align
	  inc 	ebx         ; pid = 1	 
	  inc   ecx         ; sig = 2     ; e_flags
	  inc   ecx
	  int 	0x80		
	  db    0			
	  dw    0x34        ; e_ehsize
	  dw    0x20        ; e_phentsize
	  db    1           ; e_phnum
                            ; e_shentsize
                            ; e_shnum
                            ; e_shstrndx
filesize	equ	$ - $$
