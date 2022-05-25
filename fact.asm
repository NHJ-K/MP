section .data
    msg1 db "Enter a number :"
    len1 equ $-msg1
    msg2 db "Factorial is :"
    len2 equ $-msg2
section .bss    
    num resb 1
    fact resb 1
section .text
    global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num
    mov edx,1
    int 0x80

    mov eax,[num]
    sub eax,'0'
    mov ebx,eax
    mov eax,1
    cmp ebx,0
    jb final
repeat:
    mul ebx
    dec ebx
    cmp ebx,0
    ja repeat
final:
    add eax,'0'
    mov [fact],eax
    
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,fact
    mov edx,1
    int 0x80

    mov eax,1
    int 0x80