;Nhap ten file .txt cu roi bam enter sau do nhap ten moi roi bam enter de doi thanh cong
;Vao thu muc: emu8086/MyBuild de xem da doi duoc hay chua
.model small
.stack
.data
    tenfile1 db 15 dup(?),0    ;ten file goc
    tenfile2 db 15 dup(?),0    ;ten file thay the 
    tb1 db "Nhap ten file goc: $"
    tb2 db 10,13,"Nhap ten file thay the: $" 
    tb3 db 10,13,"Doi ten thanh cong!!$"
    handle dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        lea si, tenfile1
        mov ah, 01h
        
        nhapgoc:      ;nhap ten file goc
        int 21h
        cmp al, 0Dh
        je next
        mov [si], al
        inc si
        jmp nhapgoc
        
               
        next:       
        mov ah, 9
        lea dx, tb2
        int 21h
        
        lea si, tenfile2
        mov ah, 01h            
        nhapthaythe:      ;nhap ten file thay the
        int 21h
        cmp al, 0Dh
        je next1
        mov [si], al
        inc si
        jmp nhapthaythe
        
        next1:            ;doi ten
        lea dx, tenfile1
        lea di, tenfile2
        mov ah, 56h
        int 21h
         
        thoat:
        mov ah, 9
        lea dx, tb3
        int 21h
        
        mov ah, 4Ch
        int 21h  
    main endp
end
