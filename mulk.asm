section .data
    msg1 db "Enter first number:"
    len1 equ $-msg1
    msg2 db "Enter second number:"
    len2 equ $-msg2
    msg3 db "Product is:"
    len3 equ $-msg3
section .bss
    num1 resb 2
    num2 resb 2
    product resb 1
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
    mov ecx,num1
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg3
    mov edx,len3
    int 0x80

    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'

    mul ebx
    add eax,'0'

    mov [product],eax

    mov eax,4
    mov ebx,1
    mov ecx,product
    mov edx,1
    int 0x80

    mov eax,1
    int 0x80