.data
    tb1 db 10,13,"Hex: $"
    tb3 db 10,13,"Bin: $" 
    tb2 db 'Nhap n = $' 
    muoi dw 10
    so db 10,0, 10 dup<$>
    num dw 0 
    kq dw 1 
    
.code
main proc 
    mov ax,@data
    mov ds,ax 

;nhap n
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,10
    lea dx,so
    int 21h
    
    call xulichuoi
    mov num, dx
    
    mov ah, 9
    lea dx, tb1
    int 21h 

    hex_out:
        mov ax,num
        mov cx, 0
        chuyen_he16:
            xor dx,dx
            mov bl,16
            div bx
            cmp dx,9
            ja chucai
            add dx,30h
            jmp chuso
        chucai:
            add dx,37h ;dua ve chu
        chuso:
            push dx
            inc cx
            cmp ax,0
            jne chuyen_he16 
       hienthi_he16:
            pop dx
            mov ah,2
            int 21h
            loop hienthi_he16
;convert to bin
    mov ah, 9
    lea dx, tb3
    int 21h
    
    mov bx, 0
    mov bx,num
    mov cx,16
    hienthi_he2:
        mov dl,30h
        shl bx,1 ;day bit cao nhat cua bx vao co CF
        adc dl,0  ;dl = dl+0+CF
        mov ah,2
        int 21h
        loop hienthi_he2 
       

thoat: 
    mov ah,8
    int 21h
    mov ah,4ch
    int 21h    
    
    main endp 
xulichuoi PROC
    mov dx, 0
    mov cx, 0 
    
    lea si,so + 2
    mov cl,[so+1]  
    
    Lap:
       mov ax,dx
       mov bx, 0
       mov bl,[si]
       
       sub bl,30h
       mul muoi
       add ax,bx
       mov dx,ax
       inc si
       loop Lap
       ret
xulichuoi ENDP
    

end main