; Q20 Write a program that display ACII characters from 0 to 255
.model small
.stack 100h
.data
	msg db  "ASCII characters from 0 to 255 are : ","$"
    msg1 db " ","$"
    char db 0
.code
  main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,09h
	mov dx,offset msg
	int 21h
	 
    PrintASCII:
		mov ah,02h
		mov dl,char
		int 21h
		cmp dl,255
		je Exit

    mov ah,09h
    mov dx ,offset msg1
    int 21h

    inc char
    jmp PrintASCII

    Exit:
		mov ah,04ch
		int 21h
		
  main endp
end