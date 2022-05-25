section .data
    msg1 db "The Quatient is: "
    len1 equ $ - msg1
    msg2 db "The Remainder is: "
    len2 equ $ - msg2
section .bss
    quatient resb 1
    remainder resb 1
section .text
    global _start
_start:
    mov eax,'6'
    sub eax,'0'
    mov ebx,'2'
    sub ebx,'0'
    div ebx
    add eax,'0'

    mov [quatient],al
    mov [remainder],ah

    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,quatient
    mov edx,1
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,remainder
    mov edx,1
    int 0x80

    mov eax,1
    int 0x80