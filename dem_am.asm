.data  
    m db 5,-2,15,0,-7,10
    n dw 6
    sochia db 5 
    str db "So cac so am trong day la: $"
    str1 db 10,13,"So cac so duong trong day la: $"
    num db ?
    soam db 0
    soduong db 0 
            
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        lea si,m  
        mov cx, n 
        
        
        duyet:
            mov al,[si] 
            cmp al, 0
            jg lasoduong
            jl lasoam
            jmp tiep
        
        lasoam:            
            add soam, 1
            
            jmp tiep
        lasoduong:
            add soduong, 1

        tiep:
            inc si 
            loop duyet 
        
        lea dx, str
        mov ah,9
        int 21h
        mov al,soam
        
        call todec
        
        lea dx, str1
        mov ah,9
        int 21h
        mov al,soduong
        
        call todec
            
            
        mov ah,4ch
        int 21h
    main endp 
    
todec proc
    mov bl, 10
    mov cx, 0
    
    chia:
        mov ah, 0
        mov dx, 0
        div bl
        
        inc cx
        mov dl, ah
        add dl, 30h
        push dx
        
        cmp al, 0
        je hienthi
        
        jmp chia
        
    hienthi:
        pop dx
        mov ah, 2
        int 21h
        loop hienthi
        
        ret
        
    todec endp
end main
