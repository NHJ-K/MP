section .data
    msg db "Biggest is: "
    len equ $ -msg
section .bss
    big resb 2
section .text
    global _start
_start:
    mov eax,'a'
    mov ebx,'4'
    cmp eax,ebx
    jb second

    mov [big],eax
    jmp display
second:
    mov [big],ebx
display:
    mov eax,4,
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,big
    mov edx,2
    int 0x80

    mov eax,1
    int 0x80
