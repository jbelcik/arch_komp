.model tiny
.386
.data
  tekst db "Jakub", 0Dh, 0Ah, "Belcik", 0Dh, 0Ah,"$"
.stack 100h
.code
start:
  mov ax, @data
  mov ds, ax
  mov dx, offset tekst
  mov ah, 09h
  int 21h
  mov ah, 4Ch
  int 21h
end start