.data
        mang db 50,0, 50 dup('$') 
        xuong db 10 , 13,'$'
        tb db 'Nhap chuoi: $'
        ktu db ?        
        
.code
    main proc
        mov ax,@data
        mov ds,ax
        lea dx, tb
        mov ah,9
        int 21h
                 
        mov ah,0Ah
        lea dx,mang
        int 21h 
        
        lea dx,xuong
        mov ah,09
        int 21h
        
        lea si,mang+ 2
        mov cl, [mang + 1] 
        
        Lap1:
            cmp [si],'A'
            Jl Boqua
            cmp [si],'Z'
            JA Boqua
            add [si],32
            
            Boqua: 
            inc si
            loop lap1
        
        
        call xuat  

        mov ah, 8
        int 21h
        
        mov ah,4ch
        int 21h          
    main endp 
    
    xuat PROC
        mov cl,[mang + 1]
        lea si,mang + 2
        lap:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop lap
        ret
   xuat endp
end main