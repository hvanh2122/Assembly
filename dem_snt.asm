.data
    tb db 'So cac so nguyen to trong day la: $'
    arr db 2,3,4,5,6,7
    n db 6
    du db ?
    num db ?
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
    
    duyet:
        mov al, [si]
        mov num, al
        
        mov bl, 1
        
        chia:
            mov ax, 0
            mov al, num
            
            inc bl
            div bl
            
            mov du, ah
            
            cmp du, 0
            jne chia
            
            cmp bl, num
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
        mov cx, 0
        mov bl, 10
        
        todec:  
            mov ah, 0
            mov dx, 0
            div bl
            
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
            
        mov ah, 8
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp
end main
            
            