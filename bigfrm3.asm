section .data
    msg db "Biggest number: "
    len equ $ - msg
section .bss
    big resb 2
section .text
    global _start
_start: 
    mov eax,'4'
    mov ebx,'5'
    mov ecx,'6'

    cmp eax,ebx
    jb second
    mov [big],eax
    cmp eax,ecx
    jb third
    mov [big],eax
    jmp display
second:
    mov [big],ebx
    cmp ebx,ecx
    jb third
    mov [big],ebx
    jmp display
third:
    mov [big],ecx
    jmp display
display:
    mov eax,4
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