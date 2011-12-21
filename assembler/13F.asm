.model small
.stack 200h
.386
.code



x dw 10					;poczatek rysowania na osi OX
y dw 60					;poczatek rysowania na osi OY
w dw 20					;szerokosc litery
c1 db 1					;kolor wypelnienia
c2 db 2					;kolor konturu
h dw 0
xp dw 0
yp dw 0
wp dw 0
r dw 0
l dw 280
m dw 0



start:
	
	mov ah, 00h
	mov al, 13h
	
	int 10h	
	
	mov ax, 0A000h
	mov es, ax
	
	dec [x]
	
	mov sp, [x]
	mov [r], sp
	
	motion:
		
		cmp [m], 0
		
		jne notequal
		
		inc [x]
		inc [r]
		
		jmp equal
		
		notequal:
		
		dec [x]
		dec [l]
		
		equal:
		
		mov sp, [y]
		mov [yp], sp
		mov sp, [w]
		mov [wp], sp
		
		add sp, [w]
		add sp, [w]
		
		mov [h], sp
		mov bp, [h]
		
		add bp, [w]
		
		fade1:
			
			mov ax, [x]
			
			dec ax
			
			mov cx, 1
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, 0
			
			rep stosb
			
			cmp bp, 0
			
			jne fade1
		
		mov sp, [y]
		mov [yp], sp
		mov bp, [h]
		
		fade2:
			
			mov ax, [x]
			
			add ax, [w]
			
			inc ax
			
			mov cx, 1
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, 0
			
			rep stosb
			
			cmp bp, 0
			
			jne fade2
		
		mov bp, [w]

		fade3:
			
			mov ax, [x]
			
			add ax, [w]
			add ax, [w]
			
			inc ax
			
			mov cx, 1
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, 0
			
			rep stosb
			
			cmp bp, 0
			
			jne fade3
		
		mov sp, [y]
		mov [yp], sp
		mov bp, [h]
		
		print1:
			
			mov ax, [x]
			mov cx, [wp]
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c1]
			
			rep stosb
			
			cmp bp, 0
			
			jne print1
		
		mov bp, [w]
		mov sp, [w]
		
		add [wp], sp
		
		print2:
			
			mov ax, [x]
			mov cx, [wp]
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c1]
			
			rep stosb
			
			cmp bp, 0
			
			jne print2
		
		mov sp, [y]
		mov [yp], sp
		mov sp, [w]
		mov [wp], sp
        	mov bp, [h]
		
		add bp, [w]
		
		print3:
			
			mov ax, [x]
			mov cx, 1
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c2]
			
			rep stosb
			
			cmp bp, 0
			
			jne print3
		
		mov sp, [x]
		
		add sp, [w]
		
		dec sp
		
		mov [xp], sp
		mov sp, [y]
		mov [yp], sp
        	mov bp, [h]
		
		inc bp
		
		print4:
			
			mov ax, [xp]
			mov cx, 1
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
					
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c2]
			
			rep stosb
			
			cmp bp, 0
			
			jne print4
	
		mov sp, [xp]
	
		add sp, [w]
	
	
		mov [xp], sp
		mov bp, [w]
	
		dec bp
		
		print5:
			
			mov ax, [xp]
			mov cx, 1
			mov dx, [yp]
			
			inc [yp]
			
			dec bp
			
			push ax
					
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c2]
			
			rep stosb
			
			cmp bp, 0
			
			jne print5
		
		mov sp, [y]
		mov [yp], sp
		mov sp, [w]
		mov [wp], sp
		mov bp, 2
		
		print6:
			
			mov ax, [x]
			mov cx, [wp]
			mov dx, [yp]
			mov sp, [yp]
			
			add sp, [h]
			add sp, [w]
			
			dec sp
			
			mov [yp], sp
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c2]
			
			rep stosb
			
			cmp bp, 0
			
			jne print6
		
		mov sp, [x]
		
		add sp, [w]
		
		mov [xp], sp
		mov sp, [y]
		
		add sp, [h]
		
		mov [yp], sp
		mov sp, [w]
		mov [wp], sp
		mov bp, 2
		
		print7:
			
			mov ax, [xp]
			mov cx, [wp]
			mov dx, [yp]
			mov sp, [yp]
			
			add sp, [w]
			
			dec sp
			
			mov [yp], sp
			
			dec bp
			
			push ax
			
			inc cx
			
			mov bx, dx
			
			shl dx, 6
			shl bx, 8
			
			add bx, dx
			
			pop ax
			
			add bx, ax
			
			xor di, di
			
			add di, bx
			
			mov al, [c2]
			
			rep stosb
			
			cmp bp, 0
			
			jne print7
		
		cmp [r], 270
		
		jna motion
		
		je change
		
		change:
		
		mov [m], 1
		
		cmp [l], 20
		
		ja motion
		
		;je exit		;odkomentowac, jezeli ruch ma sie wykonac tylko raz
		
		je reload
		
		reload:
		
		mov sp, [x]
		mov [r], sp
		mov [l], 280
		mov [m], 0
		
		jmp motion
	
	;exit:				;odkomentowac, jezeli ruch ma sie wykonac tylko raz
	
	xor ax, ax
	
	int 16h
	
	mov ah, 00h
	mov al, 03h
	
	int 10h
	
	mov ah, 4ch
	
	int 21h
	
end start
