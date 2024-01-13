.Model Small
.Stack 100H
.Data
    fnm db "enc.txt", 0
    fh dw 0
	Msg db "Enter your text: ", "$"
    str db 100 DUP(0)
    count dw 0
.Code
	main proc
		mov AX, @Data
		mov DS, AX

            mov AH, 09h
            mov DX, offset Msg
            int 21h
            mov SI, offset str
            mov cx, 0
            Again:
                mov AH, 01h
                int 21h
                cmp AL, 13
                je EndInput
                add AL, 3
                mov [SI], AL
                inc SI
                inc cx
                jmp Again

            EndInput:
            mov count, cx
			mov ah, 03ch
            mov dx, offset fnm
            mov cx, 99
            int 21H
            mov fh, AX
            
            mov ah, 040h
            mov bx, fh
            mov cx, count
            mov dx, offset str
            int 21H

            mov ah, 03eh
            mov bx, fh
            int 21h
		mov AH, 04CH
		int 21H
	main endp
End