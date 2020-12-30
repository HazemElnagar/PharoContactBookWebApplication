"
I represent a person with a name and a phone number. I'm usually
part of a contact book.
"
Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'name',
		'phone'
	],
	#category : #ContactBook
}

{ #category : #initialization }
Contact class >> name: aNameString phone: aPhoneString [
	^ self new 
	name: aNameString ;
	phone: aPhoneString ;
	yourself . 
]

{ #category : #accessing }
Contact >> name [
	^ name
]

{ #category : #'accessing-fields' }
Contact >> name: aString [ 
	name := aString
]

{ #category : #access }
Contact >> phone [
	^ phone
]

{ #category : #'accessing-fields' }
Contact >> phone: aString [ 
	phone:= aString .
]

{ #category : #accessing }
Contact >> printOn: aStream [
aStream
nextPutAll: self name;
nextPutAll: ' (';
nextPutAll: self phone;
nextPutAll: ')'
]
