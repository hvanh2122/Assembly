.data
        mang db 50,0,50 dup('$') 
        xuong db 10 , 13,'Chuyen chu thuong thanh chu hoa: $'
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
        
        Lap2:
            cmp [si],'a'
            Jb Boqua
            cmp [si],'z'
            JA Boqua
            sub [si], 32 
            
            Boqua:
                inc si
            loop Lap2
        
        
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