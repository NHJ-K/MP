section .data 
    msg db "Product is:"
    len equ $ - msg
section .bss
    product resb 1
section .text
    global _start
_start:
    mov eax,'3'
    sub eax,'0'

    mov ebx,'3'
    sub ebx,'0'

    mul ebx
    add eax,'0'

    mov [product],eax

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,product
    mov edx,1
    int 0x80

    mov eax,1
    int 0x80