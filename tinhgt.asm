.data
    tb1 db 10,13,'Nhap so duong n (0<=n<9) = $'
    tb2 db 10,13, 'n! = $' 
    tb3 db 10,13, 'Nhap 0<=n<9! Moi nhap lai!!$'
    num db ?
    muoi dw 10
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    ;nhap n 
    nhap:
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 1
        int 21h
        
        sub al, 30h
        mov num, al
        
        cmp num, 8
        ja nhaplai
        
        cmp num, 0
        je khong
        
        jmp tinh
        
    nhaplai:
        mov ah, 9
        lea dx, tb3
        int 21h
        jmp nhap
        
    khong:
        mov cx, 0
        mov ax, 1
        jmp chia
        
    tinh:
        ;tinh giai thua
        mov bx, 1
        mov cl, num
        mov ax, 1
        tinhgt:
            mul bx
            inc bx
            
            loop tinhgt
    ; hien thi ket qua
    mov cx, 0
    chia:
        mov dx, 0
        div muoi
        add dx, 30h
        push dx
        inc cx
        
        cmp ax, 0
        jne chia
        
    mov ah, 9
    lea dx, tb2
    int 21h
    
    hienthi:   
        pop dx
        mov ah, 2
        int 21h
        loop hienthi
        
    ;thoat
    mov ah, 8
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
end main
        
    