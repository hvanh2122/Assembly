; Chuong trinh chinh 
.MODEL small
ORG 100h
.data
 Enter DB 0Dh, 0Ah, '$'   
 m db 6,2,9,12
 n dw 4
 str db "Tong cac so nguyen to trong day la: $"
 num db ?
 du db ?
 tong db 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        lea dx, str
        mov ah,9
        int 21h
        lea si,m  
        mov cx, n
        
        
        duyet:
            mov al,[si] ; dua c�c gi� tr? trong m?ng do si tr? d?n v�o al
            mov num, al
            mov ah, 0

            mov al, num
            mov bl, tong
            add al, bl
            mov tong, al
             
        tiep:
            inc si ;tang ch? s? m?ng
            loop duyet 
        
        mov al,tong ;chuy?n s? tr? l?i thanh ghi al
        mov bl,10 ;g�n bl =10
        mov cx,0 ;kh?i t?o bi?n d?m
        todec:
            mov ah,0 ;xo� b�t cao
            div bl ;l?y k?t qu? chia cho 10
            mov dl,ah ;chuy?n du v�o dl
            add dl,30h ;chuy?n s? sang d?ng k� t?
            push dx ;d?y du v�o ngan x?p
            inc cx ;tang bi?n d?m
            cmp al,0 ;so s�nh thuong v?i 0
            je inso ;n?u b?ng th� in s?
            jmp todec
        inso:
            pop dx
            mov ah,2
            int 21h
            loop inso
            
        mov ah,4ch
        int 21h
    main endp
end main