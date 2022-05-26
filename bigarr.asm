section .data
    num db 6,8,1,9,4
    len equ $ - num
    msg2 db 0xA,"Biggest"
    len2 equ $ - msg2
    
section .bss
    big resb 2
    
section .text
    global _start
_start:

    
    lea ebx,[num]
    mov ecx,5
    mov al,0
repet:
    cmp al,[ebx]
    ja agin
    mov al,[ebx]
agin:
    inc ebx
    dec ecx
    cmp ecx,0
    jne repet
    add al,'0'
    mov [big],eax
    
    
    
    
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,big
    mov edx,1
    int 0x80
    
    mov  eax,1
    int 0x80
