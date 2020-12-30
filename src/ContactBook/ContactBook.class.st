"
I represent person contacts . I'm a contact book.
"
Class {
	#name : #ContactBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#category : #ContactBook
}

{ #category : #current }
ContactBook class >> createDefault [
^ self new
addContact: (Contact
name: 'Damien Cassou'
phone: '01001001000');
addContact: (Contact
name: 'Marcus Denker'
phone: '01001234567');
addContact: (Contact
name: 'Tudor Girba'
phone: '0123456789'
);
addContact: (Contact
name: 'Clara Allende'
phone: '012102030405');
yourself

]

{ #category : #accessing }
ContactBook >> addContact: aContact [
self contacts add: aContact
]

{ #category : #accessing }
ContactBook >> contacts [
^ contacts ifNil: [ contacts := OrderedCollection new ]
]

{ #category : #accessing }
ContactBook >> removeContact: aContact [
self contacts  remove: aContact
]
