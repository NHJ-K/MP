section .data
    msg1 db "Enter a number: "
    len1 equ $-msg1
    msg2 db "The number is Odd"
    len2 equ $-msg2
    msg3 db "The number is Even"
    len3 equ $-msg3
section .bss
    num resb 1
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
    AND eax,01h
    cmp eax,01h
    jb even
    
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    jmp end
even:
    mov eax,4
    mov ebx,1
    mov ecx,msg3
    mov edx,len3
    int 0x80

    jmp end
end:
    mov eax,1
    int 0x80