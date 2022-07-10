;File .txt phai nam trong link: emu8086/MyBuild (Tuy vao o C hay D luc setup nhe)
;Tao truoc 1 file bat ky trong link kia de mo 
;Nhap ten file da luu va bam enter
.model small
.stack
.data
    tenfile db 15 dup(?),0
    handle dw ?
    string db 15 dup(?),24h   ;du lieu de ghi vao file
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea si, tenfile
        mov ah, 01h
        
        nhap:      ;nhap ten file
        int 21h
        cmp al, 0Dh
        je next
        mov [si], al
        inc si
        jmp nhap
          
        next:
        mov ah, 3Dh       ;mo file
        mov al, 0
        lea dx, tenfile
        int 21h
        mov handle, ax
        
        mov ah, 3Fh       ;doc file va luu vao bien string
        mov bx, handle
        mov cx, 15
        lea dx, string
        int 21h 
        
        mov ah, 09h
        lea dx, string
        int 21h 
        thoat:
        mov ah, 4Ch
        int 21h  
    main endp
end