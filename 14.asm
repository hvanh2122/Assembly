;Nhap ten file muon xoa roi bam enter
.model small
.stack
.data
    tenfile db 15 dup(?),0
    handle dw ?
    tb db "Nhap ten file: $" 
    tb1 db 10,13,"Xoa file thanh cong!!$"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb
        int 21h
        
        lea si, tenfile
        mov ah, 01h
        
        nhap:      ;nhap ten file
        int 21h
        cmp al, 0Dh
        je next
        mov [si], al
        inc si
        jmp nhap
        
        next:            ;xoa file
        mov ah, 41h 
        lea dx, tenfile
        int 21h
        
         
        thoat:
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 4Ch
        int 21h  
    main endp
end
