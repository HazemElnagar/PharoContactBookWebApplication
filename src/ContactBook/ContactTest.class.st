Class {
	#name : #ContactTest,
	#superclass : #TestCase,
	#category : #ContactBook
}

{ #category : #tests }
ContactTest >> testCreation [
| contact |
contact := Contact name: 'Hazem' 
						phone: '01001001000'.
self assert: contact name = 'Hazem'.
self assert: contact phone = '01001001000'.
]
