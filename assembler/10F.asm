data segment
data ends

prog segment

	assume cs: prog, ds: data


tab db 0,0,0,0,0,0,0,0
var db 0
con db 0


start:

	mov ax, seg data
	mov ds, ax
	mov al, 102
	mov [var], al
	mov [con], al
	mov dh, 2
	mov bx, 0

	bin2:

		mov ah, 0

		div dh

		mov [var], al
		mov al, ah

		add al, 30H

		mov [tab + bx], al

		inc bx

		mov al, [var]

		cmp al, 0

		jna jmp1

		jmp bin2

	jmp1:

		mov cx, bx

		dec bx

	print1:

		mov al, [tab + bx]

		dec bx

		mov ah, 0EH

		int 10H

		mov al, dl

		loop print1

	mov al, 62H
	mov ah, 0EH

	int 10H

	mov al, 20H

	int 10H

	mov al, [con]
	mov [var], al
	mov dh, 8
	mov bx, 0

	oct8:

		mov ah,0

		div dh

		mov [var], al
		mov al, ah

		add al, 30H

		mov [tab + bx], al

		inc bx

		mov al, [var]

		cmp al, 0

		jna jmp2

		loop oct8

	jmp2:

		mov cx, bx

		dec bx

	print2:

		mov al, [tab + bx]

		dec bx

		mov ah, 0EH

		int 10H

		mov al, dl

		loop print2

	mov al, 6FH
	mov ah, 0EH

	int 10H

	mov al, 20H

	int 10H

	mov al, [con]
	mov [var], al
	mov dh, 10
	mov bx, 0

	dec10:

		mov ah, 0

		div dh

		mov [var], al
		mov al, ah

		add al,30H

		mov [tab + bx], al

		inc bx

		mov al, [var]

		cmp al, 0

		jna jmp3

		loop dec10

	jmp3:

		mov cx, bx

		dec bx

	print3:

		mov al, [tab + bx]

		dec bx

		mov ah, 0EH

		int 10H

		mov al, dl

		loop print3

	mov al, 64H
	mov ah, 0EH

	int 10H

	mov al, 20H

	int 10H

	mov al, [con]
	mov [var], al
	mov dh, 16
	mov bx, 0

	hex16:

		mov ah, 0

		div dh

		mov [var], al
		mov al, ah

		add al,30H

		mov [tab + bx], al

		inc bx

		mov al, [var]

		cmp al, 0

		jna jmp4

		loop hex16

	jmp4:

		mov cx, bx

		dec bx

	print4:

		mov al, [tab + bx]

		dec bx

		mov ah, 0EH

		int 10H

		mov al, dl

		loop print4

	mov al, 68H
	mov ah, 0EH

	int 10H

        mov ah, 1

        int 21H

        mov ax, 4C00H
     
        int 21H

prog ends

end start