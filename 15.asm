; Q15 Write a program which accept only numbers
.model small
.stack 100h
.data
	msg db  "Enter character(Only numbers)(Press Enter to end input): ","$"
	str1 db  100 Dup("$")
.code
  main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,09h
	mov dx,offset msg
	int 21h
	
	;take char from user
	mov si,offset str1
	
	InputChar:
		mov ah,07h
		int 21h
		cmp al,13
		je Exit
		cmp al,'0'
		jl skip
		cmp al,'9'
		jg skip
		mov [si],al
		mov ah,02h
		mov dl,al
		int 21h
		inc si
		
	skip:
		jmp InputChar

	Exit:
		mov ah,04ch
		int 21h
		
  main endp
end