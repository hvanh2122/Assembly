.data
    tb1 db 10,13,'Nhap ho ten: $'
    tb2 db 10,13,'Ma sinh vien: $'
    tb3 db 10,13,'Nhap sai thong tin! Hay nhap lai!$'
    msv db 'AT160602$'
    hoten db 'Hoang Thi Van Anh'
    len db $ - hoten
    str db 100,?,100 dup<$>
    
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    nhapmsv:
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 10
        lea dx, str
        int 21h
        
    kiemtra:
        mov cl, len
        mov bl, [str+1]
        
        cmp bl, cl
        jne saitt
        
        lea si, str+2
        lea di, hoten
        
        repe cmpsb
        
        je inht
    
    saitt:    
        mov ah, 9
        lea dx, tb3
        int 21h
        
        jmp nhapmsv
    
    inht:
        mov ah, 9
        lea dx, tb2
        int 21h
        
        lea dx, msv
        int 21h
    thoat:
        mov ah, 8
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp
end main