.model small
.386
.code
	ORG 100h


tab db 0,0,0,0,0,0,0,0
var db 0
con db 0


start:
	mov ds, ax
	mov bx, 2
	mov eax, 98
	mov [var], al
	mov [con], al
	mov dh, 2
	mov bx, 0

	call bin2
	call okt8
	call dec10 

        mov ah, 1

        int 21H

        mov ax, 4C00H
     
        int 21H



	pri proc

		print:

			mov al, [tab + bx]

			dec bx

			mov ah, 0EH

			int 10H

			mov al, dl

			loop print

		ret

	pri endp




	binary proc

		b:

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

			jmp b

		jmp1:

			mov cx, bx

			dec bx

			call pri

			mov al, 62H
			mov ah, 0EH

			int 10H

			mov al, 20H

			int 10H

			mov al, [con]
			mov [var], al
			mov dh, 8
			mov bx, 0

		ret

	binary endp



	octal proc

		o:

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
			jmp o

		jmp2:

			mov cx, bx

			dec bx

			call pri

			mov al, 6FH
			mov ah, 0EH

			int 10H

			mov al, 20H

			int 10H

			mov al, [con]
			mov [var], al
			mov dh, 10
			mov bx, 0

		ret

	octal endp



	decimial proc

		d:

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

			jmp d

		jmp3:

			mov cx, bx

			dec bx

			call pri

			mov al, 64H
			mov ah, 0EH

			int 10H

		ret

	decimial endp

kod ends
end start
