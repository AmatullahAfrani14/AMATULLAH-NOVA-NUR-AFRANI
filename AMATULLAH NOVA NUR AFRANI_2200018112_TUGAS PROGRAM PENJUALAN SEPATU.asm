.model small
.code
org 100h
start:
    jmp mulai

nama        db 13,10,'Nama Sepatu : $'
ukuran       db 13,10,'Ukuran Sepatu  : $'
harga    db 13,10,'harga  : $' 
lanjut      db 13,10,'Lanjut tekan y untuk lanjut >>>>>>>>>>>>> $'
tampung_nama        db 30,?,30 dup(?)
tampung_ukuran       db 13,?,13 dup(?)
tampung_harga    db 30,?,30 dup(?)


a db 01
b db 02
c db 03
d db 04
e db 05
j dw 15


daftar  db 13,10,'+---------------------------------------------------------------------------------------+'
                db 13,10,'+------------------DATA SEPATU YANG DI BELI-------------------------------------'
                db 13,10,'+-------------------------------------------------------------------------------'
                db 13,10,'|      NAMA SEPATU            |          UKURAN       |      HARGA SEPATU      |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|01|  ADIDAS SEPATU ANAK      |           25-30       |         500,000        |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|02|  HOMYPAD SEPATU ANAK     |           25-32       |         750,000        |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|03|  ADIDAS SEPATU DEWASA    |           37-42       |        1,600,000       |'    
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|04|  TOMKINS SEPATU DEWASA   |           36-41       |         2,500,000      |'
                db 13,10,'+--+----------------------------------------------------------------------------'
                db 13,10,'|05|  DIOR SEPATU DEWASA      |           35-40       |         3,000,000      |'
                db 13,10,'+--+----------------------------------------------------------------------------' 
                
                                
pilih_spt   db 13,10,'Silahkan Masukkan Merek sepatu yang anda pilih $'
succes      db 13,10,'Selamat Anda Berhasil $'
error       db 13,10,'Pilihan Anda Tidak Tersedia $'

mulai:
        mov ah,09
        lea dx, nama
        int 21h
        mov ah,0ah
        lea dx, tampung_nama
        int 21h
        push dx  
        
        mov ah,09
        lea dx, ukuran
        int 21h
        mov ah,0ah
        lea dx, tampung_ukuran
        int 21h
        push dx    
        
        mov ah,09
        lea dx, harga
        int 21h
        mov ah,0ah
        lea dx, tampung_harga
        int 21h
        push dx  
        
        mov ah,09h
	    mov dx,offset daftar
	    int 21h
	    mov ah,09h
    	mov dx,offset lanjut
	    int 21h
	    mov ah,01h
	    int 21h
	    cmp al,'y'
	    je proses
	    jne error_nsg   
	    
error_nsg:
    mov ah,09h
    mov dx, offset error
    int 21h
    int 20h
    
proses:
    mov ah,09h
    mov dx,offset pilih_spt
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3


    cmp bh,'0'
    cmp bl,'4'
    je hasil4
    
    cmp bh,'0'
    cmp bl,'5'
    je hasil5
    
    
    
;------------------------------------------------------------------------ 
hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    int 20h    
    
hasil5:
    mov ah,09h
    lea dx,teks5
    int 21h
    int 20h
    
    
;------------------------------------------------------------------------
teks1		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH ADIDAS SEPATU ANAK' 
		db 13,10,'DENGAN UKURAN 25-30'
		db 13,10,'BIAYA YANG HARUS DI BAYARKAN : Rp 500,000'
		db 13,10,'Terima Kasih $'

teks2		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH HOMYPAD SEPATU ANAK' 
		db 13,10,'DENGAN UKURAN 25-32'
		db 13,10,'BIAYA YANG HARUS DI BAYARKAN : Rp 750,000'
		db 13,10,'Terima Kasih $'

teks3		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH SEPATU ADIDAS DEWASA' 
		db 13,10,'DENGAN UKURAN 37-42'
		db 13,10,'BIAYA YANG HARUS DI BAYARKAN : Rp 1,600,000'
		db 13,10,'Terima Kasih $'

teks4		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH TOMKINS SEPATU DEWASA' 
		db 13,10,'DENGAN UKURAN 36-41'
		db 13,10,'BIAYA Pelatihan : Rp 2,500,000'
		db 13,10,'Terima Kasih $'

teks5		db 13,10,'                                       '
		db 13,10,'ANDA MEMILIH TOMKINS SEPATU DEWASA' 
		db 13,10,'DENGAN UKURAN 35-40'
		db 13,10,'BIAYA YANG HARUS DI BAYARKAN : Rp 3,000,000'
		db 13,10,'Terima Kasih $'



end start