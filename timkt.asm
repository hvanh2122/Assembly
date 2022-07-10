.data
    tb db "Nhap chuoi: $" 
    tb3 db 10,13,"Nhap ky tu can tim: $"
    tb1 db 10,13,"Ky tu can tim trong chuoi tai vi tri: $"
    tb2 db 10,13,"Khong co ky tu can tim trong chuoi $"
    kytu db ?
    index db 0
    solan db 0
    sokytu db ?
    string db 50,?,50 dup<"$">
.code
main proc 

    mov ax, @data
    mov ds, ax
    ;nhap chuoi
    mov ah, 9
    lea dx, tb
    int 21h
    
    mov ah, 10
    lea dx, string
    int 21h
    ;nhap ky tu can tim
    mov ah, 9
    lea dx, tb3
    int 21h
    
    mov ah, 1
    int 21h
    
    mov kytu, al
   
    mov cl, [string + 1]
    mov sokytu, cl
    lea si, string + 2
    mov bl, 0
    ;kiem tra ky tu co trong chuoi khong
    kiemtra:
        push cx 
        mov al, [si]
        cmp al, kytu
        je yes
        jmp tiep
    
    ;neu co thi in ra vi tri cua ky tu
    yes:
        add solan, 1
        
        cmp solan, 1
        je thongbao 

        call todec 
        jmp tiep
        
    thongbao:
        mov ah, 9
        lea dx, tb1
        int 21h 
        call todec
        
    tiep:
        inc si
        add index, 1
        pop cx 
        
        mov al, index
        cmp al, sokytu
        jne kiemtra
        
    cmp solan, 0
    je thongbao1
    jmp thoat
    
    thongbao1:
        mov ah, 9
        lea dx, tb2
        int 21h     

    thoat: 
    mov ah,08h ; dung man hinh de xem ket qua
        int 21h
        mov ah, 4ch ; thoat ve Dos
        int 21h
main endp
    todec proc
        mov al, index 
        mov bl, 10
        mov cx, 0
    chia: 
        mov ah, 0   
        div bl
        mov dl,ah
        add dl,30h 
        push dx 
        inc cx 
        cmp al,0 
        je inso 
        jmp chia
    inso:
        pop dx
        mov ah,2
        int 21h
        loop inso
        
        mov dl, 20h
        mov ah, 2
        int 21h 
        ret
    todec endp   
    
end main
