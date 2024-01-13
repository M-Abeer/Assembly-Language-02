; Q23 Write a program that encrypt the given data and store encrypted data into a file(i)
.Model Small
.Stack 100H
.Data
    fnm db "enc.txt", 0
    fh dw 0
	MsgBuffer db 100 DUP("$")
.Code 
	main proc
		mov AX, @Data
		mov DS, AX
			mov ah, 03ch
            mov dx, offset fnm
            mov al, 0
            int 21H
            mov fh, AX
            
            mov ah, 03fh
            mov bx, fh
            mov cx, 99 
            mov dx, offset MsgBuffer
            int 21H

        ; Print the text character by character, subtracting 3 from each character
        mov SI, offset MsgBuffer

    PrintLoop:
        mov AL, [SI]
        cmp AL, "$"
        je Done
        sub AL, 3
        mov AH, 02h
        mov DL, AL
        int 21h
        inc SI
        jmp PrintLoop

    Done:
        mov ah, 03eh
        mov bx, fh
        int 21h
        mov AH, 04CH
        int 21H
	main endp
End