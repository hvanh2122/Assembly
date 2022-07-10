.data
    tb db 'So cac so chia het cho 5 trong day la: $'
    arr db 5,6,10,15,25,35,45,65,75,85,95,55
    sochia db 5
    n db 12
    so db 0
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb
    int 21h
    
    lea si, arr
    mov cl, n  
    
    mov bl, sochia
    
    duyet:
        mov ax, 0
        mov al, [si]
        div sochia
        
        cmp ah, 0
        je tinhtong
        
        jmp tiep
        
        tinhtong:
            mov al, so
            inc al
            mov so, al
            
        tiep:
            inc si
            loop duyet
            
     mov al, so
     mov bl, 10
     mov cx, 0
     
     todec:
        mov ah, 0
        mov dx, 0
        div bl
        inc cx
        
        mov dl, ah
        add dl, 30h
        push dx
        
        cmp al, 0
        je hienthi
        
        jmp todec
     hienthi:
        pop dx
        mov ah, 2
        int 21h
        loop hienthi
        
     mov ah, 8
     int 21h
     
     mov ah, 4ch
     int 21h
     
     main endp
end main